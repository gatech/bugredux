; ModuleID = 'klee-choose.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

@.str = private constant [12 x i8] c"klee_choose\00", align 1 ; <[12 x i8]*> [#uses=1]

define i32 @klee_choose(i32 %n) nounwind {
entry:
  %x = alloca i32, align 4                        ; <i32*> [#uses=2]
  %x1 = bitcast i32* %x to i8*, !dbg !0           ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %x1, i32 4, i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !0
  %0 = load i32* %x, align 4, !dbg !9             ; <i32> [#uses=2]
  %1 = icmp ult i32 %0, %n, !dbg !9               ; <i1> [#uses=1]
  br i1 %1, label %bb2, label %bb, !dbg !9

bb:                                               ; preds = %entry
  call void @klee_silent_exit(i32 0) noreturn nounwind, !dbg !10
  unreachable, !dbg !10

bb2:                                              ; preds = %entry
  ret i32 %0, !dbg !11
}

declare void @klee_make_symbolic(i8*, i32, i8*)

declare void @klee_silent_exit(i32) noreturn

!0 = metadata !{i32 14, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 12, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"klee_choose", metadata !"klee_choose", metadata !"klee_choose", metadata !3, i32 12, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"klee-choose.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6}
!6 = metadata !{i32 458774, metadata !3, metadata !"uintptr_t", metadata !7, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 458769, i32 0, i32 1, metadata !"stdint.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!8 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 17, i32 0, metadata !1, null}
!10 = metadata !{i32 18, i32 0, metadata !1, null}
!11 = metadata !{i32 19, i32 0, metadata !1, null}
