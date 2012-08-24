; ModuleID = 'memset.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i8* @memset(i8* %dst, i32 %s, i32 %count) nounwind {
entry:
  %0 = icmp eq i32 %count, 0                      ; <i1> [#uses=1]
  br i1 %0, label %bb2, label %bb.nph, !dbg !0

bb.nph:                                           ; preds = %entry
  %1 = trunc i32 %s to i8, !dbg !11               ; <i8> [#uses=1]
  br label %bb

bb:                                               ; preds = %bb.nph, %bb
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb ] ; <i32> [#uses=2]
  %a.04 = getelementptr i8* %dst, i32 %indvar     ; <i8*> [#uses=1]
  store i8 %1, i8* %a.04, align 1, !dbg !11
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %count    ; <i1> [#uses=1]
  br i1 %exitcond, label %bb2, label %bb, !dbg !0

bb2:                                              ; preds = %bb, %entry
  ret i8* %dst, !dbg !12
}

!0 = metadata !{i32 14, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 12, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"memset", metadata !"memset", metadata !"memset", metadata !3, i32 12, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"memset.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6, metadata !7, metadata !8}
!6 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !9, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!9 = metadata !{i32 458769, i32 0, i32 1, metadata !"stddef.h", metadata !"/usr/lib/llvm/gcc-4.2/lib/gcc/i486-linux-gnu/4.2.1/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!10 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 15, i32 0, metadata !1, null}
!12 = metadata !{i32 16, i32 0, metadata !1, null}
