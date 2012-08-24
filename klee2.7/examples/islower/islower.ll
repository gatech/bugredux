; ModuleID = 'islower.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%struct.FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct.FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct.FILE*, i32 }

@.str = private constant [2 x i8] c"r\00", align 1 ; <[2 x i8]*> [#uses=1]

define i32 @testa(i32 %x) nounwind {
entry:
  %x_addr = alloca i32                            ; <i32*> [#uses=3]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata !{i32* %x_addr}, metadata !0), !dbg !6
  store i32 %x, i32* %x_addr
  %1 = load i32* %x_addr, align 4, !dbg !7        ; <i32> [#uses=1]
  %2 = icmp sle i32 %1, 96, !dbg !7               ; <i1> [#uses=1]
  br i1 %2, label %bb2, label %bb, !dbg !7

bb:                                               ; preds = %entry
  %3 = load i32* %x_addr, align 4, !dbg !7        ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 105, !dbg !7              ; <i1> [#uses=1]
  br i1 %4, label %bb2, label %bb1, !dbg !7

bb1:                                              ; preds = %bb
  %5 = call i32 (...)* @assert(i32 0) nounwind, !dbg !9 ; <i32> [#uses=0]
  br label %return, !dbg !10

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %0, align 4, !dbg !11
  %6 = load i32* %0, align 4, !dbg !11            ; <i32> [#uses=1]
  store i32 %6, i32* %retval, align 4, !dbg !11
  br label %return, !dbg !11

return:                                           ; preds = %bb2, %bb1
  %retval3 = load i32* %retval, !dbg !11          ; <i32> [#uses=1]
  ret i32 %retval3, !dbg !11
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @assert(...)

define i32 @my_islower(i32 %x) nounwind {
entry:
  %x_addr = alloca i32                            ; <i32*> [#uses=4]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata !{i32* %x_addr}, metadata !12), !dbg !14
  store i32 %x, i32* %x_addr
  %1 = load i32* %x_addr, align 4, !dbg !15       ; <i32> [#uses=1]
  %2 = icmp sle i32 %1, 96, !dbg !15              ; <i1> [#uses=1]
  br i1 %2, label %bb2, label %bb, !dbg !15

bb:                                               ; preds = %entry
  %3 = load i32* %x_addr, align 4, !dbg !15       ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 122, !dbg !15             ; <i1> [#uses=1]
  br i1 %4, label %bb2, label %bb1, !dbg !15

bb1:                                              ; preds = %bb
  %5 = load i32* %x_addr, align 4, !dbg !17       ; <i32> [#uses=1]
  %6 = call i32 @testa(i32 %5) nounwind, !dbg !17 ; <i32> [#uses=1]
  store i32 %6, i32* %0, align 4, !dbg !17
  br label %bb3, !dbg !17

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %0, align 4, !dbg !18
  br label %bb3, !dbg !18

bb3:                                              ; preds = %bb2, %bb1
  %7 = load i32* %0, align 4, !dbg !18            ; <i32> [#uses=1]
  store i32 %7, i32* %retval, align 4, !dbg !18
  br label %return, !dbg !18

return:                                           ; preds = %bb3
  %retval4 = load i32* %retval, !dbg !18          ; <i32> [#uses=1]
  ret i32 %retval4, !dbg !18
}

define i32 @main(i32 %argc, i8** %argv) nounwind {
entry:
  %argc_addr = alloca i32                         ; <i32*> [#uses=2]
  %argv_addr = alloca i8**                        ; <i8***> [#uses=2]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=3]
  %c = alloca i32                                 ; <i32*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata !{i32* %argc_addr}, metadata !19), !dbg !26
  store i32 %argc, i32* %argc_addr
  call void @llvm.dbg.declare(metadata !{i8*** %argv_addr}, metadata !27), !dbg !26
  store i8** %argv, i8*** %argv_addr
  call void @llvm.dbg.declare(metadata !{i32* %c}, metadata !28), !dbg !30
  %1 = load i32* %argc_addr, align 4, !dbg !31    ; <i32> [#uses=1]
  %2 = icmp ne i32 %1, 2, !dbg !31                ; <i1> [#uses=1]
  br i1 %2, label %bb, label %bb1, !dbg !31

bb:                                               ; preds = %entry
  store i32 0, i32* %0, align 4, !dbg !32
  br label %bb2, !dbg !32

bb1:                                              ; preds = %entry
  %3 = load i8*** %argv_addr, align 4, !dbg !33   ; <i8**> [#uses=1]
  %4 = getelementptr inbounds i8** %3, i32 1, !dbg !33 ; <i8**> [#uses=1]
  %5 = load i8** %4, align 1, !dbg !33            ; <i8*> [#uses=1]
  %6 = call %struct.FILE* @fopen(i8* noalias %5, i8* noalias getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !33 ; <%struct.FILE*> [#uses=1]
  %7 = call i32 @fgetc(%struct.FILE* %6) nounwind, !dbg !33 ; <i32> [#uses=1]
  store i32 %7, i32* %c, align 4, !dbg !33
  %8 = load i32* %c, align 4, !dbg !34            ; <i32> [#uses=1]
  %9 = call i32 @my_islower(i32 %8) nounwind, !dbg !34 ; <i32> [#uses=1]
  store i32 %9, i32* %0, align 4, !dbg !34
  br label %bb2, !dbg !34

bb2:                                              ; preds = %bb1, %bb
  %10 = load i32* %0, align 4, !dbg !34           ; <i32> [#uses=1]
  store i32 %10, i32* %retval, align 4, !dbg !34
  br label %return, !dbg !34

return:                                           ; preds = %bb2
  %retval3 = load i32* %retval, !dbg !34          ; <i32> [#uses=1]
  ret i32 %retval3, !dbg !34
}

declare %struct.FILE* @fopen(i8* noalias, i8* noalias)

declare i32 @fgetc(%struct.FILE*)

!0 = metadata !{i32 459009, metadata !1, metadata !"x", metadata !2, i32 7, metadata !5} ; [ DW_TAG_arg_variable ]
!1 = metadata !{i32 458798, i32 0, metadata !2, metadata !"testa", metadata !"testa", metadata !"testa", metadata !2, i32 7, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!2 = metadata !{i32 458769, i32 0, i32 1, metadata !"islower.c", metadata !"/home/wei/Documents/code/klee2.7/klee/examples/islower/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5}
!5 = metadata !{i32 458788, metadata !2, metadata !"int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 7, i32 0, metadata !1, null}
!7 = metadata !{i32 8, i32 0, metadata !8, null}
!8 = metadata !{i32 458763, metadata !1, i32 7, i32 0} ; [ DW_TAG_lexical_block ]
!9 = metadata !{i32 9, i32 0, metadata !8, null}
!10 = metadata !{i32 12, i32 0, metadata !8, null}
!11 = metadata !{i32 11, i32 0, metadata !8, null}
!12 = metadata !{i32 459009, metadata !13, metadata !"x", metadata !2, i32 14, metadata !5} ; [ DW_TAG_arg_variable ]
!13 = metadata !{i32 458798, i32 0, metadata !2, metadata !"my_islower", metadata !"my_islower", metadata !"my_islower", metadata !2, i32 14, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 14, i32 0, metadata !13, null}
!15 = metadata !{i32 15, i32 0, metadata !16, null}
!16 = metadata !{i32 458763, metadata !13, i32 14, i32 0} ; [ DW_TAG_lexical_block ]
!17 = metadata !{i32 16, i32 0, metadata !16, null}
!18 = metadata !{i32 17, i32 0, metadata !16, null}
!19 = metadata !{i32 459009, metadata !20, metadata !"argc", metadata !2, i32 20, metadata !5} ; [ DW_TAG_arg_variable ]
!20 = metadata !{i32 458798, i32 0, metadata !2, metadata !"main", metadata !"main", metadata !"main", metadata !2, i32 20, metadata !21, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!21 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !22, i32 0, null} ; [ DW_TAG_subroutine_type ]
!22 = metadata !{metadata !5, metadata !5, metadata !23}
!23 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !24} ; [ DW_TAG_pointer_type ]
!24 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !25} ; [ DW_TAG_pointer_type ]
!25 = metadata !{i32 458788, metadata !2, metadata !"char", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!26 = metadata !{i32 20, i32 0, metadata !20, null}
!27 = metadata !{i32 459009, metadata !20, metadata !"argv", metadata !2, i32 20, metadata !23} ; [ DW_TAG_arg_variable ]
!28 = metadata !{i32 459008, metadata !29, metadata !"c", metadata !2, i32 23, metadata !5} ; [ DW_TAG_auto_variable ]
!29 = metadata !{i32 458763, metadata !20, i32 20, i32 0} ; [ DW_TAG_lexical_block ]
!30 = metadata !{i32 20, i32 0, metadata !29, null}
!31 = metadata !{i32 21, i32 0, metadata !29, null}
!32 = metadata !{i32 22, i32 0, metadata !29, null}
!33 = metadata !{i32 23, i32 0, metadata !29, null}
!34 = metadata !{i32 25, i32 0, metadata !29, null}
