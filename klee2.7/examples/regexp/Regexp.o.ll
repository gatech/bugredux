; ModuleID = 'Regexp.o'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-pc-linux-gnu"

@.str = private constant [3 x i8] c"re\00", align 1 ; <[3 x i8]*> [#uses=1]
@.str1 = private constant [6 x i8] c"hello\00", align 1 ; <[6 x i8]*> [#uses=1]

define internal i32 @matchstar(i32 %c, i8* %re, i8* %text) nounwind {
entry:
  %c_addr = alloca i32                            ; <i32*> [#uses=3]
  %re_addr = alloca i8*                           ; <i8**> [#uses=2]
  %text_addr = alloca i8*                         ; <i8**> [#uses=6]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata !{i32* %c_addr}, metadata !0), !dbg !8
  store i32 %c, i32* %c_addr
  call void @llvm.dbg.declare(metadata !{i8** %re_addr}, metadata !9), !dbg !8
  store i8* %re, i8** %re_addr
  call void @llvm.dbg.declare(metadata !{i8** %text_addr}, metadata !10), !dbg !8
  store i8* %text, i8** %text_addr
  br label %bb, !dbg !8

bb:                                               ; preds = %bb4, %bb3, %entry
  %1 = load i8** %re_addr, align 4, !dbg !11      ; <i8*> [#uses=1]
  %2 = load i8** %text_addr, align 4, !dbg !11    ; <i8*> [#uses=1]
  %3 = call i32 @matchhere(i8* %1, i8* %2) nounwind, !dbg !11 ; <i32> [#uses=1]
  %4 = icmp ne i32 %3, 0, !dbg !11                ; <i1> [#uses=1]
  br i1 %4, label %bb1, label %bb2, !dbg !11

bb1:                                              ; preds = %bb
  store i32 1, i32* %0, align 4, !dbg !13
  br label %bb6, !dbg !13

bb2:                                              ; preds = %bb
  %5 = load i8** %text_addr, align 4, !dbg !14    ; <i8*> [#uses=1]
  %6 = load i8* %5, align 1, !dbg !14             ; <i8> [#uses=1]
  %7 = icmp eq i8 %6, 0, !dbg !14                 ; <i1> [#uses=1]
  br i1 %7, label %bb5, label %bb3, !dbg !14

bb3:                                              ; preds = %bb2
  %8 = load i8** %text_addr, align 4, !dbg !14    ; <i8*> [#uses=1]
  %9 = load i8* %8, align 1, !dbg !14             ; <i8> [#uses=1]
  %10 = sext i8 %9 to i32, !dbg !14               ; <i32> [#uses=1]
  %11 = load i32* %c_addr, align 4, !dbg !14      ; <i32> [#uses=1]
  %12 = icmp eq i32 %10, %11, !dbg !14            ; <i1> [#uses=1]
  %13 = zext i1 %12 to i8, !dbg !14               ; <i8> [#uses=1]
  %14 = load i8** %text_addr, align 4, !dbg !14   ; <i8*> [#uses=1]
  %15 = getelementptr inbounds i8* %14, i64 1, !dbg !14 ; <i8*> [#uses=1]
  store i8* %15, i8** %text_addr, align 4, !dbg !14
  %toBool = icmp ne i8 %13, 0, !dbg !14           ; <i1> [#uses=1]
  br i1 %toBool, label %bb, label %bb4, !dbg !14

bb4:                                              ; preds = %bb3
  %16 = load i32* %c_addr, align 4, !dbg !14      ; <i32> [#uses=1]
  %17 = icmp eq i32 %16, 46, !dbg !14             ; <i1> [#uses=1]
  br i1 %17, label %bb, label %bb5, !dbg !14

bb5:                                              ; preds = %bb4, %bb2
  store i32 0, i32* %0, align 4, !dbg !15
  br label %bb6, !dbg !15

bb6:                                              ; preds = %bb5, %bb1
  %18 = load i32* %0, align 4, !dbg !15           ; <i32> [#uses=1]
  store i32 %18, i32* %retval, align 4, !dbg !15
  br label %return, !dbg !15

return:                                           ; preds = %bb6
  %retval7 = load i32* %retval, !dbg !15          ; <i32> [#uses=1]
  ret i32 %retval7, !dbg !15
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal i32 @matchhere(i8* %re, i8* %text) nounwind {
entry:
  %re_addr = alloca i8*                           ; <i8**> [#uses=10]
  %text_addr = alloca i8*                         ; <i8**> [#uses=6]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=6]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata !{i8** %re_addr}, metadata !16), !dbg !20
  store i8* %re, i8** %re_addr
  call void @llvm.dbg.declare(metadata !{i8** %text_addr}, metadata !21), !dbg !20
  store i8* %text, i8** %text_addr
  %1 = load i8** %re_addr, align 4, !dbg !22      ; <i8*> [#uses=1]
  %2 = getelementptr inbounds i8* %1, i32 0, !dbg !22 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !22             ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !22                 ; <i1> [#uses=1]
  br i1 %4, label %bb, label %bb1, !dbg !22

bb:                                               ; preds = %entry
  store i32 0, i32* %0, align 4, !dbg !24
  br label %bb11, !dbg !24

bb1:                                              ; preds = %entry
  %5 = load i8** %re_addr, align 4, !dbg !25      ; <i8*> [#uses=1]
  %6 = getelementptr inbounds i8* %5, i32 1, !dbg !25 ; <i8*> [#uses=1]
  %7 = load i8* %6, align 1, !dbg !25             ; <i8> [#uses=1]
  %8 = icmp eq i8 %7, 42, !dbg !25                ; <i1> [#uses=1]
  br i1 %8, label %bb2, label %bb3, !dbg !25

bb2:                                              ; preds = %bb1
  %9 = load i8** %re_addr, align 4, !dbg !26      ; <i8*> [#uses=1]
  %10 = getelementptr inbounds i8* %9, i32 2, !dbg !26 ; <i8*> [#uses=1]
  %11 = load i8** %re_addr, align 4, !dbg !26     ; <i8*> [#uses=1]
  %12 = getelementptr inbounds i8* %11, i32 0, !dbg !26 ; <i8*> [#uses=1]
  %13 = load i8* %12, align 1, !dbg !26           ; <i8> [#uses=1]
  %14 = sext i8 %13 to i32, !dbg !26              ; <i32> [#uses=1]
  %15 = load i8** %text_addr, align 4, !dbg !26   ; <i8*> [#uses=1]
  %16 = call i32 @matchstar(i32 %14, i8* %10, i8* %15) nounwind, !dbg !26 ; <i32> [#uses=1]
  store i32 %16, i32* %0, align 4, !dbg !26
  br label %bb11, !dbg !26

bb3:                                              ; preds = %bb1
  %17 = load i8** %re_addr, align 4, !dbg !27     ; <i8*> [#uses=1]
  %18 = getelementptr inbounds i8* %17, i32 0, !dbg !27 ; <i8*> [#uses=1]
  %19 = load i8* %18, align 1, !dbg !27           ; <i8> [#uses=1]
  %20 = icmp eq i8 %19, 36, !dbg !27              ; <i1> [#uses=1]
  br i1 %20, label %bb4, label %bb6, !dbg !27

bb4:                                              ; preds = %bb3
  %21 = load i8** %re_addr, align 4, !dbg !27     ; <i8*> [#uses=1]
  %22 = getelementptr inbounds i8* %21, i32 1, !dbg !27 ; <i8*> [#uses=1]
  %23 = load i8* %22, align 1, !dbg !27           ; <i8> [#uses=1]
  %24 = icmp eq i8 %23, 0, !dbg !27               ; <i1> [#uses=1]
  br i1 %24, label %bb5, label %bb6, !dbg !27

bb5:                                              ; preds = %bb4
  %25 = load i8** %text_addr, align 4, !dbg !28   ; <i8*> [#uses=1]
  %26 = load i8* %25, align 1, !dbg !28           ; <i8> [#uses=1]
  %27 = icmp eq i8 %26, 0, !dbg !28               ; <i1> [#uses=1]
  %28 = zext i1 %27 to i32, !dbg !28              ; <i32> [#uses=1]
  store i32 %28, i32* %0, align 4, !dbg !28
  br label %bb11, !dbg !28

bb6:                                              ; preds = %bb4, %bb3
  %29 = load i8** %text_addr, align 4, !dbg !29   ; <i8*> [#uses=1]
  %30 = load i8* %29, align 1, !dbg !29           ; <i8> [#uses=1]
  %31 = icmp ne i8 %30, 0, !dbg !29               ; <i1> [#uses=1]
  br i1 %31, label %bb7, label %bb10, !dbg !29

bb7:                                              ; preds = %bb6
  %32 = load i8** %re_addr, align 4, !dbg !29     ; <i8*> [#uses=1]
  %33 = getelementptr inbounds i8* %32, i32 0, !dbg !29 ; <i8*> [#uses=1]
  %34 = load i8* %33, align 1, !dbg !29           ; <i8> [#uses=1]
  %35 = icmp eq i8 %34, 46, !dbg !29              ; <i1> [#uses=1]
  br i1 %35, label %bb9, label %bb8, !dbg !29

bb8:                                              ; preds = %bb7
  %36 = load i8** %re_addr, align 4, !dbg !29     ; <i8*> [#uses=1]
  %37 = getelementptr inbounds i8* %36, i32 0, !dbg !29 ; <i8*> [#uses=1]
  %38 = load i8* %37, align 1, !dbg !29           ; <i8> [#uses=1]
  %39 = load i8** %text_addr, align 4, !dbg !29   ; <i8*> [#uses=1]
  %40 = load i8* %39, align 1, !dbg !29           ; <i8> [#uses=1]
  %41 = icmp eq i8 %38, %40, !dbg !29             ; <i1> [#uses=1]
  br i1 %41, label %bb9, label %bb10, !dbg !29

bb9:                                              ; preds = %bb8, %bb7
  %42 = load i8** %text_addr, align 4, !dbg !30   ; <i8*> [#uses=1]
  %43 = getelementptr inbounds i8* %42, i32 1, !dbg !30 ; <i8*> [#uses=1]
  %44 = load i8** %re_addr, align 4, !dbg !30     ; <i8*> [#uses=1]
  %45 = getelementptr inbounds i8* %44, i32 1, !dbg !30 ; <i8*> [#uses=1]
  %46 = call i32 @matchhere(i8* %45, i8* %43) nounwind, !dbg !30 ; <i32> [#uses=1]
  store i32 %46, i32* %0, align 4, !dbg !30
  br label %bb11, !dbg !30

bb10:                                             ; preds = %bb8, %bb6
  store i32 0, i32* %0, align 4, !dbg !31
  br label %bb11, !dbg !31

bb11:                                             ; preds = %bb10, %bb9, %bb5, %bb2, %bb
  %47 = load i32* %0, align 4, !dbg !31           ; <i32> [#uses=1]
  store i32 %47, i32* %retval, align 4, !dbg !31
  br label %return, !dbg !31

return:                                           ; preds = %bb11
  %retval12 = load i32* %retval, !dbg !31         ; <i32> [#uses=1]
  ret i32 %retval12, !dbg !31
}

define i32 @match(i8* %re, i8* %text) nounwind {
entry:
  %re_addr = alloca i8*                           ; <i8**> [#uses=4]
  %text_addr = alloca i8*                         ; <i8**> [#uses=6]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=4]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata !{i8** %re_addr}, metadata !32), !dbg !34
  store i8* %re, i8** %re_addr
  call void @llvm.dbg.declare(metadata !{i8** %text_addr}, metadata !35), !dbg !34
  store i8* %text, i8** %text_addr
  %1 = load i8** %re_addr, align 4, !dbg !36      ; <i8*> [#uses=1]
  %2 = getelementptr inbounds i8* %1, i32 0, !dbg !36 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !36             ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 94, !dbg !36                ; <i1> [#uses=1]
  br i1 %4, label %bb, label %bb1, !dbg !36

bb:                                               ; preds = %entry
  %5 = load i8** %re_addr, align 4, !dbg !38      ; <i8*> [#uses=1]
  %6 = getelementptr inbounds i8* %5, i32 1, !dbg !38 ; <i8*> [#uses=1]
  %7 = load i8** %text_addr, align 4, !dbg !38    ; <i8*> [#uses=1]
  %8 = call i32 @matchhere(i8* %6, i8* %7) nounwind, !dbg !38 ; <i32> [#uses=1]
  store i32 %8, i32* %0, align 4, !dbg !38
  br label %bb5, !dbg !38

bb1:                                              ; preds = %bb3, %entry
  %9 = load i8** %re_addr, align 4, !dbg !39      ; <i8*> [#uses=1]
  %10 = load i8** %text_addr, align 4, !dbg !39   ; <i8*> [#uses=1]
  %11 = call i32 @matchhere(i8* %9, i8* %10) nounwind, !dbg !39 ; <i32> [#uses=1]
  %12 = icmp ne i32 %11, 0, !dbg !39              ; <i1> [#uses=1]
  br i1 %12, label %bb2, label %bb3, !dbg !39

bb2:                                              ; preds = %bb1
  store i32 1, i32* %0, align 4, !dbg !40
  br label %bb5, !dbg !40

bb3:                                              ; preds = %bb1
  %13 = load i8** %text_addr, align 4, !dbg !41   ; <i8*> [#uses=1]
  %14 = load i8* %13, align 1, !dbg !41           ; <i8> [#uses=1]
  %15 = icmp ne i8 %14, 0, !dbg !41               ; <i1> [#uses=1]
  %16 = zext i1 %15 to i8, !dbg !41               ; <i8> [#uses=1]
  %17 = load i8** %text_addr, align 4, !dbg !41   ; <i8*> [#uses=1]
  %18 = getelementptr inbounds i8* %17, i64 1, !dbg !41 ; <i8*> [#uses=1]
  store i8* %18, i8** %text_addr, align 4, !dbg !41
  %toBool = icmp ne i8 %16, 0, !dbg !41           ; <i1> [#uses=1]
  br i1 %toBool, label %bb1, label %bb4, !dbg !41

bb4:                                              ; preds = %bb3
  store i32 0, i32* %0, align 4, !dbg !42
  br label %bb5, !dbg !42

bb5:                                              ; preds = %bb4, %bb2, %bb
  %19 = load i32* %0, align 4, !dbg !42           ; <i32> [#uses=1]
  store i32 %19, i32* %retval, align 4, !dbg !42
  br label %return, !dbg !42

return:                                           ; preds = %bb5
  %retval6 = load i32* %retval, !dbg !42          ; <i32> [#uses=1]
  ret i32 %retval6, !dbg !42
}

define i32 @main() nounwind {
entry:
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %re = alloca [7 x i8]                           ; <[7 x i8]*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @llvm.dbg.declare(metadata !{[7 x i8]* %re}, metadata !43), !dbg !51
  %re1 = bitcast [7 x i8]* %re to i8*, !dbg !52   ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %re1, i32 7, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !52
  %re2 = bitcast [7 x i8]* %re to i8*, !dbg !53   ; <i8*> [#uses=1]
  %1 = call i32 @match(i8* %re2, i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !53 ; <i32> [#uses=0]
  store i32 0, i32* %0, align 4, !dbg !54
  %2 = load i32* %0, align 4, !dbg !54            ; <i32> [#uses=1]
  store i32 %2, i32* %retval, align 4, !dbg !54
  br label %return, !dbg !54

return:                                           ; preds = %entry
  %retval3 = load i32* %retval, !dbg !54          ; <i32> [#uses=1]
  ret i32 %retval3, !dbg !54
}

declare void @klee_make_symbolic(i8*, i32, i8*)

!0 = metadata !{i32 459009, metadata !1, metadata !"c", metadata !2, i32 14, metadata !5} ; [ DW_TAG_arg_variable ]
!1 = metadata !{i32 458798, i32 0, metadata !2, metadata !"matchstar", metadata !"matchstar", metadata !"matchstar", metadata !2, i32 14, metadata !3, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!2 = metadata !{i32 458769, i32 0, i32 1, metadata !"Regexp.c", metadata !"/home/wei/Documents/code/klee2.7/klee/examples/regexp/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2.7)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5, metadata !6, metadata !6}
!5 = metadata !{i32 458788, metadata !2, metadata !"int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !7} ; [ DW_TAG_pointer_type ]
!7 = metadata !{i32 458788, metadata !2, metadata !"char", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!8 = metadata !{i32 14, i32 0, metadata !1, null}
!9 = metadata !{i32 459009, metadata !1, metadata !"re", metadata !2, i32 14, metadata !6} ; [ DW_TAG_arg_variable ]
!10 = metadata !{i32 459009, metadata !1, metadata !"text", metadata !2, i32 14, metadata !6} ; [ DW_TAG_arg_variable ]
!11 = metadata !{i32 16, i32 0, metadata !12, null}
!12 = metadata !{i32 458763, metadata !1, i32 14, i32 0} ; [ DW_TAG_lexical_block ]
!13 = metadata !{i32 17, i32 0, metadata !12, null}
!14 = metadata !{i32 18, i32 0, metadata !12, null}
!15 = metadata !{i32 19, i32 0, metadata !12, null}
!16 = metadata !{i32 459009, metadata !17, metadata !"re", metadata !2, i32 22, metadata !6} ; [ DW_TAG_arg_variable ]
!17 = metadata !{i32 458798, i32 0, metadata !2, metadata !"matchhere", metadata !"matchhere", metadata !"matchhere", metadata !2, i32 22, metadata !18, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !5, metadata !6, metadata !6}
!20 = metadata !{i32 22, i32 0, metadata !17, null}
!21 = metadata !{i32 459009, metadata !17, metadata !"text", metadata !2, i32 22, metadata !6} ; [ DW_TAG_arg_variable ]
!22 = metadata !{i32 23, i32 0, metadata !23, null}
!23 = metadata !{i32 458763, metadata !17, i32 22, i32 0} ; [ DW_TAG_lexical_block ]
!24 = metadata !{i32 24, i32 0, metadata !23, null}
!25 = metadata !{i32 25, i32 0, metadata !23, null}
!26 = metadata !{i32 26, i32 0, metadata !23, null}
!27 = metadata !{i32 27, i32 0, metadata !23, null}
!28 = metadata !{i32 28, i32 0, metadata !23, null}
!29 = metadata !{i32 29, i32 0, metadata !23, null}
!30 = metadata !{i32 30, i32 0, metadata !23, null}
!31 = metadata !{i32 31, i32 0, metadata !23, null}
!32 = metadata !{i32 459009, metadata !33, metadata !"re", metadata !2, i32 34, metadata !6} ; [ DW_TAG_arg_variable ]
!33 = metadata !{i32 458798, i32 0, metadata !2, metadata !"match", metadata !"match", metadata !"match", metadata !2, i32 34, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!34 = metadata !{i32 34, i32 0, metadata !33, null}
!35 = metadata !{i32 459009, metadata !33, metadata !"text", metadata !2, i32 34, metadata !6} ; [ DW_TAG_arg_variable ]
!36 = metadata !{i32 35, i32 0, metadata !37, null}
!37 = metadata !{i32 458763, metadata !33, i32 34, i32 0} ; [ DW_TAG_lexical_block ]
!38 = metadata !{i32 36, i32 0, metadata !37, null}
!39 = metadata !{i32 38, i32 0, metadata !37, null}
!40 = metadata !{i32 39, i32 0, metadata !37, null}
!41 = metadata !{i32 40, i32 0, metadata !37, null}
!42 = metadata !{i32 41, i32 0, metadata !37, null}
!43 = metadata !{i32 459008, metadata !44, metadata !"re", metadata !2, i32 53, metadata !48} ; [ DW_TAG_auto_variable ]
!44 = metadata !{i32 458763, metadata !45, i32 51, i32 0} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 458798, i32 0, metadata !2, metadata !"main", metadata !"main", metadata !"main", metadata !2, i32 51, metadata !46, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!46 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, null} ; [ DW_TAG_subroutine_type ]
!47 = metadata !{metadata !5}
!48 = metadata !{i32 458753, metadata !2, metadata !"", metadata !2, i32 0, i64 56, i64 8, i64 0, i32 0, metadata !7, metadata !49, i32 0, null} ; [ DW_TAG_array_type ]
!49 = metadata !{metadata !50}
!50 = metadata !{i32 458785, i64 0, i64 6}        ; [ DW_TAG_subrange_type ]
!51 = metadata !{i32 51, i32 0, metadata !44, null}
!52 = metadata !{i32 56, i32 0, metadata !44, null}
!53 = metadata !{i32 59, i32 0, metadata !44, null}
!54 = metadata !{i32 61, i32 0, metadata !44, null}
