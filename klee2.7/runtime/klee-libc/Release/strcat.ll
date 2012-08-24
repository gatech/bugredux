; ModuleID = 'strcat.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i8* @strcat(i8* %s, i8* nocapture %append) nounwind {
entry:
  %0 = load i8* %s, align 1, !dbg !0              ; <i8> [#uses=1]
  %1 = icmp eq i8 %0, 0, !dbg !0                  ; <i1> [#uses=1]
  br i1 %1, label %bb2.preheader, label %bb, !dbg !0

bb:                                               ; preds = %entry, %bb
  %indvar6 = phi i32 [ %tmp, %bb ], [ 0, %entry ] ; <i32> [#uses=1]
  %tmp = add i32 %indvar6, 1                      ; <i32> [#uses=2]
  %scevgep = getelementptr i8* %s, i32 %tmp       ; <i8*> [#uses=2]
  %2 = load i8* %scevgep, align 1, !dbg !0        ; <i8> [#uses=1]
  %3 = icmp eq i8 %2, 0, !dbg !0                  ; <i1> [#uses=1]
  br i1 %3, label %bb2.preheader, label %bb, !dbg !0

bb2.preheader:                                    ; preds = %bb, %entry
  %s_addr.0.lcssa = phi i8* [ %s, %entry ], [ %scevgep, %bb ] ; <i8*> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb2.preheader, %bb2
  %indvar = phi i32 [ 0, %bb2.preheader ], [ %indvar.next, %bb2 ] ; <i32> [#uses=3]
  %append_addr.0 = getelementptr i8* %append, i32 %indvar ; <i8*> [#uses=1]
  %s_addr.1 = getelementptr i8* %s_addr.0.lcssa, i32 %indvar ; <i8*> [#uses=1]
  %4 = load i8* %append_addr.0, align 1, !dbg !10 ; <i8> [#uses=2]
  store i8 %4, i8* %s_addr.1, align 1, !dbg !10
  %5 = icmp eq i8 %4, 0, !dbg !10                 ; <i1> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br i1 %5, label %bb3, label %bb2, !dbg !10

bb3:                                              ; preds = %bb2
  ret i8* %s, !dbg !11
}

!0 = metadata !{i32 42, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 39, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strcat", metadata !"strcat", metadata !"strcat", metadata !3, i32 39, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"strcat.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6, metadata !8}
!6 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!9 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !7} ; [ DW_TAG_const_type ]
!10 = metadata !{i32 44, i32 0, metadata !1, null}
!11 = metadata !{i32 46, i32 0, metadata !1, null}
