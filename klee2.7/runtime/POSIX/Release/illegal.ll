; ModuleID = 'illegal.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%struct.__jmp_buf_tag = type { [6 x i32], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [32 x i32] }

@.str = private constant [18 x i8] c"ignoring (ENOMEM)\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str1 = private constant [18 x i8] c"ignoring (EACCES)\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str2 = private constant [17 x i8] c"ignoring (EPERM)\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str3 = private constant [10 x i8] c"illegal.c\00", align 1 ; <[10 x i8]*> [#uses=1]
@.str4 = private constant [20 x i8] c"longjmp unsupported\00", align 1 ; <[20 x i8]*> [#uses=1]
@.str5 = private constant [8 x i8] c"xxx.err\00", align 1 ; <[8 x i8]*> [#uses=1]
@.str6 = private constant [9 x i8] c"ignoring\00", align 1 ; <[9 x i8]*> [#uses=1]

define i32 @kill(i32 %pid, i32 %sig) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !0
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !9 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !9
  ret i32 -1, !dbg !10
}

define i32 @fork() nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !11
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !16 ; <i32*> [#uses=1]
  store i32 12, i32* %0, align 4, !dbg !16
  ret i32 -1, !dbg !17
}

declare void @klee_warning(i8*)

declare i32* @__errno_location() nounwind readnone

define i32 @vfork() nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !18
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !22 ; <i32*> [#uses=1]
  store i32 12, i32* %0, align 4, !dbg !22
  ret i32 -1, !dbg !19
}

define weak i32 @execve(i8* %file, i8** %argv, i8** %envp) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !23
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !23 ; <i32*> [#uses=1]
  store i32 13, i32* %0, align 4, !dbg !23
  ret i32 -1, !dbg !33
}

define weak i32 @execvp(i8* %file, i8** %argv) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !35
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !35 ; <i32*> [#uses=1]
  store i32 13, i32* %0, align 4, !dbg !35
  ret i32 -1, !dbg !39
}

define weak i32 @execv(i8* %path, i8** %argv) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !41
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !41 ; <i32*> [#uses=1]
  store i32 13, i32* %0, align 4, !dbg !41
  ret i32 -1, !dbg !43
}

define weak i32 @execle(i8* %path, i8* %arg, ...) nounwind {
entry:
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !45
  %0 = call i32* @__errno_location() nounwind readnone, !dbg !45 ; <i32*> [#uses=1]
  store i32 13, i32* %0, align 4, !dbg !45
  ret i32 -1, !dbg !49
}

define weak i32 @execlp(i8* %file, i8* %arg, ...) nounwind {
entry:
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !51
  %0 = call i32* @__errno_location() nounwind readnone, !dbg !51 ; <i32*> [#uses=1]
  store i32 13, i32* %0, align 4, !dbg !51
  ret i32 -1, !dbg !53
}

define weak i32 @execl(i8* %path, i8* %arg, ...) nounwind {
entry:
  call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !55
  %0 = call i32* @__errno_location() nounwind readnone, !dbg !55 ; <i32*> [#uses=1]
  store i32 13, i32* %0, align 4, !dbg !55
  ret i32 -1, !dbg !57
}

define void @longjmp(%struct.__jmp_buf_tag* nocapture %env, i32 %val) noreturn nounwind {
entry:
  tail call void @klee_report_error(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0), i32 35, i8* getelementptr inbounds ([20 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0)) noreturn nounwind, !dbg !59
  unreachable, !dbg !59
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

define weak i32 @_setjmp(%struct.__jmp_buf_tag* %__env) nounwind {
entry:
  tail call void @klee_warning_once(i8* getelementptr inbounds ([9 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !85
  ret i32 0, !dbg !90
}

declare void @klee_warning_once(i8*)

!0 = metadata !{i32 23, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 22, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"kill", metadata !"kill", metadata !"kill", metadata !3, i32 22, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"illegal.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !6}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458774, metadata !3, metadata !"pid_t", metadata !8, i32 268, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!8 = metadata !{i32 458769, i32 0, i32 1, metadata !"unistd.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!9 = metadata !{i32 24, i32 0, metadata !1, null}
!10 = metadata !{i32 25, i32 0, metadata !1, null}
!11 = metadata !{i32 63, i32 0, metadata !12, null}
!12 = metadata !{i32 458763, metadata !13, i32 62, i32 0} ; [ DW_TAG_lexical_block ]
!13 = metadata !{i32 458798, i32 0, metadata !3, metadata !"fork", metadata !"fork", metadata !"fork", metadata !3, i32 62, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!14 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !15, i32 0, null} ; [ DW_TAG_subroutine_type ]
!15 = metadata !{metadata !7}
!16 = metadata !{i32 64, i32 0, metadata !12, null}
!17 = metadata !{i32 65, i32 0, metadata !12, null}
!18 = metadata !{i32 63, i32 0, metadata !12, metadata !19}
!19 = metadata !{i32 69, i32 0, metadata !20, null}
!20 = metadata !{i32 458763, metadata !21, i32 68, i32 0} ; [ DW_TAG_lexical_block ]
!21 = metadata !{i32 458798, i32 0, metadata !3, metadata !"vfork", metadata !"vfork", metadata !"vfork", metadata !3, i32 68, metadata !14, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!22 = metadata !{i32 64, i32 0, metadata !12, metadata !19}
!23 = metadata !{i32 60, i32 0, metadata !24, null}
!24 = metadata !{i32 458798, i32 0, metadata !3, metadata !"execve", metadata !"execve", metadata !"execve", metadata !3, i32 60, metadata !25, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!25 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !26, i32 0, null} ; [ DW_TAG_subroutine_type ]
!26 = metadata !{metadata !6, metadata !27, metadata !30, metadata !30}
!27 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ]
!28 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !29} ; [ DW_TAG_const_type ]
!29 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!30 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ]
!31 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_const_type ]
!32 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !29} ; [ DW_TAG_pointer_type ]
!33 = metadata !{i32 60, i32 0, metadata !34, null}
!34 = metadata !{i32 458763, metadata !24, i32 60, i32 0} ; [ DW_TAG_lexical_block ]
!35 = metadata !{i32 59, i32 0, metadata !36, null}
!36 = metadata !{i32 458798, i32 0, metadata !3, metadata !"execvp", metadata !"execvp", metadata !"execvp", metadata !3, i32 59, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!37 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, null} ; [ DW_TAG_subroutine_type ]
!38 = metadata !{metadata !6, metadata !27, metadata !30}
!39 = metadata !{i32 59, i32 0, metadata !40, null}
!40 = metadata !{i32 458763, metadata !36, i32 59, i32 0} ; [ DW_TAG_lexical_block ]
!41 = metadata !{i32 58, i32 0, metadata !42, null}
!42 = metadata !{i32 458798, i32 0, metadata !3, metadata !"execv", metadata !"execv", metadata !"execv", metadata !3, i32 58, metadata !37, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 58, i32 0, metadata !44, null}
!44 = metadata !{i32 458763, metadata !42, i32 58, i32 0} ; [ DW_TAG_lexical_block ]
!45 = metadata !{i32 57, i32 0, metadata !46, null}
!46 = metadata !{i32 458798, i32 0, metadata !3, metadata !"execle", metadata !"execle", metadata !"execle", metadata !3, i32 57, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!47 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !48, i32 0, null} ; [ DW_TAG_subroutine_type ]
!48 = metadata !{metadata !6, metadata !27, metadata !27}
!49 = metadata !{i32 57, i32 0, metadata !50, null}
!50 = metadata !{i32 458763, metadata !46, i32 57, i32 0} ; [ DW_TAG_lexical_block ]
!51 = metadata !{i32 56, i32 0, metadata !52, null}
!52 = metadata !{i32 458798, i32 0, metadata !3, metadata !"execlp", metadata !"execlp", metadata !"execlp", metadata !3, i32 56, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!53 = metadata !{i32 56, i32 0, metadata !54, null}
!54 = metadata !{i32 458763, metadata !52, i32 56, i32 0} ; [ DW_TAG_lexical_block ]
!55 = metadata !{i32 55, i32 0, metadata !56, null}
!56 = metadata !{i32 458798, i32 0, metadata !3, metadata !"execl", metadata !"execl", metadata !"execl", metadata !3, i32 55, metadata !47, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!57 = metadata !{i32 55, i32 0, metadata !58, null}
!58 = metadata !{i32 458763, metadata !56, i32 55, i32 0} ; [ DW_TAG_lexical_block ]
!59 = metadata !{i32 35, i32 0, metadata !60, null}
!60 = metadata !{i32 458763, metadata !61, i32 34, i32 0} ; [ DW_TAG_lexical_block ]
!61 = metadata !{i32 458798, i32 0, metadata !3, metadata !"longjmp", metadata !"longjmp", metadata !"longjmp", metadata !3, i32 34, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!62 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, null} ; [ DW_TAG_subroutine_type ]
!63 = metadata !{null, metadata !64, metadata !6}
!64 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !65} ; [ DW_TAG_pointer_type ]
!65 = metadata !{i32 458771, metadata !3, metadata !"__jmp_buf_tag", metadata !66, i32 36, i64 1248, i64 32, i64 0, i32 0, null, metadata !67, i32 0, null} ; [ DW_TAG_structure_type ]
!66 = metadata !{i32 458769, i32 0, i32 1, metadata !"setjmp.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!67 = metadata !{metadata !68, metadata !73, metadata !74}
!68 = metadata !{i32 458765, metadata !65, metadata !"__jmpbuf", metadata !66, i32 41, i64 192, i64 32, i64 0, i32 0, metadata !69} ; [ DW_TAG_member ]
!69 = metadata !{i32 458774, metadata !3, metadata !"__jmp_buf", metadata !66, i32 36, i64 0, i64 0, i64 0, i32 0, metadata !70} ; [ DW_TAG_typedef ]
!70 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 192, i64 32, i64 0, i32 0, metadata !6, metadata !71, i32 0, null} ; [ DW_TAG_array_type ]
!71 = metadata !{metadata !72}
!72 = metadata !{i32 458785, i64 0, i64 5}        ; [ DW_TAG_subrange_type ]
!73 = metadata !{i32 458765, metadata !65, metadata !"__mask_was_saved", metadata !66, i32 42, i64 32, i64 32, i64 192, i32 0, metadata !6} ; [ DW_TAG_member ]
!74 = metadata !{i32 458765, metadata !65, metadata !"__saved_mask", metadata !66, i32 43, i64 1024, i64 32, i64 224, i32 0, metadata !75} ; [ DW_TAG_member ]
!75 = metadata !{i32 458774, metadata !3, metadata !"__sigset_t", metadata !76, i32 41, i64 0, i64 0, i64 0, i32 0, metadata !77} ; [ DW_TAG_typedef ]
!76 = metadata !{i32 458769, i32 0, i32 1, metadata !"signal.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!77 = metadata !{i32 458771, metadata !3, metadata !"", metadata !78, i32 30, i64 1024, i64 32, i64 0, i32 0, null, metadata !79, i32 0, null} ; [ DW_TAG_structure_type ]
!78 = metadata !{i32 458769, i32 0, i32 1, metadata !"sigset.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 458765, metadata !77, metadata !"__val", metadata !78, i32 31, i64 1024, i64 32, i64 0, i32 0, metadata !81} ; [ DW_TAG_member ]
!81 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 1024, i64 32, i64 0, i32 0, metadata !82, metadata !83, i32 0, null} ; [ DW_TAG_array_type ]
!82 = metadata !{i32 458788, metadata !3, metadata !"long unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!83 = metadata !{metadata !84}
!84 = metadata !{i32 458785, i64 0, i64 31}       ; [ DW_TAG_subrange_type ]
!85 = metadata !{i32 30, i32 0, metadata !86, null}
!86 = metadata !{i32 458763, metadata !87, i32 29, i32 0} ; [ DW_TAG_lexical_block ]
!87 = metadata !{i32 458798, i32 0, metadata !3, metadata !"_setjmp", metadata !"_setjmp", metadata !"_setjmp", metadata !3, i32 29, metadata !88, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, null} ; [ DW_TAG_subroutine_type ]
!89 = metadata !{metadata !6, metadata !64}
!90 = metadata !{i32 31, i32 0, metadata !86, null}
