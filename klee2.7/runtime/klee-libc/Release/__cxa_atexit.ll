; ModuleID = '__cxa_atexit.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%0 = type { i32, void ()* }
%struct.anon = type { void (i8*)*, i8*, i8* }

@AtExit = internal global [128 x %struct.anon] zeroinitializer, align 32 ; <[128 x %struct.anon]*> [#uses=4]
@NumAtExit = internal global i32 0                ; <i32*> [#uses=4]
@.str = private constant [34 x i8] c"FIXME: __cxa_atexit being ignored\00", align 4 ; <[34 x i8]*> [#uses=1]
@.str1 = private constant [15 x i8] c"__cxa_atexit.c\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str2 = private constant [32 x i8] c"__cxa_atexit: no room in array!\00", align 4 ; <[32 x i8]*> [#uses=1]
@.str3 = private constant [5 x i8] c"exec\00", align 1 ; <[5 x i8]*> [#uses=1]
@llvm.global_dtors = appending global [1 x %0] [%0 { i32 65535, void ()* @RunAtExit }] ; <[1 x %0]*> [#uses=0]

define i32 @__cxa_atexit(void (i8*)* %fn, i8* %arg, i8* nocapture %dso_handle) nounwind {
entry:
  tail call void @klee_warning_once(i8* getelementptr inbounds ([34 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !16
  %0 = load i32* @NumAtExit, align 4, !dbg !22    ; <i32> [#uses=4]
  %1 = icmp eq i32 %0, 128, !dbg !22              ; <i1> [#uses=1]
  br i1 %1, label %bb, label %bb1, !dbg !22

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i32 39, i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0)) noreturn nounwind, !dbg !23
  unreachable, !dbg !23

bb1:                                              ; preds = %entry
  %2 = getelementptr inbounds [128 x %struct.anon]* @AtExit, i32 0, i32 %0, i32 0 ; <void (i8*)**> [#uses=1]
  store void (i8*)* %fn, void (i8*)** %2, align 4, !dbg !24
  %3 = getelementptr inbounds [128 x %struct.anon]* @AtExit, i32 0, i32 %0, i32 1 ; <i8**> [#uses=1]
  store i8* %arg, i8** %3, align 4, !dbg !25
  %4 = add i32 %0, 1, !dbg !26                    ; <i32> [#uses=1]
  store i32 %4, i32* @NumAtExit, align 4, !dbg !26
  ret i32 0, !dbg !27
}

define internal void @RunAtExit() nounwind {
entry:
  %0 = load i32* @NumAtExit, align 4, !dbg !28    ; <i32> [#uses=1]
  %1 = icmp eq i32 %0, 0                          ; <i1> [#uses=1]
  br i1 %1, label %return, label %bb, !dbg !28

bb:                                               ; preds = %entry, %bb
  %i.03 = phi i32 [ %4, %bb ], [ 0, %entry ]      ; <i32> [#uses=3]
  %scevgep4 = getelementptr [128 x %struct.anon]* @AtExit, i32 0, i32 %i.03, i32 0 ; <void (i8*)**> [#uses=1]
  %scevgep5 = getelementptr [128 x %struct.anon]* @AtExit, i32 0, i32 %i.03, i32 1 ; <i8**> [#uses=1]
  %2 = load void (i8*)** %scevgep4, align 4, !dbg !33 ; <void (i8*)*> [#uses=1]
  %3 = load i8** %scevgep5, align 4, !dbg !33     ; <i8*> [#uses=1]
  tail call void %2(i8* %3) nounwind, !dbg !33
  %4 = add i32 %i.03, 1, !dbg !28                 ; <i32> [#uses=2]
  %5 = load i32* @NumAtExit, align 4, !dbg !28    ; <i32> [#uses=1]
  %6 = icmp ult i32 %4, %5, !dbg !28              ; <i1> [#uses=1]
  br i1 %6, label %bb, label %return, !dbg !28

return:                                           ; preds = %bb, %entry
  ret void, !dbg !34
}

declare void @klee_warning_once(i8*)

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

!llvm.dbg.gv = !{!0, !14}

!0 = metadata !{i32 458804, i32 0, metadata !1, metadata !"AtExit", metadata !"AtExit", metadata !"", metadata !1, i32 18, metadata !2, i1 true, i1 true, [128 x %struct.anon]* @AtExit} ; [ DW_TAG_variable ]
!1 = metadata !{i32 458769, i32 0, i32 1, metadata !"__cxa_atexit.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!2 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 12288, i64 32, i64 0, i32 0, metadata !3, metadata !12, i32 0, null} ; [ DW_TAG_array_type ]
!3 = metadata !{i32 458771, metadata !1, metadata !"", metadata !1, i32 14, i64 96, i64 32, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_structure_type ]
!4 = metadata !{metadata !5, metadata !10, metadata !11}
!5 = metadata !{i32 458765, metadata !3, metadata !"fn", metadata !1, i32 15, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!6 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, null} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9}
!9 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 458765, metadata !3, metadata !"arg", metadata !1, i32 16, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ]
!11 = metadata !{i32 458765, metadata !3, metadata !"dso_handle", metadata !1, i32 17, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 458785, i64 0, i64 127}      ; [ DW_TAG_subrange_type ]
!14 = metadata !{i32 458804, i32 0, metadata !1, metadata !"NumAtExit", metadata !"NumAtExit", metadata !"", metadata !1, i32 19, metadata !15, i1 true, i1 true, i32* @NumAtExit} ; [ DW_TAG_variable ]
!15 = metadata !{i32 458788, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!16 = metadata !{i32 32, i32 0, metadata !17, null}
!17 = metadata !{i32 458763, metadata !18, i32 31, i32 0} ; [ DW_TAG_lexical_block ]
!18 = metadata !{i32 458798, i32 0, metadata !1, metadata !"__cxa_atexit", metadata !"__cxa_atexit", metadata !"__cxa_atexit", metadata !1, i32 31, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !21, metadata !6, metadata !9, metadata !9}
!21 = metadata !{i32 458788, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!22 = metadata !{i32 37, i32 0, metadata !17, null}
!23 = metadata !{i32 38, i32 0, metadata !17, null}
!24 = metadata !{i32 43, i32 0, metadata !17, null}
!25 = metadata !{i32 44, i32 0, metadata !17, null}
!26 = metadata !{i32 45, i32 0, metadata !17, null}
!27 = metadata !{i32 47, i32 0, metadata !17, null}
!28 = metadata !{i32 25, i32 0, metadata !29, null}
!29 = metadata !{i32 458763, metadata !30, i32 22, i32 0} ; [ DW_TAG_lexical_block ]
!30 = metadata !{i32 458798, i32 0, metadata !1, metadata !"RunAtExit", metadata !"RunAtExit", metadata !"RunAtExit", metadata !1, i32 22, metadata !31, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!31 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !32, i32 0, null} ; [ DW_TAG_subroutine_type ]
!32 = metadata !{null}
!33 = metadata !{i32 26, i32 0, metadata !29, null}
!34 = metadata !{i32 27, i32 0, metadata !29, null}
