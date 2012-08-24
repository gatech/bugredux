; ModuleID = 'abort.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define void @abort() noreturn nounwind {
entry:
  tail call void @klee_abort() noreturn nounwind, !dbg !0
  unreachable, !dbg !0
}

declare void @klee_abort() noreturn

!0 = metadata !{i32 15, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 14, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"abort", metadata !"abort", metadata !"abort", metadata !3, i32 14, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"abort.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{null}
