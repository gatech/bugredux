; ModuleID = 'klee_div_zero_check.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

@.str = private constant [22 x i8] c"klee_div_zero_check.c\00", align 1 ; <[22 x i8]*> [#uses=1]
@.str1 = private constant [15 x i8] c"divide by zero\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str2 = private constant [8 x i8] c"div.err\00", align 1 ; <[8 x i8]*> [#uses=1]

define void @klee_div_zero_check(i64 %z) nounwind {
entry:
  %0 = icmp eq i64 %z, 0, !dbg !0                 ; <i1> [#uses=1]
  br i1 %0, label %bb, label %return, !dbg !0

bb:                                               ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0)) noreturn nounwind, !dbg !7
  unreachable, !dbg !7

return:                                           ; preds = %entry
  ret void, !dbg !8
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

!0 = metadata !{i32 13, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 12, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !3, i32 12, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"klee_div_zero_check.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/Intrinsic/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{null, metadata !6}
!6 = metadata !{i32 458788, metadata !3, metadata !"long long int", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 14, i32 0, metadata !1, null}
!8 = metadata !{i32 15, i32 0, metadata !1, null}
