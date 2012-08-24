; ModuleID = 'htonl.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

define zeroext i16 @htons(i16 zeroext %v) nounwind readnone {
entry:
  %0 = tail call i16 @llvm.bswap.i16(i16 %v)      ; <i16> [#uses=1]
  ret i16 %0, !dbg !0
}

declare i16 @llvm.bswap.i16(i16) nounwind readnone

define i32 @htonl(i32 %v) nounwind readnone {
entry:
  %0 = lshr i32 %v, 16, !dbg !9                   ; <i32> [#uses=1]
  %1 = trunc i32 %0 to i16, !dbg !9               ; <i16> [#uses=1]
  %2 = tail call i16 @llvm.bswap.i16(i16 %1) nounwind ; <i16> [#uses=1]
  %3 = zext i16 %2 to i32, !dbg !9                ; <i32> [#uses=1]
  %4 = trunc i32 %v to i16, !dbg !9               ; <i16> [#uses=1]
  %5 = tail call i16 @llvm.bswap.i16(i16 %4) nounwind ; <i16> [#uses=1]
  %6 = zext i16 %5 to i32, !dbg !9                ; <i32> [#uses=1]
  %7 = shl i32 %6, 16, !dbg !9                    ; <i32> [#uses=1]
  %8 = or i32 %7, %3, !dbg !9                     ; <i32> [#uses=1]
  ret i32 %8, !dbg !9
}

define zeroext i16 @ntohs(i32 %v) nounwind readnone {
entry:
  %0 = trunc i32 %v to i16, !dbg !16              ; <i16> [#uses=1]
  %1 = tail call i16 @llvm.bswap.i16(i16 %0) nounwind ; <i16> [#uses=1]
  ret i16 %1, !dbg !16
}

define i32 @ntohl(i32 %v) nounwind readnone {
entry:
  %0 = lshr i32 %v, 16, !dbg !21                  ; <i32> [#uses=1]
  %1 = trunc i32 %0 to i16, !dbg !21              ; <i16> [#uses=1]
  %2 = tail call i16 @llvm.bswap.i16(i16 %1) nounwind ; <i16> [#uses=1]
  %3 = zext i16 %2 to i32, !dbg !21               ; <i32> [#uses=1]
  %4 = trunc i32 %v to i16, !dbg !21              ; <i16> [#uses=1]
  %5 = tail call i16 @llvm.bswap.i16(i16 %4) nounwind ; <i16> [#uses=1]
  %6 = zext i16 %5 to i32, !dbg !21               ; <i32> [#uses=1]
  %7 = shl i32 %6, 16, !dbg !21                   ; <i32> [#uses=1]
  %8 = or i32 %7, %3, !dbg !21                    ; <i32> [#uses=1]
  ret i32 %8, !dbg !22
}

!0 = metadata !{i32 27, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 26, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"htons", metadata !"htons", metadata !"htons", metadata !3, i32 26, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"htonl.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/klee-libc/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6}
!6 = metadata !{i32 458774, metadata !3, metadata !"uint16_t", metadata !7, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 458769, i32 0, i32 1, metadata !"stdint.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!8 = metadata !{i32 458788, metadata !3, metadata !"short unsigned int", metadata !3, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 30, i32 0, metadata !10, null}
!10 = metadata !{i32 458763, metadata !11, i32 29, i32 0} ; [ DW_TAG_lexical_block ]
!11 = metadata !{i32 458798, i32 0, metadata !3, metadata !"htonl", metadata !"htonl", metadata !"htonl", metadata !3, i32 29, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!12 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !13, i32 0, null} ; [ DW_TAG_subroutine_type ]
!13 = metadata !{metadata !14, metadata !14}
!14 = metadata !{i32 458774, metadata !3, metadata !"uint32_t", metadata !7, i32 59, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!15 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!16 = metadata !{i32 45, i32 0, metadata !17, null}
!17 = metadata !{i32 458763, metadata !18, i32 44, i32 0} ; [ DW_TAG_lexical_block ]
!18 = metadata !{i32 458798, i32 0, metadata !3, metadata !"ntohs", metadata !"ntohs", metadata !"ntohs", metadata !3, i32 44, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !6, metadata !14}
!21 = metadata !{i32 30, i32 0, metadata !10, metadata !22}
!22 = metadata !{i32 48, i32 0, metadata !23, null}
!23 = metadata !{i32 458763, metadata !24, i32 47, i32 0} ; [ DW_TAG_lexical_block ]
!24 = metadata !{i32 458798, i32 0, metadata !3, metadata !"ntohl", metadata !"ntohl", metadata !"ntohl", metadata !3, i32 47, metadata !12, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
