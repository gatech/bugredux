; ModuleID = 'strrchr.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i8* @strrchr(i8* %t, i32 %c) nounwind readonly {
entry:
  %0 = trunc i32 %c to i8, !dbg !0                ; <i8> [#uses=2]
  %1 = load i8* %t, align 1, !dbg !11             ; <i8> [#uses=2]
  %2 = icmp eq i8 %1, %0, !dbg !11                ; <i1> [#uses=1]
  %l.06 = select i1 %2, i8* %t, i8* null          ; <i8*> [#uses=2]
  %3 = icmp eq i8 %1, 0, !dbg !11                 ; <i1> [#uses=1]
  br i1 %3, label %bb3, label %bb4, !dbg !11

bb3:                                              ; preds = %bb4, %entry
  %l.0.lcssa = phi i8* [ %l.06, %entry ], [ %l.0, %bb4 ] ; <i8*> [#uses=1]
  ret i8* %l.0.lcssa, !dbg !11

bb4:                                              ; preds = %entry, %bb4
  %indvar = phi i32 [ %tmp, %bb4 ], [ 0, %entry ] ; <i32> [#uses=1]
  %l.08 = phi i8* [ %l.0, %bb4 ], [ %l.06, %entry ] ; <i8*> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr i8* %t, i32 %tmp       ; <i8*> [#uses=2]
  %4 = load i8* %scevgep, align 1, !dbg !11       ; <i8> [#uses=2]
  %5 = icmp eq i8 %4, %0, !dbg !11                ; <i1> [#uses=1]
  %l.0 = select i1 %5, i8* %scevgep, i8* %l.08    ; <i8*> [#uses=2]
  %6 = icmp eq i8 %4, 0, !dbg !11                 ; <i1> [#uses=1]
  br i1 %6, label %bb3, label %bb4, !dbg !11
}

!0 = metadata !{i32 16, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 12, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strrchr", metadata !"strrchr", metadata !"strrchr", metadata !3, i32 12, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"strrchr.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !8, metadata !10}
!6 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!9 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !7} ; [ DW_TAG_const_type ]
!10 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 18, i32 0, metadata !1, null}
