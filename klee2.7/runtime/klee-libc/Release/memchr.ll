; ModuleID = 'memchr.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i8* @memchr(i8* %s, i32 %c, i32 %n) nounwind readonly {
entry:
  %0 = icmp eq i32 %n, 0, !dbg !0                 ; <i1> [#uses=1]
  br i1 %0, label %bb5, label %bb1.preheader, !dbg !0

bb1.preheader:                                    ; preds = %entry
  %tmp7 = add i32 %n, -1                          ; <i32> [#uses=1]
  br label %bb1

bb1:                                              ; preds = %bb1.preheader, %bb3
  %indvar = phi i32 [ 0, %bb1.preheader ], [ %indvar.next, %bb3 ] ; <i32> [#uses=3]
  %p.0 = getelementptr i8* %s, i32 %indvar        ; <i8*> [#uses=2]
  %1 = load i8* %p.0, align 1, !dbg !11           ; <i8> [#uses=1]
  %2 = zext i8 %1 to i32, !dbg !11                ; <i32> [#uses=1]
  %3 = icmp eq i32 %2, %c, !dbg !11               ; <i1> [#uses=1]
  br i1 %3, label %bb5, label %bb3, !dbg !11

bb3:                                              ; preds = %bb1
  %4 = icmp eq i32 %tmp7, %indvar                 ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %4, label %bb5, label %bb1, !dbg !13

bb5:                                              ; preds = %bb3, %bb1, %entry
  %.0 = phi i8* [ null, %entry ], [ null, %bb3 ], [ %p.0, %bb1 ] ; <i8*> [#uses=1]
  ret i8* %.0, !dbg !14
}

!0 = metadata !{i32 45, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 44, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"memchr", metadata !"memchr", metadata !"memchr", metadata !3, i32 44, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"memchr.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6, metadata !7, metadata !8}
!6 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !9, i32 29, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!9 = metadata !{i32 458769, i32 0, i32 1, metadata !"xlocale.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!10 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 49, i32 0, metadata !12, null}
!12 = metadata !{i32 458763, metadata !1, i32 44, i32 0} ; [ DW_TAG_lexical_block ]
!13 = metadata !{i32 51, i32 0, metadata !12, null}
!14 = metadata !{i32 53, i32 0, metadata !12, null}
