; ModuleID = 'strcmp.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i32 @strcmp(i8* nocapture %a, i8* nocapture %b) nounwind readonly {
entry:
  br label %bb1, !dbg !0

bb:                                               ; preds = %bb1
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb1, !dbg !9

bb1:                                              ; preds = %bb, %entry
  %indvar = phi i32 [ %indvar.next, %bb ], [ 0, %entry ] ; <i32> [#uses=3]
  %b_addr.0 = getelementptr i8* %b, i32 %indvar   ; <i8*> [#uses=1]
  %a_addr.0 = getelementptr i8* %a, i32 %indvar   ; <i8*> [#uses=1]
  %0 = load i8* %a_addr.0, align 1, !dbg !11      ; <i8> [#uses=3]
  %1 = icmp eq i8 %0, 0, !dbg !11                 ; <i1> [#uses=1]
  %.pre = load i8* %b_addr.0, align 1             ; <i8> [#uses=2]
  %.not = xor i1 %1, true                         ; <i1> [#uses=1]
  %2 = icmp eq i8 %0, %.pre, !dbg !11             ; <i1> [#uses=1]
  %or.cond = and i1 %.not, %2                     ; <i1> [#uses=1]
  br i1 %or.cond, label %bb, label %bb3, !dbg !11

bb3:                                              ; preds = %bb1
  %3 = sext i8 %0 to i32, !dbg !12                ; <i32> [#uses=1]
  %4 = sext i8 %.pre to i32, !dbg !12             ; <i32> [#uses=1]
  %5 = sub nsw i32 %3, %4, !dbg !12               ; <i32> [#uses=1]
  ret i32 %5, !dbg !12
}

!0 = metadata !{i32 10, i32 0, metadata !1, null}
!1 = metadata !{i32 458798, i32 0, metadata !2, metadata !"strcmp", metadata !"strcmp", metadata !"strcmp", metadata !2, i32 10, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!2 = metadata !{i32 458769, i32 0, i32 1, metadata !"strcmp.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !6, metadata !6}
!5 = metadata !{i32 458788, metadata !2, metadata !"int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458790, metadata !2, metadata !"", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !8} ; [ DW_TAG_const_type ]
!8 = metadata !{i32 458788, metadata !2, metadata !"char", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 12, i32 0, metadata !10, null}
!10 = metadata !{i32 458763, metadata !1, i32 10, i32 0} ; [ DW_TAG_lexical_block ]
!11 = metadata !{i32 11, i32 0, metadata !10, null}
!12 = metadata !{i32 13, i32 0, metadata !10, null}
