; ModuleID = 'strlen.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i32 @strlen(i8* %str) nounwind readonly {
entry:
  %0 = load i8* %str, align 1, !dbg !0            ; <i8> [#uses=1]
  %1 = icmp eq i8 %0, 0, !dbg !0                  ; <i1> [#uses=1]
  br i1 %1, label %bb2, label %bb, !dbg !0

bb:                                               ; preds = %entry, %bb
  %indvar = phi i32 [ %tmp, %bb ], [ 0, %entry ]  ; <i32> [#uses=1]
  %tmp = add i32 %indvar, 1                       ; <i32> [#uses=2]
  %scevgep = getelementptr i8* %str, i32 %tmp     ; <i8*> [#uses=2]
  %2 = load i8* %scevgep, align 1, !dbg !0        ; <i8> [#uses=1]
  %3 = icmp eq i8 %2, 0, !dbg !0                  ; <i1> [#uses=1]
  br i1 %3, label %bb2, label %bb, !dbg !0

bb2:                                              ; preds = %bb, %entry
  %s.0.lcssa = phi i8* [ %str, %entry ], [ %scevgep, %bb ] ; <i8*> [#uses=1]
  %4 = ptrtoint i8* %s.0.lcssa to i32, !dbg !12   ; <i32> [#uses=1]
  %5 = ptrtoint i8* %str to i32, !dbg !12         ; <i32> [#uses=1]
  %6 = sub nsw i32 %4, %5, !dbg !12               ; <i32> [#uses=1]
  ret i32 %6, !dbg !12
}

!0 = metadata !{i32 14, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 12, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strlen", metadata !"strlen", metadata !"strlen", metadata !3, i32 12, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"strlen.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !9}
!6 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !7, i32 29, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 458769, i32 0, i32 1, metadata !"xlocale.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!8 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !11} ; [ DW_TAG_const_type ]
!11 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!12 = metadata !{i32 16, i32 0, metadata !1, null}