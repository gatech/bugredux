//===-- Searcher.cpp ------------------------------------------------------===//
//
//                     The KLEE Symbolic Virtual Machine
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "Common.h"

#include "Searcher.h"

#include "CoreStats.h"
#include "Executor.h"
#include "PTree.h"
#include "StatsTracker.h"

#include "klee/ExecutionState.h"
//#include "klee/Executor.h";
#include "klee/Statistics.h"
#include "klee/Internal/Module/InstructionInfoTable.h"
#include "klee/Internal/Module/KInstruction.h"
#include "klee/Internal/Module/KModule.h"
#include "klee/Internal/ADT/DiscretePDF.h"
#include "klee/Internal/ADT/RNG.h"
#include "klee/Internal/Support/ModuleUtil.h"
#include "klee/Internal/System/Time.h"

#include "llvm/Constants.h"
#include "llvm/Instructions.h"
#include "llvm/Module.h"
#include "llvm/Support/CallSite.h"
#include "llvm/Support/CFG.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/PassManager.h"
#include "llvm/Analysis/Dominators.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/DebugInfo.h"

#include <time.h>
#include <cassert>
#include <fstream>
#include <sstream>
#include <climits>
#include <algorithm>

using namespace klee;
using namespace llvm;

cl::opt<bool>
InitEnv("init-env",
	  cl::desc("Create custom environment.  Options that can be passed as arguments to the programs are: --sym-argv <max-len>  --sym-argvs <min-argvs> <max-argvs> <max-len> + file model options"));


namespace {
  cl::opt<bool>
  DebugLogMerge("debug-log-merge");


}


namespace klee {
  extern RNG theRNG;
}

Searcher::~Searcher() {
}
///

/// General Replay parent class:

KInstruction* GeneralReplaySearcher::findInstFromSourceLine(std::string sourceline) {
	KInstruction* retInst = NULL;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction* kf = functions[i];
		int numInst = kf->numInstructions;
		for (int j=0;j<numInst;j++) {
			KInstruction* ki = kf->instructions[j];
			std::ostringstream osstream;
			osstream << ki->info->file <<":"<<ki->info->line;
			if (osstream.str().compare(sourceline)==0) {
				return ki;
			}
		}
	}
	return retInst;
}

void GeneralReplaySearcher::CleanCachedCallSites() {
	std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator end = cachedCallSite.end();
	for (std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator it = cachedCallSite.begin();it!=end;it++){
		std::vector<llvm::Instruction*>* vec = it->second;
		if (vec!=NULL) {
		vec->clear();
		delete vec;
		} else {
		}
	}

}


KInstruction* CallSeqReplaySearcher::findInstFromSourceLine(std::string sourceline) {
	KInstruction* retInst = NULL;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction* kf = functions[i];
		int numInst = kf->numInstructions;
		for (int j=0;j<numInst;j++) {
			KInstruction* ki = kf->instructions[j];
			std::ostringstream osstream;
			osstream << ki->info->file <<":"<<ki->info->line;
			if (osstream.str().compare(sourceline)==0) {

				return ki;
			}
		}
	}
	return retInst;
}

void CallSeqReplaySearcher::CleanCachedCallSites() {
	std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator end = cachedCallSite.end();
	for (std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator it = cachedCallSite.begin();it!=end;it++){
		std::vector<llvm::Instruction*>* vec = it->second;
		if (vec!=NULL) {
		vec->clear();
		delete vec;
		} else {
		}
	}

}

CallSeqReplaySearcher::CallSeqReplaySearcher(Executor &_executor)
  : executor(_executor),
    functions(executor.kmodule->functions){
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function!=NULL) {
			funcShortMap[kf->function] = 1;
		}
		llvm::Function* curFunc = kf->function;
		if (curFunc->getBasicBlockList().size()==0)
			continue;
		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
			BasicBlock *BB = I;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					if (isa<CallInst>(inst)) {
						CallInst* ci = (CallInst*) inst;
						if (ci->getCalledFunction()!=NULL) {
							Function *fc = ci->getCalledFunction();
							if (cachedCallSite.find(fc)==cachedCallSite.end()) {
								std::vector<llvm::Instruction*>* newvector = new std::vector<llvm::Instruction*>();
								newvector->push_back(inst);
								cachedCallSite[fc] = newvector;
							} else {
								std::vector<llvm::Instruction*>* oldvector = cachedCallSite[fc];
								oldvector->push_back(inst);
							}

						}
					}
				}
		}

	}

	//load call seq trace file

	callSeqPtr = 0;
	getTarget = false;

	std::set<std::string> funcCoverList;

	std::ifstream covFile("funcov", std::ifstream::in);
	while (covFile.good()) {
		char line[1024];
		covFile.getline(line,1024);
		std::string linestr(line);
		if (linestr.length()>0) {
			funcCoverList.insert(linestr);
		}
	}
	covFile.close();

	std::string usermainfile;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function!=NULL&&kf->function->getNameStr().compare("__user_main")==0) {
			if (kf->instructions[0]!=NULL) {
				usermainfile = kf->instructions[0]->info->file;
		//		std::cerr<<"__user_main file info:"<<usermainfile<<"\n";
				break;
			}
		}
	}

	if (funcCoverList.size()>0) {
	for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			if (kf->function!=NULL) {
				if (kf->instructions[0]!=NULL) {
					if (kf->instructions[0]->info->file.length()>0&&kf->instructions[0]->info->file.find("klee/runtime")==std::string::npos&&kf->instructions[0]->info->file.find("klee-uclibc")==std::string::npos){
						if (funcCoverList.find(kf->function->getNameStr())==funcCoverList.end()) {
						//	std::cerr<< "this function is not visited: "<<kf->function->getNameStr()<<"\n";
						//	std::cerr<< kf->instructions[0]->info->file << "\n";
							unvisitedFunc.insert(kf->function);
							continue;
						}
					}
				}
			}
		}

	}

	std::ifstream historyFile("callseq", std::ifstream::in);
	std::vector<std::string> funcList;
	while (historyFile.good()) {
		char line[1024];
		historyFile.getline(line,1024);
		std::string linestr(line);
		size_t strfound;
		strfound = linestr.find_first_of("#");
		if (strfound!=std::string::npos) {
			linestr = linestr.substr(0,strfound);
		}

		strfound=linestr.find_first_of(":");

		if (strfound==std::string::npos) {
			continue;
		}
		size_t funcfound;
		funcfound=linestr.find_first_of("@");
		if (funcfound==std::string::npos) {
			callSeq.push_back(linestr);
			break;
		}
		std::string lineinfo = linestr.substr(0,funcfound);
		std::string funcName = linestr.substr(funcfound+1);
		callSeq.push_back(lineinfo);
		funcList.push_back(funcName);
	}
	historyFile.close();

//	size_t strfound;
//	strfound=callSeq[0].find_first_of(":");
//	std::string fileinfo = callSeq[0].substr(0,strfound);
////	std::cerr<<" get source file name "<< fileinfo <<"\n";
//	this->sourceFile = fileinfo;
	std::map<std::string,KInstruction*> foundset;
	std::map<std::string,KInstruction*> unfoundset;

	for (unsigned i=0;i<funcList.size();i++) {
		std::string linestr = callSeq[i];
		std::string callFuncStr = funcList[i];
//		size_t bbfound,dbbfound;
//		bbfound = callFuncStr.find_first_of("#");
		//dbbfound = callFuncStr.find_first_of("%");
		std::ostringstream qcstream;
		qcstream << linestr <<"@"<<callFuncStr;
		if (foundset.find(qcstream.str())!=foundset.end()) {
			targetInstList.push_back(foundset[qcstream.str()]);
			continue;
		}
		if (unfoundset.find(qcstream.str())!=unfoundset.end()) {
			std::cerr << i << " " << funcList.size() <<"can not find target "<< linestr <<"@"<<callFuncStr<<"\n";
			continue;
		}

		bool found = false;
		for (unsigned i=0;i<functions.size();i++) {
			KFunction* kf = functions[i];
			int numInst = kf->numInstructions;
			for (int j=0;j<numInst;j++) {
				KInstruction* ki = kf->instructions[j];
				std::ostringstream osstream;
				osstream << ki->info->file <<":"<<ki->info->line<<"@"<<ki->info->assemblyLine;
	//			std::cerr << osstream.str() << "\n";
				if (osstream.str().compare(qcstream.str())==0) {
							found =true;
							targetInstList.push_back(ki);
							foundset[qcstream.str()] = ki;
							break;
				//	}
				}
			}
			if (found)
				break;
		}
		if (!found) {
			std::cerr << i << " " << funcList.size() <<"can not find target "<< linestr <<"@"<<callFuncStr<<"\n";
			unfoundset[qcstream.str()] = NULL;
		}

	}
	if (funcList.size()<callSeq.size()) {
		std::string lasttarget = callSeq[callSeq.size()-1];
		KInstruction* lastInst = this->findInstFromSourceLine(lasttarget);
		targetInstList.push_back(lastInst);
	}



	std::cerr<<"build dom tree\n";
	llvm::PassManager pmdom;
	DomInterfacePass* dpass = new DomInterfacePass(NULL, &unvisitedFunc);
	pmdom.add((llvm::Pass*)dpass);
	pmdom.run(*executor.kmodule->module);
	prunedBBSet.insert(dpass->outputPrunedList.begin(),dpass->outputPrunedList.end());

	std::cerr<<"filter out func number:" << unvisitedFunc.size() <<"\n";
	std::cerr<<"filter out BB number:" << prunedBBSet.size() <<"\n";

	generateFuncShort();


	lastChoiceNumber = -1;
	lastChoice = NULL;

	this->getToUserMain = false;
	findNextTarget();

}


void CallSeqReplaySearcher::generateFuncShort() {

	int infinity = 10000000;
	std::set<Function*> exitfuncs;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function->getNameStr().compare("__user_main")==0)
			continue;
		for (unsigned j=0;j<kf->numInstructions;j++) {
			KInstruction* ki = kf->instructions[j];
			if (isa<CallInst>(ki->inst)) {
				CallInst* callI = (CallInst*)(ki->inst);
				if (callI->getCalledFunction()!=NULL&&callI->getCalledFunction()->getNameStr().compare("exit")==0) {
					exitfuncs.insert(kf->function);
					break;
				}
			}

		}
		llvm::Function* curFunc = kf->function;
	}
	// run 5 times to get approximate short dis for func
		for (int j=0;j<5;j++) {
			curDistanceMap.clear();

		for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			llvm::Function* curFunc = kf->function;
			std::set<Instruction*> q;
			if (curFunc->getBasicBlockList().size()==0)
				continue;
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
					for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
						Instruction* inst = BI;
						if (isa<ReturnInst>(inst)) {
							curDistanceMap[inst] = 1;
						} else if (isa<CallInst>(inst)){
							CallInst* callI = (CallInst*)inst;
							if (callI->getCalledFunction()!=NULL&&callI->getCalledFunction()->getNameStr().compare("exit")==0)
								curDistanceMap[inst] = 1;
							else if (callI->getCalledFunction()!=NULL&&exitfuncs.find(callI->getCalledFunction())!=exitfuncs.end())
								curDistanceMap[inst] = 1;
							else
								curDistanceMap[inst] = infinity;
						}
						else {
							curDistanceMap[inst] = infinity;
						}
						if (inst->isTerminator()||isa<CallInst>(inst))
							q.insert(inst);
					}
			}

//
//					for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
//					if (iter->second==0) {
//						iter->first->dump();
//						std::cerr<<"initialization error!\n";
//						}
//					}


			while (q.size()>0) {
				   std::set<Instruction*>::iterator it;
				   Instruction* minInst = NULL;
				   int minval = infinity;
				   for (it = q.begin();it!=q.end();it++) {
				    	Instruction* ci = *it;

				    	if (curDistanceMap[ci]<minval) {
							minval = curDistanceMap[ci];
							minInst = ci;
				    	}
				   }
				   if (minval==infinity) {
					   q.clear();
					   break;
				   }
				   q.erase(minInst);

				   std::vector<Instruction*> instvec;
				   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
					   Instruction* binst = BI;
					   if (binst==minInst)
						   break;
					   instvec.push_back(binst);
				   }
				   int newDis = infinity;

				   Instruction* cminInst = minInst;
				   while(instvec.size()>0){
					   Instruction* backInst = instvec.back();
					   if (isa<CallInst>(backInst)) {


						//means prevInst is a call site to another func
						Function* calledFunc = ((CallInst*)backInst)->getCalledFunction();
						if (calledFunc==NULL) {
						  	newDis = curDistanceMap[cminInst]+1;
						} else {
							if (unvisitedFunc.find(calledFunc)==unvisitedFunc.end()) {
						  	if (funcShortMap.find(calledFunc)!=funcShortMap.end())
						  		newDis = curDistanceMap[cminInst]+1+funcShortMap[calledFunc];
						  	else
						  		newDis = curDistanceMap[cminInst]+1;
							} else
								newDis = infinity;
						  	}
							 if (curDistanceMap[backInst]>newDis) {
						  		 curDistanceMap[backInst] = newDis;
//						  		 if (newDis==0) {
//						  			 std::cerr<<"catch an error here!\n";
//						  		 }
						  	 }
						 }
					   else {
						  	//simple case direct pred
						    newDis = curDistanceMap[cminInst]+1;
						  	if (curDistanceMap[backInst] > newDis) {
						  			curDistanceMap[backInst] = newDis;
//						  	 		 if (newDis==0) {
//						  							  			 std::cerr<<"catch an error here3!\n";
//						  							  		 }
						  	}


					   }
					   instvec.pop_back();
					   cminInst=backInst;
					   q.erase(backInst);
				   }

					   //means minInst is the beginning of program
					   pred_iterator PI = pred_begin(cminInst->getParent()), PE = pred_end(cminInst->getParent());
					   while(PI!=PE) {
						   BasicBlock* predBB = (BasicBlock*)(*PI);
						   if (prunedBBSet.find(predBB)==prunedBBSet.end()) {
						   TerminatorInst* predterm = predBB->getTerminator();
						   newDis = curDistanceMap[cminInst]+1;
						   if (curDistanceMap[predterm]>newDis) {
							   curDistanceMap[predterm] = newDis;
//							   if (newDis==0) {
//								   std::cerr<<"catch an error here2!";
//							   }
						   }
						   }
						   PI++;
					   }


				}
			if (curDistanceMap[curFunc->getEntryBlock().begin()]<infinity) {
				funcShortMap[curFunc] = curDistanceMap[curFunc->getEntryBlock().begin()];
		//		std::cerr <<  "dis func map for "<< curFunc->getNameStr() <<" is " <<funcShortMap[curFunc]<<"\n";
			}
			else {
			//	std::cerr<<"can't get to entry of this function : "<<curFunc->getNameStr()<<"\n";
			//	std::cerr<<"ouput func map:\n";
			}
		}
		}

		std::cerr<< "start dumping curDistanceMap\n";

		for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
		if (iter->second==0) {
			iter->first->dump();
			std::cerr<<"we have error dis!\n";
			}

//		if (isa<CallInst>(iter->first)) {
//			std::cerr<<"call dis : "<<iter->second<<"\n";
//		}
		}
//		for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
//			if (iter->first->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
//			//if (iter->second<infinity) {
//			iter->first->dump();
//			std::cerr<<"distance is "<<iter->second<<"\n";
//			}
//	//		}
//		}
}

void CallSeqReplaySearcher::generateNewShortDistance() {
//	this->curDistanceMap.clear();
	this->curInsideFuncDisMap.clear();

	int infinity = 10000000;
	//std::set<BasicBlock*> s;
	std::set<Instruction*> q;
//	std::cerr<<callSeqPtr<<" "<<targetInstList.size()<<"\n";
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		Function* curFunc = kf->function;
		if (unvisitedFunc.find(curFunc)!=unvisitedFunc.end())
			continue;
	//	if (curFunc==targetInstList[callSeqPtr]->getParent()->getParent()) {
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
				if (prunedBBSet.find(BB)!=prunedBBSet.end())
					continue;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					curInsideFuncDisMap[inst] = infinity;
					if (inst->isTerminator()) {
						q.insert(inst);
					}
					if (isa<CallInst>(inst)) {
						CallInst* calli = (CallInst*)(inst);
						if (calli->getCalledFunction()!=NULL) {
							if (unvisitedFunc.find(calli->getCalledFunction())==unvisitedFunc.end())
								q.insert(inst);
						} else
							q.insert(inst);
					}
				}

			}
	//	}
	}

	std::set<Instruction*> modifiedset;

	curInsideFuncDisMap[targetInstList[callSeqPtr]->inst]=0;
	modifiedset.insert(targetInstList[callSeqPtr]->inst);
	q.insert(targetInstList[callSeqPtr]->inst);
	while (q.size()>0) {
		   std::set<Instruction*>::iterator it;
		   Instruction* minInst = NULL;
		   int minval = infinity;
		   if (modifiedset.size()>0) {
		   for (it = modifiedset.begin();it!=modifiedset.end();it++) {
		    	Instruction* cinst = *it;

		    	if (curInsideFuncDisMap[cinst]<minval) {
					minval = curInsideFuncDisMap[cinst];
		    		minInst = cinst;
		    	}
		   }
		   }
		   if (minval==infinity){
			   q.clear();
			   break;
		   }
	//	   cerr<<"get min BB:" << minBB->getNameStr() << "\n";
		   q.erase(minInst);
		   modifiedset.erase(minInst);
//		   s.insert(minBB);

		   std::vector<Instruction*> instvec;
		   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
			   Instruction* binst = BI;
			   if (binst==minInst)
				   break;
			   instvec.push_back(binst);
		   }
		   int newDis = 0;

		   Instruction* cminInst = minInst;
		   while(instvec.size()>0){
			   Instruction* backInst = instvec.back();
			   if (isa<CallInst>(backInst)) {


				//means prevInst is a call site to another func
				Function* calledFunc = ((CallInst*)backInst)->getCalledFunction();
				if (calledFunc==NULL) {
				  	newDis = curInsideFuncDisMap[cminInst]+1;
				} else {
					if (unvisitedFunc.find(calledFunc)==unvisitedFunc.end()) {

				  	if (funcShortMap.find(calledFunc)!=funcShortMap.end())
				  		newDis = curInsideFuncDisMap[cminInst]+1+funcShortMap[calledFunc];
				  	else
				  		newDis = curInsideFuncDisMap[cminInst]+1; }
					else
						newDis = infinity;
				  	}
					 if (curInsideFuncDisMap[backInst]>newDis) {
						 curInsideFuncDisMap[backInst] = newDis;
				  	 }
				 } else {
				  	//simple case direct pred
				    newDis = curInsideFuncDisMap[cminInst]+1;
				  	if (curInsideFuncDisMap[backInst] > newDis) {
				  		curInsideFuncDisMap[backInst] = newDis;
				  	}


			   }
			   instvec.pop_back();
			   cminInst=backInst;
			  // q.erase(backInst);
		   }

		   BasicBlock* parentBB = cminInst->getParent();
		   BasicBlock* entryBB = &(parentBB->getParent()->getEntryBlock());

//		   if (parentBB==entryBB) {
//		  				   std::vector<llvm::Instruction*>* vec = cachedCallSite[parentBB->getParent()];
//		  				   if (vec!=NULL) {
//		  					   for (unsigned i=0;i<vec->size();i++) {
//		  						   Instruction* calli = vec->at(i);
//		  						   if ((prunedBBSet.find(calli->getParent())==prunedBBSet.end())&&(unvisitedFunc.find(calli->getParent()->getParent())==unvisitedFunc.end())) {
//		  						   	 newDis = curInsideFuncDisMap[cminInst]+1;
//		  						   	 if (curInsideFuncDisMap[calli]>newDis) {
//		  						   		curInsideFuncDisMap[calli] = newDis;
//		  						   		modifiedset.insert(calli);
//		  						   		//std::cerr << "propagate to upper level\n";
//		  						   	 }
//		  						   }
//		  					   }
//		  				   }
//		  			   }

			   //means minInst is the beginning of program
			   pred_iterator PI = pred_begin(cminInst->getParent()), PE = pred_end(cminInst->getParent());
			   while(PI!=PE) {
				   BasicBlock* predBB = (BasicBlock*)(*PI);
				   if (prunedBBSet.find(predBB)==prunedBBSet.end()) {
				   TerminatorInst* predterm = predBB->getTerminator();
				   newDis = curInsideFuncDisMap[cminInst]+1;
				   if (curInsideFuncDisMap[predterm]>newDis) {
					   curInsideFuncDisMap[predterm] = newDis;
					   modifiedset.insert(predterm);
				   }
				   }
				   PI++;
			   }



		}

//	Function* curFunc = targetInstList[callSeqPtr]->getParent()->getParent();
//
//	for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
//		BasicBlock *BB = I;
//		std::cerr<< BB->getNameStr()<<":\n";
//			for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
//				Instruction* inst = BI;
//				inst->dump();
//				std::cerr<<"dis : "<<curInsideFuncDisMap[inst]<<"\n";
//			}
//	}

}


void CallSeqReplaySearcher::findNextTarget() {
	//missing: get current target source line
//	int infinity = 10000000;
	lastChoice = NULL;
	lastChoiceNumber = -1;

	if (callSeqPtr==targetInstList.size()) {

		this->curInsideFuncDisMap.clear();
//		for (unsigned i=0;i<functions.size();i++) {
//			KFunction * kf = functions[i];
//			Function* curFunc = kf->function;
//
//		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
//			BasicBlock *BB = I;
//				pred_iterator PI = pred_begin(BB), PE = pred_end(BB);
//				if (PI!=PE||BB==&(curFunc->getEntryBlock())) {
//					//cerr<<"-\t"<<lastBB->getNameStr()<<"\n";
//					//set to infinity make every bb become can not reach
//					curDistanceMap[BB] = infinity;
//				}
//			}
//		}
		return;
	}
//	std::string targetSourceLine = callSeq[callSeqPtr];
//	std::cerr << targetSourceLine <<"\n";

	generateNewShortDistance();

	return;

}

CallSeqReplaySearcher::~CallSeqReplaySearcher() {
}


ExecutionState &CallSeqReplaySearcher::selectState() {
	ExecutionState *backes = states.back();
	int infinity = 10000000;
	int initenvpos = 0;
	if (InitEnv)
		initenvpos = 1;
	if (getToUserMain==false&&backes->pc->inst->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
		getToUserMain = true;
	}
	if (getToUserMain==false)
		return *backes;

	if (getTarget==true) {
		states.clear();
		CleanCachedCallSites();
		return *lastChoice;
	}

	do {
	int minDis = infinity;
	std::vector<ExecutionState*> potentialminState;
	std::vector<int> potentialminVal;
	ExecutionState* minState;
//	std::cerr<<"reach here picking state?? "<<callStackPtr<<"\n";

	for (std::vector<ExecutionState*>::iterator it = states.begin(),
	             ie = states.end(); it != ie; ++it) {
		ExecutionState *es = *it;
		int dis = infinity;
		if (prunedBBSet.find(es->pc->inst->getParent())!=prunedBBSet.end()) {
			continue;
		}

		if (stateStepMap.find(es)==stateStepMap.end()) {
			stateStepMap[es] = callSeqPtr;
		}
		if (stateStepMap[es] != callSeqPtr) {
			continue;
		}

		if (callSeqPtr>0){
			bool skip = false;//if the inst is in the targetList but not next target
		if (es->pc->inst!=targetInstList[callSeqPtr]->inst&&es->pc->inst!=targetInstList[callSeqPtr-1]->inst) {
			for (int i=0;i<targetInstList.size()-1;i++) {
				if (es->pc->inst==targetInstList[i]->inst) {
					skip = true;
//					std::cerr << "next target" << targetInstList[callSeqPtr]->info->file <<":"<< targetInstList[callSeqPtr]->info->line <<"@"<< targetInstList[callSeqPtr]->info->assemblyLine << "\n";
//					std::cerr << "skip cur target" <<es->pc->info->file <<":"<<es->pc->info->line<<"@"<<es->pc->info->assemblyLine<<"\n";
					break;
				}
			}
		}
		if (skip==true)
			continue;
		}

//		std::cerr << es->pc->info->file<<":"<< es->pc->info->line << "\n";


		if (es->pc->inst->getParent()->getParent()==targetInstList[callSeqPtr]->inst->getParent()->getParent()) {
			//if (es->pc->info->file.compare(this->sourceFile)==0) {
			if (this->curInsideFuncDisMap.find(es->pc->inst)!=this->curInsideFuncDisMap.end()) {
				dis = this->curInsideFuncDisMap[es->pc->inst];
//				std::cerr<< "dis calc by same func\n";
//				std::cerr<< es->pc->info->file<<":"<<es->pc->info->line<<"\n";
//				std::cerr<< dis <<"\n";
//				std::cerr<< es->pc->inst->getParent()->getNameStr()<<"\n";
		//		es->pc->inst->dump();
				if (dis==0) {
					minState = es;
					minDis = 0;
				} else {
					if (dis<infinity) {

				potentialminState.push_back(es);
				potentialminVal.push_back(dis);
				}
				}
			}
		//	}
		}
		if (dis==infinity) {

	//		std::cerr<< "dis calc in diff func : "<<es->pc->inst->getParent()->getParent()->getNameStr()
	//		<<"\t"<<targetInstList[callSeqPtr]->inst->getParent()->getParent()->getNameStr()<<"\n";
	//		es->pc->inst->dump();
	//		std::cerr<<es->pc->info->file<<":"<<es->pc->info->line<<"\n";

			dis = this->curDistanceMap[es->pc->inst];
		//	std::cerr<<"add dis to ret "<<dis<<"\n";

			for (unsigned i = es->stack.size()-1;i>=initenvpos+1;i--) {
				StackFrame sf = es->stack[i];
				KInstruction* kinst = sf.caller;
//				if (kinst->info->file.compare(this->sourceFile)==0) {
					//if (kinst->inst->getParent()->getParent()==targetInstList[callSeqPtr]->getParent()->getParent()&&this->curInsideFuncDisMap[kinst->inst]<infinity) {
				int insidedis = infinity;
				if (this->curInsideFuncDisMap.find(kinst->inst)!=this->curInsideFuncDisMap.end())
					insidedis = this->curInsideFuncDisMap[kinst->inst];
				if (insidedis<infinity) {
						dis += insidedis;
//						std::cerr<<"add inside func to target "<<this->curInsideFuncDisMap[kinst->inst];
						break;
			//		}
				} else {
					if (i>=initenvpos+1) {
	//				std::cerr<<"add dis to ret "<<this->curDistanceMap[kinst->inst]<<"\n";
					dis+=this->curDistanceMap[kinst->inst];
					}
				}
			}
			if (dis==0) {
				minState = es;
				minDis = 0;
			} else {
				if (dis<infinity) {
							potentialminState.push_back(es);
							potentialminVal.push_back(dis);
				}
			}
		}
	}

	if (minDis>0&&potentialminVal.size()>0) {
		ExecutionState* pminState = NULL;
		int valLength = potentialminVal.size()-1;

		if (lastChoiceNumber==valLength) {
			for (int a=0;a<=valLength;a++) {
				if (potentialminState[a]==lastChoice) {
					pminState = lastChoice;
					minDis = potentialminVal[a];
					break;
				}
			}
			if (pminState!=NULL) {
				minState = pminState;
			}
		}


		if (pminState==NULL){
			lastChoiceNumber = valLength;
//			minState = potentialminState[0];
//			minDis = potentialminVal[0];
//			int minnum =0;
//			for (int a=1;a<=valLength;a++) {
//				if (potentialminVal[a]<minDis) {
//					minState = potentialminState[a];
//					minDis = potentialminVal[a];
//					minnum=a;
//				}
//			}
//			std::cerr << "pick " << minnum << " of " << valLength << "\n";

			std::map<llvm::Instruction*,int> instcounter;
			for (int a=0;a<=valLength;a++) {
				ExecutionState* aes = potentialminState[a];
				if (instcounter.find(aes->pc->inst)==instcounter.end()) {
					instcounter[aes->pc->inst] =1;
				} else {
					int prevV = instcounter[aes->pc->inst];
					instcounter[aes->pc->inst]=prevV+1;
				}
			}

	double totalVal = 0;
	for (int a=0;a<=valLength;a++) {

		totalVal+=1.00/(((double)(potentialminVal[a]))*instcounter[potentialminState[a]->pc->inst]);
	}
	double rng = theRNG.getDoubleL();
	//std::cerr<<"rng : "<<rng << " potentialminVal : "<< potentialminVal.size() ;
	double curSum = 0;
	for (unsigned i =0;i<potentialminVal.size();i++) {
		double curTemp = 1.00/(((double)(potentialminVal[i]))*instcounter[potentialminState[i]->pc->inst]);
		if (curSum/totalVal<=rng&&(curSum+curTemp)/totalVal>rng) {
			minDis = potentialminVal[i];
			minState = potentialminState[i];
//			std::cerr<<" picked number "<<i<<" from total state number "<<potentialminVal.size()<<"\n";
			break;
		}
		double v1 = curSum/totalVal;
		double v2 = (curSum+curTemp)/totalVal;
//		std::cerr<<"["<<v1<<","<<v2<<"]\n";
		curSum+=curTemp;
	}
	}
	}

	if (minDis<infinity) {
		std::ostringstream osstream;
		osstream << minState->pc->info->file <<":"<<minState->pc->info->line;
		std::ifstream checkfile("dumpdetail");
		if (checkfile) {
					std::cerr << "picked " <<minState->pc->info->file<<":"<< minState->pc->info->line << " stack size" << minState->stack.size() <<" min Dis "<<minDis<<"\n";
					std::cerr << "state number:" << states.size() <<"\n";
					minState->pc->inst->dump();
					std::cerr<<minState->pc->inst->getParent()->getNameStr()<<"@"<<minState->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
					std::cerr << "next target " << targetInstList[callSeqPtr]->info->file <<":"<< targetInstList[callSeqPtr]->info->line <<"@"<< targetInstList[callSeqPtr]->info->assemblyLine << "\n";
					if (this->curInsideFuncDisMap[minState->pc->inst]<infinity) {
						std::cerr<<"found in the same func\n";
					} else {
						for (unsigned i = minState->stack.size()-1;i>=initenvpos+1;i--) {
										StackFrame sf = minState->stack[i];
										KInstruction* kinst = sf.caller;
						//				if (kinst->info->file.compare(this->sourceFile)==0) {
											//if (kinst->inst->getParent()->getParent()==targetInstList[callSeqPtr]->getParent()->getParent()&&this->curInsideFuncDisMap[kinst->inst]<infinity) {
										int insidedis = infinity;
										if (this->curInsideFuncDisMap.find(kinst->inst)!=this->curInsideFuncDisMap.end())
											insidedis = this->curInsideFuncDisMap[kinst->inst];

										if (insidedis<infinity) {
										//		dis += insidedis;
												std::cerr<<"add inside func to distance "<<this->curInsideFuncDisMap[kinst->inst]<<"\n";
												break;
									//		}
										} else {
											if (i>=initenvpos+1) {
											std::cerr<<"add dis to ret "<<this->curDistanceMap[kinst->inst]<<"\n";
											kinst->inst->dump();
											//dis+=this->curDistanceMap[kinst->inst];
											}
										}
									}

//						if (minState->stack.size()>=2) {
//							std::cerr << "caller stack " <<minState->stack[minState->stack.size()-2].caller->info->file<<":"<< minState->stack[minState->stack.size()-2].caller->info->line << "@" << minState->stack[minState->stack.size()-2].caller->info->assemblyLine<<"\n";
//							if (this->curInsideFuncDisMap[minState->stack[minState->stack.size()-2].caller->inst]<infinity) {
//								std::cerr<< "caller stack is in the func and dis: "<< this->curInsideFuncDisMap[minState->stack[minState->stack.size()-2].caller->inst];
//							}
//						}
					}
					std::cerr<< "------------------\n";

		}
//		if (minDis==0) {
//			std::cerr<<"**min dis is 0 dumping inst\n";
//			std::cerr<<"searching inst : ";
//			minState->pc->inst->dump();
//			std::cerr<<"target inst : ";
//			targetInstList[callSeqPtr]->dump();
//		}

		if (minState->pc->inst==targetInstList[callSeqPtr]->inst){//&&(osstream.str().compare(callSeq[callSeqPtr])==0)) {

				callSeqPtr++;
				stateStepMap[minState] = callSeqPtr;
				if (callSeqPtr==targetInstList.size()) {
					std::cerr << "reach target clear other states dump pc\n";
					time_t nowtime = time (NULL);
					char buf[256];
					strftime(buf, sizeof(buf), "Get At: %Y-%m-%d %H:%M:%S\n", localtime(&nowtime));
					std::cerr << buf ;

					getTarget = true;
//					states.clear();
				} else {
					std::cerr << callSeqPtr <<" "<<targetInstList.size()<< " reach partial important move step forward\n";
				//	std::cerr << "Cur PC : "<< minState->pc->info->file<<":"<<minState->pc->info->line<<"@"<<minState->pc->info->assemblyLine <<"\n";
					time_t nowtime = time (NULL);
					char buf[256];
					strftime(buf, sizeof(buf), "Get At: %Y-%m-%d %H:%M:%S\n", localtime(&nowtime));
					std::cerr << buf ;
					std::cerr << "Next target : "<< targetInstList[callSeqPtr]->info->file<<":"<<targetInstList[callSeqPtr]->info->line<<"@"<<targetInstList[callSeqPtr]->info->assemblyLine <<"\n";
					std::cerr << "Opcode : " << targetInstList[callSeqPtr]->inst->getOpcodeName() <<"\n";
					findNextTarget();
			}
		}
		lastChoice = minState;

		return *minState;
	} else {
		if (callSeqPtr==0)
			break;
		callSeqPtr--;
		bool btmore = true;
		while (btmore) {
//			int numnotstep = 0;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
			if (stateStepMap[es] == callSeqPtr) {
				btmore = false;
				break;
			}
		}
		if (btmore==false) {
			break;
		}
		if (callSeqPtr==0) {
			//lets try to remove the top one target so that we can move step further
			int maxcallSeqPtr = -1;
			for (std::vector<ExecutionState*>::iterator it = states.begin(),
			             ie = states.end(); it != ie; ++it) {
				ExecutionState *es = *it;
				if (stateStepMap[es] > maxcallSeqPtr) {
					maxcallSeqPtr = stateStepMap[es];
				}
			}
			targetInstList.erase(targetInstList.begin()+maxcallSeqPtr);
			std::cerr<< "remove target " <<maxcallSeqPtr<<" from target list\n";
			callSeqPtr = maxcallSeqPtr;
			break;


		}
		callSeqPtr--;

		};

		std::cerr << callSeqPtr <<" "<<targetInstList.size()<< " have to perform backtracing move step back\n";
		std::cerr << "Next target : "<< targetInstList[callSeqPtr]->info->file<<":"<<targetInstList[callSeqPtr]->info->line<<"@"<<targetInstList[callSeqPtr]->info->assemblyLine << "#" << targetInstList[callSeqPtr]->inst->getParent()->getParent()->getNameStr()<<"\n";

		if (states.size()==1) {
			std::cerr<<"Cur PC : " << states.back()->pc->info->file<<":" <<states.back()->pc->info->line<<"@"<<states.back()->pc->info->assemblyLine<<"#"<<states.back()->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
		}

		if (callSeqPtr==targetInstList.size())
			break;
			findNextTarget();
		}
	} while (true);
		//clear states
		std::cerr<<"min Dis is infinite, we can't find feasible path.\n Now terminating program \n";
		ExecutionState* retVal = NULL;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
	//		Instruction* nextInst = es->pc->inst;
		//	if (nextInst==targetInstList[callSeqPtr]) {
				retVal = es;
				break;
		//	}
		}
		CleanCachedCallSites();
		states.clear();
		return *retVal;
}

void CallSeqReplaySearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator ait = states.begin(),
             aie = states.end(); ait != aie; ++ait) {
        if (es==*ait) {
          states.erase(ait);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}

///

char DomInterfacePass::ID = 0;
DomInterfacePass::DomInterfacePass(std::vector<llvm::Instruction*>* inputList,std::set<llvm::Function*>* unvisitedList)
: llvm::FunctionPass((intptr_t) &ID) {
	this->inList = inputList;
	this->unvisitedF = unvisitedList;
	if (inList!=NULL) {
	for (unsigned i=0;i<inList->size();i++) {
		outputList.push_back(inList->at(i));
	}
	}
}

void DomInterfacePass::getAnalysisUsage(AnalysisUsage &AU) const{
	AU.addRequired<llvm::DominatorTree>();
	AU.addRequired<llvm::PostDominatorTree>();
}

bool DomInterfacePass::runOnFunction(Function& f) {
	Instruction* targetInst=NULL;
	if (inList!=NULL) {
	for (unsigned i=0;i<inList->size();i++) {
		if (inList->at(i)->getParent()->getParent()==&f) {
			targetInst = inList->at(i);
			break;
		}
	}
	}

	if (this->unvisitedF->find(&f)!=this->unvisitedF->end()) {
		outputPrunedList.push_back(&f.getEntryBlock());
	}
	else {
	PostDominatorTree &PDT = getAnalysis<PostDominatorTree>();

	for (Function::iterator FI=f.begin(),FE=f.end();FI!=FE;FI++) {
		BasicBlock* curBB = FI;
		for (BasicBlock::iterator BI=curBB->begin(),BE=curBB->end();BI!=BE;BI++) {
			Instruction* inst = BI;
			if (isa<CallInst>(inst)) {
				CallInst* callInst = (CallInst*) inst;
				if (callInst->getCalledFunction()!=NULL) {
					if (this->unvisitedF->find(callInst->getCalledFunction())!=this->unvisitedF->end()) {
					   if (targetInst!=NULL) {
						   if (targetInst->getParent()!=curBB) {
							   outputPrunedList.push_back(curBB);
						   }
						   if (!PDT.properlyDominates(curBB,targetInst->getParent())) {
							   for (Function::iterator sFI=f.begin(),sFE = f.end();sFI!=sFE;sFI++) {
							   		BasicBlock* kBB;

							   		if (PDT.properlyDominates(curBB,kBB)) {
							   			//add all BB postdom by curcall
							   			outputPrunedList.push_back(kBB);
							   		}
							   	}
						   }

					   } else {
						   outputPrunedList.push_back(curBB);
						   for (Function::iterator sFI=f.begin(),sFE = f.end();sFI!=sFE;sFI++) {
							   BasicBlock* kBB;

							   if (PDT.properlyDominates(curBB,kBB)) {
								   //add all BB postdom by curcall
								   outputPrunedList.push_back(kBB);
							   }
						   }
					   }
					}
				}
			}
		}
	}
	}


	if (targetInst==NULL)
		return false;
	DominatorTree &DT = getAnalysis<DominatorTree>();
	unsigned kk = 0;
	for (unsigned i=0;i<outputList.size();i++) {
		if (outputList[i]==targetInst) {
			kk = i;
			break;
		}
	}
	DomTreeNode* dtn = DT.getNode(targetInst->getParent());
	if (dtn==NULL) {
	//	std::cerr<<"dtn is null\n";
		targetInst->dump();
		return false;
	}
	DomTreeNode* idom = dtn->getIDom();
//	std::vector<llvm::BasicBlock*> domset;
	while (idom!=NULL&&idom!=dtn) {
		dtn = idom;
		if (dtn!=DT.getRootNode()) {
			BasicBlock* bb = dtn->getBlock();
			if (bb!=NULL) {
				outputList.insert(outputList.begin()+kk,bb->begin());
			}
		}
		idom = dtn->getIDom();
	}
	return false;

	//	if () {

//	}
}


///

int ShortestPathSearcher::getDistanceForBB(BasicBlock* bb, Instruction* tinst) {
	int distance = 1;
	for (BasicBlock::iterator I=bb->begin(), E=bb->end();I!=E;I++) {
		Instruction* inst = I;
		if (tinst!=NULL&&tinst==inst) {
			return distance;
		}
		if (isa<CallInst>(inst)) {
			CallInst* cinst = (CallInst*)inst;
			if (funcShortMap.find((Function*)cinst->getCalledFunction())!=funcShortMap.end()) {
				distance+=funcShortMap[(Function*)cinst->getCalledFunction()]+1;
			}
		}
	}
	return distance;
}

llvm::Instruction* ShortestPathSearcher::findInstFromSourceLine(std::string sourceline) {

	Instruction* retInst = NULL;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction* kf = functions[i];
		int numInst = kf->numInstructions;
		for (int j=0;j<numInst;j++) {
			KInstruction* ki = kf->instructions[j];
			std::ostringstream osstream;
			osstream << ki->info->file <<":"<<ki->info->line;
//			std::cerr << osstream.str() << "\n";
			if (osstream.str().compare(sourceline)==0) {

				//BasicBlock* curBB = ki->inst->getParent();
				//calc All distance to that targetBB;
				retInst = ki->inst;
			//	std::cerr <<"found"<<sourceline<<"\n";
			//	std::cerr << retInst->getParent()->getNameStr() <<"\n";
			//	std::cerr << retInst->getParent()->getParent()->getNameStr() <<"\n";
				return retInst;

				//std::cerr << (*(ki->inst)) <<"\n";
		//		return ki->inst;
//				targetBBList.push_back(curBB);
//					generateNewShortDistance();
			}
		}
	}
	if (retInst!=NULL) {

		retInst->dump();
	}
	return retInst;

}

ShortestPathSearcher::ShortestPathSearcher(Executor &_executor)
  : executor(_executor),
    functions(executor.kmodule->functions){
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function!=NULL) {
			funcShortMap[kf->function] = 1;
		}

	}

	//load stack trace file

	callStackPtr = 0;

	changeTargetInst = NULL;

	std::ifstream changeFile("changeTarget", std::ifstream::in);
	//only need the first line in cur version.
	if (changeFile.good()) {
		char line[1024];
		changeFile.getline(line,1024);
		std::string linestr(line);
		changeTargetSource = linestr;
		changeTargetInst = this->findInstFromSourceLine(changeTargetSource);
		if (changeTargetInst!=NULL)
			generateChangeDis();
	}
	changeFile.close();

	std::set<std::string> funcCoverList;

	std::ifstream covFile("funcov", std::ifstream::in);
	//only need the first line in cur version.
	while (covFile.good()) {
		char line[1024];
		covFile.getline(line,1024);
		std::string linestr(line);
		if (linestr.length()>0) {
			funcCoverList.insert(linestr);
		}
	}
	covFile.close();
	  std::set<llvm::Function*> unvisitedFunc;

//	std::string usermainfile;
//	for (unsigned i=0;i<functions.size();i++) {
//		KFunction * kf = functions[i];
//		if (kf->function!=NULL&&kf->function->getNameStr().compare("__user_main")==0) {
//			if (kf->instructions[0]!=NULL) {
//				usermainfile = kf->instructions[0]->info->file;
//				std::cerr<<"__user_main file info:"<<usermainfile<<"\n";
//				break;
//			}
//		}
//	}

	for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			if (kf->function!=NULL) {
				if (kf->instructions[0]!=NULL) {
					if (kf->instructions[0]->info->file.length()>0&&kf->instructions[0]->info->file.find("klee/runtime")==std::string::npos&&kf->instructions[0]->info->file.find("klee-uclibc")==std::string::npos){
						if (funcCoverList.find(kf->function->getNameStr())==funcCoverList.end()) {
					//		std::cerr<< "this function is not visited: "<<kf->function->getNameStr()<<"\n";
					//		std::cerr<<kf->instructions[0]->info->file<<"\n";
							unvisitedFunc.insert(kf->function);
							continue;
						}
					}
				}
			}
		}



	std::ifstream historyFile("stackHistory", std::ifstream::in);
	std::vector<std::string> funcList;
	while (historyFile.good()) {
		char line[1024];
		historyFile.getline(line,1024);
		std::string linestr(line);
		size_t strfound;
		strfound=linestr.find_first_of(":");

		if (strfound==std::string::npos)
			continue;
		size_t funcfound;
		funcfound=linestr.find_first_of("@");
		if (funcfound==std::string::npos) {
			callStack.push_back(linestr);
			break;
		}
		std::string lineinfo = linestr.substr(0,funcfound);
		std::string funcName = linestr.substr(funcfound+1);
		callStack.push_back(lineinfo);
		funcList.push_back(funcName);
	}
	historyFile.close();

	for (unsigned i=0;i<funcList.size();i++) {
		std::string linestr = callStack[i];
		std::string callFuncStr = funcList[i];
//		size_t bbfound;
//		bbfound = callFuncStr.find_first_of("#");
		bool found = false;
		for (unsigned i=0;i<functions.size();i++) {
			KFunction* kf = functions[i];
			int numInst = kf->numInstructions;
			for (int j=0;j<numInst;j++) {
				KInstruction* ki = kf->instructions[j];
				std::ostringstream osstream;
				osstream << ki->info->file <<":"<<ki->info->line<<"@"<<ki->info->assemblyLine;
	//			std::cerr << osstream.str() << "\n";
				std::ostringstream osstream2;
				osstream2 << linestr <<"@"<<callFuncStr;
				if (osstream.str().compare(osstream2.str())==0) {
						found =true;
					stackcallList.push_back(ki->inst);
//					generateNewShortDistance();
					break;
				}
			}
			if (found)
				break;
		}


	}
//	if (funcList.size() < callStack.size()) {
//	std::string lasttarget = callStack[callStack.size()-1];
//	Instruction* lastInst = this->findInstFromSourceLine(lasttarget);
//	stackcallList.push_back(lastInst);
//	}
//	std::cerr<<"build dom tree\n";
	llvm::PassManager pmdom;
	DomInterfacePass* dpass = new DomInterfacePass(&stackcallList, &unvisitedFunc);
	pmdom.add((llvm::Pass*)dpass);
	pmdom.run(*executor.kmodule->module);
	targetInstList.insert(targetInstList.begin(),dpass->outputList.begin(),dpass->outputList.end());
	prunedBBSet.insert(dpass->outputPrunedList.begin(),dpass->outputPrunedList.end());
//	for (unsigned i=0;i<dpass.size();i++) {
////		std::cerr<<callStack[i]<<"\n";
//		Instruction* callInst = stackcallList[i];
//		DomTreeNode* dtn = dtpass->getNode(callInst->getParent());
//		if (dtn==NULL) {
//			targetInstList.push_back(stackcallList[i]);
//			std::cerr<<"dtn is null\n";
//			callInst->dump();
//			continue;
//		}
//		DomTreeNode* idom = dtn->getIDom();
//		std::vector<llvm::BasicBlock*> domset;
//		while (idom!=NULL&&idom!=dtn) {
//			dtn = idom;
//			domset.push_back(dtn->getBlock());
//			idom = dtn->getIDom();
//		}
//		for (unsigned j=domset.size()-2;j>=0;j--) {
//			targetInstList.push_back(domset[j]->getFirstNonPHI());
//		}
//		targetInstList.push_back(stackcallList[i]);
//	}
	targetPtr = 0;
	lastChoiceNumber = -1;
	lastChoice = NULL;
	std::cerr<<"stack size:"<<stackcallList.size()<<"\n";
	std::cerr<<"target number:"<<targetInstList.size()<<"\n";
	std::cerr<< "Pruned bb size:"<< prunedBBSet.size()<<"\n";
	this->getTarget = false;
	generateFuncMap();
	findNextTarget();

}

void ShortestPathSearcher::generateFuncMap() {
	// run 5 times to get approximate short dis for func
		for (int j=0;j<5;j++) {
			curDistanceMap.clear();

		for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			llvm::Function* curFunc = kf->function;
			int infinity = 10000000;
		//	std::set<BasicBlock*> s;
			std::set<Instruction*> q;
	//		BasicBlock* lastBB;
	//		std::map<Instruction*,int> curFuncMap;
			//cerr << curFunc->getBasicBlockList().size()<<"\n";
			if (curFunc->getBasicBlockList().size()==0)
				continue;
			//std::cerr<<"start generating for func "<<curFunc->getNameStr()<<"\n";
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
				bool notaddtoq = false;
				if (prunedBBSet.find(BB)!=prunedBBSet.end())
					notaddtoq = true;

					for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
						Instruction* inst = BI;
						if (notaddtoq)  {
							curDistanceMap[inst] = infinity;
							continue;
						}
						if (isa<ReturnInst>(inst)) {
							curDistanceMap[inst] = 1;
						} else if (isa<CallInst>(inst)){
												CallInst* callI = (CallInst*)inst;
												if (callI->getCalledFunction()!=NULL&&callI->getCalledFunction()->getNameStr().compare("exit")==0)
													curDistanceMap[inst] = 1;
						} else {
							curDistanceMap[inst] = infinity;
						}
						q.insert(inst);
					}
			}

	//		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
	//			BasicBlock *BB = I;
	//			pred_iterator PI = pred_begin(BB), PE = pred_end(BB);
	//			if (PI!=PE||BB==&(curFunc->getEntryBlock())) {
	//				lastBB = BB;
	//				//cerr<<"-\t"<<lastBB->getNameStr()<<"\n";
	//				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
	//					Instruction* inst = BI;
	//					curFuncMap[inst] = infinity;
	//					q.insert(inst);
	//				}
	//
	//			  }
	//		}

	//		BasicBlock* entry = &(curFunc->getEntryBlock());
	//		Instruction* entryInst = entry->begin();
	//		curFuncMap[entryInst] = 1;
			//curFuncMap[entry] = getDistanceForBB(entry,NULL);
			while (q.size()>0) {
				   std::set<Instruction*>::iterator it;
				   Instruction* minInst = NULL;
				   int minval = infinity;
				   for (it = q.begin();it!=q.end();it++) {
				    	Instruction* ci = *it;

				    	if (curDistanceMap[ci]<minval) {
							minval = curDistanceMap[ci];
							minInst = ci;
				    	}
				   }
				   if (minval==infinity) {
					   q.clear();
					   break;
				   }
			//	   cerr<<"get min BB:" << minBB->getNameStr() << "\n";
				   q.erase(minInst);
		//		   s.insert(minBB);

				   Instruction* prevInst = NULL;
				   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
					   Instruction* binst = BI;
					   if (binst==minInst)
						   break;
					   prevInst = BI;
				   }
				   int newDis = 0;
				   if (prevInst==NULL) {
					   //means minInst is the beginning of program
					   pred_iterator PI = pred_begin(minInst->getParent()), PE = pred_end(minInst->getParent());
					   while(PI!=PE) {
						   BasicBlock* predBB = (BasicBlock*)(*PI);
						   TerminatorInst* predterm = predBB->getTerminator();
						   newDis = curDistanceMap[minInst]+1;
						   if (curDistanceMap[predterm]>newDis) {
							   curDistanceMap[predterm] = newDis;
						   }
						   PI++;
					   }

				   } else if (isa<CallInst>(prevInst)) {

					   //means prevInst is a call site to another func
					   Function* calledFunc = ((CallInst*)prevInst)->getCalledFunction();
					   if (calledFunc==NULL) {
						   newDis = curDistanceMap[minInst]+1;
						} else {
							if (funcShortMap.find(calledFunc)!=funcShortMap.end())
								newDis = curDistanceMap[minInst]+1+funcShortMap[calledFunc];
							else
								newDis = curDistanceMap[minInst]+1;
						}
					   if (curDistanceMap[prevInst]>newDis) {
						   curDistanceMap[prevInst] = newDis;
					   }
				   } else {
					   //simple case direct pred

					   newDis = curDistanceMap[minInst]+1;
					   if (curDistanceMap[prevInst] > newDis) {
						   curDistanceMap[prevInst] = newDis;
					   }
				   }
		//		    cerr<<q.size()<<"\n";

				}
	//			cerr << lastBB->getNameStr() << "\n";
	//			cerr << curFuncMap[lastBB] << "\n";
			if (curDistanceMap[curFunc->getEntryBlock().begin()]<infinity) {
				funcShortMap[curFunc] = curDistanceMap[curFunc->getEntryBlock().begin()];
		//		std::cerr <<  "dis func map for "<< curFunc->getNameStr() <<" is " <<funcShortMap[curFunc]<<"\n";
			}
		//	else
			//	std::cerr<<"can't get to entry of this function : "<<curFunc->getNameStr()<<"\n";
		}
		}

}

void ShortestPathSearcher::generateChangeDis() {
	this->changeTargetDisMap.clear();

	int infinity = 10000000;
	//std::set<BasicBlock*> s;
	std::set<Instruction*> q;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		Function* curFunc = kf->function;

	for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
		BasicBlock *BB = I;
		for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
			Instruction* inst = BI;

			changeTargetDisMap[inst] = infinity;
			q.insert(inst);
		}
	}
	}

	std::set<Function*> callingFuncList;
	callingFuncList.insert(changeTargetInst->getParent()->getParent());

	changeTargetDisMap[changeTargetInst] = 0;
	//first round can only going into call sites.
	while (q.size()>0) {
		   std::set<Instruction*>::iterator it;
		   Instruction* minInst = NULL;
		   int minval = infinity;
		   for (it = q.begin();it!=q.end();it++) {
		    	Instruction* cinst = *it;

		    	if (changeTargetDisMap[cinst]<minval) {
					minval = changeTargetDisMap[cinst];
		    		minInst = cinst;
		    	}
		   }
		   if (minval==infinity) {
			   q.clear();
			   break;
		   }
	//	   cerr<<"get min BB:" << minBB->getNameStr() << "\n";
		   q.erase(minInst);
//		   s.insert(minBB);

		   Instruction* prevInst = NULL;
		   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
			   Instruction* binst = BI;
			   if (binst==minInst)
				   break;
			   prevInst = BI;
		   }
		   int newDis = 0;

		   if (prevInst==NULL) {
			   //means minInst is the beginning of program
			   BasicBlock* funcEntryBB = &(minInst->getParent()->getParent()->getEntryBlock());
			   if (minInst->getParent()!=funcEntryBB) {
				   pred_iterator PI = pred_begin(minInst->getParent()), PE = pred_end(minInst->getParent());
				   while(PI!=PE) {
					   BasicBlock* predBB = (BasicBlock*)(*PI);
					   TerminatorInst* predterm = predBB->getTerminator();
					   newDis = changeTargetDisMap[minInst]+1;
					   if (changeTargetDisMap[predterm]>newDis) {
						   changeTargetDisMap[predterm] = newDis;
					   }
					   PI++;
				   }
			   } else {
				   //find all callinst to this func
				   Function* calledFunc = minInst->getParent()->getParent();
				 //  std::cerr<<"up scaled reaching func: "<<calledFunc->getNameStr()<<"\n";
				   if (callingFuncList.find(calledFunc)!=callingFuncList.end()) {
				   //find all call site for calledFunc can traverse all CallInst in module
					  // std::cerr<<"found in reaching list"<<calledFunc->getNameStr()<<"\n";
					for (unsigned i=0;i<functions.size();i++) {
						KFunction * kf = functions[i];
//						KInstruction** instList = kf->instructions;
						Function* curFunc = kf->function;
						for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
							BasicBlock *BB = I;
							for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
								Instruction* inst = BI;
							if (isa<CallInst>(inst)) {
								CallInst* cinst = (CallInst*)(inst);
								if (cinst->getCalledFunction()==calledFunc||cinst->getCalledFunction()==NULL) {
									newDis = changeTargetDisMap[minInst]+1;
									if (this->changeTargetDisMap[cinst]>newDis) {
										this->changeTargetDisMap[cinst] = newDis;

									}
									callingFuncList.insert(cinst->getParent()->getParent());

								}
							}
							}
						}
					}

				   }

			   }

		   } else if (isa<CallInst>(prevInst)) {
			   //means prevInst is a call site to another func
			   Function* calledFunc = ((CallInst*)prevInst)->getCalledFunction();
			   if (calledFunc==NULL) {
				   newDis = changeTargetDisMap[minInst]+1;
					if (this->changeTargetDisMap[prevInst]>newDis)
						this->changeTargetDisMap[prevInst] = newDis;
			   } else {

				if (funcShortMap.find(calledFunc)!=funcShortMap.end()) {

					for (Function::iterator FI = calledFunc->begin(), FE = calledFunc->end();FI!=FE;FI++) {
						BasicBlock* fibb = (FI);
						TerminatorInst* tfibb = fibb->getTerminator();
						if (isa<ReturnInst>(tfibb)) {
							   newDis = changeTargetDisMap[minInst]+1;
							if (this->changeTargetDisMap[tfibb]>newDis) {
								this->changeTargetDisMap[tfibb]=newDis;
							}
						}
					}
					newDis = changeTargetDisMap[minInst]+1+funcShortMap[calledFunc];
					if (this->changeTargetDisMap[prevInst]>newDis)
						this->changeTargetDisMap[prevInst] = newDis;
				} else {
					   newDis = changeTargetDisMap[minInst]+1;
						if (this->changeTargetDisMap[prevInst]>newDis)
							this->changeTargetDisMap[prevInst] = newDis;
				}
			   }

		   } else {

			   //simple case direct pred
			   newDis = changeTargetDisMap[minInst]+1;
			   if (changeTargetDisMap[prevInst] > newDis) {
				   changeTargetDisMap[prevInst] = newDis;
			   }
		   }


		}
////	std::cerr<<"entry of this func"<<changeTargetDisMap[changeTargetInst->getParent()->getParent()->getEntryBlock().begin()] <<"\n";
//	for (std::set<Function*>::iterator it = callingFuncList.begin(),ie = callingFuncList.end();it!=ie;it++) {
//		Function* cfunc = (*it);
//		std::cerr<<"up reached func : "+cfunc->getNameStr()+"\n";
//	}
}


void ShortestPathSearcher::generateNewShortDistance() {
//	this->curDistanceMap.clear();
	this->curInsideFuncDisMap.clear();

	int infinity = 10000000;
	//std::set<BasicBlock*> s;
	std::set<Instruction*> q;
	int totalfuncInstcount = 0;

	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		Function* curFunc = kf->function;
		if (curFunc==targetInstList[targetPtr]->getParent()->getParent()) {
			totalfuncInstcount = kf->numInstructions;
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
				bool notaddtoq = false;
				if (prunedBBSet.find(BB)!=prunedBBSet.end())
					notaddtoq = true;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					curInsideFuncDisMap[inst] = infinity;
					if (!notaddtoq)
						q.insert(inst);
				}

			}
		}
	}
	curInsideFuncDisMap[targetInstList[targetPtr]]=0;

	int reachableinstnum = 0;
	while (q.size()>0) {
		   std::set<Instruction*>::iterator it;
		   Instruction* minInst = NULL;
		   int minval = infinity;
		   for (it = q.begin();it!=q.end();it++) {
		    	Instruction* cinst = *it;

		    	if (curInsideFuncDisMap[cinst]<minval) {
					minval = curInsideFuncDisMap[cinst];
		    		minInst = cinst;
		    	}
		   }
		   if (minval==infinity){
			   q.clear();
			   break;
		   }
	//	   cerr<<"get min BB:" << minBB->getNameStr() << "\n";
		   q.erase(minInst);
		   reachableinstnum++;
//		   s.insert(minBB);

		   Instruction* prevInst = NULL;
		   BasicBlock* parentBB = minInst->getParent();
		   for (BasicBlock::iterator BI = parentBB->begin(),BE = parentBB->end();BI!=BE;BI++) {
			   Instruction* binst = BI;
			   if (binst==minInst)
				   break;
			   prevInst = BI;
		   }
		   int newDis = 0;

		   if (prevInst==NULL) {
		   				   //means minInst is the beginning of basic block
		   				   pred_iterator PI = pred_begin(minInst->getParent()), PE = pred_end(minInst->getParent());
		   				   while(PI!=PE) {
		   					   BasicBlock* predBB = (BasicBlock*)(*PI);
		   					   TerminatorInst* predterm = predBB->getTerminator();
		   					   newDis = curInsideFuncDisMap[minInst]+1;
		   					   if (curInsideFuncDisMap[predterm]>newDis) {
		   						curInsideFuncDisMap[predterm] = newDis;
		   					   }
		   					   PI++;
		   				   }

		   			   } else if (isa<CallInst>(prevInst)) {
		   				   //means prevInst is a call site to another func
		   				Function* calledFunc = ((CallInst*)prevInst)->getCalledFunction();

						   if (calledFunc==NULL) {
							   newDis = curInsideFuncDisMap[minInst]+1;
							} else {
								if (funcShortMap.find(calledFunc)!=funcShortMap.end())
									newDis = curInsideFuncDisMap[minInst]+1+funcShortMap[calledFunc];
								else
									newDis = curInsideFuncDisMap[minInst]+1;
							}
						   if (curInsideFuncDisMap[prevInst]>newDis) {
							   curInsideFuncDisMap[prevInst] = newDis;
						   }

		   			   } else {
		   				   //simple case direct pred
		   				   newDis = curInsideFuncDisMap[minInst]+1;
		   				   if (curInsideFuncDisMap[prevInst] > newDis) {
		   					curInsideFuncDisMap[prevInst] = newDis;
		   				   }
		   			   }

		}
	//std::cerr<<"finish generating new dis : " <<reachableinstnum<<"\t"<<totalfuncInstcount<<"\n";
}

void ShortestPathSearcher::findNextTarget() {
	//missing: get current target source line
	// clear lastchoice
	lastChoice = NULL;
	lastChoiceNumber = -1;
	int infinity = 10000000;

	if (targetPtr==targetInstList.size()) {

		this->curInsideFuncDisMap.clear();
//		for (unsigned i=0;i<functions.size();i++) {
//			KFunction * kf = functions[i];
//			Function* curFunc = kf->function;
//
//		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
//			BasicBlock *BB = I;
//				pred_iterator PI = pred_begin(BB), PE = pred_end(BB);
//				if (PI!=PE||BB==&(curFunc->getEntryBlock())) {
//					//cerr<<"-\t"<<lastBB->getNameStr()<<"\n";
//					//set to infinity make every bb become can not reach
//					curDistanceMap[BB] = infinity;
//				}
//			}
//		}
		return;
	}
//	std::string targetSourceLine = callStack[callStackPtr];
//	std::cerr << targetSourceLine <<"\n";

	generateNewShortDistance();

	return;

}

ShortestPathSearcher::~ShortestPathSearcher() {
}


ExecutionState &ShortestPathSearcher::selectState() {
	//ExecutionState *es = states.back();
	int infinity = 10000000;
	int initenvpos = 0;
	if (InitEnv)
		initenvpos = 1;

	if (this->getTarget==true) {
		ExecutionState* correctState = NULL;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
			if (es->stack.size()>=callStackPtr+initenvpos) {
				bool correctStack = true;
				for (unsigned ui = 1+initenvpos;ui<callStackPtr+initenvpos;ui++) {
					StackFrame sf = es->stack[ui];
					KInstruction* kinst = sf.caller;

					std::ostringstream osstream;
					osstream << kinst->info->file <<":"<<kinst->info->line;

				//	std::cerr<<kinst->info->line<<"\n";
					if (kinst->inst!=stackcallList[ui-1-initenvpos]){//||(osstream.str().compare(callStack[ui-1-initenvpos])!=0)) {
						correctStack = false;
						break;
					}

				}
				if (correctStack) {

				if (es->stack.size()==callStackPtr+initenvpos) {
					std::ostringstream osstream;
					KInstruction* kinst = es->pc;
					osstream << kinst->info->file <<":"<<kinst->info->line;
					if (/*kinst->inst->getParent()==targetBBList[callStackPtr-1]&&*/(osstream.str().compare(callStack[callStackPtr-1])==0)) {
						correctState = es;
					} else {
						std::ostringstream prevosstream;
						KInstruction* kprevinst = es->prevPC;
						prevosstream << kprevinst->info->file <<":"<<kprevinst->info->line;
						if (/*kprevinst->inst->getParent()==targetBBList[callStackPtr-1]&&*/(prevosstream.str().compare(callStack[callStackPtr-1])==0)) {
							correctState = es;
					//		std::cerr<<"clear state | current line no @ " << kinst->info->line<<"\n";
							states.clear();
						}
					}
				} else {
					KInstruction* kinst = es->stack[callStackPtr+initenvpos].caller;
					std::ostringstream osstream;
					osstream << kinst->info->file <<":"<<kinst->info->line;
					if (/*kinst->inst->getParent()==targetBBList[callStackPtr-1]&&*/(osstream.str().compare(callStack[callStackPtr-1])==0)) {
						correctState = es;
					}
				}


				}
			}
		}
		if (correctState==NULL) {
		//	std::cerr<<"maybe this execution already be killed due to fault\n";
			//temp solution pick any path
			correctState = *(states.begin());
			states.clear();
		}
		return *correctState;
	}
	do {
	int minDis = infinity;
	std::vector<ExecutionState*> potentialminState;
	std::vector<int> potentialminVal;
	ExecutionState* minState;
//	std::cerr<<"reach here picking state?? "<<callStackPtr<<"\n";

	for (std::vector<ExecutionState*>::iterator it = states.begin(),
	             ie = states.end(); it != ie; ++it) {
		ExecutionState *es = *it;
		int dis = infinity;

		BasicBlock* nextbb = es->pc->inst->getParent();
		if (prunedBBSet.find(nextbb)!=prunedBBSet.end())
			continue;

		if (es->stack.size()>=callStackPtr+initenvpos) {
			bool sameCallStack = true;
			unsigned checkstacksize = 0;
			if (callStackPtr+initenvpos==es->stack.size())
				checkstacksize = callStackPtr+initenvpos;
			else
				checkstacksize = callStackPtr+1+initenvpos;
			for (unsigned i=1+initenvpos;i<checkstacksize;i++) {
				StackFrame sf = es->stack[i];
				KInstruction* kinst = sf.caller;
			//	std::ostringstream osstream;
			//	osstream << kinst->info->file <<":"<<kinst->info->line;

			//	std::cerr<<kinst->info->line<<"\n";
				if (kinst->inst!=stackcallList[i-1-initenvpos]){//||(osstream.str().compare(callStack[i-1-initenvpos])!=0)) {
					sameCallStack = false;
					break;
				}
				//if (sf->)
			}
			if (sameCallStack) {
				if ((es->stack.size()==callStackPtr+initenvpos)&&(callStackPtr>0)) {

				//	std::ostringstream osstream;
				//	osstream << es->pc->info->file <<":"<<es->pc->info->line;

					if (es->pc->inst==stackcallList[callStackPtr-1]){//&&(osstream.str().compare(callStack[callStackPtr-1])==0)) {
						if (isa<CallInst>(es->pc->inst)) {
								BasicBlock* calledEntry = &(((CallInst*)es->pc->inst)->getCalledFunction()->getEntryBlock());
								if (this->curInsideFuncDisMap[calledEntry->begin()]<infinity) {
									dis = this->curInsideFuncDisMap[calledEntry->begin()];
									if (changeTargetInst!=NULL) {
											if (changeTargetReachFlag.find(es)==changeTargetReachFlag.end()) {
												dis+=this->changeTargetDisMap[calledEntry->begin()];
											}
									}
									if (dis<infinity) {
									potentialminState.push_back(es);
									potentialminVal.push_back(dis);
									}
									//minState = es;
									if (dis==0) {
										minDis = dis;
										minState = es;
										visitedInstSet.insert(minState->pc->inst);
									}
									//break;
								}
						}

//						std::cerr << "min dis set\n";
					}
				} else {
					//check _user_main
					bool foundusermain = false;
					for (unsigned i=1;i<es->stack.size();i++) {
						StackFrame sf = es->stack[i];
						if (isa<CallInst>(sf.caller->inst)) {
							if ((((CallInst*)sf.caller->inst)->getCalledFunction()!=NULL)&&((CallInst*)sf.caller->inst)->getCalledFunction()->getNameStr().compare("__user_main")==0) {
								foundusermain = true;
							}
						}
					}
					if (foundusermain == false) {
						dis = 10; //set a constant for inst in wrapped main provided by klee
						potentialminState.push_back(es);
						potentialminVal.push_back(dis);
					//	std::cerr<<es->pc->inst->getParent()->getParent()->getNameStr();
					}
					else {
						if ((es->stack.size()==callStackPtr+1+initenvpos)) {
							//it should be in the same function
							//use pc to get distance
						//	std::cerr<<es->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
							if (es->pc->inst->getParent()->getParent()==targetInstList[targetPtr]->getParent()->getParent()) {
								dis = this->curInsideFuncDisMap[es->pc->inst];
								//std::cerr<<"reach here "<<dis<<"\n";
								if (changeTargetInst!=NULL) {
										if (changeTargetReachFlag.find(es)==changeTargetReachFlag.end()) {
											dis+=this->changeTargetDisMap[es->pc->inst];
										}
								}
								//std::cerr<<"reach here "<<dis<<"\n";
								if (dis<infinity) {
									potentialminState.push_back(es);
									potentialminVal.push_back(dis);
								}
								//minState = es;
								if (dis==0) {
									minDis = dis;
									minState = es;
									visitedInstSet.insert(minState->pc->inst);
								}
							} else {
				//				std::cerr << "current top pc(same stack size) is not in ths same function \n==== information dumped =======\n";
				//				std::cerr << es->pc->info->file <<":"<<es->pc->info->line<<"\n";
				//				std::cerr << "current target is "<<callStackPtr<<" ; "<< callStack[callStackPtr]<<"\n";
							}
						} else {
							StackFrame sfo = es->stack[callStackPtr+1+initenvpos];

							if (sfo.caller->inst->getParent()->getParent()==targetInstList[targetPtr]->getParent()->getParent()) {
							//first part comes from pc
							dis = this->curDistanceMap[es->pc->inst];
							//count down to stack
							for (unsigned i=es->stack.size()-1;i>callStackPtr+1+initenvpos;i--) {
								StackFrame sf = es->stack[i];
								KInstruction* kinst = sf.caller;
								dis += this->curDistanceMap[kinst->inst];
							}
							//get to the same stack pos with target should use the Inside func dis
							dis+= this->curInsideFuncDisMap[sfo.caller->inst];
							if (changeTargetInst!=NULL) {
									if (changeTargetReachFlag.find(es)==changeTargetReachFlag.end()) {
										dis+=this->changeTargetDisMap[es->pc->inst];
									}
							}
							if (dis<infinity) {
								potentialminState.push_back(es);
								potentialminVal.push_back(dis);
							}
							if (dis==0) {
									minDis = dis;
									minState = es;
									visitedInstSet.insert(minState->pc->inst);
							}
							} else {
					//			std::cerr << "current sf at the same level of target (larger stack size) is not in ths same function \n==== information dumped =======\n";
					//			std::cerr << sfo.caller->info->file <<":"<<sfo.caller->info->line<<"\n";
					//			std::cerr << "current target is "<<callStackPtr<<" ; "<< callStack[callStackPtr]<<"\n";
							}
						}
					}

				}
			}
		}


	}
	if (minDis>0&&potentialminVal.size()>0) {
		int valLength = potentialminVal.size()-1;
		ExecutionState* pminState = NULL;
		if (lastChoiceNumber==valLength) {
			for (int a=0;a<=valLength;a++) {
				if (potentialminState[a]==lastChoice) {
					pminState = lastChoice;
					minDis = potentialminVal[a];
					break;
				}
			}
			if (pminState!=NULL) {
				minState = pminState;
			}
		}
		if (pminState==NULL) {

			lastChoiceNumber = valLength;
			for (int a=0;a<=valLength;a++) {
				for (int b=valLength;b>a;b--) {
					if (potentialminVal[b-1]>potentialminVal[b]) {
						int swapInt = potentialminVal[b-1];
						potentialminVal[b-1] = potentialminVal[b];
						potentialminVal[b] = swapInt;
						ExecutionState* swapState = potentialminState[b-1];
						potentialminState[b-1] =potentialminState[b];
						potentialminState[b] = swapState;
					}
				}
			}
		bool foundNewInst = false;
//		std::cerr<<"num choices: "<<valLength<<"\n";
		for (unsigned i=0;i<=valLength;i++) {
			ExecutionState* cures = potentialminState[i];
			if (visitedInstSet.find(cures->pc->inst)==visitedInstSet.end()) {
				foundNewInst = true;
				minDis = potentialminVal[i];
				minState = potentialminState[i];
				visitedInstSet.insert(minState->pc->inst);
		//		std::cerr<<"move to new inst\n";
				break;
			}
		}
		if (foundNewInst==false) {
			minDis = potentialminVal[0];
			minState = potentialminState[0];
		//	std::cerr<<"no new coverage move to shortest path\n";
		}
	}
//	double totalVal = 0;
//	for (std::vector<int>::iterator it = potentialminVal.begin(),
//	             ie = potentialminVal.end(); it != ie; ++it) {
//		totalVal+=1.00/((double)(*it));
//	}
//	double rng = theRNG.getDoubleL();
//	//std::cerr<<"rng : "<<rng << " potentialminVal : "<< potentialminVal.size() ;
//	double curSum = 0;
//	for (unsigned i =0;i<potentialminVal.size();i++) {
//		double curTemp = 1.00/((double)(potentialminVal[i]));
//		if (curSum/totalVal<=rng&&(curSum+curTemp)/totalVal>rng) {
//			minDis = potentialminVal[i];
//			minState = potentialminState[i];
////			std::cerr<<" picked number "<<i<<"\n";
//			break;
//		}
//		double v1 = curSum/totalVal;
//		double v2 = (curSum+curTemp)/totalVal;
////		std::cerr<<"["<<v1<<","<<v2<<"]\n";
//		curSum+=curTemp;
//	}
	}

	if (minDis<infinity) {
//		std::cerr << "picked " <<minState->pc->info->file<<":"<< minState->pc->info->line << " stack size" << minState->stack.size() <<" min Dis "<<minDis<<"\n";
//		std::cerr << "bb:" <<minState->pc->inst->getParent()->getNameStr()<<"@"<<minState->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
		//std::ostringstream osstream;
		//osstream << minState->pc->info->file <<":"<<minState->pc->info->line;

		if (minState->pc->inst==this->changeTargetInst/*&&osstream.str().compare(changeTargetSource)==0*/) {
			if (changeTargetReachFlag.find(minState)==changeTargetReachFlag.end())
				changeTargetReachFlag[minState] = 1;
		}

		if (minState->pc->inst==targetInstList[targetPtr]/*&&(osstream.str().compare(callStack[callStackPtr])==0)*/) {

		//	llvm::errs() << "cur pc stack size" << minState->stack.size();
			if (targetInstList[targetPtr]==stackcallList[callStackPtr]) {
			if (minState->stack.size()==callStackPtr+1+initenvpos) {
				targetPtr++;
				callStackPtr++;
				if (callStackPtr==callStack.size()) {
					std::cerr << "reach target clear other states dump pc\n";
					this->getTarget = true;
					states.clear();
				} else {
					std::cerr << targetPtr <<" "<<targetInstList.size()<< " reach partial important move step forward\n";
					findNextTarget();
				}
			}
			} else {
				targetPtr++;
				std::cerr << targetPtr <<" "<<targetInstList.size()<< " reach partial important move step forward\n";
				findNextTarget();
			}
		}
		lastChoice = minState;
		return *minState;
	} else {
		if (targetPtr==0)
			break;
		targetPtr--;
		if (targetInstList[targetPtr]==stackcallList[callStackPtr-1])
			callStackPtr--;
		std::cerr << targetPtr <<" "<<targetInstList.size()<< " have to perform backtracing move step back\n";
			findNextTarget();
		}
	} while (true);
		//clear states
		std::cerr<<"min Dis is infinite\n terminating search\n";
		ExecutionState* retVal = NULL;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
			Instruction* nextInst = es->pc->inst;
			if (nextInst==targetInstList[callStackPtr]) {
				retVal = es;
			}
		}
		states.clear();
		return *retVal;
}

void ShortestPathSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator ait = states.begin(),
             aie = states.end(); ait != aie; ++ait) {
        if (es==*ait) {
          states.erase(ait);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}

///

ConcreteFuncCoverageSearcher::ConcreteFuncCoverageSearcher() {
	getToUserMain = false;
	lastbb = NULL;


	std::ofstream funcovFile;
	funcovFile.open("funcov",std::ios::out);
	funcovFile.close();

}

ExecutionState &ConcreteFuncCoverageSearcher::selectState() {
	ExecutionState* es = states.back();
	if (getToUserMain==false&&es->pc->inst->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
		getToUserMain = true;
		firstLineFile = es->pc->info->file;
	}
	if (getToUserMain==false)
		return *es;
	//* bb = es->pc->inst->getParent();
	if (es->pc->info->file.find("klee/runtime")!=std::string::npos)
		return *es;
	if (es->pc->info->file.find("klee-uclibc")!=std::string::npos)
			return *es;

	Function* curFunc = es->pc->inst->getParent()->getParent();
	if (visitedFunc.find(curFunc)==visitedFunc.end()) {
		std::ofstream funcovFile;
		funcovFile.open("funcov",std::ios::app);

		funcovFile<< es->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
		funcovFile.close();

		visitedFunc.insert(curFunc);
	}

  return *es;
}

void ConcreteFuncCoverageSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}


///

ConcreteCallSeqSearcher::ConcreteCallSeqSearcher(){
	getToUserMain = false;
	outputNextInst = false;
	lastbb = NULL;

	std::ifstream historyFile("funclist", std::ifstream::in);
	while (historyFile.good()) {
		char line[1024];
		historyFile.getline(line,1024);
		std::string linestr(line);
		pathFunSet.insert(linestr);
		std::cerr<<"get func : "<<linestr<<"\n";
	}
	historyFile.close();
	std::ofstream callSeqFile;
	callSeqFile.open("callseq",std::ios::out);
	callSeqFile.close();
	std::ofstream funcovFile;
	funcovFile.open("funcov",std::ios::out);
	funcovFile.close();
}

ExecutionState &ConcreteCallSeqSearcher::selectState() {
	ExecutionState* es = states.back();
	if (getToUserMain==false&&es->pc->inst->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
		getToUserMain = true;
		firstLineFile = es->pc->info->file;
	}
	if (getToUserMain==false)
		return *es;
	if (es->pc->info->file.find("klee/runtime")!=std::string::npos)
		return *es;
//	if (es->pc->info->file.find("libc/stdio/_vfprintf.c")!=std::string::npos)
//		return *es;
	if (es->pc->info->file.find("libc/stdio")!=std::string::npos)
			return *es;


//	if (es->pc->info->file.find("klee-uclibc")!=std::string::npos)
//			return *es;

	Function* curFun = es->pc->inst->getParent()->getParent();
	if (visitedFunc.find(curFun)==visitedFunc.end()) {
		std::ofstream funcovFile;
		funcovFile.open("funcov",std::ios::app);
		funcovFile<<es->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
		funcovFile.close();
		visitedFunc.insert(curFun);
	}

//	pofFile.open("pof",std::ios::out);
//	pofFile<< es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->id<<"#"<<es->pc->info->assemblyLine<<"\n";
//	pofFile.close();

	//* bb = es->pc->inst->getParent();
	std::string funcName;
	std::string curFunc = es->pc->inst->getParent()->getParent()->getNameStr();
	if (pathFunSet.find(curFunc)!=pathFunSet.end()) {
	//std::cerr<<"detail: "<<es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->assemblyLine<<"\n";
	//es->pc->inst->dump();
	if (outputNextInst) {

		if ((!isa<PHINode>(es->pc->inst))&&(es->pc->info->file.find("klee/runtime")==std::string::npos)){//&&(es->pc->info->file.find("klee-uclibc")==std::string::npos)) {
			std::ofstream callSeqFile;
		callSeqFile.open("callseq",std::ios::app);
		callSeqFile<< es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->assemblyLine<<"#\n";
		callSeqFile.close();
		}
		if (!isa<PHINode>(es->pc->inst))
		outputNextInst = false;
	}
	if (es->pc->inst->isTerminator()) {
		TerminatorInst* tinst = (TerminatorInst*)es->pc->inst;
	//	std::cerr<<"NumSuccs:"<<tinst->getNumSuccessors()<<"\n";
		if (tinst->getNumSuccessors()>0)
			outputNextInst = true;
	}

	} else
	if (isa<CallInst>(es->pc->inst)) {
		CallInst* callInst = (CallInst*)(es->pc->inst);
		if (callInst->getCalledFunction()!=NULL) {
			if (callInst->getCalledFunction()->getBasicBlockList().size()==0)
				return *es;
			BasicBlock& entrybb = callInst->getCalledFunction()->getEntryBlock();
			bool foundsyscallinfo = false;
			for (BasicBlock::iterator BI = entrybb.begin(),BE=entrybb.end();BI!=BE;BI++) {
				Instruction* inst = BI;
				  if (MDNode *N = inst->getMetadata("dbg")) {
					  if (N!=NULL) {
						    DILocation Loc(N);
						  std::string dir = Loc.getDirectory();
						  if (dir.find("klee/runtime")!=std::string::npos) {
							  foundsyscallinfo = true;
						  }
						  if (dir.find("klee-uclibc")!=std::string::npos) {
						  							  foundsyscallinfo = true;
						  }
						  break;
					  }
				  }

			}

//			if (foundsyscallinfo)
//				return *es;

			funcName = callInst->getCalledFunction()->getNameStr();
			if (funcName.find("klee")!=std::string::npos) {
				return *es;
			}
//			if (funcName.compare("free")==0) {
//				return *es;
//			}
//			if (funcName.compare("calloc")==0) {
//				return *es;
//			}
//			if (funcName.compare("realloc")==0) {
//				return *es;
//			}
//			if (funcName.compare("malloc")==0) {
//				return *es;
//			}
//			if (funcName.compare("memset")==0) {
//				return *es;
//			}
//			if (funcName.compare("memcpy")==0) {
//				return *es;
//			}
//			if (funcName.compare("memalign")==0) {
//				return *es;
//			}
//			if (funcName.compare("syscall")==0) {
//				return *es;
//			}

			std::ofstream callSeqFile;
				callSeqFile.open("callseq",std::ios::app);
				callSeqFile<< es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->assemblyLine<<"#"<<funcName<<"\n";
				callSeqFile.close();


		} else {
			std::ofstream callSeqFile;
				callSeqFile.open("callseq",std::ios::app);
				callSeqFile<< es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->assemblyLine<<"#"<<"\n";
				callSeqFile.close();

		}
//		if (es->pc->info->file.compare(firstLineFile)==0)
	}
  return *es;
}

void ConcreteCallSeqSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}


///

ConcretePathSearcher::ConcretePathSearcher() {
//	this->curBB = NULL;
	outputNextInst = true;
	getToUserMain = false;
	std::ofstream callSeqFile;
	callSeqFile.open("concretepath",std::ios::out);
	callSeqFile.close();
	std::ofstream funcovFile;
	funcovFile.open("funcov",std::ios::out);
	funcovFile.close();

}

ExecutionState &ConcretePathSearcher::selectState() {
	ExecutionState* es = states.back();
	if (getToUserMain==false&&es->pc->inst->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
		getToUserMain = true;
		std::ostringstream osstream;
		osstream << es->pc->info->file <<":"<<es->pc->info->line;
		firstLine = osstream.str();
	}
	if (getToUserMain==false)
		return *es;

	Function* curFun = es->pc->inst->getParent()->getParent();
	if (visitedFunc.find(curFun)==visitedFunc.end()) {
		std::ofstream funcovFile;
		funcovFile.open("funcov",std::ios::app);
		funcovFile<<es->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
		funcovFile.close();
		visitedFunc.insert(curFun);
	}


	std::ostringstream osstream1;
	osstream1 << es->pc->info->file <<":"<<es->pc->info->line;

	if (getToUserMain==true&&osstream1.str().compare(firstLine)==0)
		return *es;
	if (outputNextInst) {
		if ((es->pc->info->file.find("klee/runtime")==std::string::npos)&&(es->pc->info->file.find("klee-uclibc")==std::string::npos)) {
			std::ofstream callSeqFile;
		callSeqFile.open("concretepath",std::ios::app);
		callSeqFile<< es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->assemblyLine<<"\n";
		callSeqFile.close();
		}
		outputNextInst = false;
	}
	if (es->pc->inst->isTerminator()) {
		TerminatorInst* tinst = (TerminatorInst*)es->pc->inst;
		if (tinst->getNumSuccessors()>0)
			outputNextInst = true;
	}

  return *es;
}

void ConcretePathSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}


///CBranch

ConcreteBranchSearcher::ConcreteBranchSearcher() {
//	this->curBB = NULL;
	outputNextInst = true;
	getToUserMain = false;
	std::ofstream callSeqFile;
	callSeqFile.open("concretebranch",std::ios::out);
	callSeqFile.close();
	std::ofstream funcovFile;
	funcovFile.open("funcov",std::ios::out);
	funcovFile.close();

}

ExecutionState &ConcreteBranchSearcher::selectState() {
	ExecutionState* es = states.back();
	if (getToUserMain==false&&es->pc->inst->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
		getToUserMain = true;
		std::ostringstream osstream;
		osstream << es->pc->info->file <<":"<<es->pc->info->line;
		firstLine = osstream.str();
	}
	if (getToUserMain==false)
		return *es;

	Function* curFun = es->pc->inst->getParent()->getParent();
	if (visitedFunc.find(curFun)==visitedFunc.end()) {
		std::ofstream funcovFile;
		funcovFile.open("funcov",std::ios::app);
		funcovFile<<es->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
		funcovFile.close();
		visitedFunc.insert(curFun);
	}


	std::ostringstream osstream1;
	osstream1 << es->pc->info->file <<":"<<es->pc->info->line;

	if (getToUserMain==true&&osstream1.str().compare(firstLine)==0)
		return *es;
	if (outputNextInst) {
			std::ofstream callSeqFile;
		callSeqFile.open("concretebranch",std::ios::app);
		callSeqFile<< es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->assemblyLine<<"\n";
		callSeqFile.close();
		outputNextInst = false;
	}
	if (es->pc->inst->isTerminator()) {
		TerminatorInst* tinst = (TerminatorInst*)es->pc->inst;
		if (tinst->getNumSuccessors()>0) {
			if ((es->pc->info->file.find("klee/runtime")==std::string::npos)&&(es->pc->info->file.find("klee-uclibc")==std::string::npos)) {
				outputNextInst = true;

			std::ofstream callSeqFile;
			callSeqFile.open("concretebranch",std::ios::app);
			callSeqFile<< es->pc->info->file<<":"<<es->pc->info->line <<"@"<<es->pc->info->assemblyLine<<"#";
			callSeqFile.close();
			}
		}
	}

  return *es;
}

void ConcreteBranchSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}

///

KInstruction* PathReplaySearcher::findInstFromSourceLine(std::string sourceline) {

	KInstruction* retInst = NULL;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction* kf = functions[i];
		int numInst = kf->numInstructions;
		for (int j=0;j<numInst;j++) {
			KInstruction* ki = kf->instructions[j];
			std::ostringstream osstream;
			osstream << ki->info->file <<":"<<ki->info->line;
			if (osstream.str().compare(sourceline)==0) {
				return ki;
			}
		}
	}
	return retInst;

}


void PathReplaySearcher::CleanCachedCallSites() {
	std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator end = cachedCallSite.end();
	for (std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator it = cachedCallSite.begin();it!=end;it++){
		std::vector<llvm::Instruction*>* vec = it->second;
		if (vec!=NULL) {
		vec->clear();
		delete vec;
		} else {
//			std::cerr << it->first->getNameStr()<<"\n";
		}
	}

}


PathReplaySearcher::PathReplaySearcher(Executor &_executor)
	  : executor(_executor),
	    functions(executor.kmodule->functions){
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function!=NULL) {
			funcShortMap[kf->function] = 1;
		}
		llvm::Function* curFunc = kf->function;
		if (curFunc->getBasicBlockList().size()==0)
			continue;
		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
			BasicBlock *BB = I;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					if (isa<CallInst>(inst)) {
						CallInst* ci = (CallInst*) inst;
						if (ci->getCalledFunction()!=NULL) {
							Function *fc = ci->getCalledFunction();
							if (cachedCallSite.find(fc)==cachedCallSite.end()) {
								std::vector<llvm::Instruction*>* newvector = new std::vector<llvm::Instruction*>();
								newvector->push_back(inst);
								cachedCallSite[fc] = newvector;
							} else {
								std::vector<llvm::Instruction*>* oldvector = cachedCallSite[fc];
								oldvector->push_back(inst);
							}

						}
					}
				}
		}

	}

	//load call seq trace file

	callSeqPtr = 0;
	getTarget = false;

	std::set<std::string> funcCoverList;

	std::ifstream covFile("funcov", std::ifstream::in);
	while (covFile.good()) {
		char line[1024];
		covFile.getline(line,1024);
		std::string linestr(line);
		if (linestr.length()>0) {
			funcCoverList.insert(linestr);
		}
	}
	covFile.close();

	std::string usermainfile;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function!=NULL&&kf->function->getNameStr().compare("__user_main")==0) {
			if (kf->instructions[0]!=NULL) {
				usermainfile = kf->instructions[0]->info->file;
		//		std::cerr<<"__user_main file info:"<<usermainfile<<"\n";
				break;
			}
		}
	}

	for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			if (kf->function!=NULL) {
				if (kf->instructions[0]!=NULL) {
					if (kf->instructions[0]->info->file.length()>0&&kf->instructions[0]->info->file.find("klee/runtime")==std::string::npos&&kf->instructions[0]->info->file.find("klee-uclibc")==std::string::npos){
						if (funcCoverList.find(kf->function->getNameStr())==funcCoverList.end()) {
						//	std::cerr<< "this function is not visited: "<<kf->function->getNameStr()<<"\n";
						//	std::cerr<< kf->instructions[0]->info->file << "\n";
							unvisitedFunc.insert(kf->function);
							continue;
						}
					}
				}
			}
		}


	std::ifstream historyFile("concretepath", std::ifstream::in);
	std::vector<std::string> funcList;
	while (historyFile.good()) {
		char line[1024];
		historyFile.getline(line,1024);
		std::string linestr(line);
		size_t strfound;
		strfound=linestr.find_first_of(":");

		if (strfound==std::string::npos) {
			continue;
		}
		size_t funcfound;
		funcfound=linestr.find_first_of("@");
		if (funcfound==std::string::npos) {
			callSeq.push_back(linestr);
			break;
		}
		std::string lineinfo = linestr.substr(0,funcfound);
		std::string funcName = linestr.substr(funcfound+1);
		callSeq.push_back(lineinfo);
		funcList.push_back(funcName);
	}
	historyFile.close();

//	size_t strfound;
//	strfound=callSeq[0].find_first_of(":");
//	std::string fileinfo = callSeq[0].substr(0,strfound);
////	std::cerr<<" get source file name "<< fileinfo <<"\n";
//	this->sourceFile = fileinfo;
	std::map<std::string,KInstruction*> foundset;
	std::map<std::string,KInstruction*> unfoundset;

	for (unsigned i=0;i<funcList.size();i++) {
		std::string linestr = callSeq[i];
		std::string callFuncStr = funcList[i];
//		size_t bbfound,dbbfound;
//		bbfound = callFuncStr.find_first_of("#");
		//dbbfound = callFuncStr.find_first_of("%");
		std::ostringstream qcstream;
		qcstream << linestr <<"@"<<callFuncStr;
		if (foundset.find(qcstream.str())!=foundset.end()) {
			targetInstList.push_back(foundset[qcstream.str()]);
			continue;
		}
		if (unfoundset.find(qcstream.str())!=unfoundset.end()) {
			std::cerr << i << " " << funcList.size() <<"can not find target "<< linestr <<"@"<<callFuncStr<<"\n";
			continue;
		}

		bool found = false;
		for (unsigned i=0;i<functions.size();i++) {
			KFunction* kf = functions[i];
			int numInst = kf->numInstructions;
			for (int j=0;j<numInst;j++) {
				KInstruction* ki = kf->instructions[j];
				std::ostringstream osstream;
				osstream << ki->info->file <<":"<<ki->info->line<<"@"<<ki->info->assemblyLine;
	//			std::cerr << osstream.str() << "\n";
				if (osstream.str().compare(qcstream.str())==0) {
							found =true;
							targetInstList.push_back(ki);
							foundset[qcstream.str()] = ki;
							break;
				//	}
				}
			}
			if (found)
				break;
		}
		if (!found) {
			std::cerr << i << " " << funcList.size() <<"can not find target "<< linestr <<"@"<<callFuncStr<<"\n";
			unfoundset[qcstream.str()] = NULL;
		}

	}
	if (funcList.size()<callSeq.size()) {
		std::string lasttarget = callSeq[callSeq.size()-1];
		KInstruction* lastInst = this->findInstFromSourceLine(lasttarget);
		targetInstList.push_back(lastInst);
	}



	std::cerr<<"build dom tree\n";
	llvm::PassManager pmdom;
	DomInterfacePass* dpass = new DomInterfacePass(NULL, &unvisitedFunc);
	pmdom.add((llvm::Pass*)dpass);
	pmdom.run(*executor.kmodule->module);
	prunedBBSet.insert(dpass->outputPrunedList.begin(),dpass->outputPrunedList.end());

	std::cerr<<"filter out func number:" << unvisitedFunc.size() <<"\n";
	std::cerr<<"filter out BB number:" << prunedBBSet.size() <<"\n";

	generateFuncShort();

	lastChoiceNumber = -1;
	lastChoice = NULL;

	this->getToUserMain = false;
	findNextTarget();

}

void PathReplaySearcher::generateFuncShort() {

	int infinity = 10000000;
	std::set<Function*> exitfuncs;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function->getNameStr().compare("__user_main")==0)
			continue;
		for (unsigned j=0;j<kf->numInstructions;j++) {
			KInstruction* ki = kf->instructions[j];
			if (isa<CallInst>(ki->inst)) {
				CallInst* callI = (CallInst*)(ki->inst);
				if (callI->getCalledFunction()!=NULL&&callI->getCalledFunction()->getNameStr().compare("exit")==0) {
					exitfuncs.insert(kf->function);
					break;
				}
			}

		}
		llvm::Function* curFunc = kf->function;
	}
	// run 5 times to get approximate short dis for func
		for (int j=0;j<5;j++) {
			curDistanceMap.clear();

		for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			llvm::Function* curFunc = kf->function;
			std::set<Instruction*> q;
			if (curFunc->getBasicBlockList().size()==0)
				continue;
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
					for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
						Instruction* inst = BI;
						if (isa<ReturnInst>(inst)) {
							curDistanceMap[inst] = 1;
						} else if (isa<CallInst>(inst)){
							CallInst* callI = (CallInst*)inst;
							if (callI->getCalledFunction()!=NULL&&callI->getCalledFunction()->getNameStr().compare("exit")==0)
								curDistanceMap[inst] = 1;
							else if (callI->getCalledFunction()!=NULL&&exitfuncs.find(callI->getCalledFunction())!=exitfuncs.end())
								curDistanceMap[inst] = 1;
							else
								curDistanceMap[inst] = infinity;
						}
						else {
							curDistanceMap[inst] = infinity;
						}
						if (inst->isTerminator()||isa<CallInst>(inst))
							q.insert(inst);
					}
			}

//
//					for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
//					if (iter->second==0) {
//						iter->first->dump();
//						std::cerr<<"initialization error!\n";
//						}
//					}


			while (q.size()>0) {
				   std::set<Instruction*>::iterator it;
				   Instruction* minInst = NULL;
				   int minval = infinity;
				   for (it = q.begin();it!=q.end();it++) {
				    	Instruction* ci = *it;

				    	if (curDistanceMap[ci]<minval) {
							minval = curDistanceMap[ci];
							minInst = ci;
				    	}
				   }
				   if (minval==infinity) {
					   q.clear();
					   break;
				   }
				   q.erase(minInst);

				   std::vector<Instruction*> instvec;
				   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
					   Instruction* binst = BI;
					   if (binst==minInst)
						   break;
					   instvec.push_back(binst);
				   }
				   int newDis = infinity;

				   Instruction* cminInst = minInst;
				   while(instvec.size()>0){
					   Instruction* backInst = instvec.back();
					   if (isa<CallInst>(backInst)) {


						//means prevInst is a call site to another func
						Function* calledFunc = ((CallInst*)backInst)->getCalledFunction();
						if (calledFunc==NULL) {
						  	newDis = curDistanceMap[cminInst]+1;
						} else {
							if (unvisitedFunc.find(calledFunc)==unvisitedFunc.end()) {
						  	if (funcShortMap.find(calledFunc)!=funcShortMap.end())
						  		newDis = curDistanceMap[cminInst]+1+funcShortMap[calledFunc];
						  	else
						  		newDis = curDistanceMap[cminInst]+1;
							} else
								newDis = infinity;
						  	}
							 if (curDistanceMap[backInst]>newDis) {
						  		 curDistanceMap[backInst] = newDis;
//						  		 if (newDis==0) {
//						  			 std::cerr<<"catch an error here!\n";
//						  		 }
						  	 }
						 }
					   else {
						  	//simple case direct pred
						    newDis = curDistanceMap[cminInst]+1;
						  	if (curDistanceMap[backInst] > newDis) {
						  			curDistanceMap[backInst] = newDis;
//						  	 		 if (newDis==0) {
//						  							  			 std::cerr<<"catch an error here3!\n";
//						  							  		 }
						  	}


					   }
					   instvec.pop_back();
					   cminInst=backInst;
					   q.erase(backInst);
				   }

					   //means minInst is the beginning of program
					   pred_iterator PI = pred_begin(cminInst->getParent()), PE = pred_end(cminInst->getParent());
					   while(PI!=PE) {
						   BasicBlock* predBB = (BasicBlock*)(*PI);
						   if (prunedBBSet.find(predBB)==prunedBBSet.end()) {
						   TerminatorInst* predterm = predBB->getTerminator();
						   newDis = curDistanceMap[cminInst]+1;
						   if (curDistanceMap[predterm]>newDis) {
							   curDistanceMap[predterm] = newDis;
//							   if (newDis==0) {
//								   std::cerr<<"catch an error here2!";
//							   }
						   }
						   }
						   PI++;
					   }


				}
			if (curDistanceMap[curFunc->getEntryBlock().begin()]<infinity) {
				funcShortMap[curFunc] = curDistanceMap[curFunc->getEntryBlock().begin()];
		//		std::cerr <<  "dis func map for "<< curFunc->getNameStr() <<" is " <<funcShortMap[curFunc]<<"\n";
			}
			else {
			//	std::cerr<<"can't get to entry of this function : "<<curFunc->getNameStr()<<"\n";
			//	std::cerr<<"ouput func map:\n";
			}
		}
		}

		std::cerr<< "start dumping curDistanceMap\n";

		for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
		if (iter->second==0) {
			iter->first->dump();
			std::cerr<<"we have error dis!\n";
			}

//		if (isa<CallInst>(iter->first)) {
//			std::cerr<<"call dis : "<<iter->second<<"\n";
//		}
		}
//		for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
//			if (iter->first->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
//			//if (iter->second<infinity) {
//			iter->first->dump();
//			std::cerr<<"distance is "<<iter->second<<"\n";
//			}
//	//		}
//		}
}

void PathReplaySearcher::generateNewShortDistance() {
//	this->curDistanceMap.clear();
	this->curInsideFuncDisMap.clear();
	int infinity = 10000000;
	//std::set<BasicBlock*> s;
	std::set<Instruction*> q;
//	std::cerr<<callSeqPtr<<" "<<targetInstList.size()<<"\n";
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		Function* curFunc = kf->function;
		if (unvisitedFunc.find(curFunc)!=unvisitedFunc.end())
			continue;
	//	if (curFunc==targetInstList[callSeqPtr]->getParent()->getParent()) {
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
				if (prunedBBSet.find(BB)!=prunedBBSet.end())
					continue;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					curInsideFuncDisMap[inst] = infinity;
					if (inst->isTerminator()) {
						q.insert(inst);
					}
					if (isa<CallInst>(inst)) {
						CallInst* calli = (CallInst*)(inst);
						if (calli->getCalledFunction()!=NULL) {
							if (unvisitedFunc.find(calli->getCalledFunction())==unvisitedFunc.end())
								q.insert(inst);
						} else
							q.insert(inst);
					}
				}

			}
	//	}
	}

	std::set<Instruction*> modifiedset;

	curInsideFuncDisMap[targetInstList[callSeqPtr]->inst]=0;
	modifiedset.insert(targetInstList[callSeqPtr]->inst);
	q.insert(targetInstList[callSeqPtr]->inst);
	while (q.size()>0) {
		   std::set<Instruction*>::iterator it;
		   Instruction* minInst = NULL;
		   int minval = infinity;
		   if (modifiedset.size()>0) {
		   for (it = modifiedset.begin();it!=modifiedset.end();it++) {
		    	Instruction* cinst = *it;

		    	if (curInsideFuncDisMap[cinst]<minval) {
					minval = curInsideFuncDisMap[cinst];
		    		minInst = cinst;
		    	}
		   }
		   }
		   if (minval==infinity){
			   q.clear();
			   break;
		   }
	//	   cerr<<"get min BB:" << minBB->getNameStr() << "\n";
		   q.erase(minInst);
		   modifiedset.erase(minInst);
//		   s.insert(minBB);

		   std::vector<Instruction*> instvec;
		   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
			   Instruction* binst = BI;
			   if (binst==minInst)
				   break;
			   instvec.push_back(binst);
		   }
		   int newDis = 0;

		   Instruction* cminInst = minInst;
		   while(instvec.size()>0){
			   Instruction* backInst = instvec.back();
			   if (isa<CallInst>(backInst)) {


				//means prevInst is a call site to another func
				Function* calledFunc = ((CallInst*)backInst)->getCalledFunction();
				if (calledFunc==NULL) {
				  	newDis = curInsideFuncDisMap[cminInst]+1;
				} else {
					if (unvisitedFunc.find(calledFunc)==unvisitedFunc.end()) {

				  	if (funcShortMap.find(calledFunc)!=funcShortMap.end())
				  		newDis = curInsideFuncDisMap[cminInst]+1+funcShortMap[calledFunc];
				  	else
				  		newDis = curInsideFuncDisMap[cminInst]+1; }
					else
						newDis = infinity;
				  	}
					 if (curInsideFuncDisMap[backInst]>newDis) {
						 curInsideFuncDisMap[backInst] = newDis;
				  	 }
				 } else {
				  	//simple case direct pred
				    newDis = curInsideFuncDisMap[cminInst]+1;
				  	if (curInsideFuncDisMap[backInst] > newDis) {
				  		curInsideFuncDisMap[backInst] = newDis;
				  	}


			   }
			   instvec.pop_back();
			   cminInst=backInst;
			  // q.erase(backInst);
		   }

		   BasicBlock* parentBB = cminInst->getParent();
		   BasicBlock* entryBB = &(parentBB->getParent()->getEntryBlock());

//		   if (parentBB==entryBB) {
//		  				   std::vector<llvm::Instruction*>* vec = cachedCallSite[parentBB->getParent()];
//		  				   if (vec!=NULL) {
//		  					   for (unsigned i=0;i<vec->size();i++) {
//		  						   Instruction* calli = vec->at(i);
//		  						   if ((prunedBBSet.find(calli->getParent())==prunedBBSet.end())&&(unvisitedFunc.find(calli->getParent()->getParent())==unvisitedFunc.end())) {
//		  						   	 newDis = curInsideFuncDisMap[cminInst]+1;
//		  						   	 if (curInsideFuncDisMap[calli]>newDis) {
//		  						   		curInsideFuncDisMap[calli] = newDis;
//		  						   		modifiedset.insert(calli);
//		  						   		//std::cerr << "propagate to upper level\n";
//		  						   	 }
//		  						   }
//		  					   }
//		  				   }
//		  			   }

			   //means minInst is the beginning of program
			   pred_iterator PI = pred_begin(cminInst->getParent()), PE = pred_end(cminInst->getParent());
			   while(PI!=PE) {
				   BasicBlock* predBB = (BasicBlock*)(*PI);
				   if (prunedBBSet.find(predBB)==prunedBBSet.end()) {
				   TerminatorInst* predterm = predBB->getTerminator();
				   newDis = curInsideFuncDisMap[cminInst]+1;
				   if (curInsideFuncDisMap[predterm]>newDis) {
					   curInsideFuncDisMap[predterm] = newDis;
					   modifiedset.insert(predterm);
				   }
				   }
				   PI++;
			   }



		}

//	Function* curFunc = targetInstList[callSeqPtr]->getParent()->getParent();
//
//	for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
//		BasicBlock *BB = I;
//		std::cerr<< BB->getNameStr()<<":\n";
//			for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
//				Instruction* inst = BI;
//				inst->dump();
//				std::cerr<<"dis : "<<curInsideFuncDisMap[inst]<<"\n";
//			}
//	}

}


void PathReplaySearcher::findNextTarget() {
	//missing: get current target source line
//	int infinity = 10000000;
	lastChoice = NULL;
	lastChoiceNumber = -1;

	if (callSeqPtr==targetInstList.size()) {

		this->curInsideFuncDisMap.clear();
//		for (unsigned i=0;i<functions.size();i++) {
//			KFunction * kf = functions[i];
//			Function* curFunc = kf->function;
//
//		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
//			BasicBlock *BB = I;
//				pred_iterator PI = pred_begin(BB), PE = pred_end(BB);
//				if (PI!=PE||BB==&(curFunc->getEntryBlock())) {
//					//cerr<<"-\t"<<lastBB->getNameStr()<<"\n";
//					//set to infinity make every bb become can not reach
//					curDistanceMap[BB] = infinity;
//				}
//			}
//		}
		return;
	}
//	std::string targetSourceLine = callSeq[callSeqPtr];
//	std::cerr << targetSourceLine <<"\n";

	generateNewShortDistance();

	return;

}

PathReplaySearcher::~PathReplaySearcher() {
}


ExecutionState &PathReplaySearcher::selectState() {
	ExecutionState *backes = states.back();
	int infinity = 10000000;
	int initenvpos = 0;
	if (InitEnv)
		initenvpos = 1;
	if (getToUserMain==false&&backes->pc->inst->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
		getToUserMain = true;
	}
	if (getToUserMain==false)
		return *backes;

	if (getTarget==true) {
		states.clear();
		CleanCachedCallSites();
		return *lastChoice;
	}

	do {
	int minDis = infinity;
	std::vector<ExecutionState*> potentialminState;
	std::vector<int> potentialminVal;
	ExecutionState* minState;
//	std::cerr<<"reach here picking state?? "<<callStackPtr<<"\n";
	for (std::vector<ExecutionState*>::iterator it = states.begin(),
	             ie = states.end(); it != ie; ++it) {
		ExecutionState *es = *it;
		int dis = infinity;
		if (prunedBBSet.find(es->pc->inst->getParent())!=prunedBBSet.end()) {
//			std::cerr<<"pruned out\n";
			continue;
		}

		if (stateStepMap.find(es)==stateStepMap.end()) {
			stateStepMap[es] = callSeqPtr;
		}
		if (stateStepMap[es] != callSeqPtr) {
			continue;
		}


//		if (callSeqPtr>0){
//			bool skip = false;//if the inst is in the targetList but not next target
//		if (es->pc->inst!=targetInstList[callSeqPtr]->inst&&es->pc->inst!=targetInstList[callSeqPtr-1]->inst) {
//			for (int i=0;i<targetInstList.size();i++) {
//				if (es->pc->inst==targetInstList[i]->inst) {
//					skip = true;
//				//	std::cerr << "next target" << callSeq[callSeqPtr] << "\n";
//				//	std::cerr << "skip cur target" <<es->pc->info->file <<":"<<es->pc->info->line<<"@"<<es->pc->info->assemblyLine<<"\n";
//					break;
//				}
//			}
//		}
//		if (skip==true)
//			continue;
//		}


		if (es->pc->inst->getParent()->getParent()==targetInstList[callSeqPtr]->inst->getParent()->getParent()) {
			//if (es->pc->info->file.compare(this->sourceFile)==0) {
			if (this->curInsideFuncDisMap.find(es->pc->inst)!=this->curInsideFuncDisMap.end()&&this->curInsideFuncDisMap[es->pc->inst]<infinity) {
				dis = this->curInsideFuncDisMap[es->pc->inst];
//				std::cerr<< "dis calc by same func\n";
//				std::cerr<< es->pc->info->file<<":"<<es->pc->info->line<<"\n";
//				std::cerr<< dis <<"\n";
//				std::cerr<< es->pc->inst->getParent()->getNameStr()<<"\n";
		//		es->pc->inst->dump();
				if (dis==0) {
					minState = es;
					minDis = 0;
				} else {
					if (dis<infinity) {

				potentialminState.push_back(es);
				potentialminVal.push_back(dis);
				}
				}
			}
		//	}
		}
		if (dis==infinity) {
	//		std::cerr<< "dis calc in diff func\n";
	//		std::cerr<< "dis calc in diff func : "<<es->pc->inst->getParent()->getParent()->getNameStr()
	//			<<"\t"<<targetInstList[callSeqPtr]->getParent()->getParent()->getNameStr()<<"\n";

			dis = this->curDistanceMap[es->pc->inst];
//			std::cerr<<"add dis to ret "<<dis<<"\n";

			for (unsigned i = es->stack.size()-1;i>=initenvpos+1;i--) {
				StackFrame sf = es->stack[i];
				KInstruction* kinst = sf.caller;
//				if (kinst->info->file.compare(this->sourceFile)==0) {
					//if (kinst->inst->getParent()->getParent()==targetInstList[callSeqPtr]->getParent()->getParent()&&this->curInsideFuncDisMap[kinst->inst]<infinity) {
				int insidedis = this->curInsideFuncDisMap[kinst->inst];
				if (this->curInsideFuncDisMap.find(kinst->inst)!=this->curInsideFuncDisMap.end())
					insidedis = this->curInsideFuncDisMap[kinst->inst];
				if (insidedis<infinity) {
						dis += insidedis;
	//					std::cerr<<"add inside func to target "<<this->curInsideFuncDisMap[kinst->inst];
						break;
			//		}
				} else {
					if (i>initenvpos+1) {
		//			std::cerr<<"add dis to ret "<<this->curDistanceMap[kinst->inst]<<"\n";
					dis+=this->curDistanceMap[kinst->inst];
					}
				}
			}
			if (dis==0) {
				minState = es;
				minDis = 0;
			} else {
				if (dis<infinity) {
							potentialminState.push_back(es);
							potentialminVal.push_back(dis);
				}
			}
		}
	}

//	if (potentialminVal.size()==0) {
//		std::cerr<<"can not find target:" <<backes->pc->info->file<<":"<<backes->pc->info->line<<"@"<<backes->pc->info->assemblyLine<<"\n";
//	}

	if (minDis>0&&potentialminVal.size()>0) {
		ExecutionState* pminState = NULL;
		int valLength = potentialminVal.size()-1;

		if (lastChoiceNumber==valLength) {
			for (int a=0;a<=valLength;a++) {
				if (potentialminState[a]==lastChoice) {
					pminState = lastChoice;
					minDis = potentialminVal[a];
					break;
				}
			}
			if (pminState!=NULL) {
				minState = pminState;
			}
		}


		if (pminState==NULL){
			lastChoiceNumber = valLength;
//			minState = potentialminState[0];
//			minDis = potentialminVal[0];
//			int minnum =0;
//			for (int a=1;a<=valLength;a++) {
//				if (potentialminVal[a]<minDis) {
//					minState = potentialminState[a];
//					minDis = potentialminVal[a];
//					minnum=a;
//				}
//			}
//			std::cerr << "pick " << minnum << " of " << valLength << "\n";

			std::map<llvm::Instruction*,int> instcounter;
			for (int a=0;a<=valLength;a++) {
				ExecutionState* aes = potentialminState[a];
				if (instcounter.find(aes->pc->inst)==instcounter.end()) {
					instcounter[aes->pc->inst] =1;
				} else {
					int prevV = instcounter[aes->pc->inst];
					instcounter[aes->pc->inst]=prevV+1;
				}
			}

	double totalVal = 0;
	for (int a=0;a<=valLength;a++) {

		totalVal+=1.00/(((double)(potentialminVal[a]))*instcounter[potentialminState[a]->pc->inst]);
	}
	double rng = theRNG.getDoubleL();
	//std::cerr<<"rng : "<<rng << " potentialminVal : "<< potentialminVal.size() ;
	double curSum = 0;
	for (unsigned i =0;i<potentialminVal.size();i++) {
		double curTemp = 1.00/(((double)(potentialminVal[i]))*instcounter[potentialminState[i]->pc->inst]);
		if (curSum/totalVal<=rng&&(curSum+curTemp)/totalVal>rng) {
			minDis = potentialminVal[i];
			minState = potentialminState[i];
//			std::cerr<<" picked number "<<i<<" from total state number "<<potentialminVal.size()<<"\n";
			break;
		}
		double v1 = curSum/totalVal;
		double v2 = (curSum+curTemp)/totalVal;
//		std::cerr<<"["<<v1<<","<<v2<<"]\n";
		curSum+=curTemp;
	}
	}
	}

	if (minDis<infinity) {
//		if (callSeqPtr>200) {
//		std::cerr << "picked " <<minState->pc->info->file<<":"<< minState->pc->info->line << " stack size" << minState->stack.size() <<" min Dis "<<minDis<<"\n";
//		minState->pc->inst->dump();
//		std::cerr<<minState->pc->inst->getParent()->getNameStr()<<"@"<<minState->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
//		}

		std::ostringstream osstream;
		osstream << minState->pc->info->file <<":"<<minState->pc->info->line;

//		if (minDis==0) {
//			std::cerr<<"**min dis is 0 dumping inst\n";
//			std::cerr<<"searching inst : ";
//			minState->pc->inst->dump();
//			std::cerr<<"target inst : ";
//			targetInstList[callSeqPtr]->dump();
//		}

		if (minState->pc->inst==targetInstList[callSeqPtr]->inst){//&&(osstream.str().compare(callSeq[callSeqPtr])==0)) {

				callSeqPtr++;
				stateStepMap[minState] = callSeqPtr;
				if (callSeqPtr==targetInstList.size()) {
					std::cerr << "reach target clear other states dump pc\n";
					getTarget = true;
//					states.clear();
				} else {
					std::cerr << callSeqPtr <<" "<<targetInstList.size()<< " reach partial important move step forward\n";
					std::cerr << "Next target : "<< targetInstList[callSeqPtr]->info->file<<":"<<targetInstList[callSeqPtr]->info->line<<"@"<<targetInstList[callSeqPtr]->info->assemblyLine <<"\n";
					std::cerr << "Opcode : " << targetInstList[callSeqPtr]->inst->getOpcodeName() <<"\n";
					findNextTarget();
			}
		}
		lastChoice = minState;

		return *minState;
	} else {
		if (callSeqPtr==0)
			break;
		callSeqPtr--;
		bool btmore = true;
		while (btmore) {
//			int numnotstep = 0;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
			if (stateStepMap[es] == callSeqPtr) {
				btmore = false;
				break;
			}
		}
		if (btmore==false) {
			break;
		}
		if (callSeqPtr==0) {
			//lets try to remove the top one target so that we can move step further
			int maxcallSeqPtr = -1;
			for (std::vector<ExecutionState*>::iterator it = states.begin(),
			             ie = states.end(); it != ie; ++it) {
				ExecutionState *es = *it;
				if (stateStepMap[es] > maxcallSeqPtr) {
					maxcallSeqPtr = stateStepMap[es];
				}
			}
			targetInstList.erase(targetInstList.begin()+maxcallSeqPtr);
			std::cerr<< "remove target " <<maxcallSeqPtr<<" from target list\n";
			callSeqPtr = maxcallSeqPtr;
			break;


		}
		callSeqPtr--;

		};

		std::cerr << callSeqPtr <<" "<<targetInstList.size()<< " have to perform backtracing move step back\n";
		std::cerr << "Next target : "<< targetInstList[callSeqPtr]->info->file<<":"<<targetInstList[callSeqPtr]->info->line<<"@"<<targetInstList[callSeqPtr]->info->assemblyLine <<"\n";

		if (states.size()==1) {
					std::cerr<<"Cur PC : " << states.back()->pc->info->file<<":" <<states.back()->pc->info->line<<"@"<<states.back()->pc->info->assemblyLine<<"#"<<states.back()->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
				}

		if (callSeqPtr==targetInstList.size())
			break;
			findNextTarget();
		}
	} while (true);
		//clear states
		std::cerr<<"min Dis is infinite, we can't find feasible path.\n Now terminating program \n";
		ExecutionState* retVal = NULL;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
	//		Instruction* nextInst = es->pc->inst;
		//	if (nextInst==targetInstList[callSeqPtr]) {
				retVal = es;
				break;
		//	}
		}
		CleanCachedCallSites();
		states.clear();
		return *retVal;
}

void PathReplaySearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator ait = states.begin(),
             aie = states.end(); ait != aie; ++ait) {
        if (es==*ait) {
          states.erase(ait);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}

///

ExecutionState &DFSSearcher::selectState() {
//	ExecutionState* es = states.back();
//	es->
  return *states.back();
}

void DFSSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}

///

ExecutionState &RandomSearcher::selectState() {
  return *states[theRNG.getInt32()%states.size()];
}

void RandomSearcher::update(ExecutionState *current,
                            const std::set<ExecutionState*> &addedStates,
                            const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    bool ok = false;

    for (std::vector<ExecutionState*>::iterator it = states.begin(),
           ie = states.end(); it != ie; ++it) {
      if (es==*it) {
        states.erase(it);
        ok = true;
        break;
      }
    }
    
    assert(ok && "invalid state removed");
  }
}

///

WeightedRandomSearcher::WeightedRandomSearcher(Executor &_executor,
                                               WeightType _type) 
  : executor(_executor),
    states(new DiscretePDF<ExecutionState*>()),
    type(_type) {
  switch(type) {
  case Depth: 
    updateWeights = false;
    break;
  case InstCount:
  case CPInstCount:
  case QueryCost:
  case MinDistToUncovered:
  case CoveringNew:
    updateWeights = true;
    break;
  default:
    assert(0 && "invalid weight type");
  }
}

WeightedRandomSearcher::~WeightedRandomSearcher() {
  delete states;
}

ExecutionState &WeightedRandomSearcher::selectState() {
  return *states->choose(theRNG.getDoubleL());
}

double WeightedRandomSearcher::getWeight(ExecutionState *es) {
  switch(type) {
  default:
  case Depth: 
    return es->weight;
  case InstCount: {
    uint64_t count = theStatisticManager->getIndexedValue(stats::instructions,
                                                          es->pc->info->id);
    double inv = 1. / std::max((uint64_t) 1, count);
    return inv * inv;
  }
  case CPInstCount: {
    StackFrame &sf = es->stack.back();
    uint64_t count = sf.callPathNode->statistics.getValue(stats::instructions);
    double inv = 1. / std::max((uint64_t) 1, count);
    return inv;
  }
  case QueryCost:
    return (es->queryCost < .1) ? 1. : 1./es->queryCost;
  case CoveringNew:
  case MinDistToUncovered: {
    uint64_t md2u = computeMinDistToUncovered(es->pc,
                                              es->stack.back().minDistToUncoveredOnReturn);

    double invMD2U = 1. / (md2u ? md2u : 10000);
    if (type==CoveringNew) {
      double invCovNew = 0.;
      if (es->instsSinceCovNew)
        invCovNew = 1. / std::max(1, (int) es->instsSinceCovNew - 1000);
      return (invCovNew * invCovNew + invMD2U * invMD2U);
    } else {
      return invMD2U * invMD2U;
    }
  }
  }
}

void WeightedRandomSearcher::update(ExecutionState *current,
                                    const std::set<ExecutionState*> &addedStates,
                                    const std::set<ExecutionState*> &removedStates) {
  if (current && updateWeights && !removedStates.count(current))
    states->update(current, getWeight(current));
  
  for (std::set<ExecutionState*>::const_iterator it = addedStates.begin(),
         ie = addedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    states->insert(es, getWeight(es));
  }

  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    states->remove(*it);
  }
}

bool WeightedRandomSearcher::empty() { 
  return states->empty(); 
}

///

RandomPathSearcher::RandomPathSearcher(Executor &_executor)
  : executor(_executor) {
}

RandomPathSearcher::~RandomPathSearcher() {
}

ExecutionState &RandomPathSearcher::selectState() {
  unsigned flips=0, bits=0;
  PTree::Node *n = executor.processTree->root;
  
  while (!n->data) {
    if (!n->left) {
      n = n->right;
    } else if (!n->right) {
      n = n->left;
    } else {
      if (bits==0) {
        flips = theRNG.getInt32();
        bits = 32;
      }
      --bits;
      n = (flips&(1<<bits)) ? n->left : n->right;
    }
  }

  return *n->data;
}

void RandomPathSearcher::update(ExecutionState *current,
                                const std::set<ExecutionState*> &addedStates,
                                const std::set<ExecutionState*> &removedStates) {
}

bool RandomPathSearcher::empty() { 
  return executor.states.empty(); 
}

///

BumpMergingSearcher::BumpMergingSearcher(Executor &_executor, Searcher *_baseSearcher) 
  : executor(_executor),
    baseSearcher(_baseSearcher),
    mergeFunction(executor.kmodule->kleeMergeFn) {
}

BumpMergingSearcher::~BumpMergingSearcher() {
  delete baseSearcher;
}

///

Instruction *BumpMergingSearcher::getMergePoint(ExecutionState &es) {  
  if (mergeFunction) {
    Instruction *i = es.pc->inst;

    if (i->getOpcode()==Instruction::Call) {
      CallSite cs(cast<CallInst>(i));
      if (mergeFunction==cs.getCalledFunction())
        return i;
    }
  }

  return 0;
}

ExecutionState &BumpMergingSearcher::selectState() {
entry:
  // out of base states, pick one to pop
  if (baseSearcher->empty()) {
    std::map<llvm::Instruction*, ExecutionState*>::iterator it = 
      statesAtMerge.begin();
    ExecutionState *es = it->second;
    statesAtMerge.erase(it);
    ++es->pc;

    baseSearcher->addState(es);
  }

  ExecutionState &es = baseSearcher->selectState();

  if (Instruction *mp = getMergePoint(es)) {
    std::map<llvm::Instruction*, ExecutionState*>::iterator it = 
      statesAtMerge.find(mp);

    baseSearcher->removeState(&es);

    if (it==statesAtMerge.end()) {
      statesAtMerge.insert(std::make_pair(mp, &es));
    } else {
      ExecutionState *mergeWith = it->second;
      if (mergeWith->merge(es)) {
        // hack, because we are terminating the state we need to let
        // the baseSearcher know about it again
        baseSearcher->addState(&es);
        executor.terminateState(es);
      } else {
        it->second = &es; // the bump
        ++mergeWith->pc;

        baseSearcher->addState(mergeWith);
      }
    }

    goto entry;
  } else {
    return es;
  }
}

void BumpMergingSearcher::update(ExecutionState *current,
                                 const std::set<ExecutionState*> &addedStates,
                                 const std::set<ExecutionState*> &removedStates) {
  baseSearcher->update(current, addedStates, removedStates);
}

///

MergingSearcher::MergingSearcher(Executor &_executor, Searcher *_baseSearcher) 
  : executor(_executor),
    baseSearcher(_baseSearcher),
    mergeFunction(executor.kmodule->kleeMergeFn) {
}

MergingSearcher::~MergingSearcher() {
  delete baseSearcher;
}

///

Instruction *MergingSearcher::getMergePoint(ExecutionState &es) {
  if (mergeFunction) {
    Instruction *i = es.pc->inst;

    if (i->getOpcode()==Instruction::Call) {
      CallSite cs(cast<CallInst>(i));
      if (mergeFunction==cs.getCalledFunction())
        return i;
    }
  }

  return 0;
}

ExecutionState &MergingSearcher::selectState() {
  while (!baseSearcher->empty()) {
    ExecutionState &es = baseSearcher->selectState();
    if (getMergePoint(es)) {
      baseSearcher->removeState(&es, &es);
      statesAtMerge.insert(&es);
    } else {
      return es;
    }
  }
  
  // build map of merge point -> state list
  std::map<Instruction*, std::vector<ExecutionState*> > merges;
  for (std::set<ExecutionState*>::const_iterator it = statesAtMerge.begin(),
         ie = statesAtMerge.end(); it != ie; ++it) {
    ExecutionState &state = **it;
    Instruction *mp = getMergePoint(state);
    
    merges[mp].push_back(&state);
  }
  
  if (DebugLogMerge)
    std::cerr << "-- all at merge --\n";
  for (std::map<Instruction*, std::vector<ExecutionState*> >::iterator
         it = merges.begin(), ie = merges.end(); it != ie; ++it) {
    if (DebugLogMerge) {
      std::cerr << "\tmerge: " << it->first << " [";
      for (std::vector<ExecutionState*>::iterator it2 = it->second.begin(),
             ie2 = it->second.end(); it2 != ie2; ++it2) {
        ExecutionState *state = *it2;
        std::cerr << state << ", ";
      }
      std::cerr << "]\n";
    }

    // merge states
    std::set<ExecutionState*> toMerge(it->second.begin(), it->second.end());
    while (!toMerge.empty()) {
      ExecutionState *base = *toMerge.begin();
      toMerge.erase(toMerge.begin());
      
      std::set<ExecutionState*> toErase;
      for (std::set<ExecutionState*>::iterator it = toMerge.begin(),
             ie = toMerge.end(); it != ie; ++it) {
        ExecutionState *mergeWith = *it;
        
        if (base->merge(*mergeWith)) {
          toErase.insert(mergeWith);
        }
      }
      if (DebugLogMerge && !toErase.empty()) {
        std::cerr << "\t\tmerged: " << base << " with [";
        for (std::set<ExecutionState*>::iterator it = toErase.begin(),
               ie = toErase.end(); it != ie; ++it) {
          if (it!=toErase.begin()) std::cerr << ", ";
          std::cerr << *it;
        }
        std::cerr << "]\n";
      }
      for (std::set<ExecutionState*>::iterator it = toErase.begin(),
             ie = toErase.end(); it != ie; ++it) {
        std::set<ExecutionState*>::iterator it2 = toMerge.find(*it);
        assert(it2!=toMerge.end());
        executor.terminateState(**it);
        toMerge.erase(it2);
      }

      // step past merge and toss base back in pool
      statesAtMerge.erase(statesAtMerge.find(base));
      ++base->pc;
      baseSearcher->addState(base);
    }  
  }
  
  if (DebugLogMerge)
    std::cerr << "-- merge complete, continuing --\n";
  
  return selectState();
}

void MergingSearcher::update(ExecutionState *current,
                             const std::set<ExecutionState*> &addedStates,
                             const std::set<ExecutionState*> &removedStates) {
  if (!removedStates.empty()) {
    std::set<ExecutionState *> alt = removedStates;
    for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
           ie = removedStates.end(); it != ie; ++it) {
      ExecutionState *es = *it;
      std::set<ExecutionState*>::const_iterator it = statesAtMerge.find(es);
      if (it!=statesAtMerge.end()) {
        statesAtMerge.erase(it);
        alt.erase(alt.find(es));
      }
    }    
    baseSearcher->update(current, addedStates, alt);
  } else {
    baseSearcher->update(current, addedStates, removedStates);
  }
}

///

BatchingSearcher::BatchingSearcher(Searcher *_baseSearcher,
                                   double _timeBudget,
                                   unsigned _instructionBudget) 
  : baseSearcher(_baseSearcher),
    timeBudget(_timeBudget),
    instructionBudget(_instructionBudget),
    lastState(0) {
  
}

BatchingSearcher::~BatchingSearcher() {
  delete baseSearcher;
}

ExecutionState &BatchingSearcher::selectState() {
  if (!lastState || 
      (util::getWallTime()-lastStartTime)>timeBudget ||
      (stats::instructions-lastStartInstructions)>instructionBudget) {
    if (lastState) {
      double delta = util::getWallTime()-lastStartTime;
      if (delta>timeBudget*1.1) {
        std::cerr << "KLEE: increased time budget from " << timeBudget << " to " << delta << "\n";
        timeBudget = delta;
      }
    }
    lastState = &baseSearcher->selectState();
    lastStartTime = util::getWallTime();
    lastStartInstructions = stats::instructions;
    return *lastState;
  } else {
    return *lastState;
  }
}

void BatchingSearcher::update(ExecutionState *current,
                              const std::set<ExecutionState*> &addedStates,
                              const std::set<ExecutionState*> &removedStates) {
  if (removedStates.count(lastState))
    lastState = 0;
  baseSearcher->update(current, addedStates, removedStates);
}

/***/

IterativeDeepeningTimeSearcher::IterativeDeepeningTimeSearcher(Searcher *_baseSearcher)
  : baseSearcher(_baseSearcher),
    time(1.) {
}

IterativeDeepeningTimeSearcher::~IterativeDeepeningTimeSearcher() {
  delete baseSearcher;
}

ExecutionState &IterativeDeepeningTimeSearcher::selectState() {
  ExecutionState &res = baseSearcher->selectState();
  startTime = util::getWallTime();
  return res;
}

void IterativeDeepeningTimeSearcher::update(ExecutionState *current,
                                            const std::set<ExecutionState*> &addedStates,
                                            const std::set<ExecutionState*> &removedStates) {
  double elapsed = util::getWallTime() - startTime;

  if (!removedStates.empty()) {
    std::set<ExecutionState *> alt = removedStates;
    for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
           ie = removedStates.end(); it != ie; ++it) {
      ExecutionState *es = *it;
      std::set<ExecutionState*>::const_iterator it = pausedStates.find(es);
      if (it!=pausedStates.end()) {
        pausedStates.erase(it);
        alt.erase(alt.find(es));
      }
    }    
    baseSearcher->update(current, addedStates, alt);
  } else {
    baseSearcher->update(current, addedStates, removedStates);
  }

  if (current && !removedStates.count(current) && elapsed>time) {
    pausedStates.insert(current);
    baseSearcher->removeState(current);
  }

  if (baseSearcher->empty()) {
    time *= 2;
    std::cerr << "KLEE: increasing time budget to: " << time << "\n";
    baseSearcher->update(0, pausedStates, std::set<ExecutionState*>());
    pausedStates.clear();
  }
}

/***/

InterleavedSearcher::InterleavedSearcher(const std::vector<Searcher*> &_searchers)
  : searchers(_searchers),
    index(1) {
}

InterleavedSearcher::~InterleavedSearcher() {
  for (std::vector<Searcher*>::const_iterator it = searchers.begin(),
         ie = searchers.end(); it != ie; ++it)
    delete *it;
}

ExecutionState &InterleavedSearcher::selectState() {
  Searcher *s = searchers[--index];
  if (index==0) index = searchers.size();
  return s->selectState();
}

void InterleavedSearcher::update(ExecutionState *current,
                                 const std::set<ExecutionState*> &addedStates,
                                 const std::set<ExecutionState*> &removedStates) {
  for (std::vector<Searcher*>::const_iterator it = searchers.begin(),
         ie = searchers.end(); it != ie; ++it)
    (*it)->update(current, addedStates, removedStates);
}

/////---- add a new search that won't stop after reaching POF -----////

KInstruction* CallSeqReplayNonStopSearcher::findInstFromSourceLine(std::string sourceline) {

	KInstruction* retInst = NULL;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction* kf = functions[i];
		int numInst = kf->numInstructions;
		for (int j=0;j<numInst;j++) {
			KInstruction* ki = kf->instructions[j];
			std::ostringstream osstream;
			osstream << ki->info->file <<":"<<ki->info->line;
//			std::cerr << osstream.str() << "\n";
			if (osstream.str().compare(sourceline)==0) {

				//BasicBlock* curBB = ki->inst->getParent();
				//calc All distance to that targetBB;
				return ki;
				//std::cerr << (*(ki->inst)) <<"\n";
		//		return ki->inst;
//				targetBBList.push_back(curBB);
//					generateNewShortDistance();
			}
		}
	}
//	if (retInst!=NULL) {
//
//		retInst->dump();
//	}
	return retInst;

}

void CallSeqReplayNonStopSearcher::CleanCachedCallSites() {
	std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator end = cachedCallSite.end();
	for (std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator it = cachedCallSite.begin();it!=end;it++){
		std::vector<llvm::Instruction*>* vec = it->second;
		if (vec!=NULL) {
		vec->clear();
		delete vec;
		} else {
//			std::cerr << it->first->getNameStr()<<"\n";
		}
	}

}

CallSeqReplayNonStopSearcher::CallSeqReplayNonStopSearcher(Executor &_executor)
  : executor(_executor),
    functions(executor.kmodule->functions){
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function!=NULL) {
			funcShortMap[kf->function] = 1;
		}
		llvm::Function* curFunc = kf->function;
		if (curFunc->getBasicBlockList().size()==0)
			continue;
		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
			BasicBlock *BB = I;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					if (isa<CallInst>(inst)) {
						CallInst* ci = (CallInst*) inst;
						if (ci->getCalledFunction()!=NULL) {
							Function *fc = ci->getCalledFunction();
							if (cachedCallSite.find(fc)==cachedCallSite.end()) {
								std::vector<llvm::Instruction*>* newvector = new std::vector<llvm::Instruction*>();
								newvector->push_back(inst);
								cachedCallSite[fc] = newvector;
							} else {
								std::vector<llvm::Instruction*>* oldvector = cachedCallSite[fc];
								oldvector->push_back(inst);
							}

						}
					}
				}
		}

	}

	//load call seq trace file

	callSeqPtr = 0;
	getTarget = false;

	std::set<std::string> funcCoverList;

	std::ifstream covFile("funcov", std::ifstream::in);
	while (covFile.good()) {
		char line[1024];
		covFile.getline(line,1024);
		std::string linestr(line);
		if (linestr.length()>0) {
			funcCoverList.insert(linestr);
		}
	}
	covFile.close();

	std::string usermainfile;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function!=NULL&&kf->function->getNameStr().compare("__user_main")==0) {
			if (kf->instructions[0]!=NULL) {
				usermainfile = kf->instructions[0]->info->file;
		//		std::cerr<<"__user_main file info:"<<usermainfile<<"\n";
				break;
			}
		}
	}

	if (funcCoverList.size()>0) {
	for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			if (kf->function!=NULL) {
				if (kf->instructions[0]!=NULL) {
					if (kf->instructions[0]->info->file.length()>0&&kf->instructions[0]->info->file.find("klee/runtime")==std::string::npos&&kf->instructions[0]->info->file.find("klee-uclibc")==std::string::npos){
						if (funcCoverList.find(kf->function->getNameStr())==funcCoverList.end()) {
						//	std::cerr<< "this function is not visited: "<<kf->function->getNameStr()<<"\n";
						//	std::cerr<< kf->instructions[0]->info->file << "\n";
							unvisitedFunc.insert(kf->function);
							continue;
						}
					}
				}
			}
		}
	}

	std::ifstream historyFile("callseq", std::ifstream::in);
	std::vector<std::string> funcList;
	while (historyFile.good()) {
		char line[1024];
		historyFile.getline(line,1024);
		std::string linestr(line);
		size_t strfound;
		strfound = linestr.find_first_of("#");
		if (strfound!=std::string::npos) {
			linestr = linestr.substr(0,strfound);
		}

		strfound=linestr.find_first_of(":");

		if (strfound==std::string::npos) {
			continue;
		}
		size_t funcfound;
		funcfound=linestr.find_first_of("@");
		if (funcfound==std::string::npos) {
			callSeq.push_back(linestr);
			break;
		}
		std::string lineinfo = linestr.substr(0,funcfound);
		std::string funcName = linestr.substr(funcfound+1);
		callSeq.push_back(lineinfo);
		funcList.push_back(funcName);
	}
	historyFile.close();

//	size_t strfound;
//	strfound=callSeq[0].find_first_of(":");
//	std::string fileinfo = callSeq[0].substr(0,strfound);
////	std::cerr<<" get source file name "<< fileinfo <<"\n";
//	this->sourceFile = fileinfo;
	std::map<std::string,KInstruction*> foundset;
	std::map<std::string,KInstruction*> unfoundset;

	for (unsigned i=0;i<funcList.size();i++) {
		std::string linestr = callSeq[i];
		std::string callFuncStr = funcList[i];
//		size_t bbfound,dbbfound;
//		bbfound = callFuncStr.find_first_of("#");
		//dbbfound = callFuncStr.find_first_of("%");
		std::ostringstream qcstream;
		qcstream << linestr <<"@"<<callFuncStr;
		if (foundset.find(qcstream.str())!=foundset.end()) {
			targetInstList.push_back(foundset[qcstream.str()]);
			continue;
		}
		if (unfoundset.find(qcstream.str())!=unfoundset.end()) {
			std::cerr << i << " " << funcList.size() <<"can not find target "<< linestr <<"@"<<callFuncStr<<"\n";
			continue;
		}

		bool found = false;
		for (unsigned i=0;i<functions.size();i++) {
			KFunction* kf = functions[i];
			int numInst = kf->numInstructions;
			for (int j=0;j<numInst;j++) {
				KInstruction* ki = kf->instructions[j];
				std::ostringstream osstream;
				osstream << ki->info->file <<":"<<ki->info->line<<"@"<<ki->info->assemblyLine;
	//			std::cerr << osstream.str() << "\n";
				if (osstream.str().compare(qcstream.str())==0) {
							found =true;
							targetInstList.push_back(ki);
							foundset[qcstream.str()] = ki;
							break;
				//	}
				}
			}
			if (found)
				break;
		}
		if (!found) {
			std::cerr << i << " " << funcList.size() <<"can not find target "<< linestr <<"@"<<callFuncStr<<"\n";
			unfoundset[qcstream.str()] = NULL;
		}

	}
	if (funcList.size()<callSeq.size()) {
		std::string lasttarget = callSeq[callSeq.size()-1];
		KInstruction* lastInst = this->findInstFromSourceLine(lasttarget);
		targetInstList.push_back(lastInst);
	}



	std::cerr<<"build dom tree\n";
	llvm::PassManager pmdom;
	DomInterfacePass* dpass = new DomInterfacePass(NULL, &unvisitedFunc);
	pmdom.add((llvm::Pass*)dpass);
	pmdom.run(*executor.kmodule->module);
	prunedBBSet.insert(dpass->outputPrunedList.begin(),dpass->outputPrunedList.end());

	std::cerr<<"filter out func number:" << unvisitedFunc.size() <<"\n";
	std::cerr<<"filter out BB number:" << prunedBBSet.size() <<"\n";

	generateFuncShort();


	lastChoiceNumber = -1;
	lastChoice = NULL;

	this->getToUserMain = false;
	findNextTarget();

}


void CallSeqReplayNonStopSearcher::generateFuncShort() {

	int infinity = 10000000;
	std::set<Function*> exitfuncs;
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		if (kf->function->getNameStr().compare("__user_main")==0)
			continue;
		for (unsigned j=0;j<kf->numInstructions;j++) {
			KInstruction* ki = kf->instructions[j];
			if (isa<CallInst>(ki->inst)) {
				CallInst* callI = (CallInst*)(ki->inst);
				if (callI->getCalledFunction()!=NULL&&callI->getCalledFunction()->getNameStr().compare("exit")==0) {
					exitfuncs.insert(kf->function);
					break;
				}
			}

		}
		llvm::Function* curFunc = kf->function;
	}
	// run 5 times to get approximate short dis for func
		for (int j=0;j<5;j++) {
			curDistanceMap.clear();

		for (unsigned i=0;i<functions.size();i++) {
			KFunction * kf = functions[i];
			llvm::Function* curFunc = kf->function;
			std::set<Instruction*> q;
			if (curFunc->getBasicBlockList().size()==0)
				continue;
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
					for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
						Instruction* inst = BI;
						if (isa<ReturnInst>(inst)) {
							curDistanceMap[inst] = 1;
						} else if (isa<CallInst>(inst)){
							CallInst* callI = (CallInst*)inst;
							if (callI->getCalledFunction()!=NULL&&callI->getCalledFunction()->getNameStr().compare("exit")==0)
								curDistanceMap[inst] = 1;
							else if (callI->getCalledFunction()!=NULL&&exitfuncs.find(callI->getCalledFunction())!=exitfuncs.end())
								curDistanceMap[inst] = 1;
							else
								curDistanceMap[inst] = infinity;
						}
						else {
							curDistanceMap[inst] = infinity;
						}
						if (inst->isTerminator()||isa<CallInst>(inst))
							q.insert(inst);
					}
			}

//
//					for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
//					if (iter->second==0) {
//						iter->first->dump();
//						std::cerr<<"initialization error!\n";
//						}
//					}


			while (q.size()>0) {
				   std::set<Instruction*>::iterator it;
				   Instruction* minInst = NULL;
				   int minval = infinity;
				   for (it = q.begin();it!=q.end();it++) {
				    	Instruction* ci = *it;

				    	if (curDistanceMap[ci]<minval) {
							minval = curDistanceMap[ci];
							minInst = ci;
				    	}
				   }
				   if (minval==infinity) {
					   q.clear();
					   break;
				   }
				   q.erase(minInst);

				   std::vector<Instruction*> instvec;
				   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
					   Instruction* binst = BI;
					   if (binst==minInst)
						   break;
					   instvec.push_back(binst);
				   }
				   int newDis = infinity;

				   Instruction* cminInst = minInst;
				   while(instvec.size()>0){
					   Instruction* backInst = instvec.back();
					   if (isa<CallInst>(backInst)) {


						//means prevInst is a call site to another func
						Function* calledFunc = ((CallInst*)backInst)->getCalledFunction();
						if (calledFunc==NULL) {
						  	newDis = curDistanceMap[cminInst]+1;
						} else {
							if (unvisitedFunc.find(calledFunc)==unvisitedFunc.end()) {
						  	if (funcShortMap.find(calledFunc)!=funcShortMap.end())
						  		newDis = curDistanceMap[cminInst]+1+funcShortMap[calledFunc];
						  	else
						  		newDis = curDistanceMap[cminInst]+1;
							} else
								newDis = infinity;
						  	}
							 if (curDistanceMap[backInst]>newDis) {
						  		 curDistanceMap[backInst] = newDis;
//						  		 if (newDis==0) {
//						  			 std::cerr<<"catch an error here!\n";
//						  		 }
						  	 }
						 }
					   else {
						  	//simple case direct pred
						    newDis = curDistanceMap[cminInst]+1;
						  	if (curDistanceMap[backInst] > newDis) {
						  			curDistanceMap[backInst] = newDis;
//						  	 		 if (newDis==0) {
//						  							  			 std::cerr<<"catch an error here3!\n";
//						  							  		 }
						  	}


					   }
					   instvec.pop_back();
					   cminInst=backInst;
					   q.erase(backInst);
				   }

					   //means minInst is the beginning of program
					   pred_iterator PI = pred_begin(cminInst->getParent()), PE = pred_end(cminInst->getParent());
					   while(PI!=PE) {
						   BasicBlock* predBB = (BasicBlock*)(*PI);
						   if (prunedBBSet.find(predBB)==prunedBBSet.end()) {
						   TerminatorInst* predterm = predBB->getTerminator();
						   newDis = curDistanceMap[cminInst]+1;
						   if (curDistanceMap[predterm]>newDis) {
							   curDistanceMap[predterm] = newDis;
//							   if (newDis==0) {
//								   std::cerr<<"catch an error here2!";
//							   }
						   }
						   }
						   PI++;
					   }


				}
			if (curDistanceMap[curFunc->getEntryBlock().begin()]<infinity) {
				funcShortMap[curFunc] = curDistanceMap[curFunc->getEntryBlock().begin()];
		//		std::cerr <<  "dis func map for "<< curFunc->getNameStr() <<" is " <<funcShortMap[curFunc]<<"\n";
			}
			else {
			//	std::cerr<<"can't get to entry of this function : "<<curFunc->getNameStr()<<"\n";
			//	std::cerr<<"ouput func map:\n";
			}
		}
		}

		std::cerr<< "start dumping curDistanceMap\n";

		for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
		if (iter->second==0) {
			iter->first->dump();
			std::cerr<<"we have error dis!\n";
			}

//		if (isa<CallInst>(iter->first)) {
//			std::cerr<<"call dis : "<<iter->second<<"\n";
//		}
		}
//		for (std::map<llvm::Instruction*, int>::iterator iter = curDistanceMap.begin();iter!=curDistanceMap.end();iter++) {
//			if (iter->first->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
//			//if (iter->second<infinity) {
//			iter->first->dump();
//			std::cerr<<"distance is "<<iter->second<<"\n";
//			}
//	//		}
//		}
}

void CallSeqReplayNonStopSearcher::generateNewShortDistance() {
//	this->curDistanceMap.clear();
	this->curInsideFuncDisMap.clear();

	int infinity = 10000000;
	//std::set<BasicBlock*> s;
	std::set<Instruction*> q;
//	std::cerr<<callSeqPtr<<" "<<targetInstList.size()<<"\n";
	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		Function* curFunc = kf->function;
		if (unvisitedFunc.find(curFunc)!=unvisitedFunc.end())
			continue;
	//	if (curFunc==targetInstList[callSeqPtr]->getParent()->getParent()) {
			for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
				BasicBlock *BB = I;
				if (prunedBBSet.find(BB)!=prunedBBSet.end())
					continue;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					curInsideFuncDisMap[inst] = infinity;
					if (inst->isTerminator()) {
						q.insert(inst);
					}
					if (isa<CallInst>(inst)) {
						CallInst* calli = (CallInst*)(inst);
						if (calli->getCalledFunction()!=NULL) {
							if (unvisitedFunc.find(calli->getCalledFunction())==unvisitedFunc.end())
								q.insert(inst);
						} else
							q.insert(inst);
					}
				}

			}
	//	}
	}

	std::set<Instruction*> modifiedset;

	curInsideFuncDisMap[targetInstList[callSeqPtr]->inst]=0;
	modifiedset.insert(targetInstList[callSeqPtr]->inst);
	q.insert(targetInstList[callSeqPtr]->inst);
	while (q.size()>0) {
		   std::set<Instruction*>::iterator it;
		   Instruction* minInst = NULL;
		   int minval = infinity;
		   if (modifiedset.size()>0) {
		   for (it = modifiedset.begin();it!=modifiedset.end();it++) {
		    	Instruction* cinst = *it;

		    	if (curInsideFuncDisMap[cinst]<minval) {
					minval = curInsideFuncDisMap[cinst];
		    		minInst = cinst;
		    	}
		   }
		   }
		   if (minval==infinity){
			   q.clear();
			   break;
		   }
	//	   cerr<<"get min BB:" << minBB->getNameStr() << "\n";
		   q.erase(minInst);
		   modifiedset.erase(minInst);
//		   s.insert(minBB);

		   std::vector<Instruction*> instvec;
		   for (BasicBlock::iterator BI = minInst->getParent()->begin(),BE = minInst->getParent()->end();BI!=BE;BI++) {
			   Instruction* binst = BI;
			   if (binst==minInst)
				   break;
			   instvec.push_back(binst);
		   }
		   int newDis = 0;

		   Instruction* cminInst = minInst;
		   while(instvec.size()>0){
			   Instruction* backInst = instvec.back();
			   if (isa<CallInst>(backInst)) {


				//means prevInst is a call site to another func
				Function* calledFunc = ((CallInst*)backInst)->getCalledFunction();
				if (calledFunc==NULL) {
				  	newDis = curInsideFuncDisMap[cminInst]+1;
				} else {
					if (unvisitedFunc.find(calledFunc)==unvisitedFunc.end()) {

				  	if (funcShortMap.find(calledFunc)!=funcShortMap.end())
				  		newDis = curInsideFuncDisMap[cminInst]+1+funcShortMap[calledFunc];
				  	else
				  		newDis = curInsideFuncDisMap[cminInst]+1; }
					else
						newDis = infinity;
				  	}
					 if (curInsideFuncDisMap[backInst]>newDis) {
						 curInsideFuncDisMap[backInst] = newDis;
				  	 }
				 } else {
				  	//simple case direct pred
				    newDis = curInsideFuncDisMap[cminInst]+1;
				  	if (curInsideFuncDisMap[backInst] > newDis) {
				  		curInsideFuncDisMap[backInst] = newDis;
				  	}


			   }
			   instvec.pop_back();
			   cminInst=backInst;
			  // q.erase(backInst);
		   }

		   BasicBlock* parentBB = cminInst->getParent();
		   BasicBlock* entryBB = &(parentBB->getParent()->getEntryBlock());

//		   if (parentBB==entryBB) {
//		  				   std::vector<llvm::Instruction*>* vec = cachedCallSite[parentBB->getParent()];
//		  				   if (vec!=NULL) {
//		  					   for (unsigned i=0;i<vec->size();i++) {
//		  						   Instruction* calli = vec->at(i);
//		  						   if ((prunedBBSet.find(calli->getParent())==prunedBBSet.end())&&(unvisitedFunc.find(calli->getParent()->getParent())==unvisitedFunc.end())) {
//		  						   	 newDis = curInsideFuncDisMap[cminInst]+1;
//		  						   	 if (curInsideFuncDisMap[calli]>newDis) {
//		  						   		curInsideFuncDisMap[calli] = newDis;
//		  						   		modifiedset.insert(calli);
//		  						   		//std::cerr << "propagate to upper level\n";
//		  						   	 }
//		  						   }
//		  					   }
//		  				   }
//		  			   }

			   //means minInst is the beginning of program
			   pred_iterator PI = pred_begin(cminInst->getParent()), PE = pred_end(cminInst->getParent());
			   while(PI!=PE) {
				   BasicBlock* predBB = (BasicBlock*)(*PI);
				   if (prunedBBSet.find(predBB)==prunedBBSet.end()) {
				   TerminatorInst* predterm = predBB->getTerminator();
				   newDis = curInsideFuncDisMap[cminInst]+1;
				   if (curInsideFuncDisMap[predterm]>newDis) {
					   curInsideFuncDisMap[predterm] = newDis;
					   modifiedset.insert(predterm);
				   }
				   }
				   PI++;
			   }



		}

//	Function* curFunc = targetInstList[callSeqPtr]->getParent()->getParent();
//
//	for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
//		BasicBlock *BB = I;
//		std::cerr<< BB->getNameStr()<<":\n";
//			for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
//				Instruction* inst = BI;
//				inst->dump();
//				std::cerr<<"dis : "<<curInsideFuncDisMap[inst]<<"\n";
//			}
//	}

}


void CallSeqReplayNonStopSearcher::findNextTarget() {
	lastChoice = NULL;
	lastChoiceNumber = -1;

	if (callSeqPtr==targetInstList.size()) {

//		this->curInsideFuncDisMap.clear();

//		return;
		callSeqPtr--;
	}

	generateNewShortDistance();

	return;

}

CallSeqReplayNonStopSearcher::~CallSeqReplayNonStopSearcher() {
}


ExecutionState &CallSeqReplayNonStopSearcher::selectState() {
	ExecutionState *backes = states.back();
	int infinity = 10000000;
	int initenvpos = 0;
	if (InitEnv)
		initenvpos = 1;

	if (getToUserMain==false&&backes->pc->inst->getParent()->getParent()->getNameStr().compare("__user_main")==0) {
		getToUserMain = true;
	}
	if (getToUserMain==false)
		return *backes;

	if (getTarget==true) {
//		states.clear();
//		CleanCachedCallSites();
//		ExecutionState* retState = lastChoice;
		findNextTarget();
		std::cerr<<"set getTarget to false\n";
		std::cerr<<"state size"<<states.size()<<"\n";
		getTarget = false;
//		return *retState;
	}

	do {
	int minDis = infinity;
	std::vector<ExecutionState*> potentialminState;
	std::vector<int> potentialminVal;
	ExecutionState* minState;
//	std::cerr<<"reach here picking state?? "<<callStackPtr<<"\n";

	for (std::vector<ExecutionState*>::iterator it = states.begin(),
	             ie = states.end(); it != ie; ++it) {
		ExecutionState *es = *it;
		int dis = infinity;
		if (prunedBBSet.find(es->pc->inst->getParent())!=prunedBBSet.end()) {
			continue;
		}

		if (stateStepMap.find(es)==stateStepMap.end()) {
			stateStepMap[es] = callSeqPtr;
		}
		if (stateStepMap[es] != callSeqPtr) {
			continue;
		}

		if (callSeqPtr>0){
			bool skip = false;//if the inst is in the targetList but not next target
		if (es->pc->inst!=targetInstList[callSeqPtr]->inst&&es->pc->inst!=targetInstList[callSeqPtr-1]->inst) {
			for (int i=0;i<targetInstList.size();i++) {
				if (es->pc->inst==targetInstList[i]->inst) {
					skip = true;
					//std::cerr << "next target" << targetInstList[callSeqPtr]->info->file <<":"<< targetInstList[callSeqPtr]->info->line <<"@"<< targetInstList[callSeqPtr]->info->assemblyLine << "\n";
					//std::cerr << "skip cur target" <<es->pc->info->file <<":"<<es->pc->info->line<<"@"<<es->pc->info->assemblyLine<<"\n";
					break;
				}
			}
		}
		if (skip==true)
			continue;
		}


		if (es->pc->inst->getParent()->getParent()==targetInstList[callSeqPtr]->inst->getParent()->getParent()) {
			//if (es->pc->info->file.compare(this->sourceFile)==0) {
			if (this->curInsideFuncDisMap.find(es->pc->inst)!=this->curInsideFuncDisMap.end()) {
				dis = this->curInsideFuncDisMap[es->pc->inst];
//				std::cerr<< "dis calc by same func\n";
//				std::cerr<< es->pc->info->file<<":"<<es->pc->info->line<<"\n";
//				std::cerr<< dis <<"\n";
//				std::cerr<< es->pc->inst->getParent()->getNameStr()<<"\n";
		//		es->pc->inst->dump();
				if (dis==0) {
					minState = es;
					minDis = 0;
				} else {
					if (dis<infinity) {

				potentialminState.push_back(es);
				potentialminVal.push_back(dis);
				}
				}
			}
		//	}
		}
		if (dis==infinity) {

	//		std::cerr<< "dis calc in diff func : "<<es->pc->inst->getParent()->getParent()->getNameStr()
	//			<<"\t"<<targetInstList[callSeqPtr]->getParent()->getParent()->getNameStr()<<"\n";

			dis = this->curDistanceMap[es->pc->inst];
//			std::cerr<<"add dis to ret "<<dis<<"\n";

			for (unsigned i = es->stack.size()-1;i>=initenvpos+1;i--) {
				StackFrame sf = es->stack[i];
				KInstruction* kinst = sf.caller;
//				if (kinst->info->file.compare(this->sourceFile)==0) {
					//if (kinst->inst->getParent()->getParent()==targetInstList[callSeqPtr]->getParent()->getParent()&&this->curInsideFuncDisMap[kinst->inst]<infinity) {
				int insidedis = infinity;
				if (this->curInsideFuncDisMap.find(kinst->inst)!=this->curInsideFuncDisMap.end())
					insidedis = this->curInsideFuncDisMap[kinst->inst];
				if (insidedis<infinity) {
						dis += insidedis;
	//					std::cerr<<"add inside func to target "<<this->curInsideFuncDisMap[kinst->inst];
						break;
			//		}
				} else {
					if (i>=initenvpos+1) {
		//			std::cerr<<"add dis to ret "<<this->curDistanceMap[kinst->inst]<<"\n";
					dis+=this->curDistanceMap[kinst->inst];
					}
				}
			}
			if (dis==0) {
				minState = es;
				minDis = 0;
			} else {
				if (dis<infinity) {
							potentialminState.push_back(es);
							potentialminVal.push_back(dis);
				}
			}
		}
	}

	if (minDis>0&&potentialminVal.size()>0) {
		ExecutionState* pminState = NULL;
		int valLength = potentialminVal.size()-1;

		if (lastChoiceNumber==valLength) {
			for (int a=0;a<=valLength;a++) {
				if (potentialminState[a]==lastChoice) {
					pminState = lastChoice;
					minDis = potentialminVal[a];
					break;
				}
			}
			if (pminState!=NULL) {
				minState = pminState;
			}
		}


		if (pminState==NULL){
			lastChoiceNumber = valLength;
//			minState = potentialminState[0];
//			minDis = potentialminVal[0];
//			int minnum =0;
//			for (int a=1;a<=valLength;a++) {
//				if (potentialminVal[a]<minDis) {
//					minState = potentialminState[a];
//					minDis = potentialminVal[a];
//					minnum=a;
//				}
//			}
//			std::cerr << "pick " << minnum << " of " << valLength << "\n";

			std::map<llvm::Instruction*,int> instcounter;
			for (int a=0;a<=valLength;a++) {
				ExecutionState* aes = potentialminState[a];
				if (instcounter.find(aes->pc->inst)==instcounter.end()) {
					instcounter[aes->pc->inst] =1;
				} else {
					int prevV = instcounter[aes->pc->inst];
					instcounter[aes->pc->inst]=prevV+1;
				}
			}

	double totalVal = 0;
	for (int a=0;a<=valLength;a++) {

		totalVal+=1.00/(((double)(potentialminVal[a]))*instcounter[potentialminState[a]->pc->inst]);
	}
	double rng = theRNG.getDoubleL();
	//std::cerr<<"rng : "<<rng << " potentialminVal : "<< potentialminVal.size() ;
	double curSum = 0;
	for (unsigned i =0;i<potentialminVal.size();i++) {
		double curTemp = 1.00/(((double)(potentialminVal[i]))*instcounter[potentialminState[i]->pc->inst]);
		if (curSum/totalVal<=rng&&(curSum+curTemp)/totalVal>rng) {
			minDis = potentialminVal[i];
			minState = potentialminState[i];
//			std::cerr<<" picked number "<<i<<" from total state number "<<potentialminVal.size()<<"\n";
			break;
		}
		double v1 = curSum/totalVal;
		double v2 = (curSum+curTemp)/totalVal;
//		std::cerr<<"["<<v1<<","<<v2<<"]\n";
		curSum+=curTemp;
	}
	}
	}

	if (minDis<infinity) {
		std::ostringstream osstream;
		osstream << minState->pc->info->file <<":"<<minState->pc->info->line;
		std::ifstream checkfile("dumpdetail");
		if (checkfile) {
					std::cerr << "picked " <<minState->pc->info->file<<":"<< minState->pc->info->line << " stack size" << minState->stack.size() <<" min Dis "<<minDis<<"\n";
					std::cerr << "state number:" << states.size() <<"\n";
					minState->pc->inst->dump();
					std::cerr<<minState->pc->inst->getParent()->getNameStr()<<"@"<<minState->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
					std::cerr << "next target " << targetInstList[callSeqPtr]->info->file <<":"<< targetInstList[callSeqPtr]->info->line <<"@"<< targetInstList[callSeqPtr]->info->assemblyLine << "\n";
					if (this->curInsideFuncDisMap[minState->pc->inst]<infinity) {
						std::cerr<<"found in the same func\n";
					} else {
						for (unsigned i = minState->stack.size()-1;i>=initenvpos+1;i--) {
										StackFrame sf = minState->stack[i];
										KInstruction* kinst = sf.caller;
						//				if (kinst->info->file.compare(this->sourceFile)==0) {
											//if (kinst->inst->getParent()->getParent()==targetInstList[callSeqPtr]->getParent()->getParent()&&this->curInsideFuncDisMap[kinst->inst]<infinity) {
										int insidedis = infinity;
										if (this->curInsideFuncDisMap.find(kinst->inst)!=this->curInsideFuncDisMap.end())
											insidedis = this->curInsideFuncDisMap[kinst->inst];

										if (insidedis<infinity) {
										//		dis += insidedis;
												std::cerr<<"add inside func to distance "<<this->curInsideFuncDisMap[kinst->inst]<<"\n";
												break;
									//		}
										} else {
											if (i>=initenvpos+1) {
											std::cerr<<"add dis to ret "<<this->curDistanceMap[kinst->inst]<<"\n";
											kinst->inst->dump();
											//dis+=this->curDistanceMap[kinst->inst];
											}
										}
									}

//						if (minState->stack.size()>=2) {
//							std::cerr << "caller stack " <<minState->stack[minState->stack.size()-2].caller->info->file<<":"<< minState->stack[minState->stack.size()-2].caller->info->line << "@" << minState->stack[minState->stack.size()-2].caller->info->assemblyLine<<"\n";
//							if (this->curInsideFuncDisMap[minState->stack[minState->stack.size()-2].caller->inst]<infinity) {
//								std::cerr<< "caller stack is in the func and dis: "<< this->curInsideFuncDisMap[minState->stack[minState->stack.size()-2].caller->inst];
//							}
//						}
					}
					std::cerr<< "------------------\n";

		}
//		if (minDis==0) {
//			std::cerr<<"**min dis is 0 dumping inst\n";
//			std::cerr<<"searching inst : ";
//			minState->pc->inst->dump();
//			std::cerr<<"target inst : ";
//			targetInstList[callSeqPtr]->dump();
//		}

		if (minState->pc->inst==targetInstList[callSeqPtr]->inst){//&&(osstream.str().compare(callSeq[callSeqPtr])==0)) {

				callSeqPtr++;
				stateStepMap[minState] = callSeqPtr;
				if (callSeqPtr==targetInstList.size()) {
					std::cerr << "reach target clear other states dump pc\n";
					time_t nowtime = time (NULL);
					char buf[256];
					strftime(buf, sizeof(buf), "Get At: %Y-%m-%d %H:%M:%S\n", localtime(&nowtime));
					std::cerr << buf ;

					getTarget = true;
//					states.clear();
				} else {
					std::cerr << callSeqPtr <<" "<<targetInstList.size()<< " reach partial important move step forward\n";
				//	std::cerr << "Cur PC : "<< minState->pc->info->file<<":"<<minState->pc->info->line<<"@"<<minState->pc->info->assemblyLine <<"\n";
					time_t nowtime = time (NULL);
					char buf[256];
					strftime(buf, sizeof(buf), "Get At: %Y-%m-%d %H:%M:%S\n", localtime(&nowtime));
					std::cerr << buf ;
					std::cerr << "Next target : "<< targetInstList[callSeqPtr]->info->file<<":"<<targetInstList[callSeqPtr]->info->line<<"@"<<targetInstList[callSeqPtr]->info->assemblyLine <<"\n";
					std::cerr << "Opcode : " << targetInstList[callSeqPtr]->inst->getOpcodeName() <<"\n";
					findNextTarget();
			}
		}
		lastChoice = minState;

		return *minState;
	} else {
		if (callSeqPtr==0)
			break;
		callSeqPtr--;
		bool btmore = true;
		while (btmore) {
//			int numnotstep = 0;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
			if (stateStepMap[es] == callSeqPtr) {
				btmore = false;
				break;
			}
		}
		if (btmore==false) {
			break;
		}
		if (callSeqPtr==0) {
			//lets try to remove the top one target so that we can move step further
			int maxcallSeqPtr = -1;
			for (std::vector<ExecutionState*>::iterator it = states.begin(),
			             ie = states.end(); it != ie; ++it) {
				ExecutionState *es = *it;
				if (stateStepMap[es] > maxcallSeqPtr) {
					maxcallSeqPtr = stateStepMap[es];
				}
			}
			targetInstList.erase(targetInstList.begin()+maxcallSeqPtr);
			std::cerr<< "remove target " <<maxcallSeqPtr<<" from target list\n";
			callSeqPtr = maxcallSeqPtr;
			break;


		}
		callSeqPtr--;

		};

		std::cerr << callSeqPtr <<" "<<targetInstList.size()<< " have to perform backtracing move step back\n";
		std::cerr << "Next target : "<< targetInstList[callSeqPtr]->info->file<<":"<<targetInstList[callSeqPtr]->info->line<<"@"<<targetInstList[callSeqPtr]->info->assemblyLine << "#" << targetInstList[callSeqPtr]->inst->getParent()->getParent()->getNameStr()<<"\n";

		if (states.size()==1) {
			std::cerr<<"Cur PC : " << states.back()->pc->info->file<<":" <<states.back()->pc->info->line<<"@"<<states.back()->pc->info->assemblyLine<<"#"<<states.back()->pc->inst->getParent()->getParent()->getNameStr()<<"\n";
		}

		if (callSeqPtr==targetInstList.size())
			break;
			findNextTarget();
		}
	} while (true);
		//clear states
		std::cerr<<"min Dis is infinite, we can't find feasible path.\n Now terminating program \n";
		ExecutionState* retVal = NULL;
		for (std::vector<ExecutionState*>::iterator it = states.begin(),
		             ie = states.end(); it != ie; ++it) {
			ExecutionState *es = *it;
	//		Instruction* nextInst = es->pc->inst;
		//	if (nextInst==targetInstList[callSeqPtr]) {
				retVal = es;
				break;
		//	}
		}
		CleanCachedCallSites();
		states.clear();
		return *retVal;
}

void CallSeqReplayNonStopSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator ait = states.begin(),
             aie = states.end(); ait != aie; ++ait) {
        if (es==*ait) {
          states.erase(ait);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}


/////<<<< add a new search that won't stop after reaching POF >>>>>////

/// this searcher is used for calculating the common branch dependency information ////

///CBranch

bool comparebranch(CommonBranch* i, CommonBranch* j) {
	return (i->depNo<j->depNo);
}

BranchRankingSearcher::BranchRankingSearcher(Executor &_executor)
	  : executor(_executor),
	    functions(executor.kmodule->functions){


	for (unsigned i=0;i<functions.size();i++) {
		KFunction * kf = functions[i];
		llvm::Function* curFunc = kf->function;
		if (curFunc->getBasicBlockList().size()==0)
			continue;
		for (Function::iterator I=curFunc->begin(), E=curFunc->end();I!=E;I++) {
			BasicBlock *BB = I;
				for (BasicBlock::iterator BI=BB->begin(),BE=BB->end();BI!=BE;BI++) {
					Instruction* inst = BI;
					if (isa<CallInst>(inst)) {
						CallInst* ci = (CallInst*) inst;
						if (ci->getCalledFunction()!=NULL) {
							Function *fc = ci->getCalledFunction();
							if (cachedCallSite.find(fc)==cachedCallSite.end()) {
								std::vector<llvm::Instruction*>* newvector = new std::vector<llvm::Instruction*>();
								newvector->push_back(inst);
								cachedCallSite[fc] = newvector;
							} else {
								std::vector<llvm::Instruction*>* oldvector = cachedCallSite[fc];
								oldvector->push_back(inst);
							}

						}
					}
				}
		}

	}

	//	this->curBB = NULL;
	std::ifstream historyFile("commonbranch", std::ifstream::in);
	std::vector<std::string> funcList;
	while (historyFile.good()) {
		char line[1024];
		historyFile.getline(line,1024);
		std::string linestr(line);
		size_t strfound;
		strfound=linestr.find_first_of("#");

		if (strfound==std::string::npos) {
			continue;
		}
		std::string branchstr = linestr.substr(0,strfound);
		std::string succstr = linestr.substr(strfound+1);
		llvm::Instruction* branch;
		llvm::Instruction* succ;
		for (unsigned i=0;i<functions.size();i++) {
			KFunction* kf = functions[i];
			int numInst = kf->numInstructions;
			for (int j=0;j<numInst;j++) {
				KInstruction* ki = kf->instructions[j];
				std::ostringstream osstream;
				osstream << ki->info->file <<":"<<ki->info->line<<"@"<<ki->info->assemblyLine;
				if (osstream.str().compare(branchstr)==0)  {
					if (isa<TerminatorInst>(ki->inst)) {
						TerminatorInst* ti = (TerminatorInst*)(ki->inst);
						int succNo = ti->getNumSuccessors();
						for (int k=0;k<numInst;k++) {
							KInstruction* ki2 = kf->instructions[k];
							std::ostringstream osstream2;
							osstream2 << ki2->info->file <<":"<<ki2->info->line<<"@"<<ki2->info->assemblyLine;
							if (osstream2.str().compare(succstr)==0) {
								CommonBranch* cb=new CommonBranch();
								cb->branchinst = ki;
								cb->succinst = ki2;
								cb->depNo = 0;
								branchlist.push_back(cb);

								Function* curFun = kf->function;
								while (cachedCallSite.find(curFun)!=cachedCallSite.end()&&curFun->getNameStr().compare("__user_main")!=0) {
									if (cachedCallSite[curFun]->size()==1) {
										Instruction* calli = cachedCallSite[curFun]->at(0);
										DominateCall* newdcall = new DominateCall;
										newdcall->callinst = calli;
										newdcall->comb = cb;
										curFun = calli->getParent()->getParent();
										dcalllist.push_back(newdcall);
									} else {
										std::cerr <<" call site size for "<<curFun->getNameStr()<<" : "<<cachedCallSite[curFun]->size()<<"\n";
										break;
									}
								}


								break;
							}
						}

					} else {
						std::cerr<< branchstr <<" is not a branch instruction\n";
					}
					break;
				}
			}
		}

	}

	llvm::PassManager pmdom;
	CDPass* cdpass = new CDPass(&branchlist,&dcalllist);

	pmdom.add((llvm::Pass*)cdpass);
	pmdom.run(*executor.kmodule->module);
	std::cerr<<" read "<<branchlist.size()<<" branches\n";
	std::cerr<<" dominate calls: "<<dcalllist.size()<<" \n";

	sort(branchlist.begin(),branchlist.end(),comparebranch);
	std::ofstream outFile;
	outFile.open("sortbranch",std::ios::out);

	for (int i=0;i<branchlist.size();i++) {
		CommonBranch* cb = branchlist[i];
		if (cb->depNo==0)
		outFile << cb->branchinst->info->file << ":" << cb->branchinst->info->line << "@" << cb->branchinst->info->assemblyLine << "#"
				<< cb->succinst->info->file << ":" << cb->succinst->info->line << "@" << cb->succinst->info->assemblyLine << "\n";
		delete cb;
	}
	outFile.close();

	historyFile.close();

	std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator end = cachedCallSite.end();
	for (std::map<llvm::Function*, std::vector<llvm::Instruction*>* >::iterator it = cachedCallSite.begin();it!=end;it++){
		std::vector<llvm::Instruction*>* vec = it->second;
		if (vec!=NULL) {
		vec->clear();
		delete vec;
		} else {
//			std::cerr << it->first->getNameStr()<<"\n";
		}
	}


}

ExecutionState &BranchRankingSearcher::selectState() {
	ExecutionState* es = states.back();

  return *es;
}

void BranchRankingSearcher::update(ExecutionState *current,
                         const std::set<ExecutionState*> &addedStates,
                         const std::set<ExecutionState*> &removedStates) {
  states.insert(states.end(),
                addedStates.begin(),
                addedStates.end());
  for (std::set<ExecutionState*>::const_iterator it = removedStates.begin(),
         ie = removedStates.end(); it != ie; ++it) {
    ExecutionState *es = *it;
    if (es == states.back()) {
      states.pop_back();
    } else {
      bool ok = false;

      for (std::vector<ExecutionState*>::iterator it = states.begin(),
             ie = states.end(); it != ie; ++it) {
        if (es==*it) {
          states.erase(it);
          ok = true;
          break;
        }
      }

      assert(ok && "invalid state removed");
    }
  }
}


///

char CDPass::ID = 1;
CDPass::CDPass(std::vector<CommonBranch*>* inList,std::vector<DominateCall*>* dcalllist)
: llvm::FunctionPass((intptr_t) &ID) {
	this->inList = inList;
	this->dcalllist = dcalllist;
}

void CDPass::getAnalysisUsage(AnalysisUsage &AU) const{
	AU.addRequired<llvm::PostDominanceFrontier>();
	AU.addRequired<llvm::PostDominatorTree>();
}

void CDPass::updateCDNum(BasicBlock* bb, int number) {
	PostDominanceFrontier::const_iterator it = PDF->find(bb);
					if (it==PDF->end()) {
				    	std::cerr<<"can't find on pdf\n";
					} else {
						std::vector<BasicBlock*> worklist;
						std::set<BasicBlock*> cdlist;

						worklist.push_back(bb);
						while (worklist.size()>0) {
					    BasicBlock* wbb = worklist[worklist.size()-1];
					    worklist.pop_back();
						PostDominanceFrontier::const_iterator it = PDF->find(wbb);
					    if (it!=PDF->end()) {
					    	const PostDominanceFrontier::DomSetType &S = it->second;
					    	for (PostDominanceFrontier::DomSetType::const_iterator P = S.begin(),
					             PE = S.end(); P != PE; ++P) {
					    		BasicBlock* cbb = (*P);
					    		if (cbb!=bb&&cdlist.find(cbb)==cdlist.end()) {
					    			cdlist.insert(cbb);
					    			worklist.push_back(cbb);
					    		}
					        }

					    }
						}
	//					std::cerr << cb.branchinst->info->file << ":" << cb.branchinst->info->line << "@" << cb.branchinst->info->assemblyLine << "#"
	//							<< cb.succinst->info->file << ":" << cb.succinst->info->line << "@" << cb.succinst->info->assemblyLine << "#" << cb.depNo<<"\n";
	//
	//					std::cerr<<"CD size:"<<cdlist.size()<<"\n";
						//loop for all control dep in cdlist;
						std::set<BasicBlock*>::iterator sit;
						for (sit = cdlist.begin();sit!=cdlist.end();sit++) {
							BasicBlock* cdbb = (*sit);
							for (int j=0;j<inList->size();j++) {
								CommonBranch* icb = inList->at(j);
								if (icb->branchinst->inst->getParent()==cdbb) {
									//check PDT
	//								std::cerr << "found CD in branchlist\n";
	//								std::cerr << icb.branchinst->info->file << ":" << icb.branchinst->info->line << "@" << icb.branchinst->info->assemblyLine << "#"
	//										<< icb.succinst->info->file << ":" << icb.succinst->info->line << "@" << icb.succinst->info->assemblyLine << "#" << icb.depNo<<"\n";

									if (bb==icb->succinst->inst->getParent()||PDT->dominates(bb,icb->succinst->inst->getParent())) {
										icb->depNo=icb->depNo+number;
										std::cerr << "depNo++\n";

									}
								}
							}
						}

					}

}

bool CDPass::runOnFunction(Function& f) {
	 PDF= &getAnalysis<PostDominanceFrontier>();
	 PDT= &getAnalysis<PostDominatorTree>();

	for (Function::iterator FI=f.begin(),FE=f.end();FI!=FE;FI++) {
		BasicBlock* bb = FI;
		TerminatorInst* ti = bb->getTerminator();
		for (BasicBlock::iterator BI=bb->begin(),BE=bb->end();BI!=BE;BI++) {
			Instruction* inst = BI;
			if (isa<CallInst>(inst)) {
				int callnum = 0;
		for (int i=0;i<dcalllist->size();i++) {
			DominateCall* dcall = dcalllist->at(i);
			if (dcall->callinst==ti) {
				callnum++;
				}
			}
		if (callnum>0) {

			updateCDNum(bb, callnum);
		}
		}
		}
		for (int i=0;i<inList->size();i++) {
			CommonBranch* cb = inList->at(i);
			if (cb->branchinst->inst==ti) {
				updateCDNum(bb,1);
			}
		}
	}

	return false;

}


///


