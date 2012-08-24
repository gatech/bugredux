; ModuleID = 'memmove.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i8* @memmove(i8* %dst, i8* %src, i32 %count) nounwind {
entry:
  %0 = icmp eq i8* %src, %dst, !dbg !0            ; <i1> [#uses=1]
  br i1 %0, label %bb8, label %bb1, !dbg !0

bb1:                                              ; preds = %entry
  %1 = icmp ugt i8* %src, %dst, !dbg !10          ; <i1> [#uses=1]
  %2 = icmp eq i32 %count, 0                      ; <i1> [#uses=2]
  br i1 %1, label %bb3.preheader, label %bb4, !dbg !10

bb3.preheader:                                    ; preds = %bb1
  br i1 %2, label %bb8, label %bb2, !dbg !11

bb2:                                              ; preds = %bb3.preheader, %bb2
  %indvar17 = phi i32 [ %indvar.next18, %bb2 ], [ 0, %bb3.preheader ] ; <i32> [#uses=3]
  %b.014 = getelementptr i8* %src, i32 %indvar17  ; <i8*> [#uses=1]
  %a.013 = getelementptr i8* %dst, i32 %indvar17  ; <i8*> [#uses=1]
  %3 = load i8* %b.014, align 1, !dbg !11         ; <i8> [#uses=1]
  store i8 %3, i8* %a.013, align 1, !dbg !11
  %indvar.next18 = add i32 %indvar17, 1           ; <i32> [#uses=2]
  %exitcond19 = icmp eq i32 %indvar.next18, %count ; <i1> [#uses=1]
  br i1 %exitcond19, label %bb8, label %bb2, !dbg !11

bb4:                                              ; preds = %bb1
  br i1 %2, label %bb8, label %bb.nph, !dbg !12

bb.nph:                                           ; preds = %bb4
  %4 = add i32 %count, -1                         ; <i32> [#uses=1]
  br label %bb5

bb5:                                              ; preds = %bb.nph, %bb5
  %indvar = phi i32 [ 0, %bb.nph ], [ %indvar.next, %bb5 ] ; <i32> [#uses=2]
  %tmp16 = sub i32 %4, %indvar                    ; <i32> [#uses=2]
  %b.112 = getelementptr i8* %src, i32 %tmp16     ; <i8*> [#uses=1]
  %a.111 = getelementptr i8* %dst, i32 %tmp16     ; <i8*> [#uses=1]
  %5 = load i8* %b.112, align 1, !dbg !12         ; <i8> [#uses=1]
  store i8 %5, i8* %a.111, align 1, !dbg !12
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %indvar.next, %count    ; <i1> [#uses=1]
  br i1 %exitcond, label %bb8, label %bb5, !dbg !12

bb8:                                              ; preds = %bb3.preheader, %bb2, %bb4, %bb5, %entry
  ret i8* %dst, !dbg !13
}

!0 = metadata !{i32 16, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 12, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"memmove", metadata !"memmove", metadata !"memmove", metadata !3, i32 12, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"memmove.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6, metadata !6, metadata !7}
!6 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !8, i32 326, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_typedef ]
!8 = metadata !{i32 458769, i32 0, i32 1, metadata !"stddef.h", metadata !"/usr/lib/llvm/gcc-4.2/lib/gcc/i486-linux-gnu/4.2.1/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!9 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 19, i32 0, metadata !1, null}
!11 = metadata !{i32 20, i32 0, metadata !1, null}
!12 = metadata !{i32 24, i32 0, metadata !1, null}
!13 = metadata !{i32 27, i32 0, metadata !1, null}
