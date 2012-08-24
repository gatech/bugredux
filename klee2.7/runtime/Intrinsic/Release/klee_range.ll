; ModuleID = 'klee_range.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

@.str = private constant [13 x i8] c"klee_range.c\00", align 1 ; <[13 x i8]*> [#uses=1]
@.str1 = private constant [14 x i8] c"invalid range\00", align 1 ; <[14 x i8]*> [#uses=1]
@.str2 = private constant [5 x i8] c"user\00", align 1 ; <[5 x i8]*> [#uses=1]

define i32 @klee_range(i32 %start, i32 %end, i8* %name) nounwind {
entry:
  %x = alloca i32, align 4                        ; <i32*> [#uses=4]
  %0 = icmp slt i32 %start, %end, !dbg !0         ; <i1> [#uses=1]
  br i1 %0, label %bb1, label %bb, !dbg !0

bb:                                               ; preds = %entry
  call void @klee_report_error(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 17, i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0)) noreturn nounwind, !dbg !10
  unreachable, !dbg !10

bb1:                                              ; preds = %entry
  %1 = add nsw i32 %start, 1, !dbg !11            ; <i32> [#uses=1]
  %2 = icmp eq i32 %1, %end, !dbg !11             ; <i1> [#uses=1]
  br i1 %2, label %bb8, label %bb3, !dbg !11

bb3:                                              ; preds = %bb1
  %x4 = bitcast i32* %x to i8*, !dbg !12          ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %x4, i32 4, i8* %name) nounwind, !dbg !12
  %3 = icmp eq i32 %start, 0, !dbg !13            ; <i1> [#uses=1]
  %4 = load i32* %x, align 4, !dbg !14            ; <i32> [#uses=2]
  br i1 %3, label %bb5, label %bb6, !dbg !13

bb5:                                              ; preds = %bb3
  %5 = icmp ult i32 %4, %end, !dbg !14            ; <i1> [#uses=1]
  %6 = zext i1 %5 to i32, !dbg !14                ; <i32> [#uses=1]
  call void @klee_assume(i32 %6) nounwind, !dbg !14
  br label %bb7, !dbg !14

bb6:                                              ; preds = %bb3
  %7 = icmp sge i32 %4, %start, !dbg !15          ; <i1> [#uses=1]
  %8 = zext i1 %7 to i32, !dbg !15                ; <i32> [#uses=1]
  call void @klee_assume(i32 %8) nounwind, !dbg !15
  %9 = load i32* %x, align 4, !dbg !16            ; <i32> [#uses=1]
  %10 = icmp slt i32 %9, %end, !dbg !16           ; <i1> [#uses=1]
  %11 = zext i1 %10 to i32, !dbg !16              ; <i32> [#uses=1]
  call void @klee_assume(i32 %11) nounwind, !dbg !16
  br label %bb7, !dbg !16

bb7:                                              ; preds = %bb6, %bb5
  %12 = load i32* %x, align 4, !dbg !17           ; <i32> [#uses=1]
  ret i32 %12, !dbg !17

bb8:                                              ; preds = %bb1
  ret i32 %start, !dbg !17
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @klee_make_symbolic(i8*, i32, i8*)

declare void @klee_assume(i32)

!0 = metadata !{i32 16, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 13, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"klee_range", metadata !"klee_range", metadata !"klee_range", metadata !3, i32 13, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"klee_range.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6, metadata !6, metadata !7}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ]
!9 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 17, i32 0, metadata !1, null}
!11 = metadata !{i32 19, i32 0, metadata !1, null}
!12 = metadata !{i32 22, i32 0, metadata !1, null}
!13 = metadata !{i32 25, i32 0, metadata !1, null}
!14 = metadata !{i32 26, i32 0, metadata !1, null}
!15 = metadata !{i32 28, i32 0, metadata !1, null}
!16 = metadata !{i32 29, i32 0, metadata !1, null}
!17 = metadata !{i32 32, i32 0, metadata !1, null}
