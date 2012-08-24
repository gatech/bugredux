; ModuleID = 'strchr.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i8* @strchr(i8* %p, i32 %ch) nounwind readonly {
entry:
  %0 = trunc i32 %ch to i8, !dbg !0               ; <i8> [#uses=1]
  br label %bb, !dbg !0

bb:                                               ; preds = %bb4, %entry
  %indvar = phi i32 [ %indvar.next, %bb4 ], [ 0, %entry ] ; <i32> [#uses=2]
  %p_addr.0 = getelementptr i8* %p, i32 %indvar   ; <i8*> [#uses=2]
  %1 = load i8* %p_addr.0, align 1, !dbg !11      ; <i8> [#uses=2]
  %2 = icmp eq i8 %1, %0, !dbg !11                ; <i1> [#uses=1]
  br i1 %2, label %bb5, label %bb2, !dbg !11

bb2:                                              ; preds = %bb
  %3 = icmp eq i8 %1, 0, !dbg !12                 ; <i1> [#uses=1]
  br i1 %3, label %bb5, label %bb4, !dbg !12

bb4:                                              ; preds = %bb2
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb, !dbg !13

bb5:                                              ; preds = %bb2, %bb
  %.0 = phi i8* [ %p_addr.0, %bb ], [ null, %bb2 ] ; <i8*> [#uses=1]
  ret i8* %.0, !dbg !13
}

!0 = metadata !{i32 13, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 10, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strchr", metadata !"strchr", metadata !"strchr", metadata !3, i32 10, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"strchr.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !8, metadata !10}
!6 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!9 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !7} ; [ DW_TAG_const_type ]
!10 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 15, i32 0, metadata !1, null}
!12 = metadata !{i32 17, i32 0, metadata !1, null}
!13 = metadata !{i32 14, i32 0, metadata !1, null}
