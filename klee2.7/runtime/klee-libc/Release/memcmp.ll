; ModuleID = 'memcmp.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i32 @memcmp(i8* nocapture %s1, i8* nocapture %s2, i32 %n) nounwind readonly {
entry:
  %0 = icmp eq i32 %n, 0, !dbg !0                 ; <i1> [#uses=1]
  br i1 %0, label %bb5, label %bb1.preheader, !dbg !0

bb1.preheader:                                    ; preds = %entry
  %tmp11 = add i32 %n, -1                         ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb1.preheader, %bb3
  %indvar = phi i32 [ 0, %bb1.preheader ], [ %indvar.next, %bb3 ] ; <i32> [#uses=4]
  %p1.0 = getelementptr i8* %s1, i32 %indvar      ; <i8*> [#uses=1]
  %p2.0 = getelementptr i8* %s2, i32 %indvar      ; <i8*> [#uses=1]
  %1 = load i8* %p1.0, align 1, !dbg !11          ; <i8> [#uses=2]
  %2 = load i8* %p2.0, align 1, !dbg !11          ; <i8> [#uses=2]
  %3 = icmp eq i8 %1, %2, !dbg !11                ; <i1> [#uses=1]
  br i1 %3, label %bb3, label %bb2, !dbg !11

bb2:                                              ; preds = %bb1
  %4 = zext i8 %1 to i32, !dbg !13                ; <i32> [#uses=1]
  %5 = zext i8 %2 to i32, !dbg !13                ; <i32> [#uses=1]
  %6 = sub nsw i32 %4, %5, !dbg !13               ; <i32> [#uses=1]
  ret i32 %6, !dbg !14

bb3:                                              ; preds = %bb1
  %7 = icmp eq i32 %tmp11, %indvar                ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %7, label %bb5, label %bb1, !dbg !15

bb5:                                              ; preds = %bb3, %entry
  ret i32 0, !dbg !14
}

!0 = metadata !{i32 43, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 42, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"memcmp", metadata !"memcmp", metadata !"memcmp", metadata !3, i32 42, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"memcmp.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !7, metadata !8}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !9, i32 29, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!9 = metadata !{i32 458769, i32 0, i32 1, metadata !"xlocale.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!10 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 47, i32 0, metadata !12, null}
!12 = metadata !{i32 458763, metadata !1, i32 42, i32 0} ; [ DW_TAG_lexical_block ]
!13 = metadata !{i32 48, i32 0, metadata !12, null}
!14 = metadata !{i32 52, i32 0, metadata !12, null}
!15 = metadata !{i32 50, i32 0, metadata !12, null}
