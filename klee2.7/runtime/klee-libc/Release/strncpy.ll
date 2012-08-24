; ModuleID = 'strncpy.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i8* @strncpy(i8* %dst, i8* nocapture %src, i32 %n) nounwind {
entry:
  %0 = icmp eq i32 %n, 0, !dbg !0                 ; <i1> [#uses=1]
  br i1 %0, label %bb5, label %bb1.preheader, !dbg !0

bb1.preheader:                                    ; preds = %entry
  %tmp21 = add i32 %n, -1                         ; <i32> [#uses=2]
  br label %bb1

bb1:                                              ; preds = %bb1.preheader, %bb4
  %1 = phi i32 [ 0, %bb1.preheader ], [ %indvar.next12, %bb4 ] ; <i32> [#uses=7]
  %d.0 = getelementptr i8* %dst, i32 %1           ; <i8*> [#uses=1]
  %s.0 = getelementptr i8* %src, i32 %1           ; <i8*> [#uses=1]
  %2 = load i8* %s.0, align 1, !dbg !13           ; <i8> [#uses=2]
  store i8 %2, i8* %d.0, align 1, !dbg !13
  %3 = icmp eq i8 %2, 0, !dbg !13                 ; <i1> [#uses=1]
  br i1 %3, label %bb3.preheader, label %bb4, !dbg !13

bb3.preheader:                                    ; preds = %bb1
  %n_addr.1 = sub i32 %n, %1                      ; <i32> [#uses=1]
  %4 = icmp eq i32 %n_addr.1, 1                   ; <i1> [#uses=1]
  br i1 %4, label %bb5, label %bb.nph, !dbg !15

bb.nph:                                           ; preds = %bb3.preheader
  %tmp14 = sub i32 %tmp21, %1                     ; <i32> [#uses=1]
  %tmp15 = add i32 %1, 1                          ; <i32> [#uses=1]
  br label %bb2

bb2:                                              ; preds = %bb.nph, %bb2
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb2 ] ; <i32> [#uses=2]
  %tmp16 = add i32 %tmp15, %indvar                ; <i32> [#uses=1]
  %d.18 = getelementptr i8* %dst, i32 %tmp16      ; <i8*> [#uses=1]
  store i8 0, i8* %d.18, align 1, !dbg !16
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %tmp14    ; <i1> [#uses=1]
  br i1 %exitcond, label %bb5, label %bb2, !dbg !15

bb4:                                              ; preds = %bb1
  %5 = icmp eq i32 %tmp21, %1                     ; <i1> [#uses=1]
  %indvar.next12 = add i32 %1, 1                  ; <i32> [#uses=1]
  br i1 %5, label %bb5, label %bb1, !dbg !17

bb5:                                              ; preds = %bb4, %bb3.preheader, %bb2, %entry
  ret i8* %dst, !dbg !18
}

!0 = metadata !{i32 44, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 43, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strncpy", metadata !"strncpy", metadata !"strncpy", metadata !3, i32 43, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"strncpy.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6, metadata !8, metadata !10}
!6 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!9 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !7} ; [ DW_TAG_const_type ]
!10 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !11, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !12} ; [ DW_TAG_typedef ]
!11 = metadata !{i32 458769, i32 0, i32 1, metadata !"stddef.h", metadata !"/usr/lib/llvm/gcc-4.2/lib/gcc/i486-linux-gnu/4.2.1/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!12 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 49, i32 0, metadata !14, null}
!14 = metadata !{i32 458763, metadata !1, i32 43, i32 0} ; [ DW_TAG_lexical_block ]
!15 = metadata !{i32 51, i32 0, metadata !14, null}
!16 = metadata !{i32 52, i32 0, metadata !14, null}
!17 = metadata !{i32 55, i32 0, metadata !14, null}
!18 = metadata !{i32 57, i32 0, metadata !1, null}
