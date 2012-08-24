; ModuleID = 'strtoul.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i32 @strtoul(i8* %nptr, i8** %endptr, i32 %base) nounwind {
entry:
  %0 = tail call i16** @__ctype_b_loc() nounwind readnone, !dbg !0 ; <i16**> [#uses=1]
  %1 = load i16** %0, align 4, !dbg !0            ; <i16*> [#uses=1]
  br label %bb, !dbg !13

bb:                                               ; preds = %bb, %entry
  %indvar48 = phi i32 [ %tmp, %bb ], [ 0, %entry ] ; <i32> [#uses=4]
  %s.0 = getelementptr i8* %nptr, i32 %indvar48   ; <i8*> [#uses=1]
  %tmp = add i32 %indvar48, 1                     ; <i32> [#uses=2]
  %scevgep = getelementptr i8* %nptr, i32 %tmp    ; <i8*> [#uses=3]
  %2 = load i8* %s.0, align 1, !dbg !14           ; <i8> [#uses=3]
  %3 = zext i8 %2 to i32, !dbg !0                 ; <i32> [#uses=1]
  %4 = getelementptr inbounds i16* %1, i32 %3, !dbg !0 ; <i16*> [#uses=1]
  %5 = load i16* %4, align 2, !dbg !0             ; <i16> [#uses=1]
  %6 = zext i16 %5 to i32, !dbg !0                ; <i32> [#uses=1]
  %7 = and i32 %6, 8192, !dbg !0                  ; <i32> [#uses=1]
  %8 = icmp eq i32 %7, 0, !dbg !0                 ; <i1> [#uses=1]
  br i1 %8, label %bb1, label %bb, !dbg !0

bb1:                                              ; preds = %bb
  switch i8 %2, label %bb5 [
    i8 45, label %bb2
    i8 43, label %bb4
  ]

bb2:                                              ; preds = %bb1
  %9 = load i8* %scevgep, align 1, !dbg !15       ; <i8> [#uses=1]
  %s.0.sum50 = add i32 %indvar48, 2               ; <i32> [#uses=1]
  %10 = getelementptr inbounds i8* %nptr, i32 %s.0.sum50, !dbg !15 ; <i8*> [#uses=1]
  br label %bb5, !dbg !15

bb4:                                              ; preds = %bb1
  %11 = load i8* %scevgep, align 1, !dbg !16      ; <i8> [#uses=1]
  %s.0.sum = add i32 %indvar48, 2                 ; <i32> [#uses=1]
  %12 = getelementptr inbounds i8* %nptr, i32 %s.0.sum, !dbg !16 ; <i8*> [#uses=1]
  br label %bb5, !dbg !16

bb5:                                              ; preds = %bb1, %bb4, %bb2
  %s.1 = phi i8* [ %10, %bb2 ], [ %12, %bb4 ], [ %scevgep, %bb1 ] ; <i8*> [#uses=6]
  %c.0 = phi i8 [ %9, %bb2 ], [ %11, %bb4 ], [ %2, %bb1 ] ; <i8> [#uses=4]
  %neg.0 = phi i32 [ 1, %bb2 ], [ 0, %bb4 ], [ 0, %bb1 ] ; <i32> [#uses=1]
  switch i32 %base, label %bb16 [
    i32 0, label %bb7
    i32 16, label %bb7
  ]

bb7:                                              ; preds = %bb5, %bb5
  %13 = icmp eq i8 %c.0, 48, !dbg !17             ; <i1> [#uses=2]
  br i1 %13, label %bb8, label %bb11, !dbg !17

bb8:                                              ; preds = %bb7
  %14 = load i8* %s.1, align 1, !dbg !17          ; <i8> [#uses=1]
  switch i8 %14, label %bb11 [
    i8 120, label %bb11.thread
    i8 88, label %bb11.thread
  ]

bb11.thread:                                      ; preds = %bb8, %bb8
  %15 = getelementptr inbounds i8* %s.1, i32 1, !dbg !18 ; <i8*> [#uses=1]
  %16 = load i8* %15, align 1, !dbg !18           ; <i8> [#uses=1]
  %17 = getelementptr inbounds i8* %s.1, i32 2, !dbg !19 ; <i8*> [#uses=1]
  br label %bb16

bb11:                                             ; preds = %bb8, %bb7
  %18 = icmp eq i32 %base, 0, !dbg !20            ; <i1> [#uses=1]
  br i1 %18, label %bb12, label %bb16, !dbg !20

bb12:                                             ; preds = %bb11
  %iftmp.1.0 = select i1 %13, i32 8, i32 10       ; <i32> [#uses=1]
  br label %bb16, !dbg !21

bb16:                                             ; preds = %bb5, %bb11.thread, %bb12, %bb11
  %c.145 = phi i8 [ %c.0, %bb12 ], [ %c.0, %bb11 ], [ %16, %bb11.thread ], [ %c.0, %bb5 ] ; <i8> [#uses=1]
  %s.244 = phi i8* [ %s.1, %bb12 ], [ %s.1, %bb11 ], [ %17, %bb11.thread ], [ %s.1, %bb5 ] ; <i8*> [#uses=2]
  %base_addr.1 = phi i32 [ %iftmp.1.0, %bb12 ], [ %base, %bb11 ], [ 16, %bb11.thread ], [ %base, %bb5 ] ; <i32> [#uses=5]
  %19 = add i32 %base_addr.1, -2                  ; <i32> [#uses=1]
  %20 = icmp ugt i32 %19, 34, !dbg !22            ; <i1> [#uses=1]
  br i1 %20, label %noconv, label %bb17, !dbg !22

bb17:                                             ; preds = %bb16
  %21 = udiv i32 -1, %base_addr.1, !dbg !23       ; <i32> [#uses=2]
  %22 = urem i32 -1, %base_addr.1, !dbg !24       ; <i32> [#uses=1]
  br label %bb18, !dbg !24

bb18:                                             ; preds = %bb31, %bb17
  %indvar = phi i32 [ %indvar.next, %bb31 ], [ 0, %bb17 ] ; <i32> [#uses=2]
  %acc.1 = phi i32 [ %acc.0, %bb31 ], [ 0, %bb17 ] ; <i32> [#uses=8]
  %c.3 = phi i8 [ %39, %bb31 ], [ %c.145, %bb17 ] ; <i8> [#uses=5]
  %any.1 = phi i32 [ %any.0, %bb31 ], [ 0, %bb17 ] ; <i32> [#uses=6]
  %s.3 = getelementptr i8* %s.244, i32 %indvar    ; <i8*> [#uses=4]
  %23 = add i8 %c.3, -48                          ; <i8> [#uses=2]
  %24 = icmp ult i8 %23, 10                       ; <i1> [#uses=1]
  br i1 %24, label %bb24, label %bb20, !dbg !25

bb20:                                             ; preds = %bb18
  %25 = add i8 %c.3, -65                          ; <i8> [#uses=1]
  %26 = icmp ult i8 %25, 26                       ; <i1> [#uses=1]
  br i1 %26, label %bb21, label %bb22, !dbg !26

bb21:                                             ; preds = %bb20
  %27 = add i8 %c.3, -55                          ; <i8> [#uses=1]
  br label %bb24, !dbg !27

bb22:                                             ; preds = %bb20
  %28 = add i8 %c.3, -97                          ; <i8> [#uses=1]
  %29 = icmp ult i8 %28, 26                       ; <i1> [#uses=1]
  br i1 %29, label %bb23, label %bb32, !dbg !28

bb23:                                             ; preds = %bb22
  %30 = add i8 %c.3, -87                          ; <i8> [#uses=1]
  br label %bb24, !dbg !29

bb24:                                             ; preds = %bb18, %bb23, %bb21
  %c.2 = phi i8 [ %27, %bb21 ], [ %30, %bb23 ], [ %23, %bb18 ] ; <i8> [#uses=1]
  %31 = sext i8 %c.2 to i32, !dbg !30             ; <i32> [#uses=3]
  %32 = icmp slt i32 %31, %base_addr.1, !dbg !30  ; <i1> [#uses=1]
  br i1 %32, label %bb25, label %bb32, !dbg !30

bb25:                                             ; preds = %bb24
  %33 = icmp slt i32 %any.1, 0, !dbg !31          ; <i1> [#uses=1]
  %34 = icmp ugt i32 %acc.1, %21, !dbg !31        ; <i1> [#uses=1]
  %or.cond = or i1 %33, %34                       ; <i1> [#uses=1]
  br i1 %or.cond, label %bb31, label %bb27, !dbg !31

bb27:                                             ; preds = %bb25
  %35 = icmp eq i32 %acc.1, %21, !dbg !31         ; <i1> [#uses=1]
  %36 = icmp sgt i32 %31, %22, !dbg !31           ; <i1> [#uses=1]
  %or.cond51 = and i1 %35, %36                    ; <i1> [#uses=1]
  br i1 %or.cond51, label %bb31, label %bb30, !dbg !31

bb30:                                             ; preds = %bb27
  %37 = mul i32 %acc.1, %base_addr.1, !dbg !32    ; <i32> [#uses=1]
  %38 = add i32 %31, %37, !dbg !33                ; <i32> [#uses=1]
  br label %bb31, !dbg !33

bb31:                                             ; preds = %bb27, %bb25, %bb30
  %acc.0 = phi i32 [ %38, %bb30 ], [ %acc.1, %bb25 ], [ %acc.1, %bb27 ] ; <i32> [#uses=1]
  %any.0 = phi i32 [ 1, %bb30 ], [ -1, %bb25 ], [ -1, %bb27 ] ; <i32> [#uses=1]
  %39 = load i8* %s.3, align 1, !dbg !34          ; <i8> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb18, !dbg !34

bb32:                                             ; preds = %bb24, %bb22
  %40 = icmp slt i32 %any.1, 0, !dbg !35          ; <i1> [#uses=1]
  br i1 %40, label %bb33, label %bb34, !dbg !35

bb33:                                             ; preds = %bb32
  %41 = tail call i32* @__errno_location() nounwind readnone, !dbg !36 ; <i32*> [#uses=1]
  store i32 34, i32* %41, align 4, !dbg !36
  br label %bb37, !dbg !36

bb34:                                             ; preds = %bb32
  %42 = icmp eq i32 %any.1, 0, !dbg !37           ; <i1> [#uses=1]
  br i1 %42, label %noconv, label %bb35, !dbg !37

noconv:                                           ; preds = %bb34, %bb16
  %s.4 = phi i8* [ %s.244, %bb16 ], [ %s.3, %bb34 ] ; <i8*> [#uses=1]
  %acc.2 = phi i32 [ 0, %bb16 ], [ %acc.1, %bb34 ] ; <i32> [#uses=1]
  %any.2 = phi i32 [ 0, %bb16 ], [ %any.1, %bb34 ] ; <i32> [#uses=1]
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !38 ; <i32*> [#uses=1]
  store i32 22, i32* %43, align 4, !dbg !38
  br label %bb37, !dbg !38

bb35:                                             ; preds = %bb34
  %44 = sub i32 0, %acc.1, !dbg !39               ; <i32> [#uses=1]
  %45 = icmp eq i32 %neg.0, 0, !dbg !40           ; <i1> [#uses=1]
  %acc.1. = select i1 %45, i32 %acc.1, i32 %44    ; <i32> [#uses=1]
  br label %bb37, !dbg !40

bb37:                                             ; preds = %bb35, %noconv, %bb33
  %s.5 = phi i8* [ %s.4, %noconv ], [ %s.3, %bb33 ], [ %s.3, %bb35 ] ; <i8*> [#uses=1]
  %acc.3 = phi i32 [ %acc.2, %noconv ], [ -1, %bb33 ], [ %acc.1., %bb35 ] ; <i32> [#uses=2]
  %any.3 = phi i32 [ %any.2, %noconv ], [ %any.1, %bb33 ], [ %any.1, %bb35 ] ; <i32> [#uses=1]
  %46 = icmp eq i8** %endptr, null, !dbg !41      ; <i1> [#uses=1]
  br i1 %46, label %bb42, label %bb38, !dbg !41

bb38:                                             ; preds = %bb37
  %47 = icmp eq i32 %any.3, 0, !dbg !42           ; <i1> [#uses=1]
  br i1 %47, label %bb41, label %bb39, !dbg !42

bb39:                                             ; preds = %bb38
  %48 = getelementptr inbounds i8* %s.5, i32 -1, !dbg !42 ; <i8*> [#uses=1]
  br label %bb41, !dbg !42

bb41:                                             ; preds = %bb38, %bb39
  %iftmp.12.0 = phi i8* [ %48, %bb39 ], [ %nptr, %bb38 ] ; <i8*> [#uses=1]
  store i8* %iftmp.12.0, i8** %endptr, align 4, !dbg !42
  ret i32 %acc.3, !dbg !43

bb42:                                             ; preds = %bb37
  ret i32 %acc.3, !dbg !43
}

declare i16** @__ctype_b_loc() nounwind readnone

declare i32* @__errno_location() nounwind readnone

!0 = metadata !{i32 60, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 47, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strtoul", metadata !"strtoul", metadata !"strtoul", metadata !3, i32 47, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"strtoul.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !10, metadata !12}
!6 = metadata !{i32 458788, metadata !3, metadata !"long unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ]
!9 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 57, i32 0, metadata !1, null}
!14 = metadata !{i32 59, i32 0, metadata !1, null}
!15 = metadata !{i32 63, i32 0, metadata !1, null}
!16 = metadata !{i32 67, i32 0, metadata !1, null}
!17 = metadata !{i32 69, i32 0, metadata !1, null}
!18 = metadata !{i32 71, i32 0, metadata !1, null}
!19 = metadata !{i32 72, i32 0, metadata !1, null}
!20 = metadata !{i32 75, i32 0, metadata !1, null}
!21 = metadata !{i32 76, i32 0, metadata !1, null}
!22 = metadata !{i32 78, i32 0, metadata !1, null}
!23 = metadata !{i32 81, i32 0, metadata !1, null}
!24 = metadata !{i32 82, i32 0, metadata !1, null}
!25 = metadata !{i32 84, i32 0, metadata !1, null}
!26 = metadata !{i32 86, i32 0, metadata !1, null}
!27 = metadata !{i32 87, i32 0, metadata !1, null}
!28 = metadata !{i32 88, i32 0, metadata !1, null}
!29 = metadata !{i32 89, i32 0, metadata !1, null}
!30 = metadata !{i32 92, i32 0, metadata !1, null}
!31 = metadata !{i32 94, i32 0, metadata !1, null}
!32 = metadata !{i32 98, i32 0, metadata !1, null}
!33 = metadata !{i32 99, i32 0, metadata !1, null}
!34 = metadata !{i32 83, i32 0, metadata !1, null}
!35 = metadata !{i32 102, i32 0, metadata !1, null}
!36 = metadata !{i32 104, i32 0, metadata !1, null}
!37 = metadata !{i32 105, i32 0, metadata !1, null}
!38 = metadata !{i32 107, i32 0, metadata !1, null}
!39 = metadata !{i32 109, i32 0, metadata !1, null}
!40 = metadata !{i32 108, i32 0, metadata !1, null}
!41 = metadata !{i32 110, i32 0, metadata !1, null}
!42 = metadata !{i32 111, i32 0, metadata !1, null}
!43 = metadata !{i32 112, i32 0, metadata !1, null}
