; ModuleID = 'fd_64.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%struct.__fsid_t = type { [2 x i32] }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.stat = type { i64, i16, i32, i32, i32, i32, i32, i64, i16, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.stat64 = type { i64, i32, i32, i32, i32, i32, i32, i64, i32, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.statfs = type { i32, i32, i64, i64, i64, i64, i64, %struct.__fsid_t, i32, i32, [5 x i32] }
%struct.timespec = type { i32, i32 }

@__getdents64 = alias i32 (i32, %struct.dirent*, i32)* @getdents64 ; <i32 (i32, %struct.dirent*, i32)*> [#uses=0]

define i32 @"\01open64"(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=3]
  %0 = and i32 %flags, 64, !dbg !0                ; <i32> [#uses=1]
  %1 = icmp eq i32 %0, 0, !dbg !0                 ; <i1> [#uses=1]
  br i1 %1, label %bb3, label %bb, !dbg !0

bb:                                               ; preds = %entry
  %ap1 = bitcast i8** %ap to i8*, !dbg !10        ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1), !dbg !10
  %2 = load i8** %ap, align 4, !dbg !12           ; <i8*> [#uses=2]
  %3 = getelementptr inbounds i8* %2, i32 4, !dbg !12 ; <i8*> [#uses=1]
  store i8* %3, i8** %ap, align 4, !dbg !12
  %4 = bitcast i8* %2 to i32*, !dbg !12           ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4, !dbg !12            ; <i32> [#uses=1]
  call void @llvm.va_end(i8* %ap1), !dbg !13
  br label %bb3, !dbg !13

bb3:                                              ; preds = %entry, %bb
  %mode.0 = phi i32 [ %5, %bb ], [ 0, %entry ]    ; <i32> [#uses=1]
  %6 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !14 ; <i32> [#uses=1]
  ret i32 %6, !dbg !14
}

define i32 @getdents64(i32 %fd, %struct.dirent* %dirp, i32 %count) nounwind {
entry:
  %0 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent* %dirp, i32 %count) nounwind, !dbg !15 ; <i32> [#uses=1]
  ret i32 %0, !dbg !15
}

declare i32 @__fd_getdents(i32, %struct.dirent*, i32)

define weak i32 @"\01statfs64"(i8* %path, %struct.statfs* %buf) nounwind {
entry:
  %0 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) nounwind, !dbg !40 ; <i32> [#uses=1]
  ret i32 %0, !dbg !40
}

declare i32 @__fd_statfs(i8*, %struct.statfs*)

define i32 @ftruncate64(i32 %fd, i64 %length) nounwind {
entry:
  %0 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind, !dbg !72 ; <i32> [#uses=1]
  ret i32 %0, !dbg !72
}

declare i32 @__fd_ftruncate(i32, i64)

define i32 @"\01fstat64"(i32 %fd, %struct.stat* %buf) nounwind {
entry:
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !79 ; <%struct.stat64*> [#uses=1]
  %1 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %0) nounwind, !dbg !79 ; <i32> [#uses=1]
  ret i32 %1, !dbg !79
}

declare i32 @__fd_fstat(i32, %struct.stat64*)

define i32 @"\01__fxstat64"(i32 %vers, i32 %fd, %struct.stat* %buf) nounwind {
entry:
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !120 ; <%struct.stat64*> [#uses=1]
  %1 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %0) nounwind, !dbg !120 ; <i32> [#uses=1]
  ret i32 %1, !dbg !120
}

define i32 @"\01lstat64"(i8* %path, %struct.stat* %buf) nounwind {
entry:
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !125 ; <%struct.stat64*> [#uses=1]
  %1 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %0) nounwind, !dbg !125 ; <i32> [#uses=1]
  ret i32 %1, !dbg !125
}

declare i32 @__fd_lstat(i8*, %struct.stat64*)

define i32 @"\01__lxstat64"(i32 %vers, i8* %path, %struct.stat* %buf) nounwind {
entry:
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !130 ; <%struct.stat64*> [#uses=1]
  %1 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %0) nounwind, !dbg !130 ; <i32> [#uses=1]
  ret i32 %1, !dbg !130
}

define i32 @"\01stat64"(i8* %path, %struct.stat* %buf) nounwind {
entry:
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !135 ; <%struct.stat64*> [#uses=1]
  %1 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %0) nounwind, !dbg !135 ; <i32> [#uses=1]
  ret i32 %1, !dbg !135
}

declare i32 @__fd_stat(i8*, %struct.stat64*)

define i32 @"\01__xstat64"(i32 %vers, i8* %path, %struct.stat* %buf) nounwind {
entry:
  %0 = bitcast %struct.stat* %buf to %struct.stat64*, !dbg !138 ; <%struct.stat64*> [#uses=1]
  %1 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %0) nounwind, !dbg !138 ; <i32> [#uses=1]
  ret i32 %1, !dbg !138
}

define i64 @"\01lseek64"(i32 %fd, i64 %offset, i32 %whence) nounwind {
entry:
  %0 = tail call i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) nounwind, !dbg !141 ; <i64> [#uses=1]
  ret i64 %0, !dbg !141
}

declare i64 @__fd_lseek(i32, i64, i32)

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @__fd_open(i8*, i32, i32)

!0 = metadata !{i32 38, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 35, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"open", metadata !"open", metadata !"\01open64", metadata !3, i32 35, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"fd_64.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !6}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ]
!9 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 41, i32 0, metadata !11, null}
!11 = metadata !{i32 458763, metadata !1, i32 38, i32 0} ; [ DW_TAG_lexical_block ]
!12 = metadata !{i32 42, i32 0, metadata !11, null}
!13 = metadata !{i32 43, i32 0, metadata !11, null}
!14 = metadata !{i32 46, i32 0, metadata !1, null}
!15 = metadata !{i32 87, i32 0, metadata !16, null}
!16 = metadata !{i32 458763, metadata !17, i32 86, i32 0} ; [ DW_TAG_lexical_block ]
!17 = metadata !{i32 458798, i32 0, metadata !3, metadata !"getdents64", metadata !"getdents64", metadata !"getdents64", metadata !3, i32 86, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !6, metadata !20, metadata !21, metadata !20}
!20 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!21 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 458771, metadata !3, metadata !"dirent", metadata !23, i32 24, i64 2208, i64 32, i64 0, i32 0, null, metadata !24, i32 0, null} ; [ DW_TAG_structure_type ]
!23 = metadata !{i32 458769, i32 0, i32 1, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!24 = metadata !{metadata !25, metadata !29, metadata !32, metadata !34, metadata !36}
!25 = metadata !{i32 458765, metadata !22, metadata !"d_ino", metadata !23, i32 29, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_member ]
!26 = metadata !{i32 458774, metadata !3, metadata !"__ino64_t", metadata !27, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!27 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!28 = metadata !{i32 458788, metadata !3, metadata !"long long unsigned int", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!29 = metadata !{i32 458765, metadata !22, metadata !"d_off", metadata !23, i32 30, i64 64, i64 64, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!30 = metadata !{i32 458774, metadata !3, metadata !"__off64_t", metadata !27, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!31 = metadata !{i32 458788, metadata !3, metadata !"long long int", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!32 = metadata !{i32 458765, metadata !22, metadata !"d_reclen", metadata !23, i32 32, i64 16, i64 16, i64 128, i32 0, metadata !33} ; [ DW_TAG_member ]
!33 = metadata !{i32 458788, metadata !3, metadata !"short unsigned int", metadata !3, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!34 = metadata !{i32 458765, metadata !22, metadata !"d_type", metadata !23, i32 33, i64 8, i64 8, i64 144, i32 0, metadata !35} ; [ DW_TAG_member ]
!35 = metadata !{i32 458788, metadata !3, metadata !"unsigned char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!36 = metadata !{i32 458765, metadata !22, metadata !"d_name", metadata !23, i32 34, i64 2048, i64 8, i64 152, i32 0, metadata !37} ; [ DW_TAG_member ]
!37 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !9, metadata !38, i32 0, null} ; [ DW_TAG_array_type ]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 458785, i64 0, i64 255}      ; [ DW_TAG_subrange_type ]
!40 = metadata !{i32 83, i32 0, metadata !41, null}
!41 = metadata !{i32 458763, metadata !42, i32 82, i32 0} ; [ DW_TAG_lexical_block ]
!42 = metadata !{i32 458798, i32 0, metadata !3, metadata !"statfs", metadata !"statfs", metadata !"\01statfs64", metadata !3, i32 82, metadata !43, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null} ; [ DW_TAG_subroutine_type ]
!44 = metadata !{metadata !6, metadata !7, metadata !45}
!45 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ]
!46 = metadata !{i32 458771, metadata !3, metadata !"statfs", metadata !47, i32 26, i64 672, i64 32, i64 0, i32 0, null, metadata !48, i32 0, null} ; [ DW_TAG_structure_type ]
!47 = metadata !{i32 458769, i32 0, i32 1, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!48 = metadata !{metadata !49, metadata !50, metadata !51, metadata !53, metadata !54, metadata !55, metadata !57, metadata !58, metadata !66, metadata !67, metadata !68}
!49 = metadata !{i32 458765, metadata !46, metadata !"f_type", metadata !47, i32 27, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!50 = metadata !{i32 458765, metadata !46, metadata !"f_bsize", metadata !47, i32 28, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!51 = metadata !{i32 458765, metadata !46, metadata !"f_blocks", metadata !47, i32 36, i64 64, i64 64, i64 64, i32 0, metadata !52} ; [ DW_TAG_member ]
!52 = metadata !{i32 458774, metadata !3, metadata !"__fsblkcnt64_t", metadata !27, i32 177, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!53 = metadata !{i32 458765, metadata !46, metadata !"f_bfree", metadata !47, i32 37, i64 64, i64 64, i64 128, i32 0, metadata !52} ; [ DW_TAG_member ]
!54 = metadata !{i32 458765, metadata !46, metadata !"f_bavail", metadata !47, i32 38, i64 64, i64 64, i64 192, i32 0, metadata !52} ; [ DW_TAG_member ]
!55 = metadata !{i32 458765, metadata !46, metadata !"f_files", metadata !47, i32 39, i64 64, i64 64, i64 256, i32 0, metadata !56} ; [ DW_TAG_member ]
!56 = metadata !{i32 458774, metadata !3, metadata !"__fsfilcnt64_t", metadata !27, i32 180, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!57 = metadata !{i32 458765, metadata !46, metadata !"f_ffree", metadata !47, i32 40, i64 64, i64 64, i64 320, i32 0, metadata !56} ; [ DW_TAG_member ]
!58 = metadata !{i32 458765, metadata !46, metadata !"f_fsid", metadata !47, i32 42, i64 64, i64 32, i64 384, i32 0, metadata !59} ; [ DW_TAG_member ]
!59 = metadata !{i32 458774, metadata !3, metadata !"__fsid_t", metadata !27, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!60 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !61, i32 0, null} ; [ DW_TAG_structure_type ]
!61 = metadata !{metadata !62}
!62 = metadata !{i32 458765, metadata !60, metadata !"__val", metadata !27, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !63} ; [ DW_TAG_member ]
!63 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !6, metadata !64, i32 0, null} ; [ DW_TAG_array_type ]
!64 = metadata !{metadata !65}
!65 = metadata !{i32 458785, i64 0, i64 1}        ; [ DW_TAG_subrange_type ]
!66 = metadata !{i32 458765, metadata !46, metadata !"f_namelen", metadata !47, i32 43, i64 32, i64 32, i64 448, i32 0, metadata !6} ; [ DW_TAG_member ]
!67 = metadata !{i32 458765, metadata !46, metadata !"f_frsize", metadata !47, i32 44, i64 32, i64 32, i64 480, i32 0, metadata !6} ; [ DW_TAG_member ]
!68 = metadata !{i32 458765, metadata !46, metadata !"f_spare", metadata !47, i32 45, i64 160, i64 32, i64 512, i32 0, metadata !69} ; [ DW_TAG_member ]
!69 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 160, i64 32, i64 0, i32 0, metadata !6, metadata !70, i32 0, null} ; [ DW_TAG_array_type ]
!70 = metadata !{metadata !71}
!71 = metadata !{i32 458785, i64 0, i64 4}        ; [ DW_TAG_subrange_type ]
!72 = metadata !{i32 78, i32 0, metadata !73, null}
!73 = metadata !{i32 458763, metadata !74, i32 77, i32 0} ; [ DW_TAG_lexical_block ]
!74 = metadata !{i32 458798, i32 0, metadata !3, metadata !"ftruncate64", metadata !"ftruncate64", metadata !"ftruncate64", metadata !3, i32 77, metadata !75, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!75 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, null} ; [ DW_TAG_subroutine_type ]
!76 = metadata !{metadata !6, metadata !6, metadata !77}
!77 = metadata !{i32 458774, metadata !3, metadata !"off64_t", metadata !78, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!78 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!79 = metadata !{i32 74, i32 0, metadata !80, null}
!80 = metadata !{i32 458763, metadata !81, i32 73, i32 0} ; [ DW_TAG_lexical_block ]
!81 = metadata !{i32 458798, i32 0, metadata !3, metadata !"fstat", metadata !"fstat", metadata !"\01fstat64", metadata !3, i32 73, metadata !82, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!82 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, null} ; [ DW_TAG_subroutine_type ]
!83 = metadata !{metadata !6, metadata !6, metadata !84}
!84 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !85} ; [ DW_TAG_pointer_type ]
!85 = metadata !{i32 458771, metadata !3, metadata !"stat", metadata !86, i32 44, i64 768, i64 32, i64 0, i32 0, null, metadata !87, i32 0, null} ; [ DW_TAG_structure_type ]
!86 = metadata !{i32 458769, i32 0, i32 1, metadata !"stat.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!87 = metadata !{metadata !88, metadata !90, metadata !91, metadata !94, metadata !96, metadata !98, metadata !100, metadata !102, metadata !103, metadata !104, metadata !105, metadata !108, metadata !110, metadata !117, metadata !118, metadata !119}
!88 = metadata !{i32 458765, metadata !85, metadata !"st_dev", metadata !86, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !89} ; [ DW_TAG_member ]
!89 = metadata !{i32 458774, metadata !3, metadata !"__dev_t", metadata !27, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!90 = metadata !{i32 458765, metadata !85, metadata !"__pad1", metadata !86, i32 47, i64 16, i64 16, i64 64, i32 0, metadata !33} ; [ DW_TAG_member ]
!91 = metadata !{i32 458765, metadata !85, metadata !"__st_ino", metadata !86, i32 52, i64 32, i64 32, i64 96, i32 0, metadata !92} ; [ DW_TAG_member ]
!92 = metadata !{i32 458774, metadata !3, metadata !"__ino_t", metadata !27, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_typedef ]
!93 = metadata !{i32 458788, metadata !3, metadata !"long unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!94 = metadata !{i32 458765, metadata !85, metadata !"st_mode", metadata !86, i32 55, i64 32, i64 32, i64 128, i32 0, metadata !95} ; [ DW_TAG_member ]
!95 = metadata !{i32 458774, metadata !3, metadata !"__mode_t", metadata !27, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!96 = metadata !{i32 458765, metadata !85, metadata !"st_nlink", metadata !86, i32 56, i64 32, i64 32, i64 160, i32 0, metadata !97} ; [ DW_TAG_member ]
!97 = metadata !{i32 458774, metadata !3, metadata !"__nlink_t", metadata !27, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!98 = metadata !{i32 458765, metadata !85, metadata !"st_uid", metadata !86, i32 61, i64 32, i64 32, i64 192, i32 0, metadata !99} ; [ DW_TAG_member ]
!99 = metadata !{i32 458774, metadata !3, metadata !"__uid_t", metadata !27, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!100 = metadata !{i32 458765, metadata !85, metadata !"st_gid", metadata !86, i32 62, i64 32, i64 32, i64 224, i32 0, metadata !101} ; [ DW_TAG_member ]
!101 = metadata !{i32 458774, metadata !3, metadata !"__gid_t", metadata !27, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !20} ; [ DW_TAG_typedef ]
!102 = metadata !{i32 458765, metadata !85, metadata !"st_rdev", metadata !86, i32 66, i64 64, i64 64, i64 256, i32 0, metadata !89} ; [ DW_TAG_member ]
!103 = metadata !{i32 458765, metadata !85, metadata !"__pad2", metadata !86, i32 68, i64 16, i64 16, i64 320, i32 0, metadata !33} ; [ DW_TAG_member ]
!104 = metadata !{i32 458765, metadata !85, metadata !"st_size", metadata !86, i32 73, i64 64, i64 64, i64 352, i32 0, metadata !30} ; [ DW_TAG_member ]
!105 = metadata !{i32 458765, metadata !85, metadata !"st_blksize", metadata !86, i32 75, i64 32, i64 32, i64 416, i32 0, metadata !106} ; [ DW_TAG_member ]
!106 = metadata !{i32 458774, metadata !3, metadata !"__blksize_t", metadata !27, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_typedef ]
!107 = metadata !{i32 458788, metadata !3, metadata !"long int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!108 = metadata !{i32 458765, metadata !85, metadata !"st_blocks", metadata !86, i32 79, i64 64, i64 64, i64 448, i32 0, metadata !109} ; [ DW_TAG_member ]
!109 = metadata !{i32 458774, metadata !3, metadata !"__blkcnt64_t", metadata !27, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ]
!110 = metadata !{i32 458765, metadata !85, metadata !"st_atim", metadata !86, i32 88, i64 64, i64 32, i64 512, i32 0, metadata !111} ; [ DW_TAG_member ]
!111 = metadata !{i32 458771, metadata !3, metadata !"timespec", metadata !112, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !113, i32 0, null} ; [ DW_TAG_structure_type ]
!112 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!113 = metadata !{metadata !114, metadata !116}
!114 = metadata !{i32 458765, metadata !111, metadata !"tv_sec", metadata !112, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !115} ; [ DW_TAG_member ]
!115 = metadata !{i32 458774, metadata !3, metadata !"__time_t", metadata !27, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_typedef ]
!116 = metadata !{i32 458765, metadata !111, metadata !"tv_nsec", metadata !112, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !107} ; [ DW_TAG_member ]
!117 = metadata !{i32 458765, metadata !85, metadata !"st_mtim", metadata !86, i32 89, i64 64, i64 32, i64 576, i32 0, metadata !111} ; [ DW_TAG_member ]
!118 = metadata !{i32 458765, metadata !85, metadata !"st_ctim", metadata !86, i32 90, i64 64, i64 32, i64 640, i32 0, metadata !111} ; [ DW_TAG_member ]
!119 = metadata !{i32 458765, metadata !85, metadata !"st_ino", metadata !86, i32 109, i64 64, i64 64, i64 704, i32 0, metadata !26} ; [ DW_TAG_member ]
!120 = metadata !{i32 70, i32 0, metadata !121, null}
!121 = metadata !{i32 458763, metadata !122, i32 69, i32 0} ; [ DW_TAG_lexical_block ]
!122 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__fxstat", metadata !"__fxstat", metadata !"\01__fxstat64", metadata !3, i32 69, metadata !123, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!123 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, null} ; [ DW_TAG_subroutine_type ]
!124 = metadata !{metadata !6, metadata !6, metadata !6, metadata !84}
!125 = metadata !{i32 66, i32 0, metadata !126, null}
!126 = metadata !{i32 458763, metadata !127, i32 65, i32 0} ; [ DW_TAG_lexical_block ]
!127 = metadata !{i32 458798, i32 0, metadata !3, metadata !"lstat", metadata !"lstat", metadata !"\01lstat64", metadata !3, i32 65, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!128 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !129, i32 0, null} ; [ DW_TAG_subroutine_type ]
!129 = metadata !{metadata !6, metadata !7, metadata !84}
!130 = metadata !{i32 62, i32 0, metadata !131, null}
!131 = metadata !{i32 458763, metadata !132, i32 61, i32 0} ; [ DW_TAG_lexical_block ]
!132 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__lxstat", metadata !"__lxstat", metadata !"\01__lxstat64", metadata !3, i32 61, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!133 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !134, i32 0, null} ; [ DW_TAG_subroutine_type ]
!134 = metadata !{metadata !6, metadata !6, metadata !7, metadata !84}
!135 = metadata !{i32 58, i32 0, metadata !136, null}
!136 = metadata !{i32 458763, metadata !137, i32 57, i32 0} ; [ DW_TAG_lexical_block ]
!137 = metadata !{i32 458798, i32 0, metadata !3, metadata !"stat", metadata !"stat", metadata !"\01stat64", metadata !3, i32 57, metadata !128, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!138 = metadata !{i32 54, i32 0, metadata !139, null}
!139 = metadata !{i32 458763, metadata !140, i32 53, i32 0} ; [ DW_TAG_lexical_block ]
!140 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__xstat", metadata !"__xstat", metadata !"\01__xstat64", metadata !3, i32 53, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!141 = metadata !{i32 50, i32 0, metadata !142, null}
!142 = metadata !{i32 458763, metadata !143, i32 49, i32 0} ; [ DW_TAG_lexical_block ]
!143 = metadata !{i32 458798, i32 0, metadata !3, metadata !"lseek", metadata !"lseek", metadata !"\01lseek64", metadata !3, i32 49, metadata !144, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!144 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !145, i32 0, null} ; [ DW_TAG_subroutine_type ]
!145 = metadata !{metadata !77, metadata !6, metadata !77, metadata !6}
