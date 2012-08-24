; ModuleID = 'islower.o'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

@.str = private constant [6 x i8] c"input\00", align 1 ; <[6 x i8]*> [#uses=1]

define i32 @testa(i32 %x) nounwind {
entry:
  %x_addr = alloca i32                            ; <i32*> [#uses=3]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %x, i32* %x_addr
  %1 = load i32* %x_addr, align 4, !dbg !0        ; <i32> [#uses=1]
  %2 = icmp sle i32 %1, 96, !dbg !0               ; <i1> [#uses=1]
  br i1 %2, label %bb2, label %bb, !dbg !0

bb:                                               ; preds = %entry
  %3 = load i32* %x_addr, align 4, !dbg !0        ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 105, !dbg !0              ; <i1> [#uses=1]
  br i1 %4, label %bb2, label %bb1, !dbg !0

bb1:                                              ; preds = %bb
  store i32 1, i32* %0, align 4, !dbg !7
  br label %bb3, !dbg !7

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %0, align 4, !dbg !8
  br label %bb3, !dbg !8

bb3:                                              ; preds = %bb2, %bb1
  %5 = load i32* %0, align 4, !dbg !8             ; <i32> [#uses=1]
  store i32 %5, i32* %retval, align 4, !dbg !8
  %retval4 = load i32* %retval, !dbg !8           ; <i32> [#uses=1]
  ret i32 %retval4, !dbg !8
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define i32 @my_islower(i32 %x) nounwind {
entry:
  %x_addr = alloca i32                            ; <i32*> [#uses=4]
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=3]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  store i32 %x, i32* %x_addr
  %1 = load i32* %x_addr, align 4, !dbg !9        ; <i32> [#uses=1]
  %2 = icmp sle i32 %1, 96, !dbg !9               ; <i1> [#uses=1]
  br i1 %2, label %bb2, label %bb, !dbg !9

bb:                                               ; preds = %entry
  %3 = load i32* %x_addr, align 4, !dbg !9        ; <i32> [#uses=1]
  %4 = icmp sgt i32 %3, 122, !dbg !9              ; <i1> [#uses=1]
  br i1 %4, label %bb2, label %bb1, !dbg !9

bb1:                                              ; preds = %bb
  %5 = load i32* %x_addr, align 4, !dbg !12       ; <i32> [#uses=1]
  %6 = call i32 @testa(i32 %5) nounwind, !dbg !12 ; <i32> [#uses=1]
  store i32 %6, i32* %0, align 4, !dbg !12
  br label %bb3, !dbg !12

bb2:                                              ; preds = %bb, %entry
  store i32 0, i32* %0, align 4, !dbg !13
  br label %bb3, !dbg !13

bb3:                                              ; preds = %bb2, %bb1
  %7 = load i32* %0, align 4, !dbg !13            ; <i32> [#uses=1]
  store i32 %7, i32* %retval, align 4, !dbg !13
  %retval4 = load i32* %retval, !dbg !13          ; <i32> [#uses=1]
  ret i32 %retval4, !dbg !13
}

define i32 @main() nounwind {
entry:
  %retval = alloca i32                            ; <i32*> [#uses=2]
  %0 = alloca i32                                 ; <i32*> [#uses=2]
  %c = alloca i8                                  ; <i8*> [#uses=2]
  %"alloca point" = bitcast i32 0 to i32          ; <i32> [#uses=0]
  call void @klee_make_symbolic(i8* %c, i32 1, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !14
  %1 = load i8* %c, align 1, !dbg !19             ; <i8> [#uses=1]
  %2 = sext i8 %1 to i32, !dbg !19                ; <i32> [#uses=1]
  %3 = call i32 @my_islower(i32 %2) nounwind, !dbg !19 ; <i32> [#uses=1]
  store i32 %3, i32* %0, align 4, !dbg !19
  %4 = load i32* %0, align 4, !dbg !19            ; <i32> [#uses=1]
  store i32 %4, i32* %retval, align 4, !dbg !19
  %retval1 = load i32* %retval, !dbg !19          ; <i32> [#uses=1]
  ret i32 %retval1, !dbg !19
}

declare void @klee_make_symbolic(i8*, i32, i8*)

!0 = metadata !{i32 8, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 7, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"testa", metadata !"testa", metadata !"testa", metadata !3, i32 7, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"islower.c", metadata !"/home/wei/Documents/code/klee2.7/klee/examples/islower/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 false, metadata !"", i32 0} ; [ DW_TAG_comp
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 9, i32 0, metadata !1, null}
!8 = metadata !{i32 11, i32 0, metadata !1, null}
!9 = metadata !{i32 15, i32 0, metadata !10, null}
!10 = metadata !{i32 458763, metadata !11, i32 14, i32 0} ; [ DW_TAG_lexical_block ]
!11 = metadata !{i32 458798, i32 0, metadata !3, metadata !"my_islower", metadata !"my_islower", metadata !"my_islower", metadata !3, i32 14, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 16, i32 0, metadata !10, null}
!13 = metadata !{i32 17, i32 0, metadata !10, null}
!14 = metadata !{i32 22, i32 0, metadata !15, null}
!15 = metadata !{i32 458763, metadata !16, i32 20, i32 0} ; [ DW_TAG_lexical_block ]
!16 = metadata !{i32 458798, i32 0, metadata !3, metadata !"main", metadata !"main", metadata !"main", metadata !3, i32 20, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!17 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, null} ; [ DW_TAG_subroutine_type ]
!18 = metadata !{metadata !6}
!19 = metadata !{i32 23, i32 0, metadata !15, null}
