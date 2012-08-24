; ModuleID = 'strtol.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i32 @strtol(i8* %nptr, i8** %endptr, i32 %base) nounwind {
entry:
  %0 = tail call i16** @__ctype_b_loc() nounwind readnone, !dbg !0 ; <i16**> [#uses=1]
  %1 = load i16** %0, align 4, !dbg !0            ; <i16*> [#uses=1]
  br label %bb, !dbg !13

bb:                                               ; preds = %bb, %entry
  %indvar54 = phi i32 [ %tmp, %bb ], [ 0, %entry ] ; <i32> [#uses=4]
  %s.0 = getelementptr i8* %nptr, i32 %indvar54   ; <i8*> [#uses=1]
  %tmp = add i32 %indvar54, 1                     ; <i32> [#uses=2]
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
  %s.0.sum56 = add i32 %indvar54, 2               ; <i32> [#uses=1]
  %10 = getelementptr inbounds i8* %nptr, i32 %s.0.sum56, !dbg !15 ; <i8*> [#uses=1]
  br label %bb5, !dbg !15

bb4:                                              ; preds = %bb1
  %11 = load i8* %scevgep, align 1, !dbg !16      ; <i8> [#uses=1]
  %s.0.sum = add i32 %indvar54, 2                 ; <i32> [#uses=1]
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
  %c.151 = phi i8 [ %c.0, %bb12 ], [ %c.0, %bb11 ], [ %16, %bb11.thread ], [ %c.0, %bb5 ] ; <i8> [#uses=1]
  %s.250 = phi i8* [ %s.1, %bb12 ], [ %s.1, %bb11 ], [ %17, %bb11.thread ], [ %s.1, %bb5 ] ; <i8*> [#uses=2]
  %base_addr.1 = phi i32 [ %iftmp.1.0, %bb12 ], [ %base, %bb11 ], [ 16, %bb11.thread ], [ %base, %bb5 ] ; <i32> [#uses=5]
  %19 = add i32 %base_addr.1, -2                  ; <i32> [#uses=1]
  %20 = icmp ugt i32 %19, 34, !dbg !22            ; <i1> [#uses=1]
  br i1 %20, label %noconv, label %bb17, !dbg !22

bb17:                                             ; preds = %bb16
  %21 = icmp eq i32 %neg.0, 0, !dbg !23           ; <i1> [#uses=2]
  %iftmp.3.0 = select i1 %21, i32 2147483647, i32 -2147483648 ; <i32> [#uses=3]
  %22 = urem i32 %iftmp.3.0, %base_addr.1, !dbg !24 ; <i32> [#uses=1]
  %23 = udiv i32 %iftmp.3.0, %base_addr.1, !dbg !25 ; <i32> [#uses=2]
  br label %bb21, !dbg !25

bb21:                                             ; preds = %bb34, %bb17
  %indvar = phi i32 [ %indvar.next, %bb34 ], [ 0, %bb17 ] ; <i32> [#uses=2]
  %acc.1 = phi i32 [ %acc.0, %bb34 ], [ 0, %bb17 ] ; <i32> [#uses=8]
  %c.3 = phi i8 [ %40, %bb34 ], [ %c.151, %bb17 ] ; <i8> [#uses=5]
  %any.1 = phi i32 [ %any.0, %bb34 ], [ 0, %bb17 ] ; <i32> [#uses=6]
  %s.3 = getelementptr i8* %s.250, i32 %indvar    ; <i8*> [#uses=4]
  %24 = add i8 %c.3, -48                          ; <i8> [#uses=2]
  %25 = icmp ult i8 %24, 10                       ; <i1> [#uses=1]
  br i1 %25, label %bb27, label %bb23, !dbg !26

bb23:                                             ; preds = %bb21
  %26 = add i8 %c.3, -65                          ; <i8> [#uses=1]
  %27 = icmp ult i8 %26, 26                       ; <i1> [#uses=1]
  br i1 %27, label %bb24, label %bb25, !dbg !27

bb24:                                             ; preds = %bb23
  %28 = add i8 %c.3, -55                          ; <i8> [#uses=1]
  br label %bb27, !dbg !28

bb25:                                             ; preds = %bb23
  %29 = add i8 %c.3, -97                          ; <i8> [#uses=1]
  %30 = icmp ult i8 %29, 26                       ; <i1> [#uses=1]
  br i1 %30, label %bb26, label %bb35, !dbg !29

bb26:                                             ; preds = %bb25
  %31 = add i8 %c.3, -87                          ; <i8> [#uses=1]
  br label %bb27, !dbg !30

bb27:                                             ; preds = %bb21, %bb26, %bb24
  %c.2 = phi i8 [ %28, %bb24 ], [ %31, %bb26 ], [ %24, %bb21 ] ; <i8> [#uses=1]
  %32 = sext i8 %c.2 to i32, !dbg !31             ; <i32> [#uses=3]
  %33 = icmp slt i32 %32, %base_addr.1, !dbg !31  ; <i1> [#uses=1]
  br i1 %33, label %bb28, label %bb35, !dbg !31

bb28:                                             ; preds = %bb27
  %34 = icmp slt i32 %any.1, 0, !dbg !32          ; <i1> [#uses=1]
  %35 = icmp ugt i32 %acc.1, %23, !dbg !32        ; <i1> [#uses=1]
  %or.cond = or i1 %34, %35                       ; <i1> [#uses=1]
  br i1 %or.cond, label %bb34, label %bb30, !dbg !32

bb30:                                             ; preds = %bb28
  %36 = icmp eq i32 %acc.1, %23, !dbg !32         ; <i1> [#uses=1]
  %37 = icmp sgt i32 %32, %22, !dbg !32           ; <i1> [#uses=1]
  %or.cond57 = and i1 %36, %37                    ; <i1> [#uses=1]
  br i1 %or.cond57, label %bb34, label %bb33, !dbg !32

bb33:                                             ; preds = %bb30
  %38 = mul i32 %acc.1, %base_addr.1, !dbg !33    ; <i32> [#uses=1]
  %39 = add i32 %32, %38, !dbg !34                ; <i32> [#uses=1]
  br label %bb34, !dbg !34

bb34:                                             ; preds = %bb30, %bb28, %bb33
  %acc.0 = phi i32 [ %39, %bb33 ], [ %acc.1, %bb28 ], [ %acc.1, %bb30 ] ; <i32> [#uses=1]
  %any.0 = phi i32 [ 1, %bb33 ], [ -1, %bb28 ], [ -1, %bb30 ] ; <i32> [#uses=1]
  %40 = load i8* %s.3, align 1, !dbg !35          ; <i8> [#uses=1]
  %indvar.next = add i32 %indvar, 1               ; <i32> [#uses=1]
  br label %bb21, !dbg !35

bb35:                                             ; preds = %bb27, %bb25
  %41 = icmp slt i32 %any.1, 0, !dbg !36          ; <i1> [#uses=1]
  br i1 %41, label %bb36, label %bb40, !dbg !36

bb36:                                             ; preds = %bb35
  %42 = tail call i32* @__errno_location() nounwind readnone, !dbg !37 ; <i32*> [#uses=1]
  store i32 34, i32* %42, align 4, !dbg !37
  br label %bb43, !dbg !37

bb40:                                             ; preds = %bb35
  %43 = icmp eq i32 %any.1, 0, !dbg !38           ; <i1> [#uses=1]
  br i1 %43, label %noconv, label %bb41, !dbg !38

noconv:                                           ; preds = %bb40, %bb16
  %acc.2 = phi i32 [ 0, %bb16 ], [ %acc.1, %bb40 ] ; <i32> [#uses=1]
  %s.4 = phi i8* [ %s.250, %bb16 ], [ %s.3, %bb40 ] ; <i8*> [#uses=1]
  %any.2 = phi i32 [ 0, %bb16 ], [ %any.1, %bb40 ] ; <i32> [#uses=1]
  %44 = tail call i32* @__errno_location() nounwind readnone, !dbg !39 ; <i32*> [#uses=1]
  store i32 22, i32* %44, align 4, !dbg !39
  br label %bb43, !dbg !39

bb41:                                             ; preds = %bb40
  %45 = sub i32 0, %acc.1, !dbg !40               ; <i32> [#uses=1]
  %acc.1. = select i1 %21, i32 %acc.1, i32 %45    ; <i32> [#uses=1]
  br label %bb43, !dbg !41

bb43:                                             ; preds = %bb41, %noconv, %bb36
  %acc.3 = phi i32 [ %acc.2, %noconv ], [ %iftmp.3.0, %bb36 ], [ %acc.1., %bb41 ] ; <i32> [#uses=2]
  %s.5 = phi i8* [ %s.4, %noconv ], [ %s.3, %bb36 ], [ %s.3, %bb41 ] ; <i8*> [#uses=1]
  %any.3 = phi i32 [ %any.2, %noconv ], [ %any.1, %bb36 ], [ %any.1, %bb41 ] ; <i32> [#uses=1]
  %46 = icmp eq i8** %endptr, null, !dbg !42      ; <i1> [#uses=1]
  br i1 %46, label %bb48, label %bb44, !dbg !42

bb44:                                             ; preds = %bb43
  %47 = icmp eq i32 %any.3, 0, !dbg !43           ; <i1> [#uses=1]
  br i1 %47, label %bb47, label %bb45, !dbg !43

bb45:                                             ; preds = %bb44
  %48 = getelementptr inbounds i8* %s.5, i32 -1, !dbg !43 ; <i8*> [#uses=1]
  br label %bb47, !dbg !43

bb47:                                             ; preds = %bb44, %bb45
  %iftmp.14.0 = phi i8* [ %48, %bb45 ], [ %nptr, %bb44 ] ; <i8*> [#uses=1]
  store i8* %iftmp.14.0, i8** %endptr, align 4, !dbg !43
  ret i32 %acc.3, !dbg !44

bb48:                                             ; preds = %bb43
  ret i32 %acc.3, !dbg !44
}

declare i16** @__ctype_b_loc() nounwind readnone

declare i32* @__errno_location() nounwind readnone

!0 = metadata !{i32 63, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 48, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strtol", metadata !"strtol", metadata !"strtol", metadata !3, i32 48, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"strtol.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !10, metadata !12}
!6 = metadata !{i32 458788, metadata !3, metadata !"long int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ]
!9 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ]
!11 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!13 = metadata !{i32 60, i32 0, metadata !1, null}
!14 = metadata !{i32 62, i32 0, metadata !1, null}
!15 = metadata !{i32 66, i32 0, metadata !1, null}
!16 = metadata !{i32 70, i32 0, metadata !1, null}
!17 = metadata !{i32 72, i32 0, metadata !1, null}
!18 = metadata !{i32 74, i32 0, metadata !1, null}
!19 = metadata !{i32 75, i32 0, metadata !1, null}
!20 = metadata !{i32 78, i32 0, metadata !1, null}
!21 = metadata !{i32 79, i32 0, metadata !1, null}
!22 = metadata !{i32 81, i32 0, metadata !1, null}
!23 = metadata !{i32 101, i32 0, metadata !1, null}
!24 = metadata !{i32 103, i32 0, metadata !1, null}
!25 = metadata !{i32 104, i32 0, metadata !1, null}
!26 = metadata !{i32 106, i32 0, metadata !1, null}
!27 = metadata !{i32 108, i32 0, metadata !1, null}
!28 = metadata !{i32 109, i32 0, metadata !1, null}
!29 = metadata !{i32 110, i32 0, metadata !1, null}
!30 = metadata !{i32 111, i32 0, metadata !1, null}
!31 = metadata !{i32 114, i32 0, metadata !1, null}
!32 = metadata !{i32 116, i32 0, metadata !1, null}
!33 = metadata !{i32 120, i32 0, metadata !1, null}
!34 = metadata !{i32 121, i32 0, metadata !1, null}
!35 = metadata !{i32 105, i32 0, metadata !1, null}
!36 = metadata !{i32 124, i32 0, metadata !1, null}
!37 = metadata !{i32 126, i32 0, metadata !1, null}
!38 = metadata !{i32 127, i32 0, metadata !1, null}
!39 = metadata !{i32 129, i32 0, metadata !1, null}
!40 = metadata !{i32 131, i32 0, metadata !1, null}
!41 = metadata !{i32 130, i32 0, metadata !1, null}
!42 = metadata !{i32 132, i32 0, metadata !1, null}
!43 = metadata !{i32 133, i32 0, metadata !1, null}
!44 = metadata !{i32 134, i32 0, metadata !1, null}
