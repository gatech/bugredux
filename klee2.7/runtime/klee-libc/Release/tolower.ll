; ModuleID = 'tolower.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define i32 @tolower(i32 %ch) nounwind readnone {
entry:
  %0 = add nsw i32 %ch, -65                       ; <i32> [#uses=1]
  %1 = add nsw i32 %ch, 32                        ; <i32> [#uses=1]
  %2 = icmp ult i32 %0, 26                        ; <i1> [#uses=1]
  %.ch = select i1 %2, i32 %1, i32 %ch            ; <i32> [#uses=1]
  ret i32 %.ch, !dbg !0
}

!0 = metadata !{i32 13, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 10, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"tolower", metadata !"tolower", metadata !"tolower", metadata !3, i32 10, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"tolower.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
