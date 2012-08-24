; ModuleID = 'fd.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__fsid_t = type { [2 x i32] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.fd_set = type { [32 x i32] }
%struct.stat64 = type { i64, i32, i32, i32, i32, i32, i32, i64, i32, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.statfs = type { i32, i32, i32, i32, i32, i32, i32, %struct.__fsid_t, i32, i32, [5 x i32] }
%struct.timespec = type { i32, i32 }

@__exe_fs = external global %struct.exe_file_system_t ; <%struct.exe_file_system_t*> [#uses=12]
@__exe_env = external global %struct.exe_sym_env_t ; <%struct.exe_sym_env_t*> [#uses=94]
@.str = private constant [18 x i8] c"ignoring (ENOENT)\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str1 = private constant [17 x i8] c"ignoring (EPERM)\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str2 = private constant [32 x i8] c"symbolic file, ignoring (EPERM)\00", align 4 ; <[32 x i8]*> [#uses=1]
@.str3 = private constant [32 x i8] c"symbolic file, ignoring (EBADF)\00", align 4 ; <[32 x i8]*> [#uses=1]
@n_calls.4747 = internal global i32 0             ; <i32*> [#uses=4]
@.str4 = private constant [30 x i8] c"symbolic file, ignoring (EIO)\00", align 1 ; <[30 x i8]*> [#uses=1]
@.str5 = private constant [33 x i8] c"symbolic file, ignoring (ENOENT)\00", align 4 ; <[33 x i8]*> [#uses=1]
@n_calls.5255 = internal global i32 0             ; <i32*> [#uses=2]
@n_calls.4379 = internal global i32 0             ; <i32*> [#uses=4]
@.str6 = private constant [33 x i8] c"symbolic file, ignoring (EINVAL)\00", align 4 ; <[33 x i8]*> [#uses=1]
@.str7 = private constant [41 x i8] c"(TCGETS) symbolic file, incomplete model\00", align 4 ; <[41 x i8]*> [#uses=1]
@.str8 = private constant [42 x i8] c"(TCSETS) symbolic file, silently ignoring\00", align 4 ; <[42 x i8]*> [#uses=1]
@.str9 = private constant [43 x i8] c"(TCSETSW) symbolic file, silently ignoring\00", align 4 ; <[43 x i8]*> [#uses=1]
@.str10 = private constant [43 x i8] c"(TCSETSF) symbolic file, silently ignoring\00", align 4 ; <[43 x i8]*> [#uses=1]
@.str11 = private constant [45 x i8] c"(TIOCGWINSZ) symbolic file, incomplete model\00", align 4 ; <[45 x i8]*> [#uses=1]
@.str12 = private constant [46 x i8] c"(TIOCSWINSZ) symbolic file, ignoring (EINVAL)\00", align 4 ; <[46 x i8]*> [#uses=1]
@.str13 = private constant [43 x i8] c"(FIONREAD) symbolic file, incomplete model\00", align 4 ; <[43 x i8]*> [#uses=1]
@.str14 = private constant [44 x i8] c"(MTIOCGET) symbolic file, ignoring (EINVAL)\00", align 4 ; <[44 x i8]*> [#uses=1]
@.str15 = private constant [18 x i8] c"s != (off64_t) -1\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str16 = private constant [5 x i8] c"fd.c\00", align 1 ; <[5 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.4784 = internal constant [14 x i8] c"__fd_getdents\00" ; <[14 x i8]*> [#uses=1]
@.str17 = private constant [18 x i8] c"new_off == f->off\00", align 1 ; <[18 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.4528 = internal constant [11 x i8] c"__fd_lseek\00" ; <[11 x i8]*> [#uses=1]
@n_calls.4399 = internal global i32 0             ; <i32*> [#uses=2]
@.str18 = private constant [12 x i8] c"f->off >= 0\00", align 1 ; <[12 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.4402 = internal constant [5 x i8] c"read\00" ; <[5 x i8]*> [#uses=1]
@n_calls.4654 = internal global i32 0             ; <i32*> [#uses=2]
@n_calls.4631 = internal global i32 0             ; <i32*> [#uses=2]
@n_calls.4458 = internal global i32 0             ; <i32*> [#uses=2]
@.str19 = private constant [7 x i8] c"r >= 0\00", align 1 ; <[7 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.4461 = internal constant [6 x i8] c"write\00" ; <[6 x i8]*> [#uses=1]
@.str20 = private constant [2 x i8] c"0\00", align 1 ; <[2 x i8]*> [#uses=1]
@stderr = external global %struct._IO_FILE*       ; <%struct._IO_FILE**> [#uses=2]
@.str21 = private constant [33 x i8] c"WARNING: write() ignores bytes.\0A\00", align 4 ; <[33 x i8]*> [#uses=1]
@.str22 = private constant [47 x i8] c"Undefined call to open(): O_EXCL w/o O_RDONLY\0A\00", align 4 ; <[47 x i8]*> [#uses=1]

define i32 @access(i8* %pathname, i32 %mode) nounwind {
entry:
  %0 = load i8* %pathname, align 1, !dbg !40      ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !98                 ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb.i, !dbg !98

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i32 1, !dbg !98 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !98             ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !98                 ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !98

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !99 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !100               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !100              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !100              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !100

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !101 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !103 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !103 ; <%struct.stat64*> [#uses=1]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !103 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !103         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !103             ; <i1> [#uses=1]
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !103

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !99                  ; <i32> [#uses=1]
  br label %bb8.i, !dbg !99

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !99            ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb1, !dbg !99

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !101 ; <%struct.exe_disk_file_t*> [#uses=1]
  %phitmp = icmp eq %struct.exe_disk_file_t* %19, null ; <i1> [#uses=1]
  br i1 %phitmp, label %bb1, label %bb4, !dbg !104

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %20 = tail call fastcc i8* @__concretize_ptr(i8* %pathname) nounwind, !dbg !105 ; <i8*> [#uses=1]
  br label %bb.i6, !dbg !112

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %20, %bb1 ], [ %sc.0.i, %bb6.i8 ] ; <i8*> [#uses=7]
  %21 = phi i32 [ 0, %bb1 ], [ %33, %bb6.i8 ]     ; <i32> [#uses=3]
  %tmp.i = add i32 %21, -1                        ; <i32> [#uses=1]
  %22 = load i8* %sc.1.i, align 1, !dbg !113      ; <i8> [#uses=3]
  %23 = and i32 %tmp.i, %21, !dbg !115            ; <i32> [#uses=1]
  %24 = icmp eq i32 %23, 0, !dbg !115             ; <i1> [#uses=1]
  br i1 %24, label %bb1.i, label %bb5.i, !dbg !115

bb1.i:                                            ; preds = %bb.i6
  switch i8 %22, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !116
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !117
  %25 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !117 ; <i8*> [#uses=1]
  br label %bb6.i8, !dbg !117

bb5.i:                                            ; preds = %bb.i6
  %26 = sext i8 %22 to i32, !dbg !118             ; <i32> [#uses=1]
  %27 = tail call i32 @klee_get_valuel(i32 %26) nounwind, !dbg !118 ; <i32> [#uses=1]
  %28 = trunc i32 %27 to i8, !dbg !118            ; <i8> [#uses=3]
  %29 = icmp eq i8 %28, %22, !dbg !120            ; <i1> [#uses=1]
  %30 = zext i1 %29 to i32, !dbg !120             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %30) nounwind, !dbg !120
  store i8 %28, i8* %sc.1.i, align 1, !dbg !121
  %31 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !121 ; <i8*> [#uses=1]
  %32 = icmp eq i8 %28, 0, !dbg !122              ; <i1> [#uses=1]
  br i1 %32, label %__concretize_string.exit, label %bb6.i8, !dbg !122

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %25, %bb4.i7 ], [ %31, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %33 = add i32 %21, 1, !dbg !112                 ; <i32> [#uses=1]
  br label %bb.i6, !dbg !112

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %34 = tail call i32 (i32, ...)* @syscall(i32 33, i8* %pathname, i32 %mode) nounwind, !dbg !110 ; <i32> [#uses=3]
  %35 = icmp eq i32 %34, -1, !dbg !123            ; <i1> [#uses=1]
  br i1 %35, label %bb2, label %bb4, !dbg !123

bb2:                                              ; preds = %__concretize_string.exit
  %36 = tail call i32* @__errno_location() nounwind readnone, !dbg !124 ; <i32*> [#uses=1]
  %37 = tail call i32 @klee_get_errno() nounwind, !dbg !124 ; <i32> [#uses=1]
  store i32 %37, i32* %36, align 4, !dbg !124
  ret i32 %34, !dbg !125

bb4:                                              ; preds = %__concretize_string.exit, %__get_sym_file.exit
  %.0 = phi i32 [ 0, %__get_sym_file.exit ], [ %34, %__concretize_string.exit ] ; <i32> [#uses=1]
  ret i32 %.0, !dbg !125
}

define i32 @umask(i32 %mask) nounwind {
entry:
  %0 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 1), align 4, !dbg !126 ; <i32> [#uses=1]
  %1 = and i32 %mask, 511, !dbg !131              ; <i32> [#uses=1]
  store i32 %1, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 1), align 4, !dbg !131
  ret i32 %0, !dbg !132
}

define i32 @chroot(i8* nocapture %path) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !133         ; <i8> [#uses=1]
  switch i8 %0, label %bb4 [
    i8 0, label %bb
    i8 47, label %bb2
  ]

bb:                                               ; preds = %entry
  %1 = tail call i32* @__errno_location() nounwind readnone, !dbg !138 ; <i32*> [#uses=1]
  store i32 2, i32* %1, align 4, !dbg !138
  ret i32 -1, !dbg !139

bb2:                                              ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !140 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !140            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !140                ; <i1> [#uses=1]
  br i1 %4, label %bb5, label %bb4, !dbg !140

bb4:                                              ; preds = %entry, %bb2
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !141
  %5 = tail call i32* @__errno_location() nounwind readnone, !dbg !142 ; <i32*> [#uses=1]
  store i32 2, i32* %5, align 4, !dbg !142
  ret i32 -1, !dbg !139

bb5:                                              ; preds = %bb2
  ret i32 0, !dbg !139
}

declare i32* @__errno_location() nounwind readnone

declare void @klee_warning(i8*)

define i32 @unlink(i8* nocapture %pathname) nounwind {
entry:
  %0 = load i8* %pathname, align 1, !dbg !143     ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !147                ; <i1> [#uses=1]
  br i1 %1, label %bb5, label %bb.i, !dbg !147

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i32 1, !dbg !147 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !147            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !147                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb5, !dbg !147

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !148 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !149               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !149              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !149              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !149

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !150 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !151 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !151 ; <%struct.stat64*> [#uses=2]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !151 ; <i64*> [#uses=2]
  %14 = load i64* %13, align 4, !dbg !151         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !151             ; <i1> [#uses=1]
  br i1 %15, label %bb5, label %__get_sym_file.exit, !dbg !151

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !148                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !148

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !148           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb5, !dbg !148

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !150 ; <%struct.exe_disk_file_t*> [#uses=1]
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !152 ; <i1> [#uses=1]
  br i1 %20, label %bb5, label %bb, !dbg !152

bb:                                               ; preds = %__get_sym_file.exit
  %21 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 3, !dbg !153 ; <i32*> [#uses=1]
  %22 = load i32* %21, align 4, !dbg !153         ; <i32> [#uses=1]
  %23 = and i32 %22, 61440, !dbg !153             ; <i32> [#uses=2]
  %24 = icmp eq i32 %23, 32768, !dbg !153         ; <i1> [#uses=1]
  br i1 %24, label %bb1, label %bb2, !dbg !153

bb1:                                              ; preds = %bb
  store i64 0, i64* %13, align 4, !dbg !154
  ret i32 0, !dbg !155

bb2:                                              ; preds = %bb
  %25 = icmp eq i32 %23, 16384, !dbg !156         ; <i1> [#uses=1]
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !157 ; <i32*> [#uses=2]
  br i1 %25, label %bb3, label %bb4, !dbg !156

bb3:                                              ; preds = %bb2
  store i32 21, i32* %26, align 4, !dbg !157
  ret i32 -1, !dbg !155

bb4:                                              ; preds = %bb2
  store i32 1, i32* %26, align 4, !dbg !158
  ret i32 -1, !dbg !155

bb5:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !159
  %27 = tail call i32* @__errno_location() nounwind readnone, !dbg !160 ; <i32*> [#uses=1]
  store i32 1, i32* %27, align 4, !dbg !160
  ret i32 -1, !dbg !155
}

define i32 @rmdir(i8* nocapture %pathname) nounwind {
entry:
  %0 = load i8* %pathname, align 1, !dbg !161     ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !165                ; <i1> [#uses=1]
  br i1 %1, label %bb3, label %bb.i, !dbg !165

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %pathname, i32 1, !dbg !165 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !165            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !165                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb3, !dbg !165

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !166 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !167               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !167              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !167              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !167

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !168 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !169 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !169 ; <%struct.stat64*> [#uses=2]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !169 ; <i64*> [#uses=2]
  %14 = load i64* %13, align 4, !dbg !169         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !169             ; <i1> [#uses=1]
  br i1 %15, label %bb3, label %__get_sym_file.exit, !dbg !169

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !166                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !166

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !166           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb3, !dbg !166

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !168 ; <%struct.exe_disk_file_t*> [#uses=1]
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !170 ; <i1> [#uses=1]
  br i1 %20, label %bb3, label %bb, !dbg !170

bb:                                               ; preds = %__get_sym_file.exit
  %21 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 3, !dbg !171 ; <i32*> [#uses=1]
  %22 = load i32* %21, align 4, !dbg !171         ; <i32> [#uses=1]
  %23 = and i32 %22, 61440, !dbg !171             ; <i32> [#uses=1]
  %24 = icmp eq i32 %23, 16384, !dbg !171         ; <i1> [#uses=1]
  br i1 %24, label %bb1, label %bb2, !dbg !171

bb1:                                              ; preds = %bb
  store i64 0, i64* %13, align 4, !dbg !172
  ret i32 0, !dbg !173

bb2:                                              ; preds = %bb
  %25 = tail call i32* @__errno_location() nounwind readnone, !dbg !174 ; <i32*> [#uses=1]
  store i32 20, i32* %25, align 4, !dbg !174
  ret i32 -1, !dbg !173

bb3:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !175
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !176 ; <i32*> [#uses=1]
  store i32 1, i32* %26, align 4, !dbg !176
  ret i32 -1, !dbg !173
}

define i32 @readlink(i8* %path, i8* %buf, i32 %bufsize) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !177         ; <i8> [#uses=3]
  %1 = icmp eq i8 %0, 0, !dbg !183                ; <i1> [#uses=1]
  br i1 %1, label %bb12, label %bb.i, !dbg !183

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !183 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !183            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !183                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb12, !dbg !183

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !184 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !185               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !185              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !185              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !185

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !186 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !187 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !187 ; <%struct.stat64*> [#uses=2]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !187 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !187         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !187             ; <i1> [#uses=1]
  br i1 %15, label %bb12, label %__get_sym_file.exit, !dbg !187

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !184                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !184

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !184           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb12, !dbg !184

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !186 ; <%struct.exe_disk_file_t*> [#uses=1]
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !188 ; <i1> [#uses=1]
  br i1 %20, label %bb12, label %bb, !dbg !188

bb:                                               ; preds = %__get_sym_file.exit
  %21 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 3, !dbg !189 ; <i32*> [#uses=1]
  %22 = load i32* %21, align 4, !dbg !189         ; <i32> [#uses=1]
  %23 = and i32 %22, 61440, !dbg !189             ; <i32> [#uses=1]
  %24 = icmp eq i32 %23, 40960, !dbg !189         ; <i1> [#uses=1]
  br i1 %24, label %bb1, label %bb11, !dbg !189

bb1:                                              ; preds = %bb
  store i8 %0, i8* %buf, align 1, !dbg !190
  %25 = icmp ugt i32 %bufsize, 1, !dbg !191       ; <i1> [#uses=1]
  br i1 %25, label %bb2, label %bb3, !dbg !191

bb2:                                              ; preds = %bb1
  %26 = getelementptr inbounds i8* %buf, i32 1, !dbg !191 ; <i8*> [#uses=1]
  store i8 46, i8* %26, align 1, !dbg !191
  br label %bb3, !dbg !191

bb3:                                              ; preds = %bb2, %bb1
  %27 = icmp ugt i32 %bufsize, 2, !dbg !192       ; <i1> [#uses=1]
  br i1 %27, label %bb4, label %bb5, !dbg !192

bb4:                                              ; preds = %bb3
  %28 = getelementptr inbounds i8* %buf, i32 2, !dbg !192 ; <i8*> [#uses=1]
  store i8 108, i8* %28, align 1, !dbg !192
  br label %bb5, !dbg !192

bb5:                                              ; preds = %bb4, %bb3
  %29 = icmp ugt i32 %bufsize, 3, !dbg !193       ; <i1> [#uses=1]
  br i1 %29, label %bb6, label %bb7, !dbg !193

bb6:                                              ; preds = %bb5
  %30 = getelementptr inbounds i8* %buf, i32 3, !dbg !193 ; <i8*> [#uses=1]
  store i8 110, i8* %30, align 1, !dbg !193
  br label %bb7, !dbg !193

bb7:                                              ; preds = %bb6, %bb5
  %31 = icmp ugt i32 %bufsize, 4, !dbg !194       ; <i1> [#uses=1]
  br i1 %31, label %bb8, label %bb9, !dbg !194

bb8:                                              ; preds = %bb7
  %32 = getelementptr inbounds i8* %buf, i32 4, !dbg !194 ; <i8*> [#uses=1]
  store i8 107, i8* %32, align 1, !dbg !194
  br label %bb9, !dbg !194

bb9:                                              ; preds = %bb8, %bb7
  %33 = icmp ugt i32 %bufsize, 5                  ; <i1> [#uses=1]
  %min = select i1 %33, i32 5, i32 %bufsize, !dbg !195 ; <i32> [#uses=1]
  ret i32 %min, !dbg !196

bb11:                                             ; preds = %bb
  %34 = tail call i32* @__errno_location() nounwind readnone, !dbg !197 ; <i32*> [#uses=1]
  store i32 22, i32* %34, align 4, !dbg !197
  ret i32 -1, !dbg !196

bb12:                                             ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %35 = tail call i32 (i32, ...)* @syscall(i32 85, i8* %path, i8* %buf, i32 %bufsize) nounwind, !dbg !198 ; <i32> [#uses=3]
  %36 = icmp eq i32 %35, -1, !dbg !200            ; <i1> [#uses=1]
  br i1 %36, label %bb13, label %bb15, !dbg !200

bb13:                                             ; preds = %bb12
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !201 ; <i32*> [#uses=1]
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !201 ; <i32> [#uses=1]
  store i32 %38, i32* %37, align 4, !dbg !201
  ret i32 %35, !dbg !196

bb15:                                             ; preds = %bb12
  ret i32 %35, !dbg !196
}

declare i32 @syscall(i32, ...) nounwind

declare i32 @klee_get_errno()

define i32 @fsync(i32 %fd) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !202

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !218           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !218                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !218

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !220 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !220

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !221 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !221
  ret i32 -1, !dbg !222

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !223 ; <%struct.exe_disk_file_t*> [#uses=1]
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !223 ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb6, !dbg !223

bb3:                                              ; preds = %bb1
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %11 = load i32* %10, align 4, !dbg !224         ; <i32> [#uses=1]
  %12 = tail call i32 (i32, ...)* @syscall(i32 118, i32 %11) nounwind, !dbg !224 ; <i32> [#uses=3]
  %13 = icmp eq i32 %12, -1, !dbg !226            ; <i1> [#uses=1]
  br i1 %13, label %bb4, label %bb6, !dbg !226

bb4:                                              ; preds = %bb3
  %14 = tail call i32* @__errno_location() nounwind readnone, !dbg !227 ; <i32*> [#uses=1]
  %15 = tail call i32 @klee_get_errno() nounwind, !dbg !227 ; <i32> [#uses=1]
  store i32 %15, i32* %14, align 4, !dbg !227
  ret i32 %12, !dbg !222

bb6:                                              ; preds = %bb3, %bb1
  %.0 = phi i32 [ 0, %bb1 ], [ %12, %bb3 ]        ; <i32> [#uses=1]
  ret i32 %.0, !dbg !222
}

define i32 @fstatfs(i32 %fd, %struct.statfs* %buf) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !228

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !261           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !261                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !261

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !262 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !262

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !263 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !263
  ret i32 -1, !dbg !264

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !265 ; <%struct.exe_disk_file_t*> [#uses=1]
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !265 ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb2, !dbg !265

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !266
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !267 ; <i32*> [#uses=1]
  store i32 9, i32* %10, align 4, !dbg !267
  ret i32 -1, !dbg !264

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !268         ; <i32> [#uses=1]
  %13 = tail call i32 (i32, ...)* @syscall(i32 100, i32 %12, %struct.statfs* %buf) nounwind, !dbg !268 ; <i32> [#uses=3]
  %14 = icmp eq i32 %13, -1, !dbg !270            ; <i1> [#uses=1]
  br i1 %14, label %bb4, label %bb6, !dbg !270

bb4:                                              ; preds = %bb3
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !271 ; <i32*> [#uses=1]
  %16 = tail call i32 @klee_get_errno() nounwind, !dbg !271 ; <i32> [#uses=1]
  store i32 %16, i32* %15, align 4, !dbg !271
  ret i32 %13, !dbg !264

bb6:                                              ; preds = %bb3
  ret i32 %13, !dbg !264
}

define i32 @__fd_ftruncate(i32 %fd, i64 %length) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %__get_file.exit.thread, !dbg !272

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !275           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !275                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %__get_file.exit.thread, label %__get_file.exit, !dbg !275

__get_file.exit.thread:                           ; preds = %bb.i, %entry
  %4 = load i32* @n_calls.4747, align 4, !dbg !276 ; <i32> [#uses=1]
  %5 = add nsw i32 %4, 1, !dbg !276               ; <i32> [#uses=1]
  store i32 %5, i32* @n_calls.4747, align 4, !dbg !276
  br label %bb

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %7 = load i32* @n_calls.4747, align 4, !dbg !276 ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 1, !dbg !276               ; <i32> [#uses=2]
  store i32 %8, i32* @n_calls.4747, align 4, !dbg !276
  %9 = icmp eq %struct.exe_file_t* %6, null, !dbg !277 ; <i1> [#uses=1]
  br i1 %9, label %bb, label %bb1, !dbg !277

bb:                                               ; preds = %__get_file.exit.thread, %__get_file.exit
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !278 ; <i32*> [#uses=1]
  store i32 9, i32* %10, align 4, !dbg !278
  ret i32 -1, !dbg !279

bb1:                                              ; preds = %__get_file.exit
  %11 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !280 ; <i32> [#uses=2]
  %12 = icmp eq i32 %11, 0, !dbg !280             ; <i1> [#uses=1]
  br i1 %12, label %bb4, label %bb2, !dbg !280

bb2:                                              ; preds = %bb1
  %13 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 9), align 4, !dbg !280 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4, !dbg !280         ; <i32> [#uses=1]
  %15 = icmp eq i32 %14, %8, !dbg !280            ; <i1> [#uses=1]
  br i1 %15, label %bb3, label %bb4, !dbg !280

bb3:                                              ; preds = %bb2
  %16 = add i32 %11, -1                           ; <i32> [#uses=1]
  store i32 %16, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !281
  %17 = tail call i32* @__errno_location() nounwind readnone, !dbg !282 ; <i32*> [#uses=1]
  store i32 5, i32* %17, align 4, !dbg !282
  ret i32 -1, !dbg !279

bb4:                                              ; preds = %bb1, %bb2
  %18 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %19 = load %struct.exe_disk_file_t** %18, align 4, !dbg !283 ; <%struct.exe_disk_file_t*> [#uses=1]
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !283 ; <i1> [#uses=1]
  br i1 %20, label %bb6, label %bb5, !dbg !283

bb5:                                              ; preds = %bb4
  tail call void @klee_warning(i8* getelementptr inbounds ([30 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !284
  %21 = tail call i32* @__errno_location() nounwind readnone, !dbg !285 ; <i32*> [#uses=1]
  store i32 5, i32* %21, align 4, !dbg !285
  ret i32 -1, !dbg !279

bb6:                                              ; preds = %bb4
  %22 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %23 = load i32* %22, align 4, !dbg !286         ; <i32> [#uses=1]
  %24 = tail call i32 (i32, ...)* @syscall(i32 194, i32 %23, i64 %length) nounwind, !dbg !286 ; <i32> [#uses=3]
  %25 = icmp eq i32 %24, -1, !dbg !288            ; <i1> [#uses=1]
  br i1 %25, label %bb7, label %bb9, !dbg !288

bb7:                                              ; preds = %bb6
  %26 = tail call i32* @__errno_location() nounwind readnone, !dbg !289 ; <i32*> [#uses=1]
  %27 = tail call i32 @klee_get_errno() nounwind, !dbg !289 ; <i32> [#uses=1]
  store i32 %27, i32* %26, align 4, !dbg !289
  ret i32 %24, !dbg !279

bb9:                                              ; preds = %bb6
  ret i32 %24, !dbg !279
}

define i32 @fchown(i32 %fd, i32 %owner, i32 %group) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !290

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !298           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !298                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !298

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !299 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !299

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !300 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !300
  ret i32 -1, !dbg !301

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !302 ; <%struct.exe_disk_file_t*> [#uses=1]
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !302 ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb2, !dbg !302

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0)) nounwind
  %10 = tail call i32* @__errno_location() nounwind readnone ; <i32*> [#uses=1]
  store i32 1, i32* %10, align 4
  ret i32 -1, !dbg !301

bb3:                                              ; preds = %bb1
  %11 = tail call i32 (i32, ...)* @syscall(i32 95, i32 %fd, i32 %owner, i32 %group) nounwind, !dbg !303 ; <i32> [#uses=3]
  %12 = icmp eq i32 %11, -1, !dbg !305            ; <i1> [#uses=1]
  br i1 %12, label %bb4, label %bb6, !dbg !305

bb4:                                              ; preds = %bb3
  %13 = tail call i32* @__errno_location() nounwind readnone, !dbg !306 ; <i32*> [#uses=1]
  %14 = tail call i32 @klee_get_errno() nounwind, !dbg !306 ; <i32> [#uses=1]
  store i32 %14, i32* %13, align 4, !dbg !306
  ret i32 %11, !dbg !301

bb6:                                              ; preds = %bb3
  ret i32 %11, !dbg !301
}

define i32 @fchdir(i32 %fd) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !307

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !311           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !311                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !311

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !312 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !312

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !313 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !313
  ret i32 -1, !dbg !314

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !315 ; <%struct.exe_disk_file_t*> [#uses=1]
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !315 ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb2, !dbg !315

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !316
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !317 ; <i32*> [#uses=1]
  store i32 2, i32* %10, align 4, !dbg !317
  ret i32 -1, !dbg !314

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !318         ; <i32> [#uses=1]
  %13 = tail call i32 (i32, ...)* @syscall(i32 133, i32 %12) nounwind, !dbg !318 ; <i32> [#uses=3]
  %14 = icmp eq i32 %13, -1, !dbg !320            ; <i1> [#uses=1]
  br i1 %14, label %bb4, label %bb6, !dbg !320

bb4:                                              ; preds = %bb3
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !321 ; <i32*> [#uses=1]
  %16 = tail call i32 @klee_get_errno() nounwind, !dbg !321 ; <i32> [#uses=1]
  store i32 %16, i32* %15, align 4, !dbg !321
  ret i32 %13, !dbg !314

bb6:                                              ; preds = %bb3
  ret i32 %13, !dbg !314
}

define internal fastcc i8* @__concretize_ptr(i8* %p) nounwind {
entry:
  %0 = ptrtoint i8* %p to i32, !dbg !322          ; <i32> [#uses=1]
  %1 = tail call i32 @klee_get_valuel(i32 %0) nounwind, !dbg !322 ; <i32> [#uses=1]
  %2 = inttoptr i32 %1 to i8*, !dbg !322          ; <i8*> [#uses=2]
  %3 = icmp eq i8* %2, %p, !dbg !327              ; <i1> [#uses=1]
  %4 = zext i1 %3 to i32, !dbg !327               ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %4) nounwind, !dbg !327
  ret i8* %2, !dbg !328
}

declare i32 @klee_get_valuel(i32)

declare void @klee_assume(i32)

define i8* @getcwd(i8* %buf, i32 %size) nounwind {
entry:
  %0 = load i32* @n_calls.5255, align 4, !dbg !329 ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 1, !dbg !329               ; <i32> [#uses=2]
  store i32 %1, i32* @n_calls.5255, align 4, !dbg !329
  %2 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !331 ; <i32> [#uses=2]
  %3 = icmp eq i32 %2, 0, !dbg !331               ; <i1> [#uses=1]
  br i1 %3, label %bb2, label %bb, !dbg !331

bb:                                               ; preds = %entry
  %4 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 10), align 4, !dbg !331 ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4, !dbg !331           ; <i32> [#uses=1]
  %6 = icmp eq i32 %5, %1, !dbg !331              ; <i1> [#uses=1]
  br i1 %6, label %bb1, label %bb2, !dbg !331

bb1:                                              ; preds = %bb
  %7 = add i32 %2, -1                             ; <i32> [#uses=1]
  store i32 %7, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !332
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !333 ; <i32*> [#uses=1]
  store i32 34, i32* %8, align 4, !dbg !333
  ret i8* null, !dbg !334

bb2:                                              ; preds = %entry, %bb
  %9 = icmp eq i8* %buf, null, !dbg !335          ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb6, !dbg !335

bb3:                                              ; preds = %bb2
  %10 = icmp eq i32 %size, 0, !dbg !336           ; <i1> [#uses=1]
  %size_addr.0 = select i1 %10, i32 1024, i32 %size ; <i32> [#uses=2]
  %11 = tail call noalias i8* @malloc(i32 %size_addr.0) nounwind, !dbg !337 ; <i8*> [#uses=1]
  br label %bb6, !dbg !337

bb6:                                              ; preds = %bb3, %bb2
  %size_addr.1 = phi i32 [ %size_addr.0, %bb3 ], [ %size, %bb2 ] ; <i32> [#uses=2]
  %buf_addr.0 = phi i8* [ %11, %bb3 ], [ %buf, %bb2 ] ; <i8*> [#uses=2]
  %12 = ptrtoint i8* %buf_addr.0 to i32, !dbg !338 ; <i32> [#uses=1]
  %13 = tail call i32 @klee_get_valuel(i32 %12) nounwind, !dbg !338 ; <i32> [#uses=1]
  %14 = inttoptr i32 %13 to i8*, !dbg !338        ; <i8*> [#uses=4]
  %15 = icmp eq i8* %14, %buf_addr.0, !dbg !340   ; <i1> [#uses=1]
  %16 = zext i1 %15 to i32, !dbg !340             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %16) nounwind, !dbg !340
  %17 = tail call i32 @klee_get_valuel(i32 %size_addr.1) nounwind, !dbg !341 ; <i32> [#uses=3]
  %18 = icmp eq i32 %17, %size_addr.1, !dbg !347  ; <i1> [#uses=1]
  %19 = zext i1 %18 to i32, !dbg !347             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %19) nounwind, !dbg !347
  tail call void @klee_check_memory_access(i8* %14, i32 %17) nounwind, !dbg !348
  %20 = tail call i32 (i32, ...)* @syscall(i32 183, i8* %14, i32 %17) nounwind, !dbg !349 ; <i32> [#uses=1]
  %21 = icmp eq i32 %20, -1, !dbg !350            ; <i1> [#uses=1]
  br i1 %21, label %bb7, label %bb9, !dbg !350

bb7:                                              ; preds = %bb6
  %22 = tail call i32* @__errno_location() nounwind readnone, !dbg !351 ; <i32*> [#uses=1]
  %23 = tail call i32 @klee_get_errno() nounwind, !dbg !351 ; <i32> [#uses=1]
  store i32 %23, i32* %22, align 4, !dbg !351
  ret i8* null, !dbg !334

bb9:                                              ; preds = %bb6
  ret i8* %14, !dbg !334
}

declare noalias i8* @malloc(i32) nounwind

declare void @klee_check_memory_access(i8*, i32)

define i32 @__fd_statfs(i8* %path, %struct.statfs* %buf) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !352         ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !358                ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb.i, !dbg !358

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !358 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !358            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !358                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !358

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !359 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !360               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !360              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !360              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !360

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !361 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !362 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !362 ; <%struct.stat64*> [#uses=1]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !362 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !362         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !362             ; <i1> [#uses=1]
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !362

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !359                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !359

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !359           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb1, !dbg !359

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !361 ; <%struct.exe_disk_file_t*> [#uses=1]
  %phitmp = icmp eq %struct.exe_disk_file_t* %19, null ; <i1> [#uses=1]
  br i1 %phitmp, label %bb1, label %bb, !dbg !363

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !364
  %20 = tail call i32* @__errno_location() nounwind readnone, !dbg !365 ; <i32*> [#uses=1]
  store i32 2, i32* %20, align 4, !dbg !365
  ret i32 -1, !dbg !366

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %21 = tail call fastcc i8* @__concretize_ptr(i8* %path) nounwind, !dbg !367 ; <i8*> [#uses=1]
  br label %bb.i6, !dbg !370

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %21, %bb1 ], [ %sc.0.i, %bb6.i8 ] ; <i8*> [#uses=7]
  %22 = phi i32 [ 0, %bb1 ], [ %34, %bb6.i8 ]     ; <i32> [#uses=3]
  %tmp.i = add i32 %22, -1                        ; <i32> [#uses=1]
  %23 = load i8* %sc.1.i, align 1, !dbg !371      ; <i8> [#uses=3]
  %24 = and i32 %tmp.i, %22, !dbg !372            ; <i32> [#uses=1]
  %25 = icmp eq i32 %24, 0, !dbg !372             ; <i1> [#uses=1]
  br i1 %25, label %bb1.i, label %bb5.i, !dbg !372

bb1.i:                                            ; preds = %bb.i6
  switch i8 %23, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !373
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !374
  %26 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !374 ; <i8*> [#uses=1]
  br label %bb6.i8, !dbg !374

bb5.i:                                            ; preds = %bb.i6
  %27 = sext i8 %23 to i32, !dbg !375             ; <i32> [#uses=1]
  %28 = tail call i32 @klee_get_valuel(i32 %27) nounwind, !dbg !375 ; <i32> [#uses=1]
  %29 = trunc i32 %28 to i8, !dbg !375            ; <i8> [#uses=3]
  %30 = icmp eq i8 %29, %23, !dbg !376            ; <i1> [#uses=1]
  %31 = zext i1 %30 to i32, !dbg !376             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %31) nounwind, !dbg !376
  store i8 %29, i8* %sc.1.i, align 1, !dbg !377
  %32 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !377 ; <i8*> [#uses=1]
  %33 = icmp eq i8 %29, 0, !dbg !378              ; <i1> [#uses=1]
  br i1 %33, label %__concretize_string.exit, label %bb6.i8, !dbg !378

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %26, %bb4.i7 ], [ %32, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %34 = add i32 %22, 1, !dbg !370                 ; <i32> [#uses=1]
  br label %bb.i6, !dbg !370

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %35 = tail call i32 (i32, ...)* @syscall(i32 99, i8* %path, %struct.statfs* %buf) nounwind, !dbg !368 ; <i32> [#uses=3]
  %36 = icmp eq i32 %35, -1, !dbg !379            ; <i1> [#uses=1]
  br i1 %36, label %bb2, label %bb4, !dbg !379

bb2:                                              ; preds = %__concretize_string.exit
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !380 ; <i32*> [#uses=1]
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !380 ; <i32> [#uses=1]
  store i32 %38, i32* %37, align 4, !dbg !380
  ret i32 %35, !dbg !366

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %35, !dbg !366
}

define i32 @lchown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !381         ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !387                ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb.i, !dbg !387

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !387 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !387            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !387                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !387

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !388 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !389               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !389              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !389              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !389

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !390 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !391 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !391 ; <%struct.stat64*> [#uses=1]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !391 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !391         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !391             ; <i1> [#uses=1]
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !391

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !388                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !388

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !388           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb1, !dbg !388

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !390 ; <%struct.exe_disk_file_t*> [#uses=1]
  %phitmp = icmp eq %struct.exe_disk_file_t* %19, null ; <i1> [#uses=1]
  br i1 %phitmp, label %bb1, label %bb, !dbg !392

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0)) nounwind
  %20 = tail call i32* @__errno_location() nounwind readnone ; <i32*> [#uses=1]
  store i32 1, i32* %20, align 4
  ret i32 -1, !dbg !393

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %21 = tail call fastcc i8* @__concretize_ptr(i8* %path) nounwind, !dbg !394 ; <i8*> [#uses=1]
  br label %bb.i6, !dbg !397

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %21, %bb1 ], [ %sc.0.i, %bb6.i8 ] ; <i8*> [#uses=7]
  %22 = phi i32 [ 0, %bb1 ], [ %34, %bb6.i8 ]     ; <i32> [#uses=3]
  %tmp.i = add i32 %22, -1                        ; <i32> [#uses=1]
  %23 = load i8* %sc.1.i, align 1, !dbg !398      ; <i8> [#uses=3]
  %24 = and i32 %tmp.i, %22, !dbg !399            ; <i32> [#uses=1]
  %25 = icmp eq i32 %24, 0, !dbg !399             ; <i1> [#uses=1]
  br i1 %25, label %bb1.i, label %bb5.i, !dbg !399

bb1.i:                                            ; preds = %bb.i6
  switch i8 %23, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !400
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !401
  %26 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !401 ; <i8*> [#uses=1]
  br label %bb6.i8, !dbg !401

bb5.i:                                            ; preds = %bb.i6
  %27 = sext i8 %23 to i32, !dbg !402             ; <i32> [#uses=1]
  %28 = tail call i32 @klee_get_valuel(i32 %27) nounwind, !dbg !402 ; <i32> [#uses=1]
  %29 = trunc i32 %28 to i8, !dbg !402            ; <i8> [#uses=3]
  %30 = icmp eq i8 %29, %23, !dbg !403            ; <i1> [#uses=1]
  %31 = zext i1 %30 to i32, !dbg !403             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %31) nounwind, !dbg !403
  store i8 %29, i8* %sc.1.i, align 1, !dbg !404
  %32 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !404 ; <i8*> [#uses=1]
  %33 = icmp eq i8 %29, 0, !dbg !405              ; <i1> [#uses=1]
  br i1 %33, label %__concretize_string.exit, label %bb6.i8, !dbg !405

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %26, %bb4.i7 ], [ %32, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %34 = add i32 %22, 1, !dbg !397                 ; <i32> [#uses=1]
  br label %bb.i6, !dbg !397

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %35 = tail call i32 (i32, ...)* @syscall(i32 182, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !395 ; <i32> [#uses=3]
  %36 = icmp eq i32 %35, -1, !dbg !406            ; <i1> [#uses=1]
  br i1 %36, label %bb2, label %bb4, !dbg !406

bb2:                                              ; preds = %__concretize_string.exit
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !407 ; <i32*> [#uses=1]
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !407 ; <i32> [#uses=1]
  store i32 %38, i32* %37, align 4, !dbg !407
  ret i32 %35, !dbg !393

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %35, !dbg !393
}

define i32 @chown(i8* %path, i32 %owner, i32 %group) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !408         ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !412                ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb.i, !dbg !412

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !412 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !412            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !412                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !412

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !413 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !414               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !414              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !414              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !414

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !415 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !416 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !416 ; <%struct.stat64*> [#uses=1]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !416 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !416         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !416             ; <i1> [#uses=1]
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !416

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !413                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !413

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !413           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb1, !dbg !413

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !415 ; <%struct.exe_disk_file_t*> [#uses=1]
  %phitmp = icmp eq %struct.exe_disk_file_t* %19, null ; <i1> [#uses=1]
  br i1 %phitmp, label %bb1, label %bb, !dbg !417

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str2, i32 0, i32 0)) nounwind
  %20 = tail call i32* @__errno_location() nounwind readnone ; <i32*> [#uses=1]
  store i32 1, i32* %20, align 4
  ret i32 -1, !dbg !418

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %21 = tail call fastcc i8* @__concretize_ptr(i8* %path) nounwind, !dbg !419 ; <i8*> [#uses=1]
  br label %bb.i6, !dbg !422

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %21, %bb1 ], [ %sc.0.i, %bb6.i8 ] ; <i8*> [#uses=7]
  %22 = phi i32 [ 0, %bb1 ], [ %34, %bb6.i8 ]     ; <i32> [#uses=3]
  %tmp.i = add i32 %22, -1                        ; <i32> [#uses=1]
  %23 = load i8* %sc.1.i, align 1, !dbg !423      ; <i8> [#uses=3]
  %24 = and i32 %tmp.i, %22, !dbg !424            ; <i32> [#uses=1]
  %25 = icmp eq i32 %24, 0, !dbg !424             ; <i1> [#uses=1]
  br i1 %25, label %bb1.i, label %bb5.i, !dbg !424

bb1.i:                                            ; preds = %bb.i6
  switch i8 %23, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !425
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !426
  %26 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !426 ; <i8*> [#uses=1]
  br label %bb6.i8, !dbg !426

bb5.i:                                            ; preds = %bb.i6
  %27 = sext i8 %23 to i32, !dbg !427             ; <i32> [#uses=1]
  %28 = tail call i32 @klee_get_valuel(i32 %27) nounwind, !dbg !427 ; <i32> [#uses=1]
  %29 = trunc i32 %28 to i8, !dbg !427            ; <i8> [#uses=3]
  %30 = icmp eq i8 %29, %23, !dbg !428            ; <i1> [#uses=1]
  %31 = zext i1 %30 to i32, !dbg !428             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %31) nounwind, !dbg !428
  store i8 %29, i8* %sc.1.i, align 1, !dbg !429
  %32 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !429 ; <i8*> [#uses=1]
  %33 = icmp eq i8 %29, 0, !dbg !430              ; <i1> [#uses=1]
  br i1 %33, label %__concretize_string.exit, label %bb6.i8, !dbg !430

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %26, %bb4.i7 ], [ %32, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %34 = add i32 %22, 1, !dbg !422                 ; <i32> [#uses=1]
  br label %bb.i6, !dbg !422

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %35 = tail call i32 (i32, ...)* @syscall(i32 182, i8* %path, i32 %owner, i32 %group) nounwind, !dbg !420 ; <i32> [#uses=3]
  %36 = icmp eq i32 %35, -1, !dbg !431            ; <i1> [#uses=1]
  br i1 %36, label %bb2, label %bb4, !dbg !431

bb2:                                              ; preds = %__concretize_string.exit
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !432 ; <i32*> [#uses=1]
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !432 ; <i32> [#uses=1]
  store i32 %38, i32* %37, align 4, !dbg !432
  ret i32 %35, !dbg !418

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %35, !dbg !418
}

define i32 @chdir(i8* %path) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !433         ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !437                ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb.i, !dbg !437

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !437 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !437            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !437                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !437

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !438 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !439               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !439              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !439              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !439

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !440 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !441 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !441 ; <%struct.stat64*> [#uses=1]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !441 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !441         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !441             ; <i1> [#uses=1]
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !441

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !438                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !438

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !438           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb1, !dbg !438

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !440 ; <%struct.exe_disk_file_t*> [#uses=1]
  %phitmp = icmp eq %struct.exe_disk_file_t* %19, null ; <i1> [#uses=1]
  br i1 %phitmp, label %bb1, label %bb, !dbg !442

bb:                                               ; preds = %__get_sym_file.exit
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !443
  %20 = tail call i32* @__errno_location() nounwind readnone, !dbg !444 ; <i32*> [#uses=1]
  store i32 2, i32* %20, align 4, !dbg !444
  ret i32 -1, !dbg !445

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %21 = tail call fastcc i8* @__concretize_ptr(i8* %path) nounwind, !dbg !446 ; <i8*> [#uses=1]
  br label %bb.i6, !dbg !449

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %21, %bb1 ], [ %sc.0.i, %bb6.i8 ] ; <i8*> [#uses=7]
  %22 = phi i32 [ 0, %bb1 ], [ %34, %bb6.i8 ]     ; <i32> [#uses=3]
  %tmp.i = add i32 %22, -1                        ; <i32> [#uses=1]
  %23 = load i8* %sc.1.i, align 1, !dbg !450      ; <i8> [#uses=3]
  %24 = and i32 %tmp.i, %22, !dbg !451            ; <i32> [#uses=1]
  %25 = icmp eq i32 %24, 0, !dbg !451             ; <i1> [#uses=1]
  br i1 %25, label %bb1.i, label %bb5.i, !dbg !451

bb1.i:                                            ; preds = %bb.i6
  switch i8 %23, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !452
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !453
  %26 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !453 ; <i8*> [#uses=1]
  br label %bb6.i8, !dbg !453

bb5.i:                                            ; preds = %bb.i6
  %27 = sext i8 %23 to i32, !dbg !454             ; <i32> [#uses=1]
  %28 = tail call i32 @klee_get_valuel(i32 %27) nounwind, !dbg !454 ; <i32> [#uses=1]
  %29 = trunc i32 %28 to i8, !dbg !454            ; <i8> [#uses=3]
  %30 = icmp eq i8 %29, %23, !dbg !455            ; <i1> [#uses=1]
  %31 = zext i1 %30 to i32, !dbg !455             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %31) nounwind, !dbg !455
  store i8 %29, i8* %sc.1.i, align 1, !dbg !456
  %32 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !456 ; <i8*> [#uses=1]
  %33 = icmp eq i8 %29, 0, !dbg !457              ; <i1> [#uses=1]
  br i1 %33, label %__concretize_string.exit, label %bb6.i8, !dbg !457

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %26, %bb4.i7 ], [ %32, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %34 = add i32 %22, 1, !dbg !449                 ; <i32> [#uses=1]
  br label %bb.i6, !dbg !449

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %35 = tail call i32 (i32, ...)* @syscall(i32 12, i8* %path) nounwind, !dbg !447 ; <i32> [#uses=3]
  %36 = icmp eq i32 %35, -1, !dbg !458            ; <i1> [#uses=1]
  br i1 %36, label %bb2, label %bb4, !dbg !458

bb2:                                              ; preds = %__concretize_string.exit
  %37 = tail call i32* @__errno_location() nounwind readnone, !dbg !459 ; <i32*> [#uses=1]
  %38 = tail call i32 @klee_get_errno() nounwind, !dbg !459 ; <i32> [#uses=1]
  store i32 %38, i32* %37, align 4, !dbg !459
  ret i32 %35, !dbg !445

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %35, !dbg !445
}

define i32 @select(i32 %nfds, %struct.fd_set* %read, %struct.fd_set* %write, %struct.fd_set* %except, %struct.timespec* nocapture %timeout) nounwind {
entry:
  %in_read = alloca %struct.fd_set, align 8       ; <%struct.fd_set*> [#uses=2]
  %in_write = alloca %struct.fd_set, align 8      ; <%struct.fd_set*> [#uses=4]
  %in_except = alloca %struct.fd_set, align 8     ; <%struct.fd_set*> [#uses=4]
  %os_read = alloca %struct.fd_set, align 8       ; <%struct.fd_set*> [#uses=4]
  %os_write = alloca %struct.fd_set, align 8      ; <%struct.fd_set*> [#uses=4]
  %os_except = alloca %struct.fd_set, align 8     ; <%struct.fd_set*> [#uses=4]
  %tv = alloca %struct.timespec, align 8          ; <%struct.timespec*> [#uses=3]
  %0 = icmp eq %struct.fd_set* %read, null, !dbg !460 ; <i1> [#uses=2]
  %in_read3 = bitcast %struct.fd_set* %in_read to i8*, !dbg !482 ; <i8*> [#uses=2]
  br i1 %0, label %bb2, label %bb, !dbg !460

bb:                                               ; preds = %entry
  %1 = bitcast %struct.fd_set* %read to i8*, !dbg !483 ; <i8*> [#uses=2]
  call void @llvm.memcpy.i32(i8* %in_read3, i8* %1, i32 128, i32 4), !dbg !483
  call void @llvm.memset.i32(i8* %1, i8 0, i32 128, i32 4), !dbg !484
  br label %bb4, !dbg !484

bb2:                                              ; preds = %entry
  call void @llvm.memset.i32(i8* %in_read3, i8 0, i32 128, i32 8), !dbg !482
  br label %bb4, !dbg !482

bb4:                                              ; preds = %bb2, %bb
  %2 = icmp eq %struct.fd_set* %write, null, !dbg !485 ; <i1> [#uses=2]
  %in_write8 = bitcast %struct.fd_set* %in_write to i8*, !dbg !486 ; <i8*> [#uses=2]
  br i1 %2, label %bb7, label %bb5, !dbg !485

bb5:                                              ; preds = %bb4
  %3 = bitcast %struct.fd_set* %write to i8*, !dbg !487 ; <i8*> [#uses=2]
  call void @llvm.memcpy.i32(i8* %in_write8, i8* %3, i32 128, i32 4), !dbg !487
  call void @llvm.memset.i32(i8* %3, i8 0, i32 128, i32 4), !dbg !488
  br label %bb9, !dbg !488

bb7:                                              ; preds = %bb4
  call void @llvm.memset.i32(i8* %in_write8, i8 0, i32 128, i32 8), !dbg !486
  br label %bb9, !dbg !486

bb9:                                              ; preds = %bb7, %bb5
  %4 = icmp eq %struct.fd_set* %except, null, !dbg !489 ; <i1> [#uses=2]
  %in_except13 = bitcast %struct.fd_set* %in_except to i8*, !dbg !490 ; <i8*> [#uses=2]
  br i1 %4, label %bb12, label %bb10, !dbg !489

bb10:                                             ; preds = %bb9
  %5 = bitcast %struct.fd_set* %except to i8*, !dbg !491 ; <i8*> [#uses=2]
  call void @llvm.memcpy.i32(i8* %in_except13, i8* %5, i32 128, i32 4), !dbg !491
  call void @llvm.memset.i32(i8* %5, i8 0, i32 128, i32 4), !dbg !492
  br label %bb14, !dbg !492

bb12:                                             ; preds = %bb9
  call void @llvm.memset.i32(i8* %in_except13, i8 0, i32 128, i32 8), !dbg !490
  br label %bb14, !dbg !490

bb14:                                             ; preds = %bb12, %bb10
  %os_read15 = bitcast %struct.fd_set* %os_read to i8*, !dbg !493 ; <i8*> [#uses=1]
  call void @llvm.memset.i32(i8* %os_read15, i8 0, i32 128, i32 8), !dbg !493
  %os_write16 = bitcast %struct.fd_set* %os_write to i8*, !dbg !494 ; <i8*> [#uses=1]
  call void @llvm.memset.i32(i8* %os_write16, i8 0, i32 128, i32 8), !dbg !494
  %os_except17 = bitcast %struct.fd_set* %os_except to i8*, !dbg !495 ; <i8*> [#uses=1]
  call void @llvm.memset.i32(i8* %os_except17, i8 0, i32 128, i32 8), !dbg !495
  br label %bb40, !dbg !496

bb18:                                             ; preds = %bb40
  %6 = sdiv i32 %79, 32, !dbg !497                ; <i32> [#uses=10]
  %7 = getelementptr inbounds %struct.fd_set* %in_read, i32 0, i32 0, i32 %6 ; <i32*> [#uses=1]
  %8 = load i32* %7, align 4, !dbg !497           ; <i32> [#uses=1]
  %9 = srem i32 %79, 32, !dbg !497                ; <i32> [#uses=1]
  %10 = shl i32 1, %9, !dbg !497                  ; <i32> [#uses=10]
  %11 = and i32 %10, %8, !dbg !497                ; <i32> [#uses=2]
  %12 = icmp eq i32 %11, 0, !dbg !497             ; <i1> [#uses=1]
  br i1 %12, label %bb19, label %bb21, !dbg !497

bb19:                                             ; preds = %bb18
  %13 = getelementptr inbounds %struct.fd_set* %in_write, i32 0, i32 0, i32 %6 ; <i32*> [#uses=1]
  %14 = load i32* %13, align 4, !dbg !497         ; <i32> [#uses=1]
  %15 = and i32 %10, %14, !dbg !497               ; <i32> [#uses=1]
  %16 = icmp eq i32 %15, 0, !dbg !497             ; <i1> [#uses=1]
  br i1 %16, label %bb20, label %bb21, !dbg !497

bb20:                                             ; preds = %bb19
  %17 = getelementptr inbounds %struct.fd_set* %in_except, i32 0, i32 0, i32 %6 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4, !dbg !497         ; <i32> [#uses=1]
  %19 = and i32 %10, %18, !dbg !497               ; <i32> [#uses=1]
  %20 = icmp eq i32 %19, 0, !dbg !497             ; <i1> [#uses=1]
  br i1 %20, label %bb39, label %bb21, !dbg !497

bb21:                                             ; preds = %bb20, %bb19, %bb18
  %21 = icmp ult i32 %79, 32                      ; <i1> [#uses=1]
  br i1 %21, label %bb.i, label %bb22, !dbg !498

bb.i:                                             ; preds = %bb21
  %22 = load i32* %scevgep79, align 4, !dbg !501  ; <i32> [#uses=1]
  %23 = and i32 %22, 1, !dbg !501                 ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %23, 0                  ; <i1> [#uses=1]
  %24 = icmp eq %struct.exe_file_t* %scevgep76, null, !dbg !502 ; <i1> [#uses=1]
  %or.cond = or i1 %toBool.i, %24                 ; <i1> [#uses=1]
  br i1 %or.cond, label %bb22, label %bb23, !dbg !501

bb22:                                             ; preds = %bb21, %bb.i
  %25 = call i32* @__errno_location() nounwind readnone, !dbg !503 ; <i32*> [#uses=1]
  store i32 9, i32* %25, align 4, !dbg !503
  ret i32 -1, !dbg !504

bb23:                                             ; preds = %bb.i
  %26 = load %struct.exe_disk_file_t** %scevgep78, align 4, !dbg !505 ; <%struct.exe_disk_file_t*> [#uses=1]
  %27 = icmp eq %struct.exe_disk_file_t* %26, null, !dbg !505 ; <i1> [#uses=1]
  %28 = icmp ne i32 %11, 0, !dbg !506             ; <i1> [#uses=2]
  br i1 %27, label %bb31, label %bb24, !dbg !505

bb24:                                             ; preds = %bb23
  br i1 %28, label %bb25, label %bb26, !dbg !506

bb25:                                             ; preds = %bb24
  %29 = getelementptr inbounds %struct.fd_set* %read, i32 0, i32 0, i32 %6 ; <i32*> [#uses=2]
  %30 = load i32* %29, align 4, !dbg !506         ; <i32> [#uses=1]
  %31 = or i32 %10, %30, !dbg !506                ; <i32> [#uses=1]
  store i32 %31, i32* %29, align 4, !dbg !506
  br label %bb26, !dbg !506

bb26:                                             ; preds = %bb24, %bb25
  %32 = getelementptr inbounds %struct.fd_set* %in_write, i32 0, i32 0, i32 %6 ; <i32*> [#uses=1]
  %33 = load i32* %32, align 4, !dbg !507         ; <i32> [#uses=1]
  %34 = and i32 %10, %33, !dbg !507               ; <i32> [#uses=1]
  %35 = icmp eq i32 %34, 0, !dbg !507             ; <i1> [#uses=1]
  br i1 %35, label %bb28, label %bb27, !dbg !507

bb27:                                             ; preds = %bb26
  %36 = getelementptr inbounds %struct.fd_set* %write, i32 0, i32 0, i32 %6 ; <i32*> [#uses=2]
  %37 = load i32* %36, align 4, !dbg !507         ; <i32> [#uses=1]
  %38 = or i32 %10, %37, !dbg !507                ; <i32> [#uses=1]
  store i32 %38, i32* %36, align 4, !dbg !507
  br label %bb28, !dbg !507

bb28:                                             ; preds = %bb26, %bb27
  %39 = getelementptr inbounds %struct.fd_set* %in_except, i32 0, i32 0, i32 %6 ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4, !dbg !508         ; <i32> [#uses=1]
  %41 = and i32 %10, %40, !dbg !508               ; <i32> [#uses=1]
  %42 = icmp eq i32 %41, 0, !dbg !508             ; <i1> [#uses=1]
  br i1 %42, label %bb30, label %bb29, !dbg !508

bb29:                                             ; preds = %bb28
  %43 = getelementptr inbounds %struct.fd_set* %except, i32 0, i32 0, i32 %6 ; <i32*> [#uses=2]
  %44 = load i32* %43, align 4, !dbg !508         ; <i32> [#uses=1]
  %45 = or i32 %10, %44, !dbg !508                ; <i32> [#uses=1]
  store i32 %45, i32* %43, align 4, !dbg !508
  br label %bb30, !dbg !508

bb30:                                             ; preds = %bb28, %bb29
  %46 = add nsw i32 %count.1, 1, !dbg !509        ; <i32> [#uses=1]
  br label %bb39, !dbg !509

bb31:                                             ; preds = %bb23
  br i1 %28, label %bb32, label %bb33, !dbg !510

bb32:                                             ; preds = %bb31
  %47 = load i32* %scevgep7677, align 4, !dbg !510 ; <i32> [#uses=2]
  %48 = sdiv i32 %47, 32, !dbg !510               ; <i32> [#uses=1]
  %49 = getelementptr inbounds %struct.fd_set* %os_read, i32 0, i32 0, i32 %48 ; <i32*> [#uses=2]
  %50 = load i32* %49, align 4, !dbg !510         ; <i32> [#uses=1]
  %51 = srem i32 %47, 32, !dbg !510               ; <i32> [#uses=1]
  %52 = shl i32 1, %51, !dbg !510                 ; <i32> [#uses=1]
  %53 = or i32 %52, %50, !dbg !510                ; <i32> [#uses=1]
  store i32 %53, i32* %49, align 4, !dbg !510
  br label %bb33, !dbg !510

bb33:                                             ; preds = %bb31, %bb32
  %54 = getelementptr inbounds %struct.fd_set* %in_write, i32 0, i32 0, i32 %6 ; <i32*> [#uses=1]
  %55 = load i32* %54, align 4, !dbg !511         ; <i32> [#uses=1]
  %56 = and i32 %10, %55, !dbg !511               ; <i32> [#uses=1]
  %57 = icmp eq i32 %56, 0, !dbg !511             ; <i1> [#uses=1]
  br i1 %57, label %bb35, label %bb34, !dbg !511

bb34:                                             ; preds = %bb33
  %58 = load i32* %scevgep7677, align 4, !dbg !511 ; <i32> [#uses=2]
  %59 = sdiv i32 %58, 32, !dbg !511               ; <i32> [#uses=1]
  %60 = getelementptr inbounds %struct.fd_set* %os_write, i32 0, i32 0, i32 %59 ; <i32*> [#uses=2]
  %61 = load i32* %60, align 4, !dbg !511         ; <i32> [#uses=1]
  %62 = srem i32 %58, 32, !dbg !511               ; <i32> [#uses=1]
  %63 = shl i32 1, %62, !dbg !511                 ; <i32> [#uses=1]
  %64 = or i32 %63, %61, !dbg !511                ; <i32> [#uses=1]
  store i32 %64, i32* %60, align 4, !dbg !511
  br label %bb35, !dbg !511

bb35:                                             ; preds = %bb33, %bb34
  %65 = getelementptr inbounds %struct.fd_set* %in_except, i32 0, i32 0, i32 %6 ; <i32*> [#uses=1]
  %66 = load i32* %65, align 4, !dbg !512         ; <i32> [#uses=1]
  %67 = and i32 %10, %66, !dbg !512               ; <i32> [#uses=1]
  %68 = icmp eq i32 %67, 0, !dbg !512             ; <i1> [#uses=1]
  %.pre = load i32* %scevgep7677, align 4         ; <i32> [#uses=6]
  br i1 %68, label %bb37, label %bb36, !dbg !512

bb36:                                             ; preds = %bb35
  %69 = sdiv i32 %.pre, 32, !dbg !512             ; <i32> [#uses=1]
  %70 = getelementptr inbounds %struct.fd_set* %os_except, i32 0, i32 0, i32 %69 ; <i32*> [#uses=2]
  %71 = load i32* %70, align 4, !dbg !512         ; <i32> [#uses=1]
  %72 = srem i32 %.pre, 32, !dbg !512             ; <i32> [#uses=1]
  %73 = shl i32 1, %72, !dbg !512                 ; <i32> [#uses=1]
  %74 = or i32 %73, %71, !dbg !512                ; <i32> [#uses=1]
  store i32 %74, i32* %70, align 4, !dbg !512
  br label %bb37, !dbg !512

bb37:                                             ; preds = %bb35, %bb36
  %75 = phi i32 [ %.pre, %bb36 ], [ %.pre, %bb35 ] ; <i32> [#uses=0]
  %76 = add nsw i32 %.pre, 1, !dbg !513           ; <i32> [#uses=1]
  %77 = icmp slt i32 %.pre, %os_nfds.1, !dbg !513 ; <i1> [#uses=1]
  %os_nfds.1. = select i1 %77, i32 %os_nfds.1, i32 %76 ; <i32> [#uses=1]
  br label %bb39, !dbg !513

bb39:                                             ; preds = %bb37, %bb20, %bb30
  %count.0 = phi i32 [ %46, %bb30 ], [ %count.1, %bb20 ], [ %count.1, %bb37 ] ; <i32> [#uses=1]
  %os_nfds.0 = phi i32 [ %os_nfds.1, %bb30 ], [ %os_nfds.1, %bb20 ], [ %os_nfds.1., %bb37 ] ; <i32> [#uses=1]
  %78 = add nsw i32 %79, 1, !dbg !496             ; <i32> [#uses=1]
  br label %bb40, !dbg !496

bb40:                                             ; preds = %bb39, %bb14
  %79 = phi i32 [ 0, %bb14 ], [ %78, %bb39 ]      ; <i32> [#uses=9]
  %count.1 = phi i32 [ 0, %bb14 ], [ %count.0, %bb39 ] ; <i32> [#uses=7]
  %os_nfds.1 = phi i32 [ 0, %bb14 ], [ %os_nfds.0, %bb39 ] ; <i32> [#uses=6]
  %scevgep76 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %79 ; <%struct.exe_file_t*> [#uses=1]
  %scevgep7677 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %79, i32 0 ; <i32*> [#uses=3]
  %scevgep78 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %79, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %scevgep79 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %79, i32 1 ; <i32*> [#uses=1]
  %80 = icmp slt i32 %79, %nfds, !dbg !496        ; <i1> [#uses=1]
  br i1 %80, label %bb18, label %bb41, !dbg !496

bb41:                                             ; preds = %bb40
  %81 = icmp sgt i32 %os_nfds.1, 0, !dbg !514     ; <i1> [#uses=1]
  br i1 %81, label %bb42, label %bb61, !dbg !514

bb42:                                             ; preds = %bb41
  %82 = getelementptr inbounds %struct.timespec* %tv, i32 0, i32 0, !dbg !515 ; <i32*> [#uses=1]
  store i32 0, i32* %82, align 8, !dbg !515
  %83 = getelementptr inbounds %struct.timespec* %tv, i32 0, i32 1, !dbg !515 ; <i32*> [#uses=1]
  store i32 0, i32* %83, align 4, !dbg !515
  %84 = call i32 (i32, ...)* @syscall(i32 82, i32 %os_nfds.1, %struct.fd_set* %os_read, %struct.fd_set* %os_write, %struct.fd_set* %os_except, %struct.timespec* %tv) nounwind, !dbg !517 ; <i32> [#uses=2]
  %85 = icmp eq i32 %84, -1, !dbg !518            ; <i1> [#uses=1]
  br i1 %85, label %bb43, label %bb45, !dbg !518

bb43:                                             ; preds = %bb42
  %86 = icmp eq i32 %count.1, 0, !dbg !519        ; <i1> [#uses=1]
  br i1 %86, label %bb44, label %bb61, !dbg !519

bb44:                                             ; preds = %bb43
  %87 = call i32* @__errno_location() nounwind readnone, !dbg !520 ; <i32*> [#uses=1]
  %88 = call i32 @klee_get_errno() nounwind, !dbg !520 ; <i32> [#uses=1]
  store i32 %88, i32* %87, align 4, !dbg !520
  ret i32 -1, !dbg !504

bb45:                                             ; preds = %bb42
  %89 = add nsw i32 %84, %count.1, !dbg !521      ; <i32> [#uses=2]
  %90 = icmp sgt i32 %nfds, 0, !dbg !522          ; <i1> [#uses=1]
  br i1 %90, label %bb46, label %bb61, !dbg !522

bb46:                                             ; preds = %bb45, %bb58
  %91 = phi i32 [ %140, %bb58 ], [ 0, %bb45 ]     ; <i32> [#uses=12]
  %scevgep71 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %91 ; <%struct.exe_file_t*> [#uses=1]
  %scevgep7173 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %91, i32 0 ; <i32*> [#uses=3]
  %scevgep72 = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %91, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %92 = icmp ult i32 %91, 32                      ; <i1> [#uses=1]
  br i1 %92, label %bb.i64, label %bb58, !dbg !523

bb.i64:                                           ; preds = %bb46
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %91, i32 1 ; <i32*> [#uses=1]
  %93 = load i32* %scevgep, align 4, !dbg !526    ; <i32> [#uses=1]
  %94 = and i32 %93, 1, !dbg !526                 ; <i32> [#uses=1]
  %toBool.i63 = icmp eq i32 %94, 0                ; <i1> [#uses=1]
  %95 = icmp eq %struct.exe_file_t* %scevgep71, null, !dbg !527 ; <i1> [#uses=1]
  %or.cond80 = or i1 %toBool.i63, %95             ; <i1> [#uses=1]
  br i1 %or.cond80, label %bb58, label %bb48, !dbg !526

bb48:                                             ; preds = %bb.i64
  %96 = load %struct.exe_disk_file_t** %scevgep72, align 4, !dbg !527 ; <%struct.exe_disk_file_t*> [#uses=1]
  %97 = icmp eq %struct.exe_disk_file_t* %96, null, !dbg !527 ; <i1> [#uses=1]
  br i1 %97, label %bb49, label %bb58, !dbg !527

bb49:                                             ; preds = %bb48
  br i1 %0, label %bb52, label %bb50, !dbg !528

bb50:                                             ; preds = %bb49
  %98 = load i32* %scevgep7173, align 4, !dbg !528 ; <i32> [#uses=2]
  %99 = sdiv i32 %98, 32, !dbg !528               ; <i32> [#uses=1]
  %100 = getelementptr inbounds %struct.fd_set* %os_read, i32 0, i32 0, i32 %99 ; <i32*> [#uses=1]
  %101 = load i32* %100, align 4, !dbg !528       ; <i32> [#uses=1]
  %102 = srem i32 %98, 32, !dbg !528              ; <i32> [#uses=1]
  %103 = shl i32 1, %102, !dbg !528               ; <i32> [#uses=1]
  %104 = and i32 %103, %101, !dbg !528            ; <i32> [#uses=1]
  %105 = icmp eq i32 %104, 0, !dbg !528           ; <i1> [#uses=1]
  br i1 %105, label %bb52, label %bb51, !dbg !528

bb51:                                             ; preds = %bb50
  %106 = sdiv i32 %91, 32, !dbg !528              ; <i32> [#uses=1]
  %107 = getelementptr inbounds %struct.fd_set* %read, i32 0, i32 0, i32 %106 ; <i32*> [#uses=2]
  %108 = load i32* %107, align 4, !dbg !528       ; <i32> [#uses=1]
  %109 = srem i32 %91, 32, !dbg !528              ; <i32> [#uses=1]
  %110 = shl i32 1, %109, !dbg !528               ; <i32> [#uses=1]
  %111 = or i32 %110, %108, !dbg !528             ; <i32> [#uses=1]
  store i32 %111, i32* %107, align 4, !dbg !528
  br label %bb52, !dbg !528

bb52:                                             ; preds = %bb50, %bb49, %bb51
  br i1 %2, label %bb55, label %bb53, !dbg !529

bb53:                                             ; preds = %bb52
  %112 = load i32* %scevgep7173, align 4, !dbg !529 ; <i32> [#uses=2]
  %113 = sdiv i32 %112, 32, !dbg !529             ; <i32> [#uses=1]
  %114 = getelementptr inbounds %struct.fd_set* %os_write, i32 0, i32 0, i32 %113 ; <i32*> [#uses=1]
  %115 = load i32* %114, align 4, !dbg !529       ; <i32> [#uses=1]
  %116 = srem i32 %112, 32, !dbg !529             ; <i32> [#uses=1]
  %117 = shl i32 1, %116, !dbg !529               ; <i32> [#uses=1]
  %118 = and i32 %117, %115, !dbg !529            ; <i32> [#uses=1]
  %119 = icmp eq i32 %118, 0, !dbg !529           ; <i1> [#uses=1]
  br i1 %119, label %bb55, label %bb54, !dbg !529

bb54:                                             ; preds = %bb53
  %120 = sdiv i32 %91, 32, !dbg !529              ; <i32> [#uses=1]
  %121 = getelementptr inbounds %struct.fd_set* %write, i32 0, i32 0, i32 %120 ; <i32*> [#uses=2]
  %122 = load i32* %121, align 4, !dbg !529       ; <i32> [#uses=1]
  %123 = srem i32 %91, 32, !dbg !529              ; <i32> [#uses=1]
  %124 = shl i32 1, %123, !dbg !529               ; <i32> [#uses=1]
  %125 = or i32 %124, %122, !dbg !529             ; <i32> [#uses=1]
  store i32 %125, i32* %121, align 4, !dbg !529
  br label %bb55, !dbg !529

bb55:                                             ; preds = %bb53, %bb52, %bb54
  br i1 %4, label %bb58, label %bb56, !dbg !530

bb56:                                             ; preds = %bb55
  %126 = load i32* %scevgep7173, align 4, !dbg !530 ; <i32> [#uses=2]
  %127 = sdiv i32 %126, 32, !dbg !530             ; <i32> [#uses=1]
  %128 = getelementptr inbounds %struct.fd_set* %os_except, i32 0, i32 0, i32 %127 ; <i32*> [#uses=1]
  %129 = load i32* %128, align 4, !dbg !530       ; <i32> [#uses=1]
  %130 = srem i32 %126, 32, !dbg !530             ; <i32> [#uses=1]
  %131 = shl i32 1, %130, !dbg !530               ; <i32> [#uses=1]
  %132 = and i32 %131, %129, !dbg !530            ; <i32> [#uses=1]
  %133 = icmp eq i32 %132, 0, !dbg !530           ; <i1> [#uses=1]
  br i1 %133, label %bb58, label %bb57, !dbg !530

bb57:                                             ; preds = %bb56
  %134 = sdiv i32 %91, 32, !dbg !530              ; <i32> [#uses=1]
  %135 = getelementptr inbounds %struct.fd_set* %except, i32 0, i32 0, i32 %134 ; <i32*> [#uses=2]
  %136 = load i32* %135, align 4, !dbg !530       ; <i32> [#uses=1]
  %137 = srem i32 %91, 32, !dbg !530              ; <i32> [#uses=1]
  %138 = shl i32 1, %137, !dbg !530               ; <i32> [#uses=1]
  %139 = or i32 %138, %136, !dbg !530             ; <i32> [#uses=1]
  store i32 %139, i32* %135, align 4, !dbg !530
  br label %bb58, !dbg !530

bb58:                                             ; preds = %bb46, %bb.i64, %bb56, %bb55, %bb57, %bb48
  %140 = add nsw i32 %91, 1, !dbg !522            ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %140, %nfds             ; <i1> [#uses=1]
  br i1 %exitcond, label %bb61, label %bb46, !dbg !522

bb61:                                             ; preds = %bb45, %bb58, %bb41, %bb43
  %.0 = phi i32 [ %count.1, %bb43 ], [ %count.1, %bb41 ], [ %89, %bb58 ], [ %89, %bb45 ] ; <i32> [#uses=1]
  ret i32 %.0, !dbg !504
}

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @llvm.memset.i32(i8* nocapture, i8, i32, i32) nounwind

define i32 @close(i32 %fd) nounwind {
entry:
  %0 = load i32* @n_calls.4379, align 4, !dbg !531 ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 1, !dbg !531               ; <i32> [#uses=2]
  store i32 %1, i32* @n_calls.4379, align 4, !dbg !531
  %2 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %2, label %bb.i, label %bb, !dbg !533

bb.i:                                             ; preds = %entry
  %3 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4, !dbg !535           ; <i32> [#uses=1]
  %5 = and i32 %4, 1, !dbg !535                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %5, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !535

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=2]
  %7 = icmp eq %struct.exe_file_t* %6, null, !dbg !536 ; <i1> [#uses=1]
  br i1 %7, label %bb, label %bb1, !dbg !536

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !537 ; <i32*> [#uses=1]
  store i32 9, i32* %8, align 4, !dbg !537
  ret i32 -1, !dbg !538

bb1:                                              ; preds = %__get_file.exit
  %9 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !539 ; <i32> [#uses=2]
  %10 = icmp eq i32 %9, 0, !dbg !539              ; <i1> [#uses=1]
  br i1 %10, label %bb4, label %bb2, !dbg !539

bb2:                                              ; preds = %bb1
  %11 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 8), align 4, !dbg !539 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !539         ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, %1, !dbg !539            ; <i1> [#uses=1]
  br i1 %13, label %bb3, label %bb4, !dbg !539

bb3:                                              ; preds = %bb2
  %14 = add i32 %9, -1                            ; <i32> [#uses=1]
  store i32 %14, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !540
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !541 ; <i32*> [#uses=1]
  store i32 5, i32* %15, align 4, !dbg !541
  ret i32 -1, !dbg !538

bb4:                                              ; preds = %bb1, %bb2
  %16 = bitcast %struct.exe_file_t* %6 to i8*, !dbg !542 ; <i8*> [#uses=1]
  tail call void @llvm.memset.i32(i8* %16, i8 0, i32 20, i32 4), !dbg !542
  ret i32 0, !dbg !538
}

define i32 @dup2(i32 %oldfd, i32 %newfd) nounwind {
entry:
  %0 = icmp ult i32 %oldfd, 32                    ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb1, !dbg !543

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 1 ; <i32*> [#uses=2]
  %2 = load i32* %1, align 4, !dbg !549           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !549                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb1, label %__get_file.exit, !dbg !549

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !550 ; <i1> [#uses=1]
  %6 = icmp ugt i32 %newfd, 31, !dbg !550         ; <i1> [#uses=1]
  %or.cond = or i1 %5, %6                         ; <i1> [#uses=1]
  br i1 %or.cond, label %bb1, label %bb2, !dbg !550

bb1:                                              ; preds = %entry, %bb.i, %__get_file.exit
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !551 ; <i32*> [#uses=1]
  store i32 9, i32* %7, align 4, !dbg !551
  ret i32 -1, !dbg !552

bb2:                                              ; preds = %__get_file.exit
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 1 ; <i32*> [#uses=2]
  %9 = load i32* %8, align 4, !dbg !553           ; <i32> [#uses=1]
  %10 = and i32 %9, 1, !dbg !553                  ; <i32> [#uses=1]
  %toBool = icmp eq i32 %10, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb4, label %bb3, !dbg !553

bb3:                                              ; preds = %bb2
  %11 = load i32* @n_calls.4379, align 4, !dbg !555 ; <i32> [#uses=1]
  %12 = add nsw i32 %11, 1, !dbg !555             ; <i32> [#uses=2]
  store i32 %12, i32* @n_calls.4379, align 4, !dbg !555
  %13 = icmp ult i32 %newfd, 32                   ; <i1> [#uses=1]
  br i1 %13, label %__get_file.exit.i, label %bb.i7, !dbg !556

__get_file.exit.i:                                ; preds = %bb3
  %14 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd ; <%struct.exe_file_t*> [#uses=2]
  %15 = icmp eq %struct.exe_file_t* %14, null, !dbg !558 ; <i1> [#uses=1]
  br i1 %15, label %bb.i7, label %bb1.i8, !dbg !558

bb.i7:                                            ; preds = %__get_file.exit.i, %bb3
  %16 = tail call i32* @__errno_location() nounwind readnone, !dbg !559 ; <i32*> [#uses=1]
  store i32 9, i32* %16, align 4, !dbg !559
  br label %bb4

bb1.i8:                                           ; preds = %__get_file.exit.i
  %17 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !560 ; <i32> [#uses=2]
  %18 = icmp eq i32 %17, 0, !dbg !560             ; <i1> [#uses=1]
  br i1 %18, label %bb4.i, label %bb2.i, !dbg !560

bb2.i:                                            ; preds = %bb1.i8
  %19 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 8), align 4, !dbg !560 ; <i32*> [#uses=1]
  %20 = load i32* %19, align 4, !dbg !560         ; <i32> [#uses=1]
  %21 = icmp eq i32 %20, %12, !dbg !560           ; <i1> [#uses=1]
  br i1 %21, label %bb3.i9, label %bb4.i, !dbg !560

bb3.i9:                                           ; preds = %bb2.i
  %22 = add i32 %17, -1                           ; <i32> [#uses=1]
  store i32 %22, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !561
  %23 = tail call i32* @__errno_location() nounwind readnone, !dbg !562 ; <i32*> [#uses=1]
  store i32 5, i32* %23, align 4, !dbg !562
  br label %bb4

bb4.i:                                            ; preds = %bb2.i, %bb1.i8
  %24 = bitcast %struct.exe_file_t* %14 to i8*, !dbg !563 ; <i8*> [#uses=1]
  tail call void @llvm.memset.i32(i8* %24, i8 0, i32 20, i32 4) nounwind, !dbg !563
  br label %bb4

bb4:                                              ; preds = %bb.i7, %bb4.i, %bb3.i9, %bb2
  %25 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 0 ; <i32*> [#uses=1]
  %26 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 0 ; <i32*> [#uses=1]
  %27 = load i32* %26, align 4, !dbg !564         ; <i32> [#uses=1]
  store i32 %27, i32* %25, align 4, !dbg !564
  %28 = load i32* %1, align 4, !dbg !564          ; <i32> [#uses=1]
  %29 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 2 ; <i64*> [#uses=1]
  %30 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 2 ; <i64*> [#uses=1]
  %31 = load i64* %30, align 4, !dbg !564         ; <i64> [#uses=1]
  store i64 %31, i64* %29, align 4, !dbg !564
  %32 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %newfd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %34 = load %struct.exe_disk_file_t** %33, align 4, !dbg !564 ; <%struct.exe_disk_file_t*> [#uses=1]
  store %struct.exe_disk_file_t* %34, %struct.exe_disk_file_t** %32, align 4, !dbg !564
  %35 = and i32 %28, -3, !dbg !565                ; <i32> [#uses=1]
  store i32 %35, i32* %8, align 4, !dbg !565
  ret i32 %newfd, !dbg !552
}

define i32 @dup(i32 %oldfd) nounwind {
entry:
  %0 = icmp ult i32 %oldfd, 32                    ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !566

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !570           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !570                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !570

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %oldfd ; <%struct.exe_file_t*> [#uses=1]
  %phitmp = icmp eq %struct.exe_file_t* %4, null  ; <i1> [#uses=1]
  br i1 %phitmp, label %bb, label %bb4, !dbg !571

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %5 = tail call i32* @__errno_location() nounwind readnone, !dbg !572 ; <i32*> [#uses=1]
  store i32 9, i32* %5, align 4, !dbg !572
  ret i32 -1, !dbg !573

bb2:                                              ; preds = %bb4
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %10, i32 1 ; <i32*> [#uses=1]
  %6 = load i32* %scevgep, align 4, !dbg !574     ; <i32> [#uses=1]
  %7 = and i32 %6, 1, !dbg !574                   ; <i32> [#uses=1]
  %8 = icmp eq i32 %7, 0, !dbg !574               ; <i1> [#uses=1]
  br i1 %8, label %bb5, label %bb3, !dbg !574

bb3:                                              ; preds = %bb2
  %9 = add nsw i32 %10, 1, !dbg !576              ; <i32> [#uses=1]
  br label %bb4, !dbg !576

bb4:                                              ; preds = %__get_file.exit, %bb3
  %10 = phi i32 [ %9, %bb3 ], [ 0, %__get_file.exit ] ; <i32> [#uses=5]
  %11 = icmp slt i32 %10, 32                      ; <i1> [#uses=1]
  br i1 %11, label %bb2, label %bb5, !dbg !576

bb5:                                              ; preds = %bb4, %bb2
  %12 = icmp eq i32 %10, 32, !dbg !577            ; <i1> [#uses=1]
  br i1 %12, label %bb6, label %bb7, !dbg !577

bb6:                                              ; preds = %bb5
  %13 = tail call i32* @__errno_location() nounwind readnone, !dbg !578 ; <i32*> [#uses=1]
  store i32 24, i32* %13, align 4, !dbg !578
  ret i32 -1, !dbg !573

bb7:                                              ; preds = %bb5
  %14 = tail call i32 @dup2(i32 %oldfd, i32 %10) nounwind, !dbg !579 ; <i32> [#uses=1]
  ret i32 %14, !dbg !573
}

define i32 @fcntl(i32 %fd, i32 %cmd, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=3]
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !580

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=5]
  %2 = load i32* %1, align 4, !dbg !584           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !584                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !584

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !585 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !585

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = call i32* @__errno_location() nounwind readnone, !dbg !586 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !586
  ret i32 -1, !dbg !587

bb1:                                              ; preds = %__get_file.exit
  switch i32 %cmd, label %bb8 [
    i32 1, label %bb11
    i32 3, label %bb11
    i32 9, label %bb11
    i32 11, label %bb11
    i32 1025, label %bb11
    i32 1026, label %bb11
  ]

bb8:                                              ; preds = %bb1
  %ap9 = bitcast i8** %ap to i8*, !dbg !588       ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap9), !dbg !588
  %7 = load i8** %ap, align 4, !dbg !589          ; <i8*> [#uses=2]
  %8 = getelementptr inbounds i8* %7, i32 4, !dbg !589 ; <i8*> [#uses=1]
  store i8* %8, i8** %ap, align 4, !dbg !589
  %9 = bitcast i8* %7 to i32*, !dbg !589          ; <i32*> [#uses=1]
  %10 = load i32* %9, align 4, !dbg !589          ; <i32> [#uses=1]
  call void @llvm.va_end(i8* %ap9), !dbg !590
  br label %bb11, !dbg !590

bb11:                                             ; preds = %bb1, %bb1, %bb1, %bb1, %bb1, %bb1, %bb8
  %arg.0 = phi i32 [ %10, %bb8 ], [ 0, %bb1 ], [ 0, %bb1 ], [ 0, %bb1 ], [ 0, %bb1 ], [ 0, %bb1 ], [ 0, %bb1 ] ; <i32> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %12 = load %struct.exe_disk_file_t** %11, align 4, !dbg !591 ; <%struct.exe_disk_file_t*> [#uses=1]
  %13 = icmp eq %struct.exe_disk_file_t* %12, null, !dbg !591 ; <i1> [#uses=1]
  br i1 %13, label %bb21, label %bb12, !dbg !591

bb12:                                             ; preds = %bb11
  switch i32 %cmd, label %bb20 [
    i32 1, label %bb13
    i32 2, label %bb16
    i32 3, label %bb24
  ], !dbg !592

bb13:                                             ; preds = %bb12
  %14 = load i32* %1, align 4, !dbg !593          ; <i32> [#uses=1]
  %15 = lshr i32 %14, 1                           ; <i32> [#uses=1]
  %.lobit = and i32 %15, 1                        ; <i32> [#uses=1]
  ret i32 %.lobit, !dbg !587

bb16:                                             ; preds = %bb12
  %16 = load i32* %1, align 4, !dbg !595          ; <i32> [#uses=2]
  %17 = and i32 %16, -3, !dbg !595                ; <i32> [#uses=1]
  store i32 %17, i32* %1, align 4, !dbg !595
  %18 = and i32 %arg.0, 1, !dbg !596              ; <i32> [#uses=1]
  %toBool = icmp eq i32 %18, 0                    ; <i1> [#uses=1]
  br i1 %toBool, label %bb24, label %bb17, !dbg !596

bb17:                                             ; preds = %bb16
  %19 = or i32 %16, 2, !dbg !597                  ; <i32> [#uses=1]
  store i32 %19, i32* %1, align 4, !dbg !597
  ret i32 0, !dbg !587

bb20:                                             ; preds = %bb12
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !598
  %20 = call i32* @__errno_location() nounwind readnone, !dbg !599 ; <i32*> [#uses=1]
  store i32 22, i32* %20, align 4, !dbg !599
  ret i32 -1, !dbg !587

bb21:                                             ; preds = %bb11
  %21 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %22 = load i32* %21, align 4, !dbg !600         ; <i32> [#uses=1]
  %23 = call i32 (i32, ...)* @syscall(i32 55, i32 %22, i32 %cmd, i32 %arg.0) nounwind, !dbg !600 ; <i32> [#uses=3]
  %24 = icmp eq i32 %23, -1, !dbg !602            ; <i1> [#uses=1]
  br i1 %24, label %bb22, label %bb24, !dbg !602

bb22:                                             ; preds = %bb21
  %25 = call i32* @__errno_location() nounwind readnone, !dbg !603 ; <i32*> [#uses=1]
  %26 = call i32 @klee_get_errno() nounwind, !dbg !603 ; <i32> [#uses=1]
  store i32 %26, i32* %25, align 4, !dbg !603
  ret i32 %23, !dbg !587

bb24:                                             ; preds = %bb21, %bb12, %bb16
  %.0 = phi i32 [ 0, %bb16 ], [ 0, %bb12 ], [ %23, %bb21 ] ; <i32> [#uses=1]
  ret i32 %.0, !dbg !587
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @ioctl(i32 %fd, i32 %request, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=3]
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !604

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !610           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !610                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !610

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !611 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !611

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = call i32* @__errno_location() nounwind readnone, !dbg !612 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !612
  ret i32 -1, !dbg !613

bb1:                                              ; preds = %__get_file.exit
  %ap2 = bitcast i8** %ap to i8*, !dbg !614       ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap2), !dbg !614
  %7 = load i8** %ap, align 4, !dbg !615          ; <i8*> [#uses=2]
  %8 = getelementptr inbounds i8* %7, i32 4, !dbg !615 ; <i8*> [#uses=1]
  store i8* %8, i8** %ap, align 4, !dbg !615
  %9 = bitcast i8* %7 to i8**, !dbg !615          ; <i8**> [#uses=1]
  %10 = load i8** %9, align 4, !dbg !615          ; <i8*> [#uses=28]
  call void @llvm.va_end(i8* %ap2), !dbg !616
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=2]
  %12 = load %struct.exe_disk_file_t** %11, align 4, !dbg !617 ; <%struct.exe_disk_file_t*> [#uses=2]
  %13 = icmp eq %struct.exe_disk_file_t* %12, null, !dbg !617 ; <i1> [#uses=1]
  br i1 %13, label %bb31, label %bb4, !dbg !617

bb4:                                              ; preds = %bb1
  %14 = getelementptr inbounds %struct.exe_disk_file_t* %12, i32 0, i32 2, !dbg !618 ; <%struct.stat64**> [#uses=1]
  %15 = load %struct.stat64** %14, align 4, !dbg !618 ; <%struct.stat64*> [#uses=6]
  switch i32 %request, label %bb30 [
    i32 21505, label %bb5
    i32 21506, label %bb8
    i32 21507, label %bb11
    i32 21508, label %bb14
    i32 21523, label %bb17
    i32 21524, label %bb20
    i32 21531, label %bb23
    i32 -2145620734, label %bb29
  ], !dbg !620

bb5:                                              ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([41 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !621
  %16 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3 ; <i32*> [#uses=1]
  %17 = load i32* %16, align 4, !dbg !623         ; <i32> [#uses=1]
  %18 = and i32 %17, 61440, !dbg !623             ; <i32> [#uses=1]
  %19 = icmp eq i32 %18, 8192, !dbg !623          ; <i1> [#uses=1]
  br i1 %19, label %bb6, label %bb7, !dbg !623

bb6:                                              ; preds = %bb5
  %20 = bitcast i8* %10 to i32*                   ; <i32*> [#uses=1]
  store i32 27906, i32* %20, align 4, !dbg !624
  %21 = getelementptr inbounds i8* %10, i32 4     ; <i8*> [#uses=1]
  %22 = bitcast i8* %21 to i32*                   ; <i32*> [#uses=1]
  store i32 5, i32* %22, align 4, !dbg !625
  %23 = getelementptr inbounds i8* %10, i32 8     ; <i8*> [#uses=1]
  %24 = bitcast i8* %23 to i32*                   ; <i32*> [#uses=1]
  store i32 1215, i32* %24, align 4, !dbg !626
  %25 = getelementptr inbounds i8* %10, i32 12    ; <i8*> [#uses=1]
  %26 = bitcast i8* %25 to i32*                   ; <i32*> [#uses=1]
  store i32 35287, i32* %26, align 4, !dbg !627
  %27 = getelementptr inbounds i8* %10, i32 16    ; <i8*> [#uses=1]
  store i8 0, i8* %27, align 4, !dbg !628
  %28 = getelementptr inbounds i8* %10, i32 17    ; <i8*> [#uses=1]
  store i8 3, i8* %28, align 1, !dbg !629
  %29 = getelementptr inbounds i8* %10, i32 18    ; <i8*> [#uses=1]
  store i8 28, i8* %29, align 1, !dbg !630
  %30 = getelementptr inbounds i8* %10, i32 19    ; <i8*> [#uses=1]
  store i8 127, i8* %30, align 1, !dbg !631
  %31 = getelementptr inbounds i8* %10, i32 20    ; <i8*> [#uses=1]
  store i8 21, i8* %31, align 1, !dbg !632
  %32 = getelementptr inbounds i8* %10, i32 21    ; <i8*> [#uses=1]
  store i8 4, i8* %32, align 1, !dbg !633
  %33 = getelementptr inbounds i8* %10, i32 22    ; <i8*> [#uses=1]
  store i8 0, i8* %33, align 1, !dbg !634
  %34 = getelementptr inbounds i8* %10, i32 23    ; <i8*> [#uses=1]
  store i8 1, i8* %34, align 1, !dbg !635
  %35 = getelementptr inbounds i8* %10, i32 24    ; <i8*> [#uses=1]
  store i8 -1, i8* %35, align 1, !dbg !636
  %36 = getelementptr inbounds i8* %10, i32 25    ; <i8*> [#uses=1]
  store i8 17, i8* %36, align 1, !dbg !637
  %37 = getelementptr inbounds i8* %10, i32 26    ; <i8*> [#uses=1]
  store i8 19, i8* %37, align 1, !dbg !638
  %38 = getelementptr inbounds i8* %10, i32 27    ; <i8*> [#uses=1]
  store i8 26, i8* %38, align 1, !dbg !639
  %39 = getelementptr inbounds i8* %10, i32 28    ; <i8*> [#uses=1]
  store i8 -1, i8* %39, align 1, !dbg !640
  %40 = getelementptr inbounds i8* %10, i32 29    ; <i8*> [#uses=1]
  store i8 18, i8* %40, align 1, !dbg !641
  %41 = getelementptr inbounds i8* %10, i32 30    ; <i8*> [#uses=1]
  store i8 15, i8* %41, align 1, !dbg !642
  %42 = getelementptr inbounds i8* %10, i32 31    ; <i8*> [#uses=1]
  store i8 23, i8* %42, align 1, !dbg !643
  %43 = getelementptr inbounds i8* %10, i32 32    ; <i8*> [#uses=1]
  store i8 22, i8* %43, align 1, !dbg !644
  %44 = getelementptr inbounds i8* %10, i32 33    ; <i8*> [#uses=1]
  store i8 -1, i8* %44, align 1, !dbg !645
  %45 = getelementptr inbounds i8* %10, i32 34    ; <i8*> [#uses=1]
  store i8 0, i8* %45, align 1, !dbg !646
  %46 = getelementptr inbounds i8* %10, i32 35    ; <i8*> [#uses=1]
  store i8 0, i8* %46, align 1, !dbg !647
  ret i32 0, !dbg !613

bb7:                                              ; preds = %bb5
  %47 = call i32* @__errno_location() nounwind readnone, !dbg !648 ; <i32*> [#uses=1]
  store i32 25, i32* %47, align 4, !dbg !648
  ret i32 -1, !dbg !613

bb8:                                              ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([42 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !649
  %48 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3 ; <i32*> [#uses=1]
  %49 = load i32* %48, align 4, !dbg !650         ; <i32> [#uses=1]
  %50 = and i32 %49, 61440, !dbg !650             ; <i32> [#uses=1]
  %51 = icmp eq i32 %50, 8192, !dbg !650          ; <i1> [#uses=1]
  br i1 %51, label %bb34, label %bb10, !dbg !650

bb10:                                             ; preds = %bb8
  %52 = call i32* @__errno_location() nounwind readnone, !dbg !651 ; <i32*> [#uses=1]
  store i32 25, i32* %52, align 4, !dbg !651
  ret i32 -1, !dbg !613

bb11:                                             ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str9, i32 0, i32 0)) nounwind, !dbg !652
  %53 = icmp eq i32 %fd, 0, !dbg !653             ; <i1> [#uses=1]
  br i1 %53, label %bb34, label %bb13, !dbg !653

bb13:                                             ; preds = %bb11
  %54 = call i32* @__errno_location() nounwind readnone, !dbg !654 ; <i32*> [#uses=1]
  store i32 25, i32* %54, align 4, !dbg !654
  ret i32 -1, !dbg !613

bb14:                                             ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !655
  %55 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3 ; <i32*> [#uses=1]
  %56 = load i32* %55, align 4, !dbg !656         ; <i32> [#uses=1]
  %57 = and i32 %56, 61440, !dbg !656             ; <i32> [#uses=1]
  %58 = icmp eq i32 %57, 8192, !dbg !656          ; <i1> [#uses=1]
  br i1 %58, label %bb34, label %bb16, !dbg !656

bb16:                                             ; preds = %bb14
  %59 = call i32* @__errno_location() nounwind readnone, !dbg !657 ; <i32*> [#uses=1]
  store i32 25, i32* %59, align 4, !dbg !657
  ret i32 -1, !dbg !613

bb17:                                             ; preds = %bb4
  %60 = bitcast i8* %10 to i16*                   ; <i16*> [#uses=1]
  store i16 24, i16* %60, align 2, !dbg !658
  %61 = getelementptr inbounds i8* %10, i32 2     ; <i8*> [#uses=1]
  %62 = bitcast i8* %61 to i16*                   ; <i16*> [#uses=1]
  store i16 80, i16* %62, align 2, !dbg !660
  call void @klee_warning_once(i8* getelementptr inbounds ([45 x i8]* @.str11, i32 0, i32 0)) nounwind, !dbg !661
  %63 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3 ; <i32*> [#uses=1]
  %64 = load i32* %63, align 4, !dbg !662         ; <i32> [#uses=1]
  %65 = and i32 %64, 61440, !dbg !662             ; <i32> [#uses=1]
  %66 = icmp eq i32 %65, 8192, !dbg !662          ; <i1> [#uses=1]
  br i1 %66, label %bb34, label %bb19, !dbg !662

bb19:                                             ; preds = %bb17
  %67 = call i32* @__errno_location() nounwind readnone, !dbg !663 ; <i32*> [#uses=1]
  store i32 25, i32* %67, align 4, !dbg !663
  ret i32 -1, !dbg !613

bb20:                                             ; preds = %bb4
  call void @klee_warning_once(i8* getelementptr inbounds ([46 x i8]* @.str12, i32 0, i32 0)) nounwind, !dbg !664
  %68 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3 ; <i32*> [#uses=1]
  %69 = load i32* %68, align 4, !dbg !665         ; <i32> [#uses=1]
  %70 = and i32 %69, 61440, !dbg !665             ; <i32> [#uses=1]
  %71 = icmp eq i32 %70, 8192, !dbg !665          ; <i1> [#uses=1]
  %72 = call i32* @__errno_location() nounwind readnone, !dbg !666 ; <i32*> [#uses=2]
  br i1 %71, label %bb21, label %bb22, !dbg !665

bb21:                                             ; preds = %bb20
  store i32 22, i32* %72, align 4, !dbg !666
  ret i32 -1, !dbg !613

bb22:                                             ; preds = %bb20
  store i32 25, i32* %72, align 4, !dbg !667
  ret i32 -1, !dbg !613

bb23:                                             ; preds = %bb4
  %73 = bitcast i8* %10 to i32*, !dbg !668        ; <i32*> [#uses=1]
  call void @klee_warning_once(i8* getelementptr inbounds ([43 x i8]* @.str13, i32 0, i32 0)) nounwind, !dbg !670
  %74 = getelementptr inbounds %struct.stat64* %15, i32 0, i32 3 ; <i32*> [#uses=1]
  %75 = load i32* %74, align 4, !dbg !671         ; <i32> [#uses=1]
  %76 = and i32 %75, 61440, !dbg !671             ; <i32> [#uses=1]
  %77 = icmp eq i32 %76, 8192, !dbg !671          ; <i1> [#uses=1]
  br i1 %77, label %bb24, label %bb28, !dbg !671

bb24:                                             ; preds = %bb23
  %78 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=1]
  %79 = load i64* %78, align 4, !dbg !672         ; <i64> [#uses=2]
  %80 = load %struct.exe_disk_file_t** %11, align 4, !dbg !672 ; <%struct.exe_disk_file_t*> [#uses=1]
  %81 = getelementptr inbounds %struct.exe_disk_file_t* %80, i32 0, i32 0, !dbg !672 ; <i32*> [#uses=1]
  %82 = load i32* %81, align 4, !dbg !672         ; <i32> [#uses=2]
  %83 = zext i32 %82 to i64, !dbg !672            ; <i64> [#uses=1]
  %84 = icmp slt i64 %79, %83, !dbg !672          ; <i1> [#uses=1]
  br i1 %84, label %bb25, label %bb27, !dbg !672

bb25:                                             ; preds = %bb24
  %85 = trunc i64 %79 to i32, !dbg !673           ; <i32> [#uses=1]
  %86 = sub i32 %82, %85, !dbg !673               ; <i32> [#uses=1]
  br label %bb27, !dbg !673

bb27:                                             ; preds = %bb24, %bb25
  %storemerge = phi i32 [ %86, %bb25 ], [ 0, %bb24 ] ; <i32> [#uses=1]
  store i32 %storemerge, i32* %73, align 4
  ret i32 0, !dbg !613

bb28:                                             ; preds = %bb23
  %87 = call i32* @__errno_location() nounwind readnone, !dbg !674 ; <i32*> [#uses=1]
  store i32 25, i32* %87, align 4, !dbg !674
  ret i32 -1, !dbg !613

bb29:                                             ; preds = %bb4
  call void @klee_warning(i8* getelementptr inbounds ([44 x i8]* @.str14, i32 0, i32 0)) nounwind, !dbg !675
  %88 = call i32* @__errno_location() nounwind readnone, !dbg !676 ; <i32*> [#uses=1]
  store i32 22, i32* %88, align 4, !dbg !676
  ret i32 -1, !dbg !613

bb30:                                             ; preds = %bb4
  call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !677
  %89 = call i32* @__errno_location() nounwind readnone, !dbg !678 ; <i32*> [#uses=1]
  store i32 22, i32* %89, align 4, !dbg !678
  ret i32 -1, !dbg !613

bb31:                                             ; preds = %bb1
  %90 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %91 = load i32* %90, align 4, !dbg !679         ; <i32> [#uses=1]
  %92 = call i32 (i32, ...)* @syscall(i32 54, i32 %91, i32 %request, i8* %10) nounwind, !dbg !679 ; <i32> [#uses=3]
  %93 = icmp eq i32 %92, -1, !dbg !681            ; <i1> [#uses=1]
  br i1 %93, label %bb32, label %bb34, !dbg !681

bb32:                                             ; preds = %bb31
  %94 = call i32* @__errno_location() nounwind readnone, !dbg !682 ; <i32*> [#uses=1]
  %95 = call i32 @klee_get_errno() nounwind, !dbg !682 ; <i32> [#uses=1]
  store i32 %95, i32* %94, align 4, !dbg !682
  ret i32 %92, !dbg !613

bb34:                                             ; preds = %bb31, %bb17, %bb14, %bb11, %bb8
  %.0 = phi i32 [ 0, %bb8 ], [ 0, %bb11 ], [ 0, %bb14 ], [ 0, %bb17 ], [ %92, %bb31 ] ; <i32> [#uses=1]
  ret i32 %.0, !dbg !613
}

declare void @klee_warning_once(i8*)

define i32 @__fd_getdents(i32 %fd, %struct.dirent64* %dirp, i32 %count) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !683

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !703           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !703                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !703

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !704 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !704

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !705 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !705
  ret i32 -1, !dbg !706

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !707 ; <%struct.exe_disk_file_t*> [#uses=1]
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !707 ; <i1> [#uses=1]
  br i1 %9, label %bb3, label %bb2, !dbg !707

bb2:                                              ; preds = %bb1
  tail call void @klee_warning(i8* getelementptr inbounds ([33 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !708
  %10 = tail call i32* @__errno_location() nounwind readnone, !dbg !709 ; <i32*> [#uses=1]
  store i32 22, i32* %10, align 4, !dbg !709
  ret i32 -1, !dbg !706

bb3:                                              ; preds = %bb1
  %11 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=3]
  %12 = load i64* %11, align 4, !dbg !710         ; <i64> [#uses=3]
  %13 = trunc i64 %12 to i32, !dbg !710           ; <i32> [#uses=2]
  %14 = icmp ult i32 %13, 4096                    ; <i1> [#uses=1]
  br i1 %14, label %bb4, label %bb10, !dbg !710

bb4:                                              ; preds = %bb3
  %15 = sdiv i64 %12, 276, !dbg !711              ; <i64> [#uses=1]
  %16 = trunc i64 %15 to i32, !dbg !711           ; <i32> [#uses=6]
  %17 = mul i32 %16, 276, !dbg !713               ; <i32> [#uses=2]
  %18 = zext i32 %17 to i64, !dbg !713            ; <i64> [#uses=1]
  %19 = icmp eq i64 %18, %12, !dbg !713           ; <i1> [#uses=1]
  br i1 %19, label %bb5, label %bb6, !dbg !713

bb5:                                              ; preds = %bb4
  %20 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !713 ; <i32> [#uses=2]
  %21 = icmp ult i32 %20, %16, !dbg !713          ; <i1> [#uses=1]
  br i1 %21, label %bb6, label %bb8.preheader, !dbg !713

bb8.preheader:                                    ; preds = %bb5
  %22 = icmp ugt i32 %20, %16, !dbg !714          ; <i1> [#uses=1]
  br i1 %22, label %bb.nph26, label %bb9, !dbg !714

bb6:                                              ; preds = %bb4, %bb5
  %23 = tail call i32* @__errno_location() nounwind readnone, !dbg !715 ; <i32*> [#uses=1]
  store i32 22, i32* %23, align 4, !dbg !715
  ret i32 -1, !dbg !706

bb.nph26:                                         ; preds = %bb8.preheader
  %tmp38 = add i32 %16, 65                        ; <i32> [#uses=1]
  %tmp48 = add i32 %17, 276                       ; <i32> [#uses=1]
  %tmp50 = add i32 %16, 1                         ; <i32> [#uses=1]
  br label %bb7

bb7:                                              ; preds = %bb.nph26, %bb7
  %indvar = phi i32 [ 0, %bb.nph26 ], [ %tmp33, %bb7 ] ; <i32> [#uses=11]
  %bytes.024 = phi i32 [ 0, %bb.nph26 ], [ %35, %bb7 ] ; <i32> [#uses=1]
  %scevgep29 = getelementptr inbounds %struct.dirent64* %dirp, i32 %indvar, i32 0 ; <i64*> [#uses=1]
  %scevgep30 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 2 ; <i16*> [#uses=1]
  %scevgep31 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 3 ; <i8*> [#uses=1]
  %scevgep32 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 1 ; <i64*> [#uses=1]
  %tmp33 = add i32 %indvar, 1                     ; <i32> [#uses=2]
  %scevgep35 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 4, i32 0 ; <i8*> [#uses=1]
  %scevgep36 = getelementptr %struct.dirent64* %dirp, i32 %indvar, i32 4, i32 1 ; <i8*> [#uses=1]
  %tmp40 = add i32 %tmp38, %indvar                ; <i32> [#uses=1]
  %tmp41 = trunc i32 %tmp40 to i8                 ; <i8> [#uses=1]
  %tmp43 = add i32 %16, %indvar                   ; <i32> [#uses=1]
  %tmp46 = mul i32 %indvar, 276                   ; <i32> [#uses=1]
  %tmp49 = add i32 %tmp48, %tmp46                 ; <i32> [#uses=1]
  %24 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !716 ; <%struct.exe_disk_file_t*> [#uses=1]
  %scevgep44 = getelementptr %struct.exe_disk_file_t* %24, i32 %tmp43, i32 2 ; <%struct.stat64**> [#uses=2]
  %25 = load %struct.stat64** %scevgep44, align 4, !dbg !718 ; <%struct.stat64*> [#uses=1]
  %26 = getelementptr inbounds %struct.stat64* %25, i32 0, i32 15, !dbg !718 ; <i64*> [#uses=1]
  %27 = load i64* %26, align 4, !dbg !718         ; <i64> [#uses=1]
  store i64 %27, i64* %scevgep29, align 4, !dbg !718
  store i16 276, i16* %scevgep30, align 4, !dbg !719
  %28 = load %struct.stat64** %scevgep44, align 4, !dbg !720 ; <%struct.stat64*> [#uses=1]
  %29 = getelementptr inbounds %struct.stat64* %28, i32 0, i32 3, !dbg !720 ; <i32*> [#uses=1]
  %30 = load i32* %29, align 4, !dbg !720         ; <i32> [#uses=1]
  %31 = lshr i32 %30, 12                          ; <i32> [#uses=1]
  %32 = and i32 %31, 15                           ; <i32> [#uses=1]
  %33 = trunc i32 %32 to i8, !dbg !720            ; <i8> [#uses=1]
  store i8 %33, i8* %scevgep31, align 2, !dbg !720
  store i8 %tmp41, i8* %scevgep35, align 1, !dbg !721
  store i8 0, i8* %scevgep36, align 1, !dbg !722
  %34 = zext i32 %tmp49 to i64, !dbg !723         ; <i64> [#uses=1]
  store i64 %34, i64* %scevgep32, align 4, !dbg !723
  %35 = add i32 %bytes.024, 276, !dbg !724        ; <i32> [#uses=2]
  %tmp51 = add i32 %tmp50, %indvar                ; <i32> [#uses=1]
  %36 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !714 ; <i32> [#uses=1]
  %37 = icmp ugt i32 %36, %tmp51, !dbg !714       ; <i1> [#uses=1]
  br i1 %37, label %bb7, label %bb8.bb9_crit_edge, !dbg !714

bb8.bb9_crit_edge:                                ; preds = %bb7
  %scevgep34 = getelementptr %struct.dirent64* %dirp, i32 %tmp33 ; <%struct.dirent64*> [#uses=1]
  br label %bb9

bb9:                                              ; preds = %bb8.bb9_crit_edge, %bb8.preheader
  %dirp_addr.0.lcssa = phi %struct.dirent64* [ %scevgep34, %bb8.bb9_crit_edge ], [ %dirp, %bb8.preheader ] ; <%struct.dirent64*> [#uses=5]
  %bytes.0.lcssa = phi i32 [ %35, %bb8.bb9_crit_edge ], [ 0, %bb8.preheader ] ; <i32> [#uses=2]
  %38 = icmp ugt i32 %count, 4096                 ; <i1> [#uses=1]
  %min = select i1 %38, i32 4096, i32 %count, !dbg !725 ; <i32> [#uses=2]
  %39 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 0, !dbg !726 ; <i64*> [#uses=1]
  store i64 0, i64* %39, align 4, !dbg !726
  %40 = trunc i32 %min to i16, !dbg !727          ; <i16> [#uses=1]
  %41 = trunc i32 %bytes.0.lcssa to i16, !dbg !727 ; <i16> [#uses=1]
  %42 = sub i16 %40, %41, !dbg !727               ; <i16> [#uses=2]
  %43 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 2, !dbg !727 ; <i16*> [#uses=1]
  store i16 %42, i16* %43, align 4, !dbg !727
  %44 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 3, !dbg !728 ; <i8*> [#uses=1]
  store i8 0, i8* %44, align 2, !dbg !728
  %45 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  store i8 0, i8* %45, align 1, !dbg !729
  %46 = getelementptr inbounds %struct.dirent64* %dirp_addr.0.lcssa, i32 0, i32 1, !dbg !730 ; <i64*> [#uses=1]
  store i64 4096, i64* %46, align 4, !dbg !730
  %47 = zext i16 %42 to i32, !dbg !731            ; <i32> [#uses=1]
  %48 = add i32 %47, %bytes.0.lcssa, !dbg !731    ; <i32> [#uses=1]
  %49 = zext i32 %min to i64, !dbg !732           ; <i64> [#uses=1]
  store i64 %49, i64* %11, align 4, !dbg !732
  ret i32 %48, !dbg !706

bb10:                                             ; preds = %bb3
  %50 = add i32 %13, -4096                        ; <i32> [#uses=1]
  %51 = bitcast %struct.dirent64* %dirp to i8*, !dbg !733 ; <i8*> [#uses=3]
  tail call void @llvm.memset.i32(i8* %51, i8 0, i32 %count, i32 4), !dbg !733
  %52 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=3]
  %53 = load i32* %52, align 4, !dbg !735         ; <i32> [#uses=1]
  %54 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %53, i32 %50, i32 0) nounwind, !dbg !735 ; <i32> [#uses=1]
  %55 = icmp eq i32 %54, -1, !dbg !736            ; <i1> [#uses=1]
  br i1 %55, label %bb11, label %bb12, !dbg !736

bb11:                                             ; preds = %bb10
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 735, i8* getelementptr inbounds ([14 x i8]* @__PRETTY_FUNCTION__.4784, i32 0, i32 0)) noreturn nounwind, !dbg !736
  unreachable, !dbg !736

bb12:                                             ; preds = %bb10
  %56 = load i32* %52, align 4, !dbg !737         ; <i32> [#uses=1]
  %57 = tail call i32 (i32, ...)* @syscall(i32 220, i32 %56, %struct.dirent64* %dirp, i32 %count) nounwind, !dbg !737 ; <i32> [#uses=5]
  %58 = icmp eq i32 %57, -1, !dbg !738            ; <i1> [#uses=1]
  br i1 %58, label %bb13, label %bb14, !dbg !738

bb13:                                             ; preds = %bb12
  %59 = tail call i32* @__errno_location() nounwind readnone, !dbg !739 ; <i32*> [#uses=1]
  %60 = tail call i32 @klee_get_errno() nounwind, !dbg !739 ; <i32> [#uses=1]
  store i32 %60, i32* %59, align 4, !dbg !739
  ret i32 %57, !dbg !706

bb14:                                             ; preds = %bb12
  %61 = load i32* %52, align 4, !dbg !740         ; <i32> [#uses=1]
  %62 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %61, i32 0, i32 1) nounwind, !dbg !740 ; <i32> [#uses=1]
  %63 = add nsw i32 %62, 4096, !dbg !740          ; <i32> [#uses=1]
  %64 = sext i32 %63 to i64, !dbg !740            ; <i64> [#uses=1]
  store i64 %64, i64* %11, align 4, !dbg !740
  %65 = icmp sgt i32 %57, 0, !dbg !742            ; <i1> [#uses=1]
  br i1 %65, label %bb15, label %bb18, !dbg !742

bb15:                                             ; preds = %bb14, %bb15
  %pos.022 = phi i32 [ %74, %bb15 ], [ 0, %bb14 ] ; <i32> [#uses=3]
  %.sum = add i32 %pos.022, 8                     ; <i32> [#uses=1]
  %66 = getelementptr inbounds i8* %51, i32 %.sum ; <i8*> [#uses=1]
  %67 = bitcast i8* %66 to i64*                   ; <i64*> [#uses=2]
  %68 = load i64* %67, align 4, !dbg !743         ; <i64> [#uses=1]
  %69 = add nsw i64 %68, 4096, !dbg !743          ; <i64> [#uses=1]
  store i64 %69, i64* %67, align 4, !dbg !743
  %.sum21 = add i32 %pos.022, 16                  ; <i32> [#uses=1]
  %70 = getelementptr inbounds i8* %51, i32 %.sum21 ; <i8*> [#uses=1]
  %71 = bitcast i8* %70 to i16*                   ; <i16*> [#uses=1]
  %72 = load i16* %71, align 4, !dbg !745         ; <i16> [#uses=1]
  %73 = zext i16 %72 to i32, !dbg !745            ; <i32> [#uses=1]
  %74 = add nsw i32 %73, %pos.022, !dbg !745      ; <i32> [#uses=2]
  %75 = icmp slt i32 %74, %57, !dbg !742          ; <i1> [#uses=1]
  br i1 %75, label %bb15, label %bb18, !dbg !742

bb18:                                             ; preds = %bb15, %bb14
  ret i32 %57, !dbg !706
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

define i64 @__fd_lseek(i32 %fd, i64 %offset, i32 %whence) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !746

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !752           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !752                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !752

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !753 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !753

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !754 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !754
  ret i64 -1, !dbg !755

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !756 ; <%struct.exe_disk_file_t*> [#uses=2]
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !756 ; <i1> [#uses=1]
  br i1 %9, label %bb2, label %bb11, !dbg !756

bb2:                                              ; preds = %bb1
  %10 = icmp eq i32 %whence, 0, !dbg !757         ; <i1> [#uses=1]
  br i1 %10, label %bb3, label %bb4, !dbg !757

bb3:                                              ; preds = %bb2
  %11 = trunc i64 %offset to i32, !dbg !758       ; <i32> [#uses=1]
  %12 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %13 = load i32* %12, align 4, !dbg !758         ; <i32> [#uses=1]
  %14 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %13, i32 %11, i32 0) nounwind, !dbg !758 ; <i32> [#uses=1]
  %15 = sext i32 %14 to i64, !dbg !758            ; <i64> [#uses=1]
  br label %bb8, !dbg !758

bb4:                                              ; preds = %bb2
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=2]
  %17 = load i64* %16, align 4, !dbg !759         ; <i64> [#uses=1]
  %18 = trunc i64 %17 to i32, !dbg !759           ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=2]
  %20 = load i32* %19, align 4, !dbg !759         ; <i32> [#uses=1]
  %21 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %20, i32 %18, i32 0) nounwind, !dbg !759 ; <i32> [#uses=2]
  %22 = sext i32 %21 to i64, !dbg !759            ; <i64> [#uses=2]
  %23 = icmp eq i32 %21, -1                       ; <i1> [#uses=1]
  br i1 %23, label %bb8, label %bb5, !dbg !760

bb5:                                              ; preds = %bb4
  %24 = load i64* %16, align 4, !dbg !761         ; <i64> [#uses=1]
  %25 = icmp eq i64 %24, %22, !dbg !761           ; <i1> [#uses=1]
  br i1 %25, label %bb7, label %bb6, !dbg !761

bb6:                                              ; preds = %bb5
  tail call void @__assert_fail(i8* getelementptr inbounds ([18 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 397, i8* getelementptr inbounds ([11 x i8]* @__PRETTY_FUNCTION__.4528, i32 0, i32 0)) noreturn nounwind, !dbg !761
  unreachable, !dbg !761

bb7:                                              ; preds = %bb5
  %26 = trunc i64 %offset to i32, !dbg !762       ; <i32> [#uses=1]
  %27 = load i32* %19, align 4, !dbg !762         ; <i32> [#uses=1]
  %28 = tail call i32 (i32, ...)* @syscall(i32 19, i32 %27, i32 %26, i32 %whence) nounwind, !dbg !762 ; <i32> [#uses=1]
  %29 = sext i32 %28 to i64, !dbg !762            ; <i64> [#uses=1]
  br label %bb8, !dbg !762

bb8:                                              ; preds = %bb4, %bb7, %bb3
  %new_off.0 = phi i64 [ %15, %bb3 ], [ %29, %bb7 ], [ %22, %bb4 ] ; <i64> [#uses=3]
  %30 = icmp eq i64 %new_off.0, -1, !dbg !763     ; <i1> [#uses=1]
  br i1 %30, label %bb9, label %bb10, !dbg !763

bb9:                                              ; preds = %bb8
  %31 = tail call i32* @__errno_location() nounwind readnone, !dbg !764 ; <i32*> [#uses=1]
  %32 = tail call i32 @klee_get_errno() nounwind, !dbg !764 ; <i32> [#uses=1]
  store i32 %32, i32* %31, align 4, !dbg !764
  ret i64 -1, !dbg !755

bb10:                                             ; preds = %bb8
  %33 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=1]
  store i64 %new_off.0, i64* %33, align 4, !dbg !765
  ret i64 %new_off.0, !dbg !755

bb11:                                             ; preds = %bb1
  switch i32 %whence, label %bb15 [
    i32 0, label %bb16
    i32 1, label %bb13
    i32 2, label %bb14
  ], !dbg !766

bb13:                                             ; preds = %bb11
  %34 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=1]
  %35 = load i64* %34, align 4, !dbg !767         ; <i64> [#uses=1]
  %36 = add nsw i64 %35, %offset, !dbg !767       ; <i64> [#uses=1]
  br label %bb16, !dbg !767

bb14:                                             ; preds = %bb11
  %37 = getelementptr inbounds %struct.exe_disk_file_t* %8, i32 0, i32 0, !dbg !768 ; <i32*> [#uses=1]
  %38 = load i32* %37, align 4, !dbg !768         ; <i32> [#uses=1]
  %39 = zext i32 %38 to i64, !dbg !768            ; <i64> [#uses=1]
  %40 = add nsw i64 %39, %offset, !dbg !768       ; <i64> [#uses=1]
  br label %bb16, !dbg !768

bb15:                                             ; preds = %bb11
  %41 = tail call i32* @__errno_location() nounwind readnone, !dbg !769 ; <i32*> [#uses=1]
  store i32 22, i32* %41, align 4, !dbg !769
  ret i64 -1, !dbg !755

bb16:                                             ; preds = %bb11, %bb14, %bb13
  %new_off.1 = phi i64 [ %40, %bb14 ], [ %36, %bb13 ], [ %offset, %bb11 ] ; <i64> [#uses=3]
  %42 = icmp slt i64 %new_off.1, 0, !dbg !770     ; <i1> [#uses=1]
  br i1 %42, label %bb17, label %bb18, !dbg !770

bb17:                                             ; preds = %bb16
  %43 = tail call i32* @__errno_location() nounwind readnone, !dbg !771 ; <i32*> [#uses=1]
  store i32 22, i32* %43, align 4, !dbg !771
  ret i64 -1, !dbg !755

bb18:                                             ; preds = %bb16
  %44 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=1]
  store i64 %new_off.1, i64* %44, align 4, !dbg !772
  ret i64 %new_off.1, !dbg !755
}

define i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !773

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !779           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !779                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !779

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !780 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !780

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !781 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !781
  ret i32 -1, !dbg !782

bb1:                                              ; preds = %__get_file.exit
  %7 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %8 = load %struct.exe_disk_file_t** %7, align 4, !dbg !783 ; <%struct.exe_disk_file_t*> [#uses=2]
  %9 = icmp eq %struct.exe_disk_file_t* %8, null, !dbg !783 ; <i1> [#uses=1]
  br i1 %9, label %bb2, label %bb5, !dbg !783

bb2:                                              ; preds = %bb1
  %10 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %11 = load i32* %10, align 4, !dbg !784         ; <i32> [#uses=1]
  %12 = tail call i32 (i32, ...)* @syscall(i32 197, i32 %11, %struct.stat64* %buf) nounwind, !dbg !784 ; <i32> [#uses=3]
  %13 = icmp eq i32 %12, -1, !dbg !786            ; <i1> [#uses=1]
  br i1 %13, label %bb3, label %bb6, !dbg !786

bb3:                                              ; preds = %bb2
  %14 = tail call i32* @__errno_location() nounwind readnone, !dbg !787 ; <i32*> [#uses=1]
  %15 = tail call i32 @klee_get_errno() nounwind, !dbg !787 ; <i32> [#uses=1]
  store i32 %15, i32* %14, align 4, !dbg !787
  ret i32 %12, !dbg !782

bb5:                                              ; preds = %bb1
  %16 = getelementptr inbounds %struct.exe_disk_file_t* %8, i32 0, i32 2, !dbg !788 ; <%struct.stat64**> [#uses=1]
  %17 = load %struct.stat64** %16, align 4, !dbg !788 ; <%struct.stat64*> [#uses=1]
  %18 = bitcast %struct.stat64* %buf to i8*, !dbg !788 ; <i8*> [#uses=1]
  %19 = bitcast %struct.stat64* %17 to i8*, !dbg !788 ; <i8*> [#uses=1]
  tail call void @llvm.memcpy.i32(i8* %18, i8* %19, i32 96, i32 4), !dbg !788
  ret i32 0, !dbg !782

bb6:                                              ; preds = %bb2
  ret i32 %12, !dbg !782
}

define i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !789         ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !795                ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb.i, !dbg !795

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !795 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !795            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !795                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !795

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !796 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !797               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !797              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !797              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !797

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !798 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !799 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !799 ; <%struct.stat64*> [#uses=2]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !799 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !799         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !799             ; <i1> [#uses=1]
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !799

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !796                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !796

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !796           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb1, !dbg !796

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !798 ; <%struct.exe_disk_file_t*> [#uses=1]
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !800 ; <i1> [#uses=1]
  br i1 %20, label %bb1, label %bb, !dbg !800

bb:                                               ; preds = %__get_sym_file.exit
  %21 = bitcast %struct.stat64* %buf to i8*, !dbg !801 ; <i8*> [#uses=1]
  %22 = bitcast %struct.stat64* %12 to i8*, !dbg !801 ; <i8*> [#uses=1]
  tail call void @llvm.memcpy.i32(i8* %21, i8* %22, i32 96, i32 4), !dbg !801
  ret i32 0, !dbg !802

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %23 = tail call fastcc i8* @__concretize_ptr(i8* %path) nounwind, !dbg !803 ; <i8*> [#uses=1]
  br label %bb.i6, !dbg !806

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %23, %bb1 ], [ %sc.0.i, %bb6.i8 ] ; <i8*> [#uses=7]
  %24 = phi i32 [ 0, %bb1 ], [ %36, %bb6.i8 ]     ; <i32> [#uses=3]
  %tmp.i = add i32 %24, -1                        ; <i32> [#uses=1]
  %25 = load i8* %sc.1.i, align 1, !dbg !807      ; <i8> [#uses=3]
  %26 = and i32 %tmp.i, %24, !dbg !808            ; <i32> [#uses=1]
  %27 = icmp eq i32 %26, 0, !dbg !808             ; <i1> [#uses=1]
  br i1 %27, label %bb1.i, label %bb5.i, !dbg !808

bb1.i:                                            ; preds = %bb.i6
  switch i8 %25, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !809
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !810
  %28 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !810 ; <i8*> [#uses=1]
  br label %bb6.i8, !dbg !810

bb5.i:                                            ; preds = %bb.i6
  %29 = sext i8 %25 to i32, !dbg !811             ; <i32> [#uses=1]
  %30 = tail call i32 @klee_get_valuel(i32 %29) nounwind, !dbg !811 ; <i32> [#uses=1]
  %31 = trunc i32 %30 to i8, !dbg !811            ; <i8> [#uses=3]
  %32 = icmp eq i8 %31, %25, !dbg !812            ; <i1> [#uses=1]
  %33 = zext i1 %32 to i32, !dbg !812             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %33) nounwind, !dbg !812
  store i8 %31, i8* %sc.1.i, align 1, !dbg !813
  %34 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !813 ; <i8*> [#uses=1]
  %35 = icmp eq i8 %31, 0, !dbg !814              ; <i1> [#uses=1]
  br i1 %35, label %__concretize_string.exit, label %bb6.i8, !dbg !814

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %28, %bb4.i7 ], [ %34, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %36 = add i32 %24, 1, !dbg !806                 ; <i32> [#uses=1]
  br label %bb.i6, !dbg !806

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %37 = tail call i32 (i32, ...)* @syscall(i32 196, i8* %path, %struct.stat64* %buf) nounwind, !dbg !804 ; <i32> [#uses=3]
  %38 = icmp eq i32 %37, -1, !dbg !815            ; <i1> [#uses=1]
  br i1 %38, label %bb2, label %bb4, !dbg !815

bb2:                                              ; preds = %__concretize_string.exit
  %39 = tail call i32* @__errno_location() nounwind readnone, !dbg !816 ; <i32*> [#uses=1]
  %40 = tail call i32 @klee_get_errno() nounwind, !dbg !816 ; <i32> [#uses=1]
  store i32 %40, i32* %39, align 4, !dbg !816
  ret i32 %37, !dbg !802

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %37, !dbg !802
}

define i32 @__fd_stat(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !817         ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !821                ; <i1> [#uses=1]
  br i1 %1, label %bb1, label %bb.i, !dbg !821

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !821 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !821            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !821                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %bb1, !dbg !821

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !822 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !823               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %17, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !823              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !823              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !823

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !824 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, i32 2, !dbg !825 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !825 ; <%struct.stat64*> [#uses=2]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !825 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !825         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !825             ; <i1> [#uses=1]
  br i1 %15, label %bb1, label %__get_sym_file.exit, !dbg !825

bb7.i:                                            ; preds = %bb3.i
  %16 = add i32 %17, 1, !dbg !822                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !822

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %17 = phi i32 [ %16, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %18 = icmp ugt i32 %5, %17, !dbg !822           ; <i1> [#uses=1]
  br i1 %18, label %bb3.i, label %bb1, !dbg !822

__get_sym_file.exit:                              ; preds = %bb4.i
  %19 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %17, !dbg !824 ; <%struct.exe_disk_file_t*> [#uses=1]
  %20 = icmp eq %struct.exe_disk_file_t* %19, null, !dbg !826 ; <i1> [#uses=1]
  br i1 %20, label %bb1, label %bb, !dbg !826

bb:                                               ; preds = %__get_sym_file.exit
  %21 = bitcast %struct.stat64* %buf to i8*, !dbg !827 ; <i8*> [#uses=1]
  %22 = bitcast %struct.stat64* %12 to i8*, !dbg !827 ; <i8*> [#uses=1]
  tail call void @llvm.memcpy.i32(i8* %21, i8* %22, i32 96, i32 4), !dbg !827
  ret i32 0, !dbg !828

bb1:                                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %__get_sym_file.exit
  %23 = tail call fastcc i8* @__concretize_ptr(i8* %path) nounwind, !dbg !829 ; <i8*> [#uses=1]
  br label %bb.i6, !dbg !832

bb.i6:                                            ; preds = %bb6.i8, %bb1
  %sc.1.i = phi i8* [ %23, %bb1 ], [ %sc.0.i, %bb6.i8 ] ; <i8*> [#uses=7]
  %24 = phi i32 [ 0, %bb1 ], [ %36, %bb6.i8 ]     ; <i32> [#uses=3]
  %tmp.i = add i32 %24, -1                        ; <i32> [#uses=1]
  %25 = load i8* %sc.1.i, align 1, !dbg !833      ; <i8> [#uses=3]
  %26 = and i32 %tmp.i, %24, !dbg !834            ; <i32> [#uses=1]
  %27 = icmp eq i32 %26, 0, !dbg !834             ; <i1> [#uses=1]
  br i1 %27, label %bb1.i, label %bb5.i, !dbg !834

bb1.i:                                            ; preds = %bb.i6
  switch i8 %25, label %bb6.i8 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i7
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !835
  br label %__concretize_string.exit

bb4.i7:                                           ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !836
  %28 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !836 ; <i8*> [#uses=1]
  br label %bb6.i8, !dbg !836

bb5.i:                                            ; preds = %bb.i6
  %29 = sext i8 %25 to i32, !dbg !837             ; <i32> [#uses=1]
  %30 = tail call i32 @klee_get_valuel(i32 %29) nounwind, !dbg !837 ; <i32> [#uses=1]
  %31 = trunc i32 %30 to i8, !dbg !837            ; <i8> [#uses=3]
  %32 = icmp eq i8 %31, %25, !dbg !838            ; <i1> [#uses=1]
  %33 = zext i1 %32 to i32, !dbg !838             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %33) nounwind, !dbg !838
  store i8 %31, i8* %sc.1.i, align 1, !dbg !839
  %34 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !839 ; <i8*> [#uses=1]
  %35 = icmp eq i8 %31, 0, !dbg !840              ; <i1> [#uses=1]
  br i1 %35, label %__concretize_string.exit, label %bb6.i8, !dbg !840

bb6.i8:                                           ; preds = %bb5.i, %bb4.i7, %bb1.i
  %sc.0.i = phi i8* [ %28, %bb4.i7 ], [ %34, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %36 = add i32 %24, 1, !dbg !832                 ; <i32> [#uses=1]
  br label %bb.i6, !dbg !832

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %37 = tail call i32 (i32, ...)* @syscall(i32 195, i8* %path, %struct.stat64* %buf) nounwind, !dbg !830 ; <i32> [#uses=3]
  %38 = icmp eq i32 %37, -1, !dbg !841            ; <i1> [#uses=1]
  br i1 %38, label %bb2, label %bb4, !dbg !841

bb2:                                              ; preds = %__concretize_string.exit
  %39 = tail call i32* @__errno_location() nounwind readnone, !dbg !842 ; <i32*> [#uses=1]
  %40 = tail call i32 @klee_get_errno() nounwind, !dbg !842 ; <i32> [#uses=1]
  store i32 %40, i32* %39, align 4, !dbg !842
  ret i32 %37, !dbg !828

bb4:                                              ; preds = %__concretize_string.exit
  ret i32 %37, !dbg !828
}

define i32 @read(i32 %fd, i8* %buf, i32 %count) nounwind {
entry:
  %0 = load i32* @n_calls.4399, align 4, !dbg !843 ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 1, !dbg !843               ; <i32> [#uses=2]
  store i32 %1, i32* @n_calls.4399, align 4, !dbg !843
  %2 = icmp eq i32 %count, 0, !dbg !845           ; <i1> [#uses=1]
  br i1 %2, label %bb24, label %bb1, !dbg !845

bb1:                                              ; preds = %entry
  %3 = icmp eq i8* %buf, null, !dbg !846          ; <i1> [#uses=1]
  br i1 %3, label %bb2, label %bb3, !dbg !846

bb2:                                              ; preds = %bb1
  %4 = tail call i32* @__errno_location() nounwind readnone, !dbg !847 ; <i32*> [#uses=1]
  store i32 14, i32* %4, align 4, !dbg !847
  ret i32 -1, !dbg !848

bb3:                                              ; preds = %bb1
  %5 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %5, label %bb.i, label %bb4, !dbg !849

bb.i:                                             ; preds = %bb3
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %7 = load i32* %6, align 4, !dbg !851           ; <i32> [#uses=1]
  %8 = and i32 %7, 1, !dbg !851                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %8, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb4, label %__get_file.exit, !dbg !851

__get_file.exit:                                  ; preds = %bb.i
  %9 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %10 = icmp eq %struct.exe_file_t* %9, null, !dbg !852 ; <i1> [#uses=1]
  br i1 %10, label %bb4, label %bb5, !dbg !852

bb4:                                              ; preds = %bb3, %bb.i, %__get_file.exit
  %11 = tail call i32* @__errno_location() nounwind readnone, !dbg !853 ; <i32*> [#uses=1]
  store i32 9, i32* %11, align 4, !dbg !853
  ret i32 -1, !dbg !848

bb5:                                              ; preds = %__get_file.exit
  %12 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !854 ; <i32> [#uses=2]
  %13 = icmp eq i32 %12, 0, !dbg !854             ; <i1> [#uses=1]
  br i1 %13, label %bb8, label %bb6, !dbg !854

bb6:                                              ; preds = %bb5
  %14 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 6), align 4, !dbg !854 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 4, !dbg !854         ; <i32> [#uses=1]
  %16 = icmp eq i32 %15, %1, !dbg !854            ; <i1> [#uses=1]
  br i1 %16, label %bb7, label %bb8, !dbg !854

bb7:                                              ; preds = %bb6
  %17 = add i32 %12, -1                           ; <i32> [#uses=1]
  store i32 %17, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !855
  %18 = tail call i32* @__errno_location() nounwind readnone, !dbg !856 ; <i32*> [#uses=1]
  store i32 5, i32* %18, align 4, !dbg !856
  ret i32 -1, !dbg !848

bb8:                                              ; preds = %bb5, %bb6
  %19 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %20 = load %struct.exe_disk_file_t** %19, align 4, !dbg !857 ; <%struct.exe_disk_file_t*> [#uses=3]
  %21 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !857 ; <i1> [#uses=1]
  br i1 %21, label %bb9, label %bb17, !dbg !857

bb9:                                              ; preds = %bb8
  %22 = ptrtoint i8* %buf to i32, !dbg !858       ; <i32> [#uses=1]
  %23 = tail call i32 @klee_get_valuel(i32 %22) nounwind, !dbg !858 ; <i32> [#uses=1]
  %24 = inttoptr i32 %23 to i8*, !dbg !858        ; <i8*> [#uses=4]
  %25 = icmp eq i8* %24, %buf, !dbg !861          ; <i1> [#uses=1]
  %26 = zext i1 %25 to i32, !dbg !861             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %26) nounwind, !dbg !861
  %27 = tail call i32 @klee_get_valuel(i32 %count) nounwind, !dbg !862 ; <i32> [#uses=4]
  %28 = icmp eq i32 %27, %count, !dbg !864        ; <i1> [#uses=1]
  %29 = zext i1 %28 to i32, !dbg !864             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %29) nounwind, !dbg !864
  tail call void @klee_check_memory_access(i8* %24, i32 %27) nounwind, !dbg !865
  %30 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=2]
  %31 = load i32* %30, align 4, !dbg !866         ; <i32> [#uses=3]
  %32 = icmp eq i32 %31, 0, !dbg !866             ; <i1> [#uses=1]
  br i1 %32, label %bb10, label %bb11, !dbg !866

bb10:                                             ; preds = %bb9
  %33 = tail call i32 (i32, ...)* @syscall(i32 3, i32 %31, i8* %24, i32 %27) nounwind, !dbg !867 ; <i32> [#uses=1]
  br label %bb12, !dbg !867

bb11:                                             ; preds = %bb9
  %34 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=1]
  %35 = load i64* %34, align 4, !dbg !868         ; <i64> [#uses=1]
  %36 = tail call i32 (i32, ...)* @syscall(i32 180, i32 %31, i8* %24, i32 %27, i64 %35) nounwind, !dbg !868 ; <i32> [#uses=1]
  br label %bb12, !dbg !868

bb12:                                             ; preds = %bb11, %bb10
  %r.0 = phi i32 [ %33, %bb10 ], [ %36, %bb11 ]   ; <i32> [#uses=4]
  %37 = icmp eq i32 %r.0, -1, !dbg !869           ; <i1> [#uses=1]
  br i1 %37, label %bb13, label %bb14, !dbg !869

bb13:                                             ; preds = %bb12
  %38 = tail call i32* @__errno_location() nounwind readnone, !dbg !870 ; <i32*> [#uses=1]
  %39 = tail call i32 @klee_get_errno() nounwind, !dbg !870 ; <i32> [#uses=1]
  store i32 %39, i32* %38, align 4, !dbg !870
  ret i32 -1, !dbg !848

bb14:                                             ; preds = %bb12
  %40 = load i32* %30, align 4, !dbg !871         ; <i32> [#uses=1]
  %41 = icmp eq i32 %40, 0, !dbg !871             ; <i1> [#uses=1]
  br i1 %41, label %bb24, label %bb15, !dbg !871

bb15:                                             ; preds = %bb14
  %42 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=2]
  %43 = load i64* %42, align 4, !dbg !872         ; <i64> [#uses=1]
  %44 = sext i32 %r.0 to i64, !dbg !872           ; <i64> [#uses=1]
  %45 = add nsw i64 %43, %44, !dbg !872           ; <i64> [#uses=1]
  store i64 %45, i64* %42, align 4, !dbg !872
  ret i32 %r.0, !dbg !848

bb17:                                             ; preds = %bb8
  %46 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=3]
  %47 = load i64* %46, align 4, !dbg !873         ; <i64> [#uses=5]
  %48 = icmp slt i64 %47, 0, !dbg !873            ; <i1> [#uses=1]
  br i1 %48, label %bb18, label %bb19, !dbg !873

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 284, i8* getelementptr inbounds ([5 x i8]* @__PRETTY_FUNCTION__.4402, i32 0, i32 0)) noreturn nounwind, !dbg !873
  unreachable, !dbg !873

bb19:                                             ; preds = %bb17
  %49 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 0, i32 0, !dbg !874 ; <i32*> [#uses=1]
  %50 = load i32* %49, align 4, !dbg !874         ; <i32> [#uses=2]
  %51 = zext i32 %50 to i64, !dbg !874            ; <i64> [#uses=2]
  %52 = icmp slt i64 %51, %47, !dbg !874          ; <i1> [#uses=1]
  br i1 %52, label %bb24, label %bb21, !dbg !874

bb21:                                             ; preds = %bb19
  %53 = zext i32 %count to i64, !dbg !875         ; <i64> [#uses=1]
  %54 = add nsw i64 %47, %53, !dbg !875           ; <i64> [#uses=1]
  %55 = icmp sgt i64 %54, %51, !dbg !875          ; <i1> [#uses=1]
  br i1 %55, label %bb22, label %bb23, !dbg !875

bb22:                                             ; preds = %bb21
  %56 = trunc i64 %47 to i32, !dbg !876           ; <i32> [#uses=1]
  %57 = sub i32 %50, %56, !dbg !876               ; <i32> [#uses=1]
  br label %bb23, !dbg !876

bb23:                                             ; preds = %bb21, %bb22
  %count_addr.0 = phi i32 [ %57, %bb22 ], [ %count, %bb21 ] ; <i32> [#uses=3]
  %58 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 0, i32 1, !dbg !877 ; <i8**> [#uses=1]
  %59 = load i8** %58, align 4, !dbg !877         ; <i8*> [#uses=1]
  %60 = trunc i64 %47 to i32, !dbg !877           ; <i32> [#uses=1]
  %61 = getelementptr inbounds i8* %59, i32 %60, !dbg !877 ; <i8*> [#uses=1]
  tail call void @llvm.memcpy.i32(i8* %buf, i8* %61, i32 %count_addr.0, i32 1), !dbg !877
  %62 = load i64* %46, align 4, !dbg !878         ; <i64> [#uses=1]
  %63 = zext i32 %count_addr.0 to i64, !dbg !878  ; <i64> [#uses=1]
  %64 = add nsw i64 %62, %63, !dbg !878           ; <i64> [#uses=1]
  store i64 %64, i64* %46, align 4, !dbg !878
  ret i32 %count_addr.0, !dbg !848

bb24:                                             ; preds = %bb19, %bb14, %entry
  %.0 = phi i32 [ 0, %entry ], [ %r.0, %bb14 ], [ 0, %bb19 ] ; <i32> [#uses=1]
  ret i32 %.0, !dbg !848
}

declare i32 @geteuid() nounwind

declare i32 @getgid() nounwind

define i32 @fchmod(i32 %fd, i32 %mode) nounwind {
entry:
  %0 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %0, label %bb.i, label %bb, !dbg !879

bb.i:                                             ; preds = %entry
  %1 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 4, !dbg !882           ; <i32> [#uses=1]
  %3 = and i32 %2, 1, !dbg !882                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %3, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !882

__get_file.exit:                                  ; preds = %bb.i
  %4 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %5 = icmp eq %struct.exe_file_t* %4, null, !dbg !883 ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb1, !dbg !883

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %6 = tail call i32* @__errno_location() nounwind readnone, !dbg !884 ; <i32*> [#uses=1]
  store i32 9, i32* %6, align 4, !dbg !884
  ret i32 -1, !dbg !885

bb1:                                              ; preds = %__get_file.exit
  %7 = load i32* @n_calls.4654, align 4, !dbg !886 ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 1, !dbg !886               ; <i32> [#uses=2]
  store i32 %8, i32* @n_calls.4654, align 4, !dbg !886
  %9 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !887 ; <i32> [#uses=2]
  %10 = icmp eq i32 %9, 0, !dbg !887              ; <i1> [#uses=1]
  br i1 %10, label %bb4, label %bb2, !dbg !887

bb2:                                              ; preds = %bb1
  %11 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 12), align 4, !dbg !887 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !887         ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, %8, !dbg !887            ; <i1> [#uses=1]
  br i1 %13, label %bb3, label %bb4, !dbg !887

bb3:                                              ; preds = %bb2
  %14 = add i32 %9, -1                            ; <i32> [#uses=1]
  store i32 %14, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !888
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !889 ; <i32*> [#uses=1]
  store i32 5, i32* %15, align 4, !dbg !889
  ret i32 -1, !dbg !885

bb4:                                              ; preds = %bb1, %bb2
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  %17 = load %struct.exe_disk_file_t** %16, align 4, !dbg !890 ; <%struct.exe_disk_file_t*> [#uses=2]
  %18 = icmp eq %struct.exe_disk_file_t* %17, null, !dbg !890 ; <i1> [#uses=1]
  br i1 %18, label %bb6, label %bb5, !dbg !890

bb5:                                              ; preds = %bb4
  %19 = tail call i32 @geteuid() nounwind, !dbg !891 ; <i32> [#uses=1]
  %20 = getelementptr inbounds %struct.exe_disk_file_t* %17, i32 0, i32 2, !dbg !891 ; <%struct.stat64**> [#uses=2]
  %21 = load %struct.stat64** %20, align 4, !dbg !891 ; <%struct.stat64*> [#uses=1]
  %22 = getelementptr inbounds %struct.stat64* %21, i32 0, i32 5, !dbg !891 ; <i32*> [#uses=1]
  %23 = load i32* %22, align 4, !dbg !891         ; <i32> [#uses=1]
  %24 = icmp eq i32 %19, %23, !dbg !891           ; <i1> [#uses=1]
  br i1 %24, label %bb.i11, label %bb3.i12, !dbg !891

bb.i11:                                           ; preds = %bb5
  %25 = tail call i32 @getgid() nounwind, !dbg !897 ; <i32> [#uses=1]
  %26 = load %struct.stat64** %20, align 4, !dbg !897 ; <%struct.stat64*> [#uses=2]
  %27 = getelementptr inbounds %struct.stat64* %26, i32 0, i32 6, !dbg !897 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 4, !dbg !897         ; <i32> [#uses=1]
  %29 = and i32 %mode, 3071, !dbg !898            ; <i32> [#uses=1]
  %30 = icmp eq i32 %25, %28, !dbg !897           ; <i1> [#uses=1]
  %mode..i = select i1 %30, i32 %mode, i32 %29    ; <i32> [#uses=1]
  %31 = getelementptr inbounds %struct.stat64* %26, i32 0, i32 3, !dbg !899 ; <i32*> [#uses=2]
  %32 = load i32* %31, align 4, !dbg !899         ; <i32> [#uses=1]
  %33 = and i32 %32, -4096, !dbg !899             ; <i32> [#uses=1]
  %34 = and i32 %mode..i, 4095, !dbg !899         ; <i32> [#uses=1]
  %35 = or i32 %34, %33, !dbg !899                ; <i32> [#uses=1]
  store i32 %35, i32* %31, align 4, !dbg !899
  ret i32 0, !dbg !885

bb3.i12:                                          ; preds = %bb5
  %36 = tail call i32* @__errno_location() nounwind readnone, !dbg !900 ; <i32*> [#uses=1]
  store i32 1, i32* %36, align 4, !dbg !900
  ret i32 -1, !dbg !885

bb6:                                              ; preds = %bb4
  %37 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=1]
  %38 = load i32* %37, align 4, !dbg !901         ; <i32> [#uses=1]
  %39 = tail call i32 (i32, ...)* @syscall(i32 94, i32 %38, i32 %mode) nounwind, !dbg !901 ; <i32> [#uses=3]
  %40 = icmp eq i32 %39, -1, !dbg !903            ; <i1> [#uses=1]
  br i1 %40, label %bb7, label %bb9, !dbg !903

bb7:                                              ; preds = %bb6
  %41 = tail call i32* @__errno_location() nounwind readnone, !dbg !904 ; <i32*> [#uses=1]
  %42 = tail call i32 @klee_get_errno() nounwind, !dbg !904 ; <i32> [#uses=1]
  store i32 %42, i32* %41, align 4, !dbg !904
  ret i32 %39, !dbg !885

bb9:                                              ; preds = %bb6
  ret i32 %39, !dbg !885
}

define i32 @chmod(i8* %path, i32 %mode) nounwind {
entry:
  %0 = load i8* %path, align 1, !dbg !905         ; <i8> [#uses=2]
  %1 = icmp eq i8 %0, 0, !dbg !908                ; <i1> [#uses=1]
  br i1 %1, label %__get_sym_file.exit, label %bb.i, !dbg !908

bb.i:                                             ; preds = %entry
  %2 = getelementptr inbounds i8* %path, i32 1, !dbg !908 ; <i8*> [#uses=1]
  %3 = load i8* %2, align 1, !dbg !908            ; <i8> [#uses=1]
  %4 = icmp eq i8 %3, 0, !dbg !908                ; <i1> [#uses=1]
  br i1 %4, label %bb8.preheader.i, label %__get_sym_file.exit, !dbg !908

bb8.preheader.i:                                  ; preds = %bb.i
  %5 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !909 ; <i32> [#uses=1]
  %6 = sext i8 %0 to i32, !dbg !910               ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %18, 24                       ; <i32> [#uses=1]
  %7 = ashr i32 %sext.i, 24                       ; <i32> [#uses=1]
  %8 = add nsw i32 %7, 65, !dbg !910              ; <i32> [#uses=1]
  %9 = icmp eq i32 %6, %8, !dbg !910              ; <i1> [#uses=1]
  br i1 %9, label %bb4.i, label %bb7.i, !dbg !910

bb4.i:                                            ; preds = %bb3.i
  %10 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !911 ; <%struct.exe_disk_file_t*> [#uses=2]
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %18, i32 2, !dbg !912 ; <%struct.stat64**> [#uses=1]
  %12 = load %struct.stat64** %11, align 4, !dbg !912 ; <%struct.stat64*> [#uses=1]
  %13 = getelementptr inbounds %struct.stat64* %12, i32 0, i32 15, !dbg !912 ; <i64*> [#uses=1]
  %14 = load i64* %13, align 4, !dbg !912         ; <i64> [#uses=1]
  %15 = icmp eq i64 %14, 0, !dbg !912             ; <i1> [#uses=1]
  br i1 %15, label %__get_sym_file.exit, label %bb6.i, !dbg !912

bb6.i:                                            ; preds = %bb4.i
  %16 = getelementptr inbounds %struct.exe_disk_file_t* %10, i32 %18, !dbg !911 ; <%struct.exe_disk_file_t*> [#uses=1]
  br label %__get_sym_file.exit

bb7.i:                                            ; preds = %bb3.i
  %17 = add i32 %18, 1, !dbg !909                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !909

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %18 = phi i32 [ %17, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %19 = icmp ugt i32 %5, %18, !dbg !909           ; <i1> [#uses=1]
  br i1 %19, label %bb3.i, label %__get_sym_file.exit, !dbg !909

__get_sym_file.exit:                              ; preds = %bb8.i, %entry, %bb.i, %bb4.i, %bb6.i
  %20 = phi %struct.exe_disk_file_t* [ %16, %bb6.i ], [ null, %bb4.i ], [ null, %bb.i ], [ null, %entry ], [ null, %bb8.i ] ; <%struct.exe_disk_file_t*> [#uses=2]
  %21 = load i32* @n_calls.4631, align 4, !dbg !913 ; <i32> [#uses=1]
  %22 = add nsw i32 %21, 1, !dbg !913             ; <i32> [#uses=2]
  store i32 %22, i32* @n_calls.4631, align 4, !dbg !913
  %23 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !914 ; <i32> [#uses=2]
  %24 = icmp eq i32 %23, 0, !dbg !914             ; <i1> [#uses=1]
  br i1 %24, label %bb2, label %bb, !dbg !914

bb:                                               ; preds = %__get_sym_file.exit
  %25 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 11), align 4, !dbg !914 ; <i32*> [#uses=1]
  %26 = load i32* %25, align 4, !dbg !914         ; <i32> [#uses=1]
  %27 = icmp eq i32 %26, %22, !dbg !914           ; <i1> [#uses=1]
  br i1 %27, label %bb1, label %bb2, !dbg !914

bb1:                                              ; preds = %bb
  %28 = add i32 %23, -1                           ; <i32> [#uses=1]
  store i32 %28, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !915
  %29 = tail call i32* @__errno_location() nounwind readnone, !dbg !916 ; <i32*> [#uses=1]
  store i32 5, i32* %29, align 4, !dbg !916
  ret i32 -1, !dbg !917

bb2:                                              ; preds = %__get_sym_file.exit, %bb
  %30 = icmp eq %struct.exe_disk_file_t* %20, null, !dbg !918 ; <i1> [#uses=1]
  br i1 %30, label %bb4, label %bb3, !dbg !918

bb3:                                              ; preds = %bb2
  %31 = tail call i32 @geteuid() nounwind, !dbg !919 ; <i32> [#uses=1]
  %32 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 0, i32 2, !dbg !919 ; <%struct.stat64**> [#uses=2]
  %33 = load %struct.stat64** %32, align 4, !dbg !919 ; <%struct.stat64*> [#uses=1]
  %34 = getelementptr inbounds %struct.stat64* %33, i32 0, i32 5, !dbg !919 ; <i32*> [#uses=1]
  %35 = load i32* %34, align 4, !dbg !919         ; <i32> [#uses=1]
  %36 = icmp eq i32 %31, %35, !dbg !919           ; <i1> [#uses=1]
  br i1 %36, label %bb.i13, label %bb3.i14, !dbg !919

bb.i13:                                           ; preds = %bb3
  %37 = tail call i32 @getgid() nounwind, !dbg !921 ; <i32> [#uses=1]
  %38 = load %struct.stat64** %32, align 4, !dbg !921 ; <%struct.stat64*> [#uses=2]
  %39 = getelementptr inbounds %struct.stat64* %38, i32 0, i32 6, !dbg !921 ; <i32*> [#uses=1]
  %40 = load i32* %39, align 4, !dbg !921         ; <i32> [#uses=1]
  %41 = and i32 %mode, 3071, !dbg !922            ; <i32> [#uses=1]
  %42 = icmp eq i32 %37, %40, !dbg !921           ; <i1> [#uses=1]
  %mode..i = select i1 %42, i32 %mode, i32 %41    ; <i32> [#uses=1]
  %43 = getelementptr inbounds %struct.stat64* %38, i32 0, i32 3, !dbg !923 ; <i32*> [#uses=2]
  %44 = load i32* %43, align 4, !dbg !923         ; <i32> [#uses=1]
  %45 = and i32 %44, -4096, !dbg !923             ; <i32> [#uses=1]
  %46 = and i32 %mode..i, 4095, !dbg !923         ; <i32> [#uses=1]
  %47 = or i32 %46, %45, !dbg !923                ; <i32> [#uses=1]
  store i32 %47, i32* %43, align 4, !dbg !923
  ret i32 0, !dbg !917

bb3.i14:                                          ; preds = %bb3
  %48 = tail call i32* @__errno_location() nounwind readnone, !dbg !924 ; <i32*> [#uses=1]
  store i32 1, i32* %48, align 4, !dbg !924
  ret i32 -1, !dbg !917

bb4:                                              ; preds = %bb2
  %49 = tail call fastcc i8* @__concretize_ptr(i8* %path) nounwind, !dbg !925 ; <i8*> [#uses=1]
  br label %bb.i9, !dbg !928

bb.i9:                                            ; preds = %bb6.i11, %bb4
  %sc.1.i = phi i8* [ %49, %bb4 ], [ %sc.0.i, %bb6.i11 ] ; <i8*> [#uses=7]
  %50 = phi i32 [ 0, %bb4 ], [ %62, %bb6.i11 ]    ; <i32> [#uses=3]
  %tmp.i = add i32 %50, -1                        ; <i32> [#uses=1]
  %51 = load i8* %sc.1.i, align 1, !dbg !929      ; <i8> [#uses=3]
  %52 = and i32 %tmp.i, %50, !dbg !930            ; <i32> [#uses=1]
  %53 = icmp eq i32 %52, 0, !dbg !930             ; <i1> [#uses=1]
  br i1 %53, label %bb1.i, label %bb5.i, !dbg !930

bb1.i:                                            ; preds = %bb.i9
  switch i8 %51, label %bb6.i11 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i10
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !931
  br label %__concretize_string.exit

bb4.i10:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !932
  %54 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !932 ; <i8*> [#uses=1]
  br label %bb6.i11, !dbg !932

bb5.i:                                            ; preds = %bb.i9
  %55 = sext i8 %51 to i32, !dbg !933             ; <i32> [#uses=1]
  %56 = tail call i32 @klee_get_valuel(i32 %55) nounwind, !dbg !933 ; <i32> [#uses=1]
  %57 = trunc i32 %56 to i8, !dbg !933            ; <i8> [#uses=3]
  %58 = icmp eq i8 %57, %51, !dbg !934            ; <i1> [#uses=1]
  %59 = zext i1 %58 to i32, !dbg !934             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %59) nounwind, !dbg !934
  store i8 %57, i8* %sc.1.i, align 1, !dbg !935
  %60 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !935 ; <i8*> [#uses=1]
  %61 = icmp eq i8 %57, 0, !dbg !936              ; <i1> [#uses=1]
  br i1 %61, label %__concretize_string.exit, label %bb6.i11, !dbg !936

bb6.i11:                                          ; preds = %bb5.i, %bb4.i10, %bb1.i
  %sc.0.i = phi i8* [ %54, %bb4.i10 ], [ %60, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %62 = add i32 %50, 1, !dbg !928                 ; <i32> [#uses=1]
  br label %bb.i9, !dbg !928

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %63 = tail call i32 (i32, ...)* @syscall(i32 15, i8* %path, i32 %mode) nounwind, !dbg !926 ; <i32> [#uses=3]
  %64 = icmp eq i32 %63, -1, !dbg !937            ; <i1> [#uses=1]
  br i1 %64, label %bb5, label %bb7, !dbg !937

bb5:                                              ; preds = %__concretize_string.exit
  %65 = tail call i32* @__errno_location() nounwind readnone, !dbg !938 ; <i32*> [#uses=1]
  %66 = tail call i32 @klee_get_errno() nounwind, !dbg !938 ; <i32> [#uses=1]
  store i32 %66, i32* %65, align 4, !dbg !938
  ret i32 %63, !dbg !917

bb7:                                              ; preds = %__concretize_string.exit
  ret i32 %63, !dbg !917
}

define i32 @write(i32 %fd, i8* %buf, i32 %count) nounwind {
entry:
  %0 = load i32* @n_calls.4458, align 4, !dbg !939 ; <i32> [#uses=1]
  %1 = add nsw i32 %0, 1, !dbg !939               ; <i32> [#uses=2]
  store i32 %1, i32* @n_calls.4458, align 4, !dbg !939
  %2 = icmp ult i32 %fd, 32                       ; <i1> [#uses=1]
  br i1 %2, label %bb.i, label %bb, !dbg !941

bb.i:                                             ; preds = %entry
  %3 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 1 ; <i32*> [#uses=1]
  %4 = load i32* %3, align 4, !dbg !943           ; <i32> [#uses=1]
  %5 = and i32 %4, 1, !dbg !943                   ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %5, 0                   ; <i1> [#uses=1]
  br i1 %toBool.i, label %bb, label %__get_file.exit, !dbg !943

__get_file.exit:                                  ; preds = %bb.i
  %6 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd ; <%struct.exe_file_t*> [#uses=1]
  %7 = icmp eq %struct.exe_file_t* %6, null, !dbg !944 ; <i1> [#uses=1]
  br i1 %7, label %bb, label %bb1, !dbg !944

bb:                                               ; preds = %entry, %bb.i, %__get_file.exit
  %8 = tail call i32* @__errno_location() nounwind readnone, !dbg !945 ; <i32*> [#uses=1]
  store i32 9, i32* %8, align 4, !dbg !945
  ret i32 -1, !dbg !946

bb1:                                              ; preds = %__get_file.exit
  %9 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !947 ; <i32> [#uses=2]
  %10 = icmp eq i32 %9, 0, !dbg !947              ; <i1> [#uses=1]
  br i1 %10, label %bb4, label %bb2, !dbg !947

bb2:                                              ; preds = %bb1
  %11 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 7), align 4, !dbg !947 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !947         ; <i32> [#uses=1]
  %13 = icmp eq i32 %12, %1, !dbg !947            ; <i1> [#uses=1]
  br i1 %13, label %bb3, label %bb4, !dbg !947

bb3:                                              ; preds = %bb2
  %14 = add i32 %9, -1                            ; <i32> [#uses=1]
  store i32 %14, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !948
  %15 = tail call i32* @__errno_location() nounwind readnone, !dbg !949 ; <i32*> [#uses=1]
  store i32 5, i32* %15, align 4, !dbg !949
  ret i32 -1, !dbg !946

bb4:                                              ; preds = %bb1, %bb2
  %16 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 3 ; <%struct.exe_disk_file_t**> [#uses=2]
  %17 = load %struct.exe_disk_file_t** %16, align 4, !dbg !950 ; <%struct.exe_disk_file_t*> [#uses=3]
  %18 = icmp eq %struct.exe_disk_file_t* %17, null, !dbg !950 ; <i1> [#uses=1]
  br i1 %18, label %bb5, label %bb15, !dbg !950

bb5:                                              ; preds = %bb4
  %19 = ptrtoint i8* %buf to i32, !dbg !951       ; <i32> [#uses=1]
  %20 = tail call i32 @klee_get_valuel(i32 %19) nounwind, !dbg !951 ; <i32> [#uses=1]
  %21 = inttoptr i32 %20 to i8*, !dbg !951        ; <i8*> [#uses=4]
  %22 = icmp eq i8* %21, %buf, !dbg !954          ; <i1> [#uses=1]
  %23 = zext i1 %22 to i32, !dbg !954             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %23) nounwind, !dbg !954
  %24 = tail call i32 @klee_get_valuel(i32 %count) nounwind, !dbg !955 ; <i32> [#uses=4]
  %25 = icmp eq i32 %24, %count, !dbg !957        ; <i1> [#uses=1]
  %26 = zext i1 %25 to i32, !dbg !957             ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %26) nounwind, !dbg !957
  tail call void @klee_check_memory_access(i8* %21, i32 %24) nounwind, !dbg !958
  %27 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 0 ; <i32*> [#uses=2]
  %28 = load i32* %27, align 4, !dbg !959         ; <i32> [#uses=3]
  %29 = add i32 %28, -1                           ; <i32> [#uses=1]
  %30 = icmp ult i32 %29, 2                       ; <i1> [#uses=1]
  br i1 %30, label %bb6, label %bb7, !dbg !959

bb6:                                              ; preds = %bb5
  %31 = tail call i32 (i32, ...)* @syscall(i32 4, i32 %28, i8* %21, i32 %24) nounwind, !dbg !960 ; <i32> [#uses=1]
  br label %bb8, !dbg !960

bb7:                                              ; preds = %bb5
  %32 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=1]
  %33 = load i64* %32, align 4, !dbg !961         ; <i64> [#uses=1]
  %34 = tail call i32 (i32, ...)* @syscall(i32 181, i32 %28, i8* %21, i32 %24, i64 %33) nounwind, !dbg !961 ; <i32> [#uses=1]
  br label %bb8, !dbg !961

bb8:                                              ; preds = %bb7, %bb6
  %r.0 = phi i32 [ %31, %bb6 ], [ %34, %bb7 ]     ; <i32> [#uses=5]
  %35 = icmp eq i32 %r.0, -1, !dbg !962           ; <i1> [#uses=1]
  br i1 %35, label %bb9, label %bb10, !dbg !962

bb9:                                              ; preds = %bb8
  %36 = tail call i32* @__errno_location() nounwind readnone, !dbg !963 ; <i32*> [#uses=1]
  %37 = tail call i32 @klee_get_errno() nounwind, !dbg !963 ; <i32> [#uses=1]
  store i32 %37, i32* %36, align 4, !dbg !963
  ret i32 -1, !dbg !946

bb10:                                             ; preds = %bb8
  %38 = icmp slt i32 %r.0, 0, !dbg !964           ; <i1> [#uses=1]
  br i1 %38, label %bb11, label %bb12, !dbg !964

bb11:                                             ; preds = %bb10
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 338, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4461, i32 0, i32 0)) noreturn nounwind, !dbg !964
  unreachable, !dbg !964

bb12:                                             ; preds = %bb10
  %39 = load i32* %27, align 4, !dbg !965         ; <i32> [#uses=1]
  %40 = add i32 %39, -1                           ; <i32> [#uses=1]
  %41 = icmp ugt i32 %40, 1, !dbg !965            ; <i1> [#uses=1]
  br i1 %41, label %bb13, label %bb28, !dbg !965

bb13:                                             ; preds = %bb12
  %42 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=2]
  %43 = load i64* %42, align 4, !dbg !966         ; <i64> [#uses=1]
  %44 = sext i32 %r.0 to i64, !dbg !966           ; <i64> [#uses=1]
  %45 = add nsw i64 %43, %44, !dbg !966           ; <i64> [#uses=1]
  store i64 %45, i64* %42, align 4, !dbg !966
  ret i32 %r.0, !dbg !946

bb15:                                             ; preds = %bb4
  %46 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %fd, i32 2 ; <i64*> [#uses=3]
  %47 = load i64* %46, align 4, !dbg !967         ; <i64> [#uses=4]
  %48 = zext i32 %count to i64, !dbg !967         ; <i64> [#uses=2]
  %49 = add nsw i64 %47, %48, !dbg !967           ; <i64> [#uses=1]
  %50 = getelementptr inbounds %struct.exe_disk_file_t* %17, i32 0, i32 0, !dbg !967 ; <i32*> [#uses=1]
  %51 = load i32* %50, align 4, !dbg !967         ; <i32> [#uses=2]
  %52 = zext i32 %51 to i64, !dbg !967            ; <i64> [#uses=2]
  %53 = icmp sgt i64 %49, %52, !dbg !967          ; <i1> [#uses=1]
  br i1 %53, label %bb17, label %bb21, !dbg !967

bb17:                                             ; preds = %bb15
  %54 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 3), align 4, !dbg !969 ; <i32> [#uses=1]
  %55 = icmp eq i32 %54, 0, !dbg !969             ; <i1> [#uses=1]
  br i1 %55, label %bb19, label %bb18, !dbg !969

bb18:                                             ; preds = %bb17
  tail call void @__assert_fail(i8* getelementptr inbounds ([2 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str16, i32 0, i32 0), i32 351, i8* getelementptr inbounds ([6 x i8]* @__PRETTY_FUNCTION__.4461, i32 0, i32 0)) noreturn nounwind, !dbg !970
  unreachable, !dbg !970

bb19:                                             ; preds = %bb17
  %56 = icmp slt i64 %47, %52, !dbg !971          ; <i1> [#uses=1]
  br i1 %56, label %bb20, label %bb23, !dbg !971

bb20:                                             ; preds = %bb19
  %57 = trunc i64 %47 to i32, !dbg !972           ; <i32> [#uses=1]
  %58 = sub i32 %51, %57, !dbg !972               ; <i32> [#uses=1]
  br label %bb21, !dbg !972

bb21:                                             ; preds = %bb15, %bb20
  %actual_count.0 = phi i32 [ %58, %bb20 ], [ %count, %bb15 ] ; <i32> [#uses=4]
  %59 = icmp eq i32 %actual_count.0, 0, !dbg !973 ; <i1> [#uses=1]
  br i1 %59, label %bb23, label %bb22, !dbg !973

bb22:                                             ; preds = %bb21
  %60 = getelementptr inbounds %struct.exe_disk_file_t* %17, i32 0, i32 1, !dbg !974 ; <i8**> [#uses=1]
  %61 = load i8** %60, align 4, !dbg !974         ; <i8*> [#uses=1]
  %62 = trunc i64 %47 to i32, !dbg !974           ; <i32> [#uses=1]
  %63 = getelementptr inbounds i8* %61, i32 %62, !dbg !974 ; <i8*> [#uses=1]
  tail call void @llvm.memcpy.i32(i8* %63, i8* %buf, i32 %actual_count.0, i32 1), !dbg !974
  br label %bb23, !dbg !974

bb23:                                             ; preds = %bb19, %bb21, %bb22
  %actual_count.030 = phi i32 [ %actual_count.0, %bb21 ], [ %actual_count.0, %bb22 ], [ 0, %bb19 ] ; <i32> [#uses=2]
  %64 = icmp eq i32 %actual_count.030, %count, !dbg !975 ; <i1> [#uses=1]
  br i1 %64, label %bb25, label %bb24, !dbg !975

bb24:                                             ; preds = %bb23
  %65 = load %struct._IO_FILE** @stderr, align 4, !dbg !976 ; <%struct._IO_FILE*> [#uses=1]
  %66 = bitcast %struct._IO_FILE* %65 to i8*, !dbg !976 ; <i8*> [#uses=1]
  %67 = tail call i32 @fwrite(i8* getelementptr inbounds ([33 x i8]* @.str21, i32 0, i32 0), i32 1, i32 32, i8* %66) nounwind, !dbg !976 ; <i32> [#uses=0]
  br label %bb25, !dbg !976

bb25:                                             ; preds = %bb23, %bb24
  %68 = load %struct.exe_disk_file_t** %16, align 4, !dbg !977 ; <%struct.exe_disk_file_t*> [#uses=1]
  %69 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 2), align 4, !dbg !977 ; <%struct.exe_disk_file_t*> [#uses=1]
  %70 = icmp eq %struct.exe_disk_file_t* %68, %69, !dbg !977 ; <i1> [#uses=1]
  br i1 %70, label %bb26, label %bb27, !dbg !977

bb26:                                             ; preds = %bb25
  %71 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 3), align 4, !dbg !978 ; <i32> [#uses=1]
  %72 = add i32 %71, %actual_count.030, !dbg !978 ; <i32> [#uses=1]
  store i32 %72, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 3), align 4, !dbg !978
  br label %bb27, !dbg !978

bb27:                                             ; preds = %bb25, %bb26
  %73 = load i64* %46, align 4, !dbg !979         ; <i64> [#uses=1]
  %74 = add nsw i64 %73, %48, !dbg !979           ; <i64> [#uses=1]
  store i64 %74, i64* %46, align 4, !dbg !979
  ret i32 %count, !dbg !946

bb28:                                             ; preds = %bb12
  ret i32 %r.0, !dbg !946
}

declare i32 @fwrite(i8* nocapture, i32, i32, i8* nocapture) nounwind

define i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode) nounwind {
entry:
  br label %bb2, !dbg !980

bb:                                               ; preds = %bb2
  %scevgep = getelementptr %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 1 ; <i32*> [#uses=1]
  %0 = load i32* %scevgep, align 4, !dbg !985     ; <i32> [#uses=1]
  %1 = and i32 %0, 1, !dbg !985                   ; <i32> [#uses=1]
  %2 = icmp eq i32 %1, 0, !dbg !985               ; <i1> [#uses=1]
  br i1 %2, label %bb3, label %bb1, !dbg !985

bb1:                                              ; preds = %bb
  %3 = add nsw i32 %4, 1, !dbg !980               ; <i32> [#uses=1]
  br label %bb2, !dbg !980

bb2:                                              ; preds = %bb1, %entry
  %4 = phi i32 [ 0, %entry ], [ %3, %bb1 ]        ; <i32> [#uses=11]
  %5 = icmp slt i32 %4, 32                        ; <i1> [#uses=1]
  br i1 %5, label %bb, label %bb3, !dbg !980

bb3:                                              ; preds = %bb2, %bb
  %6 = icmp eq i32 %4, 32, !dbg !986              ; <i1> [#uses=1]
  br i1 %6, label %bb4, label %bb5, !dbg !986

bb4:                                              ; preds = %bb3
  %7 = tail call i32* @__errno_location() nounwind readnone, !dbg !987 ; <i32*> [#uses=1]
  store i32 24, i32* %7, align 4, !dbg !987
  ret i32 -1, !dbg !988

bb5:                                              ; preds = %bb3
  %8 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4 ; <%struct.exe_file_t*> [#uses=1]
  %9 = bitcast %struct.exe_file_t* %8 to i8*, !dbg !989 ; <i8*> [#uses=1]
  tail call void @llvm.memset.i32(i8* %9, i8 0, i32 20, i32 4), !dbg !989
  %10 = load i8* %pathname, align 1, !dbg !990    ; <i8> [#uses=2]
  %11 = icmp eq i8 %10, 0, !dbg !992              ; <i1> [#uses=1]
  br i1 %11, label %bb16, label %bb.i, !dbg !992

bb.i:                                             ; preds = %bb5
  %12 = getelementptr inbounds i8* %pathname, i32 1, !dbg !992 ; <i8*> [#uses=1]
  %13 = load i8* %12, align 1, !dbg !992          ; <i8> [#uses=1]
  %14 = icmp eq i8 %13, 0, !dbg !992              ; <i1> [#uses=1]
  br i1 %14, label %bb8.preheader.i, label %bb16, !dbg !992

bb8.preheader.i:                                  ; preds = %bb.i
  %15 = load i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 4, !dbg !993 ; <i32> [#uses=1]
  %16 = sext i8 %10 to i32, !dbg !994             ; <i32> [#uses=1]
  br label %bb8.i

bb3.i:                                            ; preds = %bb8.i
  %sext.i = shl i32 %27, 24                       ; <i32> [#uses=1]
  %17 = ashr i32 %sext.i, 24                      ; <i32> [#uses=1]
  %18 = add nsw i32 %17, 65, !dbg !994            ; <i32> [#uses=1]
  %19 = icmp eq i32 %16, %18, !dbg !994           ; <i1> [#uses=1]
  br i1 %19, label %bb4.i, label %bb7.i, !dbg !994

bb4.i:                                            ; preds = %bb3.i
  %20 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 4, !dbg !995 ; <%struct.exe_disk_file_t*> [#uses=2]
  %21 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 %27, i32 2, !dbg !996 ; <%struct.stat64**> [#uses=2]
  %22 = load %struct.stat64** %21, align 4, !dbg !996 ; <%struct.stat64*> [#uses=1]
  %23 = getelementptr inbounds %struct.stat64* %22, i32 0, i32 15, !dbg !996 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !996         ; <i64> [#uses=1]
  %25 = icmp eq i64 %24, 0, !dbg !996             ; <i1> [#uses=1]
  br i1 %25, label %bb16, label %__get_sym_file.exit, !dbg !996

bb7.i:                                            ; preds = %bb3.i
  %26 = add i32 %27, 1, !dbg !993                 ; <i32> [#uses=1]
  br label %bb8.i, !dbg !993

bb8.i:                                            ; preds = %bb7.i, %bb8.preheader.i
  %27 = phi i32 [ %26, %bb7.i ], [ 0, %bb8.preheader.i ] ; <i32> [#uses=5]
  %28 = icmp ugt i32 %15, %27, !dbg !993          ; <i1> [#uses=1]
  br i1 %28, label %bb3.i, label %bb16, !dbg !993

__get_sym_file.exit:                              ; preds = %bb4.i
  %29 = getelementptr inbounds %struct.exe_disk_file_t* %20, i32 %27, !dbg !995 ; <%struct.exe_disk_file_t*> [#uses=2]
  %30 = icmp eq %struct.exe_disk_file_t* %29, null, !dbg !997 ; <i1> [#uses=1]
  br i1 %30, label %bb16, label %bb6, !dbg !997

bb6:                                              ; preds = %__get_sym_file.exit
  %31 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 3 ; <%struct.exe_disk_file_t**> [#uses=1]
  store %struct.exe_disk_file_t* %29, %struct.exe_disk_file_t** %31, align 4, !dbg !998
  %32 = and i32 %flags, 64, !dbg !999             ; <i32> [#uses=1]
  %33 = icmp eq i32 %32, 0, !dbg !999             ; <i1> [#uses=2]
  br i1 %33, label %bb9, label %bb7, !dbg !999

bb7:                                              ; preds = %bb6
  %34 = and i32 %flags, 128, !dbg !999            ; <i32> [#uses=1]
  %35 = icmp eq i32 %34, 0, !dbg !999             ; <i1> [#uses=1]
  br i1 %35, label %bb9, label %bb8, !dbg !999

bb8:                                              ; preds = %bb7
  %36 = tail call i32* @__errno_location() nounwind readnone, !dbg !1000 ; <i32*> [#uses=1]
  store i32 17, i32* %36, align 4, !dbg !1000
  ret i32 -1, !dbg !988

bb9:                                              ; preds = %bb6, %bb7
  %37 = and i32 %flags, 128, !dbg !1001           ; <i32> [#uses=1]
  %38 = icmp eq i32 %37, 0, !dbg !1001            ; <i1> [#uses=1]
  %.not = xor i1 %33, true                        ; <i1> [#uses=1]
  %brmerge = or i1 %38, %.not                     ; <i1> [#uses=1]
  br i1 %brmerge, label %bb12, label %bb11, !dbg !1001

bb11:                                             ; preds = %bb9
  %39 = load %struct._IO_FILE** @stderr, align 4, !dbg !1002 ; <%struct._IO_FILE*> [#uses=1]
  %40 = bitcast %struct._IO_FILE* %39 to i8*, !dbg !1002 ; <i8*> [#uses=1]
  %41 = tail call i32 @fwrite(i8* getelementptr inbounds ([47 x i8]* @.str22, i32 0, i32 0), i32 1, i32 46, i8* %40) nounwind, !dbg !1002 ; <i32> [#uses=0]
  %42 = tail call i32* @__errno_location() nounwind readnone, !dbg !1003 ; <i32*> [#uses=1]
  store i32 13, i32* %42, align 4, !dbg !1003
  ret i32 -1, !dbg !988

bb12:                                             ; preds = %bb9
  %43 = load %struct.stat64** %21, align 4, !dbg !1004 ; <%struct.stat64*> [#uses=1]
  %44 = getelementptr inbounds %struct.stat64* %43, i32 0, i32 3, !dbg !1005 ; <i32*> [#uses=2]
  %45 = load i32* %44, align 4, !dbg !1005        ; <i32> [#uses=3]
  %46 = and i32 %flags, 2, !dbg !1008             ; <i32> [#uses=1]
  %47 = and i32 %flags, 1, !dbg !1009             ; <i32> [#uses=1]
  %toBool.i = icmp eq i32 %47, 0                  ; <i1> [#uses=1]
  %48 = icmp eq i32 %46, 0, !dbg !1009            ; <i1> [#uses=2]
  br i1 %toBool.i, label %bb3.i31, label %bb6.i32, !dbg !1009

bb3.i31:                                          ; preds = %bb12
  br i1 %48, label %bb14, label %bb7.i33, !dbg !1009

bb6.i32:                                          ; preds = %bb12
  br i1 %48, label %has_permission.exit, label %bb7.i33, !dbg !1010

bb7.i33:                                          ; preds = %bb6.i32, %bb3.i31
  %49 = and i32 %45, 292, !dbg !1010              ; <i32> [#uses=1]
  %50 = icmp eq i32 %49, 0, !dbg !1010            ; <i1> [#uses=1]
  br i1 %50, label %has_permission.exit, label %bb13, !dbg !1010

has_permission.exit:                              ; preds = %bb6.i32, %bb7.i33
  %51 = and i32 %45, 146, !dbg !1011              ; <i32> [#uses=1]
  %phitmp = icmp eq i32 %51, 0                    ; <i1> [#uses=1]
  br i1 %phitmp, label %bb13, label %bb14, !dbg !1004

bb13:                                             ; preds = %bb7.i33, %has_permission.exit
  %52 = tail call i32* @__errno_location() nounwind readnone, !dbg !1012 ; <i32*> [#uses=1]
  store i32 13, i32* %52, align 4, !dbg !1012
  ret i32 -1, !dbg !988

bb14:                                             ; preds = %bb3.i31, %has_permission.exit
  %53 = and i32 %45, -512, !dbg !1013             ; <i32> [#uses=1]
  %54 = load i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 1), align 4, !dbg !1013 ; <i32> [#uses=1]
  %not = xor i32 %54, -1, !dbg !1013              ; <i32> [#uses=1]
  %55 = and i32 %not, %mode, !dbg !1013           ; <i32> [#uses=1]
  %56 = or i32 %55, %53, !dbg !1013               ; <i32> [#uses=1]
  store i32 %56, i32* %44, align 4, !dbg !1013
  br label %bb19, !dbg !1013

bb16:                                             ; preds = %bb8.i, %bb5, %bb.i, %bb4.i, %__get_sym_file.exit
  %57 = tail call fastcc i8* @__concretize_ptr(i8* %pathname) nounwind, !dbg !1014 ; <i8*> [#uses=1]
  br label %bb.i27, !dbg !1017

bb.i27:                                           ; preds = %bb6.i29, %bb16
  %sc.1.i = phi i8* [ %57, %bb16 ], [ %sc.0.i, %bb6.i29 ] ; <i8*> [#uses=7]
  %58 = phi i32 [ 0, %bb16 ], [ %70, %bb6.i29 ]   ; <i32> [#uses=3]
  %tmp.i = add i32 %58, -1                        ; <i32> [#uses=1]
  %59 = load i8* %sc.1.i, align 1, !dbg !1018     ; <i8> [#uses=3]
  %60 = and i32 %tmp.i, %58, !dbg !1019           ; <i32> [#uses=1]
  %61 = icmp eq i32 %60, 0, !dbg !1019            ; <i1> [#uses=1]
  br i1 %61, label %bb1.i, label %bb5.i, !dbg !1019

bb1.i:                                            ; preds = %bb.i27
  switch i8 %59, label %bb6.i29 [
    i8 0, label %bb2.i
    i8 47, label %bb4.i28
  ]

bb2.i:                                            ; preds = %bb1.i
  store i8 0, i8* %sc.1.i, align 1, !dbg !1020
  br label %__concretize_string.exit

bb4.i28:                                          ; preds = %bb1.i
  store i8 47, i8* %sc.1.i, align 1, !dbg !1021
  %62 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !1021 ; <i8*> [#uses=1]
  br label %bb6.i29, !dbg !1021

bb5.i:                                            ; preds = %bb.i27
  %63 = sext i8 %59 to i32, !dbg !1022            ; <i32> [#uses=1]
  %64 = tail call i32 @klee_get_valuel(i32 %63) nounwind, !dbg !1022 ; <i32> [#uses=1]
  %65 = trunc i32 %64 to i8, !dbg !1022           ; <i8> [#uses=3]
  %66 = icmp eq i8 %65, %59, !dbg !1023           ; <i1> [#uses=1]
  %67 = zext i1 %66 to i32, !dbg !1023            ; <i32> [#uses=1]
  tail call void @klee_assume(i32 %67) nounwind, !dbg !1023
  store i8 %65, i8* %sc.1.i, align 1, !dbg !1024
  %68 = getelementptr inbounds i8* %sc.1.i, i32 1, !dbg !1024 ; <i8*> [#uses=1]
  %69 = icmp eq i8 %65, 0, !dbg !1025             ; <i1> [#uses=1]
  br i1 %69, label %__concretize_string.exit, label %bb6.i29, !dbg !1025

bb6.i29:                                          ; preds = %bb5.i, %bb4.i28, %bb1.i
  %sc.0.i = phi i8* [ %62, %bb4.i28 ], [ %68, %bb5.i ], [ %sc.1.i, %bb1.i ] ; <i8*> [#uses=1]
  %70 = add i32 %58, 1, !dbg !1017                ; <i32> [#uses=1]
  br label %bb.i27, !dbg !1017

__concretize_string.exit:                         ; preds = %bb5.i, %bb2.i
  %71 = tail call i32 (i32, ...)* @syscall(i32 5, i8* %pathname, i32 %flags, i32 %mode) nounwind, !dbg !1015 ; <i32> [#uses=2]
  %72 = icmp eq i32 %71, -1, !dbg !1026           ; <i1> [#uses=1]
  br i1 %72, label %bb17, label %bb18, !dbg !1026

bb17:                                             ; preds = %__concretize_string.exit
  %73 = tail call i32* @__errno_location() nounwind readnone, !dbg !1027 ; <i32*> [#uses=1]
  %74 = tail call i32 @klee_get_errno() nounwind, !dbg !1027 ; <i32> [#uses=1]
  store i32 %74, i32* %73, align 4, !dbg !1027
  ret i32 -1, !dbg !988

bb18:                                             ; preds = %__concretize_string.exit
  %75 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 0 ; <i32*> [#uses=1]
  store i32 %71, i32* %75, align 4, !dbg !1028
  br label %bb19, !dbg !1028

bb19:                                             ; preds = %bb18, %bb14
  %76 = getelementptr inbounds %struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 %4, i32 1 ; <i32*> [#uses=4]
  store i32 1, i32* %76, align 4, !dbg !1029
  %77 = and i32 %flags, 3, !dbg !1030             ; <i32> [#uses=1]
  switch i32 %77, label %bb23 [
    i32 0, label %bb20
    i32 1, label %bb22
  ]

bb20:                                             ; preds = %bb19
  store i32 5, i32* %76, align 4, !dbg !1031
  ret i32 %4, !dbg !988

bb22:                                             ; preds = %bb19
  store i32 9, i32* %76, align 4, !dbg !1032
  ret i32 %4, !dbg !988

bb23:                                             ; preds = %bb19
  store i32 13, i32* %76, align 4, !dbg !1033
  ret i32 %4, !dbg !988
}

!llvm.dbg.gv = !{!0, !9, !17, !21, !27, !32, !38}

!0 = metadata !{i32 458804, i32 0, metadata !1, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !2, i32 644, metadata !5, i1 true, i1 true, i32* @n_calls.4747} ; [ DW_TAG_variable ]
!1 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !"__fd_ftruncate", metadata !2, i32 643, metadata !3, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!2 = metadata !{i32 458769, i32 0, i32 1, metadata !"fd.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!3 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !4, i32 0, null} ; [ DW_TAG_subroutine_type ]
!4 = metadata !{metadata !5, metadata !5, metadata !6}
!5 = metadata !{i32 458788, metadata !2, metadata !"int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!6 = metadata !{i32 458774, metadata !2, metadata !"off64_t", metadata !7, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!7 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!8 = metadata !{i32 458788, metadata !2, metadata !"long long int", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!9 = metadata !{i32 458804, i32 0, metadata !10, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !2, i32 1218, metadata !5, i1 true, i1 true, i32* @n_calls.5255} ; [ DW_TAG_variable ]
!10 = metadata !{i32 458798, i32 0, metadata !2, metadata !"getcwd", metadata !"getcwd", metadata !"getcwd", metadata !2, i32 1217, metadata !11, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!11 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !12, i32 0, null} ; [ DW_TAG_subroutine_type ]
!12 = metadata !{metadata !13, metadata !13, metadata !15}
!13 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_pointer_type ]
!14 = metadata !{i32 458788, metadata !2, metadata !"char", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 458774, metadata !2, metadata !"size_t", metadata !7, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!16 = metadata !{i32 458788, metadata !2, metadata !"unsigned int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!17 = metadata !{i32 458804, i32 0, metadata !18, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !2, i32 202, metadata !5, i1 true, i1 true, i32* @n_calls.4379} ; [ DW_TAG_variable ]
!18 = metadata !{i32 458798, i32 0, metadata !2, metadata !"close", metadata !"close", metadata !"close", metadata !2, i32 201, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!19 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{metadata !5, metadata !5}
!21 = metadata !{i32 458804, i32 0, metadata !22, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !2, i32 234, metadata !5, i1 true, i1 true, i32* @n_calls.4399} ; [ DW_TAG_variable ]
!22 = metadata !{i32 458798, i32 0, metadata !2, metadata !"read", metadata !"read", metadata !"read", metadata !2, i32 233, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!23 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null} ; [ DW_TAG_subroutine_type ]
!24 = metadata !{metadata !25, metadata !5, metadata !26, metadata !15}
!25 = metadata !{i32 458774, metadata !2, metadata !"ssize_t", metadata !7, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !5} ; [ DW_TAG_typedef ]
!26 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!27 = metadata !{i32 458804, i32 0, metadata !28, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !2, i32 543, metadata !5, i1 true, i1 true, i32* @n_calls.4654} ; [ DW_TAG_variable ]
!28 = metadata !{i32 458798, i32 0, metadata !2, metadata !"fchmod", metadata !"fchmod", metadata !"fchmod", metadata !2, i32 542, metadata !29, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!29 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !30, i32 0, null} ; [ DW_TAG_subroutine_type ]
!30 = metadata !{metadata !5, metadata !5, metadata !31}
!31 = metadata !{i32 458774, metadata !2, metadata !"mode_t", metadata !7, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!32 = metadata !{i32 458804, i32 0, metadata !33, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !2, i32 521, metadata !5, i1 true, i1 true, i32* @n_calls.4631} ; [ DW_TAG_variable ]
!33 = metadata !{i32 458798, i32 0, metadata !2, metadata !"chmod", metadata !"chmod", metadata !"chmod", metadata !2, i32 520, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!34 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, null} ; [ DW_TAG_subroutine_type ]
!35 = metadata !{metadata !5, metadata !36, metadata !31}
!36 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !37} ; [ DW_TAG_pointer_type ]
!37 = metadata !{i32 458790, metadata !2, metadata !"", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !14} ; [ DW_TAG_const_type ]
!38 = metadata !{i32 458804, i32 0, metadata !39, metadata !"n_calls", metadata !"n_calls", metadata !"", metadata !2, i32 302, metadata !5, i1 true, i1 true, i32* @n_calls.4458} ; [ DW_TAG_variable ]
!39 = metadata !{i32 458798, i32 0, metadata !2, metadata !"write", metadata !"write", metadata !"write", metadata !2, i32 301, metadata !23, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!40 = metadata !{i32 40, i32 0, metadata !41, metadata !93}
!41 = metadata !{i32 458763, metadata !42, i32 39, i32 0} ; [ DW_TAG_lexical_block ]
!42 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !"__get_sym_file", metadata !2, i32 39, metadata !43, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!43 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !44, i32 0, null} ; [ DW_TAG_subroutine_type ]
!44 = metadata !{metadata !45, metadata !36}
!45 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ]
!46 = metadata !{i32 458774, metadata !2, metadata !"exe_disk_file_t", metadata !47, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!47 = metadata !{i32 458769, i32 0, i32 1, metadata !"fd.h", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!48 = metadata !{i32 458771, metadata !2, metadata !"", metadata !47, i32 20, i64 96, i64 32, i64 0, i32 0, null, metadata !49, i32 0, null} ; [ DW_TAG_structure_type ]
!49 = metadata !{metadata !50, metadata !51, metadata !52}
!50 = metadata !{i32 458765, metadata !48, metadata !"size", metadata !47, i32 21, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ]
!51 = metadata !{i32 458765, metadata !48, metadata !"contents", metadata !47, i32 22, i64 32, i64 32, i64 32, i32 0, metadata !13} ; [ DW_TAG_member ]
!52 = metadata !{i32 458765, metadata !48, metadata !"stat", metadata !47, i32 23, i64 32, i64 32, i64 64, i32 0, metadata !53} ; [ DW_TAG_member ]
!53 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !54} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 458771, metadata !2, metadata !"stat64", metadata !47, i32 23, i64 768, i64 32, i64 0, i32 0, null, metadata !55, i32 0, null} ; [ DW_TAG_structure_type ]
!55 = metadata !{metadata !56, metadata !61, metadata !62, metadata !65, metadata !67, metadata !69, metadata !71, metadata !73, metadata !74, metadata !75, metadata !77, metadata !80, metadata !82, metadata !89, metadata !90, metadata !91}
!56 = metadata !{i32 458765, metadata !54, metadata !"st_dev", metadata !57, i32 118, i64 64, i64 64, i64 0, i32 0, metadata !58} ; [ DW_TAG_member ]
!57 = metadata !{i32 458769, i32 0, i32 1, metadata !"stat.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!58 = metadata !{i32 458774, metadata !2, metadata !"__dev_t", metadata !59, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!59 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!60 = metadata !{i32 458788, metadata !2, metadata !"long long unsigned int", metadata !2, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!61 = metadata !{i32 458765, metadata !54, metadata !"__pad1", metadata !57, i32 124, i64 32, i64 32, i64 64, i32 0, metadata !16} ; [ DW_TAG_member ]
!62 = metadata !{i32 458765, metadata !54, metadata !"__st_ino", metadata !57, i32 125, i64 32, i64 32, i64 96, i32 0, metadata !63} ; [ DW_TAG_member ]
!63 = metadata !{i32 458774, metadata !2, metadata !"__ino_t", metadata !59, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ]
!64 = metadata !{i32 458788, metadata !2, metadata !"long unsigned int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!65 = metadata !{i32 458765, metadata !54, metadata !"st_mode", metadata !57, i32 126, i64 32, i64 32, i64 128, i32 0, metadata !66} ; [ DW_TAG_member ]
!66 = metadata !{i32 458774, metadata !2, metadata !"__mode_t", metadata !59, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!67 = metadata !{i32 458765, metadata !54, metadata !"st_nlink", metadata !57, i32 127, i64 32, i64 32, i64 160, i32 0, metadata !68} ; [ DW_TAG_member ]
!68 = metadata !{i32 458774, metadata !2, metadata !"__nlink_t", metadata !59, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!69 = metadata !{i32 458765, metadata !54, metadata !"st_uid", metadata !57, i32 129, i64 32, i64 32, i64 192, i32 0, metadata !70} ; [ DW_TAG_member ]
!70 = metadata !{i32 458774, metadata !2, metadata !"__uid_t", metadata !59, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!71 = metadata !{i32 458765, metadata !54, metadata !"st_gid", metadata !57, i32 130, i64 32, i64 32, i64 224, i32 0, metadata !72} ; [ DW_TAG_member ]
!72 = metadata !{i32 458774, metadata !2, metadata !"__gid_t", metadata !59, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!73 = metadata !{i32 458765, metadata !54, metadata !"st_rdev", metadata !57, i32 136, i64 64, i64 64, i64 256, i32 0, metadata !58} ; [ DW_TAG_member ]
!74 = metadata !{i32 458765, metadata !54, metadata !"__pad2", metadata !57, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !16} ; [ DW_TAG_member ]
!75 = metadata !{i32 458765, metadata !54, metadata !"st_size", metadata !57, i32 138, i64 64, i64 64, i64 352, i32 0, metadata !76} ; [ DW_TAG_member ]
!76 = metadata !{i32 458774, metadata !2, metadata !"__off64_t", metadata !59, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!77 = metadata !{i32 458765, metadata !54, metadata !"st_blksize", metadata !57, i32 140, i64 32, i64 32, i64 416, i32 0, metadata !78} ; [ DW_TAG_member ]
!78 = metadata !{i32 458774, metadata !2, metadata !"__blksize_t", metadata !59, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ]
!79 = metadata !{i32 458788, metadata !2, metadata !"long int", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!80 = metadata !{i32 458765, metadata !54, metadata !"st_blocks", metadata !57, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !81} ; [ DW_TAG_member ]
!81 = metadata !{i32 458774, metadata !2, metadata !"__blkcnt64_t", metadata !59, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !8} ; [ DW_TAG_typedef ]
!82 = metadata !{i32 458765, metadata !54, metadata !"st_atim", metadata !57, i32 149, i64 64, i64 32, i64 512, i32 0, metadata !83} ; [ DW_TAG_member ]
!83 = metadata !{i32 458771, metadata !2, metadata !"timespec", metadata !84, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !85, i32 0, null} ; [ DW_TAG_structure_type ]
!84 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!85 = metadata !{metadata !86, metadata !88}
!86 = metadata !{i32 458765, metadata !83, metadata !"tv_sec", metadata !84, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !87} ; [ DW_TAG_member ]
!87 = metadata !{i32 458774, metadata !2, metadata !"__time_t", metadata !59, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ]
!88 = metadata !{i32 458765, metadata !83, metadata !"tv_nsec", metadata !84, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !79} ; [ DW_TAG_member ]
!89 = metadata !{i32 458765, metadata !54, metadata !"st_mtim", metadata !57, i32 150, i64 64, i64 32, i64 576, i32 0, metadata !83} ; [ DW_TAG_member ]
!90 = metadata !{i32 458765, metadata !54, metadata !"st_ctim", metadata !57, i32 151, i64 64, i64 32, i64 640, i32 0, metadata !83} ; [ DW_TAG_member ]
!91 = metadata !{i32 458765, metadata !54, metadata !"st_ino", metadata !57, i32 166, i64 64, i64 64, i64 704, i32 0, metadata !92} ; [ DW_TAG_member ]
!92 = metadata !{i32 458774, metadata !2, metadata !"__ino64_t", metadata !59, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !60} ; [ DW_TAG_typedef ]
!93 = metadata !{i32 74, i32 0, metadata !94, null}
!94 = metadata !{i32 458763, metadata !95, i32 73, i32 0} ; [ DW_TAG_lexical_block ]
!95 = metadata !{i32 458798, i32 0, metadata !2, metadata !"access", metadata !"access", metadata !"access", metadata !2, i32 73, metadata !96, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!96 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !97, i32 0, null} ; [ DW_TAG_subroutine_type ]
!97 = metadata !{metadata !5, metadata !36, metadata !5}
!98 = metadata !{i32 43, i32 0, metadata !41, metadata !93}
!99 = metadata !{i32 46, i32 0, metadata !41, metadata !93}
!100 = metadata !{i32 47, i32 0, metadata !41, metadata !93}
!101 = metadata !{i32 48, i32 0, metadata !102, metadata !93}
!102 = metadata !{i32 458763, metadata !41, i32 47, i32 0} ; [ DW_TAG_lexical_block ]
!103 = metadata !{i32 49, i32 0, metadata !102, metadata !93}
!104 = metadata !{i32 76, i32 0, metadata !94, null}
!105 = metadata !{i32 1266, i32 0, metadata !106, metadata !110}
!106 = metadata !{i32 458763, metadata !107, i32 1265, i32 0} ; [ DW_TAG_lexical_block ]
!107 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__concretize_string", metadata !"__concretize_string", metadata !"__concretize_string", metadata !2, i32 1265, metadata !108, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!108 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !109, i32 0, null} ; [ DW_TAG_subroutine_type ]
!109 = metadata !{metadata !36, metadata !36}
!110 = metadata !{i32 81, i32 0, metadata !111, null}
!111 = metadata !{i32 458763, metadata !94, i32 79, i32 0} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 1269, i32 0, metadata !106, metadata !110}
!113 = metadata !{i32 1270, i32 0, metadata !114, metadata !110}
!114 = metadata !{i32 458763, metadata !106, i32 1269, i32 0} ; [ DW_TAG_lexical_block ]
!115 = metadata !{i32 1271, i32 0, metadata !114, metadata !110}
!116 = metadata !{i32 1273, i32 0, metadata !114, metadata !110}
!117 = metadata !{i32 1276, i32 0, metadata !114, metadata !110}
!118 = metadata !{i32 1279, i32 0, metadata !119, metadata !110}
!119 = metadata !{i32 458763, metadata !114, i32 1276, i32 0} ; [ DW_TAG_lexical_block ]
!120 = metadata !{i32 1280, i32 0, metadata !119, metadata !110}
!121 = metadata !{i32 1281, i32 0, metadata !119, metadata !110}
!122 = metadata !{i32 1282, i32 0, metadata !119, metadata !110}
!123 = metadata !{i32 82, i32 0, metadata !111, null}
!124 = metadata !{i32 83, i32 0, metadata !111, null}
!125 = metadata !{i32 84, i32 0, metadata !94, null}
!126 = metadata !{i32 89, i32 0, metadata !127, null}
!127 = metadata !{i32 458763, metadata !128, i32 88, i32 0} ; [ DW_TAG_lexical_block ]
!128 = metadata !{i32 458798, i32 0, metadata !2, metadata !"umask", metadata !"umask", metadata !"umask", metadata !2, i32 88, metadata !129, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!129 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !130, i32 0, null} ; [ DW_TAG_subroutine_type ]
!130 = metadata !{metadata !31, metadata !31}
!131 = metadata !{i32 90, i32 0, metadata !127, null}
!132 = metadata !{i32 91, i32 0, metadata !127, null}
!133 = metadata !{i32 1295, i32 0, metadata !134, null}
!134 = metadata !{i32 458763, metadata !135, i32 1294, i32 0} ; [ DW_TAG_lexical_block ]
!135 = metadata !{i32 458798, i32 0, metadata !2, metadata !"chroot", metadata !"chroot", metadata !"chroot", metadata !2, i32 1294, metadata !136, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!136 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !137, i32 0, null} ; [ DW_TAG_subroutine_type ]
!137 = metadata !{metadata !5, metadata !36}
!138 = metadata !{i32 1296, i32 0, metadata !134, null}
!139 = metadata !{i32 1306, i32 0, metadata !134, null}
!140 = metadata !{i32 1300, i32 0, metadata !134, null}
!141 = metadata !{i32 1304, i32 0, metadata !134, null}
!142 = metadata !{i32 1305, i32 0, metadata !134, null}
!143 = metadata !{i32 40, i32 0, metadata !41, metadata !144}
!144 = metadata !{i32 1079, i32 0, metadata !145, null}
!145 = metadata !{i32 458763, metadata !146, i32 1078, i32 0} ; [ DW_TAG_lexical_block ]
!146 = metadata !{i32 458798, i32 0, metadata !2, metadata !"unlink", metadata !"unlink", metadata !"unlink", metadata !2, i32 1078, metadata !136, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!147 = metadata !{i32 43, i32 0, metadata !41, metadata !144}
!148 = metadata !{i32 46, i32 0, metadata !41, metadata !144}
!149 = metadata !{i32 47, i32 0, metadata !41, metadata !144}
!150 = metadata !{i32 48, i32 0, metadata !102, metadata !144}
!151 = metadata !{i32 49, i32 0, metadata !102, metadata !144}
!152 = metadata !{i32 1080, i32 0, metadata !145, null}
!153 = metadata !{i32 1082, i32 0, metadata !145, null}
!154 = metadata !{i32 1083, i32 0, metadata !145, null}
!155 = metadata !{i32 1096, i32 0, metadata !145, null}
!156 = metadata !{i32 1085, i32 0, metadata !145, null}
!157 = metadata !{i32 1086, i32 0, metadata !145, null}
!158 = metadata !{i32 1089, i32 0, metadata !145, null}
!159 = metadata !{i32 1094, i32 0, metadata !145, null}
!160 = metadata !{i32 1095, i32 0, metadata !145, null}
!161 = metadata !{i32 40, i32 0, metadata !41, metadata !162}
!162 = metadata !{i32 1061, i32 0, metadata !163, null}
!163 = metadata !{i32 458763, metadata !164, i32 1060, i32 0} ; [ DW_TAG_lexical_block ]
!164 = metadata !{i32 458798, i32 0, metadata !2, metadata !"rmdir", metadata !"rmdir", metadata !"rmdir", metadata !2, i32 1060, metadata !136, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!165 = metadata !{i32 43, i32 0, metadata !41, metadata !162}
!166 = metadata !{i32 46, i32 0, metadata !41, metadata !162}
!167 = metadata !{i32 47, i32 0, metadata !41, metadata !162}
!168 = metadata !{i32 48, i32 0, metadata !102, metadata !162}
!169 = metadata !{i32 49, i32 0, metadata !102, metadata !162}
!170 = metadata !{i32 1062, i32 0, metadata !163, null}
!171 = metadata !{i32 1064, i32 0, metadata !163, null}
!172 = metadata !{i32 1065, i32 0, metadata !163, null}
!173 = metadata !{i32 1075, i32 0, metadata !163, null}
!174 = metadata !{i32 1068, i32 0, metadata !163, null}
!175 = metadata !{i32 1073, i32 0, metadata !163, null}
!176 = metadata !{i32 1074, i32 0, metadata !163, null}
!177 = metadata !{i32 40, i32 0, metadata !41, metadata !178}
!178 = metadata !{i32 1100, i32 0, metadata !179, null}
!179 = metadata !{i32 458763, metadata !180, i32 1099, i32 0} ; [ DW_TAG_lexical_block ]
!180 = metadata !{i32 458798, i32 0, metadata !2, metadata !"readlink", metadata !"readlink", metadata !"readlink", metadata !2, i32 1099, metadata !181, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!181 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !182, i32 0, null} ; [ DW_TAG_subroutine_type ]
!182 = metadata !{metadata !25, metadata !36, metadata !13, metadata !15}
!183 = metadata !{i32 43, i32 0, metadata !41, metadata !178}
!184 = metadata !{i32 46, i32 0, metadata !41, metadata !178}
!185 = metadata !{i32 47, i32 0, metadata !41, metadata !178}
!186 = metadata !{i32 48, i32 0, metadata !102, metadata !178}
!187 = metadata !{i32 49, i32 0, metadata !102, metadata !178}
!188 = metadata !{i32 1101, i32 0, metadata !179, null}
!189 = metadata !{i32 1104, i32 0, metadata !179, null}
!190 = metadata !{i32 1105, i32 0, metadata !179, null}
!191 = metadata !{i32 1106, i32 0, metadata !179, null}
!192 = metadata !{i32 1107, i32 0, metadata !179, null}
!193 = metadata !{i32 1108, i32 0, metadata !179, null}
!194 = metadata !{i32 1109, i32 0, metadata !179, null}
!195 = metadata !{i32 1110, i32 0, metadata !179, null}
!196 = metadata !{i32 1119, i32 0, metadata !179, null}
!197 = metadata !{i32 1112, i32 0, metadata !179, null}
!198 = metadata !{i32 1116, i32 0, metadata !199, null}
!199 = metadata !{i32 458763, metadata !179, i32 1113, i32 0} ; [ DW_TAG_lexical_block ]
!200 = metadata !{i32 1117, i32 0, metadata !199, null}
!201 = metadata !{i32 1118, i32 0, metadata !199, null}
!202 = metadata !{i32 64, i32 0, metadata !203, metadata !215}
!203 = metadata !{i32 458763, metadata !204, i32 63, i32 0} ; [ DW_TAG_lexical_block ]
!204 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__get_file", metadata !"__get_file", metadata !"__get_file", metadata !2, i32 63, metadata !205, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!205 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !206, i32 0, null} ; [ DW_TAG_subroutine_type ]
!206 = metadata !{metadata !207, metadata !5}
!207 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !208} ; [ DW_TAG_pointer_type ]
!208 = metadata !{i32 458774, metadata !2, metadata !"exe_file_t", metadata !47, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !209} ; [ DW_TAG_typedef ]
!209 = metadata !{i32 458771, metadata !2, metadata !"", metadata !47, i32 33, i64 160, i64 32, i64 0, i32 0, null, metadata !210, i32 0, null} ; [ DW_TAG_structure_type ]
!210 = metadata !{metadata !211, metadata !212, metadata !213, metadata !214}
!211 = metadata !{i32 458765, metadata !209, metadata !"fd", metadata !47, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!212 = metadata !{i32 458765, metadata !209, metadata !"flags", metadata !47, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !16} ; [ DW_TAG_member ]
!213 = metadata !{i32 458765, metadata !209, metadata !"off", metadata !47, i32 38, i64 64, i64 64, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!214 = metadata !{i32 458765, metadata !209, metadata !"dfile", metadata !47, i32 39, i64 32, i64 32, i64 128, i32 0, metadata !45} ; [ DW_TAG_member ]
!215 = metadata !{i32 1001, i32 0, metadata !216, null}
!216 = metadata !{i32 458763, metadata !217, i32 1000, i32 0} ; [ DW_TAG_lexical_block ]
!217 = metadata !{i32 458798, i32 0, metadata !2, metadata !"fsync", metadata !"fsync", metadata !"fsync", metadata !2, i32 1000, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!218 = metadata !{i32 66, i32 0, metadata !219, metadata !215}
!219 = metadata !{i32 458763, metadata !203, i32 63, i32 0} ; [ DW_TAG_lexical_block ]
!220 = metadata !{i32 1003, i32 0, metadata !216, null}
!221 = metadata !{i32 1004, i32 0, metadata !216, null}
!222 = metadata !{i32 1012, i32 0, metadata !216, null}
!223 = metadata !{i32 1006, i32 0, metadata !216, null}
!224 = metadata !{i32 1009, i32 0, metadata !225, null}
!225 = metadata !{i32 458763, metadata !216, i32 1007, i32 0} ; [ DW_TAG_lexical_block ]
!226 = metadata !{i32 1010, i32 0, metadata !225, null}
!227 = metadata !{i32 1011, i32 0, metadata !225, null}
!228 = metadata !{i32 64, i32 0, metadata !203, metadata !229}
!229 = metadata !{i32 981, i32 0, metadata !230, null}
!230 = metadata !{i32 458763, metadata !231, i32 980, i32 0} ; [ DW_TAG_lexical_block ]
!231 = metadata !{i32 458798, i32 0, metadata !2, metadata !"fstatfs", metadata !"fstatfs", metadata !"fstatfs", metadata !2, i32 980, metadata !232, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!232 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !233, i32 0, null} ; [ DW_TAG_subroutine_type ]
!233 = metadata !{metadata !5, metadata !5, metadata !234}
!234 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !235} ; [ DW_TAG_pointer_type ]
!235 = metadata !{i32 458771, metadata !2, metadata !"statfs", metadata !236, i32 26, i64 512, i64 32, i64 0, i32 0, null, metadata !237, i32 0, null} ; [ DW_TAG_structure_type ]
!236 = metadata !{i32 458769, i32 0, i32 1, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!237 = metadata !{metadata !238, metadata !239, metadata !240, metadata !242, metadata !243, metadata !244, metadata !246, metadata !247, metadata !255, metadata !256, metadata !257}
!238 = metadata !{i32 458765, metadata !235, metadata !"f_type", metadata !236, i32 27, i64 32, i64 32, i64 0, i32 0, metadata !5} ; [ DW_TAG_member ]
!239 = metadata !{i32 458765, metadata !235, metadata !"f_bsize", metadata !236, i32 28, i64 32, i64 32, i64 32, i32 0, metadata !5} ; [ DW_TAG_member ]
!240 = metadata !{i32 458765, metadata !235, metadata !"f_blocks", metadata !236, i32 30, i64 32, i64 32, i64 64, i32 0, metadata !241} ; [ DW_TAG_member ]
!241 = metadata !{i32 458774, metadata !2, metadata !"__fsblkcnt_t", metadata !59, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ]
!242 = metadata !{i32 458765, metadata !235, metadata !"f_bfree", metadata !236, i32 31, i64 32, i64 32, i64 96, i32 0, metadata !241} ; [ DW_TAG_member ]
!243 = metadata !{i32 458765, metadata !235, metadata !"f_bavail", metadata !236, i32 32, i64 32, i64 32, i64 128, i32 0, metadata !241} ; [ DW_TAG_member ]
!244 = metadata !{i32 458765, metadata !235, metadata !"f_files", metadata !236, i32 33, i64 32, i64 32, i64 160, i32 0, metadata !245} ; [ DW_TAG_member ]
!245 = metadata !{i32 458774, metadata !2, metadata !"__fsfilcnt_t", metadata !59, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ]
!246 = metadata !{i32 458765, metadata !235, metadata !"f_ffree", metadata !236, i32 34, i64 32, i64 32, i64 192, i32 0, metadata !245} ; [ DW_TAG_member ]
!247 = metadata !{i32 458765, metadata !235, metadata !"f_fsid", metadata !236, i32 42, i64 64, i64 32, i64 224, i32 0, metadata !248} ; [ DW_TAG_member ]
!248 = metadata !{i32 458774, metadata !2, metadata !"__fsid_t", metadata !59, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !249} ; [ DW_TAG_typedef ]
!249 = metadata !{i32 458771, metadata !2, metadata !"", metadata !59, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !250, i32 0, null} ; [ DW_TAG_structure_type ]
!250 = metadata !{metadata !251}
!251 = metadata !{i32 458765, metadata !249, metadata !"__val", metadata !59, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !252} ; [ DW_TAG_member ]
!252 = metadata !{i32 458753, metadata !2, metadata !"", metadata !2, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !5, metadata !253, i32 0, null} ; [ DW_TAG_array_type ]
!253 = metadata !{metadata !254}
!254 = metadata !{i32 458785, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!255 = metadata !{i32 458765, metadata !235, metadata !"f_namelen", metadata !236, i32 43, i64 32, i64 32, i64 288, i32 0, metadata !5} ; [ DW_TAG_member ]
!256 = metadata !{i32 458765, metadata !235, metadata !"f_frsize", metadata !236, i32 44, i64 32, i64 32, i64 320, i32 0, metadata !5} ; [ DW_TAG_member ]
!257 = metadata !{i32 458765, metadata !235, metadata !"f_spare", metadata !236, i32 45, i64 160, i64 32, i64 352, i32 0, metadata !258} ; [ DW_TAG_member ]
!258 = metadata !{i32 458753, metadata !2, metadata !"", metadata !2, i32 0, i64 160, i64 32, i64 0, i32 0, metadata !5, metadata !259, i32 0, null} ; [ DW_TAG_array_type ]
!259 = metadata !{metadata !260}
!260 = metadata !{i32 458785, i64 0, i64 4}       ; [ DW_TAG_subrange_type ]
!261 = metadata !{i32 66, i32 0, metadata !219, metadata !229}
!262 = metadata !{i32 983, i32 0, metadata !230, null}
!263 = metadata !{i32 984, i32 0, metadata !230, null}
!264 = metadata !{i32 996, i32 0, metadata !230, null}
!265 = metadata !{i32 988, i32 0, metadata !230, null}
!266 = metadata !{i32 989, i32 0, metadata !230, null}
!267 = metadata !{i32 990, i32 0, metadata !230, null}
!268 = metadata !{i32 993, i32 0, metadata !269, null}
!269 = metadata !{i32 458763, metadata !230, i32 991, i32 0} ; [ DW_TAG_lexical_block ]
!270 = metadata !{i32 994, i32 0, metadata !269, null}
!271 = metadata !{i32 995, i32 0, metadata !269, null}
!272 = metadata !{i32 64, i32 0, metadata !203, metadata !273}
!273 = metadata !{i32 645, i32 0, metadata !274, null}
!274 = metadata !{i32 458763, metadata !1, i32 643, i32 0} ; [ DW_TAG_lexical_block ]
!275 = metadata !{i32 66, i32 0, metadata !219, metadata !273}
!276 = metadata !{i32 647, i32 0, metadata !274, null}
!277 = metadata !{i32 649, i32 0, metadata !274, null}
!278 = metadata !{i32 650, i32 0, metadata !274, null}
!279 = metadata !{i32 672, i32 0, metadata !274, null}
!280 = metadata !{i32 654, i32 0, metadata !274, null}
!281 = metadata !{i32 655, i32 0, metadata !274, null}
!282 = metadata !{i32 656, i32 0, metadata !274, null}
!283 = metadata !{i32 660, i32 0, metadata !274, null}
!284 = metadata !{i32 661, i32 0, metadata !274, null}
!285 = metadata !{i32 662, i32 0, metadata !274, null}
!286 = metadata !{i32 668, i32 0, metadata !287, null}
!287 = metadata !{i32 458763, metadata !274, i32 663, i32 0} ; [ DW_TAG_lexical_block ]
!288 = metadata !{i32 670, i32 0, metadata !287, null}
!289 = metadata !{i32 671, i32 0, metadata !287, null}
!290 = metadata !{i32 64, i32 0, metadata !203, metadata !291}
!291 = metadata !{i32 589, i32 0, metadata !292, null}
!292 = metadata !{i32 458763, metadata !293, i32 588, i32 0} ; [ DW_TAG_lexical_block ]
!293 = metadata !{i32 458798, i32 0, metadata !2, metadata !"fchown", metadata !"fchown", metadata !"fchown", metadata !2, i32 588, metadata !294, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!294 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !295, i32 0, null} ; [ DW_TAG_subroutine_type ]
!295 = metadata !{metadata !5, metadata !5, metadata !296, metadata !297}
!296 = metadata !{i32 458774, metadata !2, metadata !"uid_t", metadata !7, i32 88, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!297 = metadata !{i32 458774, metadata !2, metadata !"gid_t", metadata !7, i32 72, i64 0, i64 0, i64 0, i32 0, metadata !16} ; [ DW_TAG_typedef ]
!298 = metadata !{i32 66, i32 0, metadata !219, metadata !291}
!299 = metadata !{i32 591, i32 0, metadata !292, null}
!300 = metadata !{i32 592, i32 0, metadata !292, null}
!301 = metadata !{i32 602, i32 0, metadata !292, null}
!302 = metadata !{i32 596, i32 0, metadata !292, null}
!303 = metadata !{i32 599, i32 0, metadata !304, null}
!304 = metadata !{i32 458763, metadata !292, i32 597, i32 0} ; [ DW_TAG_lexical_block ]
!305 = metadata !{i32 600, i32 0, metadata !304, null}
!306 = metadata !{i32 601, i32 0, metadata !304, null}
!307 = metadata !{i32 64, i32 0, metadata !203, metadata !308}
!308 = metadata !{i32 487, i32 0, metadata !309, null}
!309 = metadata !{i32 458763, metadata !310, i32 486, i32 0} ; [ DW_TAG_lexical_block ]
!310 = metadata !{i32 458798, i32 0, metadata !2, metadata !"fchdir", metadata !"fchdir", metadata !"fchdir", metadata !2, i32 486, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!311 = metadata !{i32 66, i32 0, metadata !219, metadata !308}
!312 = metadata !{i32 489, i32 0, metadata !309, null}
!313 = metadata !{i32 490, i32 0, metadata !309, null}
!314 = metadata !{i32 502, i32 0, metadata !309, null}
!315 = metadata !{i32 494, i32 0, metadata !309, null}
!316 = metadata !{i32 495, i32 0, metadata !309, null}
!317 = metadata !{i32 496, i32 0, metadata !309, null}
!318 = metadata !{i32 499, i32 0, metadata !319, null}
!319 = metadata !{i32 458763, metadata !309, i32 497, i32 0} ; [ DW_TAG_lexical_block ]
!320 = metadata !{i32 500, i32 0, metadata !319, null}
!321 = metadata !{i32 501, i32 0, metadata !319, null}
!322 = metadata !{i32 1254, i32 0, metadata !323, null}
!323 = metadata !{i32 458763, metadata !324, i32 1252, i32 0} ; [ DW_TAG_lexical_block ]
!324 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !"__concretize_ptr", metadata !2, i32 1252, metadata !325, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!325 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !326, i32 0, null} ; [ DW_TAG_subroutine_type ]
!326 = metadata !{metadata !26, metadata !26}
!327 = metadata !{i32 1255, i32 0, metadata !323, null}
!328 = metadata !{i32 1256, i32 0, metadata !323, null}
!329 = metadata !{i32 1221, i32 0, metadata !330, null}
!330 = metadata !{i32 458763, metadata !10, i32 1217, i32 0} ; [ DW_TAG_lexical_block ]
!331 = metadata !{i32 1223, i32 0, metadata !330, null}
!332 = metadata !{i32 1224, i32 0, metadata !330, null}
!333 = metadata !{i32 1225, i32 0, metadata !330, null}
!334 = metadata !{i32 1247, i32 0, metadata !330, null}
!335 = metadata !{i32 1229, i32 0, metadata !330, null}
!336 = metadata !{i32 1230, i32 0, metadata !330, null}
!337 = metadata !{i32 1232, i32 0, metadata !330, null}
!338 = metadata !{i32 1254, i32 0, metadata !323, metadata !339}
!339 = metadata !{i32 1235, i32 0, metadata !330, null}
!340 = metadata !{i32 1255, i32 0, metadata !323, metadata !339}
!341 = metadata !{i32 1260, i32 0, metadata !342, metadata !346}
!342 = metadata !{i32 458763, metadata !343, i32 1259, i32 0} ; [ DW_TAG_lexical_block ]
!343 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__concretize_size", metadata !"__concretize_size", metadata !"__concretize_size", metadata !2, i32 1259, metadata !344, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!344 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !345, i32 0, null} ; [ DW_TAG_subroutine_type ]
!345 = metadata !{metadata !15, metadata !15}
!346 = metadata !{i32 1236, i32 0, metadata !330, null}
!347 = metadata !{i32 1261, i32 0, metadata !342, metadata !346}
!348 = metadata !{i32 1240, i32 0, metadata !330, null}
!349 = metadata !{i32 1241, i32 0, metadata !330, null}
!350 = metadata !{i32 1242, i32 0, metadata !330, null}
!351 = metadata !{i32 1243, i32 0, metadata !330, null}
!352 = metadata !{i32 40, i32 0, metadata !41, metadata !353}
!353 = metadata !{i32 964, i32 0, metadata !354, null}
!354 = metadata !{i32 458763, metadata !355, i32 963, i32 0} ; [ DW_TAG_lexical_block ]
!355 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !"__fd_statfs", metadata !2, i32 963, metadata !356, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!356 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !357, i32 0, null} ; [ DW_TAG_subroutine_type ]
!357 = metadata !{metadata !5, metadata !36, metadata !234}
!358 = metadata !{i32 43, i32 0, metadata !41, metadata !353}
!359 = metadata !{i32 46, i32 0, metadata !41, metadata !353}
!360 = metadata !{i32 47, i32 0, metadata !41, metadata !353}
!361 = metadata !{i32 48, i32 0, metadata !102, metadata !353}
!362 = metadata !{i32 49, i32 0, metadata !102, metadata !353}
!363 = metadata !{i32 965, i32 0, metadata !354, null}
!364 = metadata !{i32 967, i32 0, metadata !354, null}
!365 = metadata !{i32 968, i32 0, metadata !354, null}
!366 = metadata !{i32 976, i32 0, metadata !354, null}
!367 = metadata !{i32 1266, i32 0, metadata !106, metadata !368}
!368 = metadata !{i32 973, i32 0, metadata !369, null}
!369 = metadata !{i32 458763, metadata !354, i32 969, i32 0} ; [ DW_TAG_lexical_block ]
!370 = metadata !{i32 1269, i32 0, metadata !106, metadata !368}
!371 = metadata !{i32 1270, i32 0, metadata !114, metadata !368}
!372 = metadata !{i32 1271, i32 0, metadata !114, metadata !368}
!373 = metadata !{i32 1273, i32 0, metadata !114, metadata !368}
!374 = metadata !{i32 1276, i32 0, metadata !114, metadata !368}
!375 = metadata !{i32 1279, i32 0, metadata !119, metadata !368}
!376 = metadata !{i32 1280, i32 0, metadata !119, metadata !368}
!377 = metadata !{i32 1281, i32 0, metadata !119, metadata !368}
!378 = metadata !{i32 1282, i32 0, metadata !119, metadata !368}
!379 = metadata !{i32 974, i32 0, metadata !369, null}
!380 = metadata !{i32 975, i32 0, metadata !369, null}
!381 = metadata !{i32 40, i32 0, metadata !41, metadata !382}
!382 = metadata !{i32 608, i32 0, metadata !383, null}
!383 = metadata !{i32 458763, metadata !384, i32 606, i32 0} ; [ DW_TAG_lexical_block ]
!384 = metadata !{i32 458798, i32 0, metadata !2, metadata !"lchown", metadata !"lchown", metadata !"lchown", metadata !2, i32 606, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!385 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !386, i32 0, null} ; [ DW_TAG_subroutine_type ]
!386 = metadata !{metadata !5, metadata !36, metadata !296, metadata !297}
!387 = metadata !{i32 43, i32 0, metadata !41, metadata !382}
!388 = metadata !{i32 46, i32 0, metadata !41, metadata !382}
!389 = metadata !{i32 47, i32 0, metadata !41, metadata !382}
!390 = metadata !{i32 48, i32 0, metadata !102, metadata !382}
!391 = metadata !{i32 49, i32 0, metadata !102, metadata !382}
!392 = metadata !{i32 610, i32 0, metadata !383, null}
!393 = metadata !{i32 616, i32 0, metadata !383, null}
!394 = metadata !{i32 1266, i32 0, metadata !106, metadata !395}
!395 = metadata !{i32 613, i32 0, metadata !396, null}
!396 = metadata !{i32 458763, metadata !383, i32 611, i32 0} ; [ DW_TAG_lexical_block ]
!397 = metadata !{i32 1269, i32 0, metadata !106, metadata !395}
!398 = metadata !{i32 1270, i32 0, metadata !114, metadata !395}
!399 = metadata !{i32 1271, i32 0, metadata !114, metadata !395}
!400 = metadata !{i32 1273, i32 0, metadata !114, metadata !395}
!401 = metadata !{i32 1276, i32 0, metadata !114, metadata !395}
!402 = metadata !{i32 1279, i32 0, metadata !119, metadata !395}
!403 = metadata !{i32 1280, i32 0, metadata !119, metadata !395}
!404 = metadata !{i32 1281, i32 0, metadata !119, metadata !395}
!405 = metadata !{i32 1282, i32 0, metadata !119, metadata !395}
!406 = metadata !{i32 614, i32 0, metadata !396, null}
!407 = metadata !{i32 615, i32 0, metadata !396, null}
!408 = metadata !{i32 40, i32 0, metadata !41, metadata !409}
!409 = metadata !{i32 576, i32 0, metadata !410, null}
!410 = metadata !{i32 458763, metadata !411, i32 575, i32 0} ; [ DW_TAG_lexical_block ]
!411 = metadata !{i32 458798, i32 0, metadata !2, metadata !"chown", metadata !"chown", metadata !"chown", metadata !2, i32 575, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!412 = metadata !{i32 43, i32 0, metadata !41, metadata !409}
!413 = metadata !{i32 46, i32 0, metadata !41, metadata !409}
!414 = metadata !{i32 47, i32 0, metadata !41, metadata !409}
!415 = metadata !{i32 48, i32 0, metadata !102, metadata !409}
!416 = metadata !{i32 49, i32 0, metadata !102, metadata !409}
!417 = metadata !{i32 578, i32 0, metadata !410, null}
!418 = metadata !{i32 584, i32 0, metadata !410, null}
!419 = metadata !{i32 1266, i32 0, metadata !106, metadata !420}
!420 = metadata !{i32 581, i32 0, metadata !421, null}
!421 = metadata !{i32 458763, metadata !410, i32 579, i32 0} ; [ DW_TAG_lexical_block ]
!422 = metadata !{i32 1269, i32 0, metadata !106, metadata !420}
!423 = metadata !{i32 1270, i32 0, metadata !114, metadata !420}
!424 = metadata !{i32 1271, i32 0, metadata !114, metadata !420}
!425 = metadata !{i32 1273, i32 0, metadata !114, metadata !420}
!426 = metadata !{i32 1276, i32 0, metadata !114, metadata !420}
!427 = metadata !{i32 1279, i32 0, metadata !119, metadata !420}
!428 = metadata !{i32 1280, i32 0, metadata !119, metadata !420}
!429 = metadata !{i32 1281, i32 0, metadata !119, metadata !420}
!430 = metadata !{i32 1282, i32 0, metadata !119, metadata !420}
!431 = metadata !{i32 582, i32 0, metadata !421, null}
!432 = metadata !{i32 583, i32 0, metadata !421, null}
!433 = metadata !{i32 40, i32 0, metadata !41, metadata !434}
!434 = metadata !{i32 469, i32 0, metadata !435, null}
!435 = metadata !{i32 458763, metadata !436, i32 468, i32 0} ; [ DW_TAG_lexical_block ]
!436 = metadata !{i32 458798, i32 0, metadata !2, metadata !"chdir", metadata !"chdir", metadata !"chdir", metadata !2, i32 468, metadata !136, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!437 = metadata !{i32 43, i32 0, metadata !41, metadata !434}
!438 = metadata !{i32 46, i32 0, metadata !41, metadata !434}
!439 = metadata !{i32 47, i32 0, metadata !41, metadata !434}
!440 = metadata !{i32 48, i32 0, metadata !102, metadata !434}
!441 = metadata !{i32 49, i32 0, metadata !102, metadata !434}
!442 = metadata !{i32 471, i32 0, metadata !435, null}
!443 = metadata !{i32 473, i32 0, metadata !435, null}
!444 = metadata !{i32 474, i32 0, metadata !435, null}
!445 = metadata !{i32 482, i32 0, metadata !435, null}
!446 = metadata !{i32 1266, i32 0, metadata !106, metadata !447}
!447 = metadata !{i32 479, i32 0, metadata !448, null}
!448 = metadata !{i32 458763, metadata !435, i32 475, i32 0} ; [ DW_TAG_lexical_block ]
!449 = metadata !{i32 1269, i32 0, metadata !106, metadata !447}
!450 = metadata !{i32 1270, i32 0, metadata !114, metadata !447}
!451 = metadata !{i32 1271, i32 0, metadata !114, metadata !447}
!452 = metadata !{i32 1273, i32 0, metadata !114, metadata !447}
!453 = metadata !{i32 1276, i32 0, metadata !114, metadata !447}
!454 = metadata !{i32 1279, i32 0, metadata !119, metadata !447}
!455 = metadata !{i32 1280, i32 0, metadata !119, metadata !447}
!456 = metadata !{i32 1281, i32 0, metadata !119, metadata !447}
!457 = metadata !{i32 1282, i32 0, metadata !119, metadata !447}
!458 = metadata !{i32 480, i32 0, metadata !448, null}
!459 = metadata !{i32 481, i32 0, metadata !448, null}
!460 = metadata !{i32 1136, i32 0, metadata !461, null}
!461 = metadata !{i32 458763, metadata !462, i32 1132, i32 0} ; [ DW_TAG_lexical_block ]
!462 = metadata !{i32 458798, i32 0, metadata !2, metadata !"select", metadata !"select", metadata !"select", metadata !2, i32 1132, metadata !463, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!463 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !464, i32 0, null} ; [ DW_TAG_subroutine_type ]
!464 = metadata !{metadata !5, metadata !5, metadata !465, metadata !465, metadata !465, metadata !475}
!465 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !466} ; [ DW_TAG_pointer_type ]
!466 = metadata !{i32 458774, metadata !2, metadata !"fd_set", metadata !467, i32 85, i64 0, i64 0, i64 0, i32 0, metadata !468} ; [ DW_TAG_typedef ]
!467 = metadata !{i32 458769, i32 0, i32 1, metadata !"select.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!468 = metadata !{i32 458771, metadata !2, metadata !"", metadata !467, i32 68, i64 1024, i64 32, i64 0, i32 0, null, metadata !469, i32 0, null} ; [ DW_TAG_structure_type ]
!469 = metadata !{metadata !470}
!470 = metadata !{i32 458765, metadata !468, metadata !"fds_bits", metadata !467, i32 72, i64 1024, i64 32, i64 0, i32 0, metadata !471} ; [ DW_TAG_member ]
!471 = metadata !{i32 458753, metadata !2, metadata !"", metadata !2, i32 0, i64 1024, i64 32, i64 0, i32 0, metadata !472, metadata !473, i32 0, null} ; [ DW_TAG_array_type ]
!472 = metadata !{i32 458774, metadata !2, metadata !"__fd_mask", metadata !467, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ]
!473 = metadata !{metadata !474}
!474 = metadata !{i32 458785, i64 0, i64 31}      ; [ DW_TAG_subrange_type ]
!475 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !476} ; [ DW_TAG_pointer_type ]
!476 = metadata !{i32 458771, metadata !2, metadata !"timeval", metadata !477, i32 70, i64 64, i64 32, i64 0, i32 0, null, metadata !478, i32 0, null} ; [ DW_TAG_structure_type ]
!477 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!478 = metadata !{metadata !479, metadata !480}
!479 = metadata !{i32 458765, metadata !476, metadata !"tv_sec", metadata !477, i32 71, i64 32, i64 32, i64 0, i32 0, metadata !87} ; [ DW_TAG_member ]
!480 = metadata !{i32 458765, metadata !476, metadata !"tv_usec", metadata !477, i32 72, i64 32, i64 32, i64 32, i32 0, metadata !481} ; [ DW_TAG_member ]
!481 = metadata !{i32 458774, metadata !2, metadata !"__suseconds_t", metadata !59, i32 153, i64 0, i64 0, i64 0, i32 0, metadata !79} ; [ DW_TAG_typedef ]
!482 = metadata !{i32 1140, i32 0, metadata !461, null}
!483 = metadata !{i32 1137, i32 0, metadata !461, null}
!484 = metadata !{i32 1138, i32 0, metadata !461, null}
!485 = metadata !{i32 1143, i32 0, metadata !461, null}
!486 = metadata !{i32 1147, i32 0, metadata !461, null}
!487 = metadata !{i32 1144, i32 0, metadata !461, null}
!488 = metadata !{i32 1145, i32 0, metadata !461, null}
!489 = metadata !{i32 1150, i32 0, metadata !461, null}
!490 = metadata !{i32 1154, i32 0, metadata !461, null}
!491 = metadata !{i32 1151, i32 0, metadata !461, null}
!492 = metadata !{i32 1152, i32 0, metadata !461, null}
!493 = metadata !{i32 1157, i32 0, metadata !461, null}
!494 = metadata !{i32 1158, i32 0, metadata !461, null}
!495 = metadata !{i32 1159, i32 0, metadata !461, null}
!496 = metadata !{i32 1162, i32 0, metadata !461, null}
!497 = metadata !{i32 1163, i32 0, metadata !461, null}
!498 = metadata !{i32 64, i32 0, metadata !203, metadata !499}
!499 = metadata !{i32 1164, i32 0, metadata !500, null}
!500 = metadata !{i32 458763, metadata !461, i32 1163, i32 0} ; [ DW_TAG_lexical_block ]
!501 = metadata !{i32 66, i32 0, metadata !219, metadata !499}
!502 = metadata !{i32 1165, i32 0, metadata !500, null}
!503 = metadata !{i32 1166, i32 0, metadata !500, null}
!504 = metadata !{i32 1212, i32 0, metadata !500, null}
!505 = metadata !{i32 1168, i32 0, metadata !500, null}
!506 = metadata !{i32 1170, i32 0, metadata !500, null}
!507 = metadata !{i32 1171, i32 0, metadata !500, null}
!508 = metadata !{i32 1172, i32 0, metadata !500, null}
!509 = metadata !{i32 1173, i32 0, metadata !500, null}
!510 = metadata !{i32 1175, i32 0, metadata !500, null}
!511 = metadata !{i32 1176, i32 0, metadata !500, null}
!512 = metadata !{i32 1177, i32 0, metadata !500, null}
!513 = metadata !{i32 1178, i32 0, metadata !500, null}
!514 = metadata !{i32 1183, i32 0, metadata !461, null}
!515 = metadata !{i32 1186, i32 0, metadata !516, null}
!516 = metadata !{i32 458763, metadata !461, i32 1183, i32 0} ; [ DW_TAG_lexical_block ]
!517 = metadata !{i32 1188, i32 0, metadata !516, null}
!518 = metadata !{i32 1190, i32 0, metadata !516, null}
!519 = metadata !{i32 1193, i32 0, metadata !516, null}
!520 = metadata !{i32 1194, i32 0, metadata !516, null}
!521 = metadata !{i32 1198, i32 0, metadata !516, null}
!522 = metadata !{i32 1201, i32 0, metadata !516, null}
!523 = metadata !{i32 64, i32 0, metadata !203, metadata !524}
!524 = metadata !{i32 1202, i32 0, metadata !525, null}
!525 = metadata !{i32 458763, metadata !516, i32 1201, i32 0} ; [ DW_TAG_lexical_block ]
!526 = metadata !{i32 66, i32 0, metadata !219, metadata !524}
!527 = metadata !{i32 1203, i32 0, metadata !525, null}
!528 = metadata !{i32 1204, i32 0, metadata !525, null}
!529 = metadata !{i32 1205, i32 0, metadata !525, null}
!530 = metadata !{i32 1206, i32 0, metadata !525, null}
!531 = metadata !{i32 206, i32 0, metadata !532, null}
!532 = metadata !{i32 458763, metadata !18, i32 201, i32 0} ; [ DW_TAG_lexical_block ]
!533 = metadata !{i32 64, i32 0, metadata !203, metadata !534}
!534 = metadata !{i32 208, i32 0, metadata !532, null}
!535 = metadata !{i32 66, i32 0, metadata !219, metadata !534}
!536 = metadata !{i32 209, i32 0, metadata !532, null}
!537 = metadata !{i32 210, i32 0, metadata !532, null}
!538 = metadata !{i32 230, i32 0, metadata !532, null}
!539 = metadata !{i32 214, i32 0, metadata !532, null}
!540 = metadata !{i32 215, i32 0, metadata !532, null}
!541 = metadata !{i32 216, i32 0, metadata !532, null}
!542 = metadata !{i32 228, i32 0, metadata !532, null}
!543 = metadata !{i32 64, i32 0, metadata !203, metadata !544}
!544 = metadata !{i32 1017, i32 0, metadata !545, null}
!545 = metadata !{i32 458763, metadata !546, i32 1016, i32 0} ; [ DW_TAG_lexical_block ]
!546 = metadata !{i32 458798, i32 0, metadata !2, metadata !"dup2", metadata !"dup2", metadata !"dup2", metadata !2, i32 1016, metadata !547, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!547 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !548, i32 0, null} ; [ DW_TAG_subroutine_type ]
!548 = metadata !{metadata !5, metadata !5, metadata !5}
!549 = metadata !{i32 66, i32 0, metadata !219, metadata !544}
!550 = metadata !{i32 1019, i32 0, metadata !545, null}
!551 = metadata !{i32 1020, i32 0, metadata !545, null}
!552 = metadata !{i32 1037, i32 0, metadata !545, null}
!553 = metadata !{i32 1024, i32 0, metadata !554, null}
!554 = metadata !{i32 458763, metadata !545, i32 1021, i32 0} ; [ DW_TAG_lexical_block ]
!555 = metadata !{i32 206, i32 0, metadata !532, metadata !553}
!556 = metadata !{i32 64, i32 0, metadata !203, metadata !557}
!557 = metadata !{i32 208, i32 0, metadata !532, metadata !553}
!558 = metadata !{i32 209, i32 0, metadata !532, metadata !553}
!559 = metadata !{i32 210, i32 0, metadata !532, metadata !553}
!560 = metadata !{i32 214, i32 0, metadata !532, metadata !553}
!561 = metadata !{i32 215, i32 0, metadata !532, metadata !553}
!562 = metadata !{i32 216, i32 0, metadata !532, metadata !553}
!563 = metadata !{i32 228, i32 0, metadata !532, metadata !553}
!564 = metadata !{i32 1028, i32 0, metadata !554, null}
!565 = metadata !{i32 1030, i32 0, metadata !554, null}
!566 = metadata !{i32 64, i32 0, metadata !203, metadata !567}
!567 = metadata !{i32 1042, i32 0, metadata !568, null}
!568 = metadata !{i32 458763, metadata !569, i32 1041, i32 0} ; [ DW_TAG_lexical_block ]
!569 = metadata !{i32 458798, i32 0, metadata !2, metadata !"dup", metadata !"dup", metadata !"dup", metadata !2, i32 1041, metadata !19, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!570 = metadata !{i32 66, i32 0, metadata !219, metadata !567}
!571 = metadata !{i32 1043, i32 0, metadata !568, null}
!572 = metadata !{i32 1044, i32 0, metadata !568, null}
!573 = metadata !{i32 1055, i32 0, metadata !568, null}
!574 = metadata !{i32 1049, i32 0, metadata !575, null}
!575 = metadata !{i32 458763, metadata !568, i32 1045, i32 0} ; [ DW_TAG_lexical_block ]
!576 = metadata !{i32 1048, i32 0, metadata !575, null}
!577 = metadata !{i32 1051, i32 0, metadata !575, null}
!578 = metadata !{i32 1052, i32 0, metadata !575, null}
!579 = metadata !{i32 1055, i32 0, metadata !575, null}
!580 = metadata !{i32 64, i32 0, metadata !203, metadata !581}
!581 = metadata !{i32 909, i32 0, metadata !582, null}
!582 = metadata !{i32 458763, metadata !583, i32 908, i32 0} ; [ DW_TAG_lexical_block ]
!583 = metadata !{i32 458798, i32 0, metadata !2, metadata !"fcntl", metadata !"fcntl", metadata !"fcntl", metadata !2, i32 908, metadata !547, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!584 = metadata !{i32 66, i32 0, metadata !219, metadata !581}
!585 = metadata !{i32 913, i32 0, metadata !582, null}
!586 = metadata !{i32 914, i32 0, metadata !582, null}
!587 = metadata !{i32 959, i32 0, metadata !582, null}
!588 = metadata !{i32 922, i32 0, metadata !582, null}
!589 = metadata !{i32 923, i32 0, metadata !582, null}
!590 = metadata !{i32 924, i32 0, metadata !582, null}
!591 = metadata !{i32 927, i32 0, metadata !582, null}
!592 = metadata !{i32 928, i32 0, metadata !582, null}
!593 = metadata !{i32 931, i32 0, metadata !594, null}
!594 = metadata !{i32 458763, metadata !582, i32 928, i32 0} ; [ DW_TAG_lexical_block ]
!595 = metadata !{i32 936, i32 0, metadata !582, null}
!596 = metadata !{i32 937, i32 0, metadata !582, null}
!597 = metadata !{i32 938, i32 0, metadata !582, null}
!598 = metadata !{i32 951, i32 0, metadata !582, null}
!599 = metadata !{i32 952, i32 0, metadata !582, null}
!600 = metadata !{i32 956, i32 0, metadata !601, null}
!601 = metadata !{i32 458763, metadata !582, i32 953, i32 0} ; [ DW_TAG_lexical_block ]
!602 = metadata !{i32 957, i32 0, metadata !601, null}
!603 = metadata !{i32 958, i32 0, metadata !601, null}
!604 = metadata !{i32 64, i32 0, metadata !203, metadata !605}
!605 = metadata !{i32 762, i32 0, metadata !606, null}
!606 = metadata !{i32 458763, metadata !607, i32 760, i32 0} ; [ DW_TAG_lexical_block ]
!607 = metadata !{i32 458798, i32 0, metadata !2, metadata !"ioctl", metadata !"ioctl", metadata !"ioctl", metadata !2, i32 760, metadata !608, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!608 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !609, i32 0, null} ; [ DW_TAG_subroutine_type ]
!609 = metadata !{metadata !5, metadata !5, metadata !64}
!610 = metadata !{i32 66, i32 0, metadata !219, metadata !605}
!611 = metadata !{i32 770, i32 0, metadata !606, null}
!612 = metadata !{i32 771, i32 0, metadata !606, null}
!613 = metadata !{i32 904, i32 0, metadata !606, null}
!614 = metadata !{i32 775, i32 0, metadata !606, null}
!615 = metadata !{i32 776, i32 0, metadata !606, null}
!616 = metadata !{i32 777, i32 0, metadata !606, null}
!617 = metadata !{i32 779, i32 0, metadata !606, null}
!618 = metadata !{i32 780, i32 0, metadata !619, null}
!619 = metadata !{i32 458763, metadata !606, i32 779, i32 0} ; [ DW_TAG_lexical_block ]
!620 = metadata !{i32 782, i32 0, metadata !619, null}
!621 = metadata !{i32 786, i32 0, metadata !622, null}
!622 = metadata !{i32 458763, metadata !619, i32 782, i32 0} ; [ DW_TAG_lexical_block ]
!623 = metadata !{i32 789, i32 0, metadata !622, null}
!624 = metadata !{i32 792, i32 0, metadata !622, null}
!625 = metadata !{i32 793, i32 0, metadata !622, null}
!626 = metadata !{i32 794, i32 0, metadata !622, null}
!627 = metadata !{i32 795, i32 0, metadata !622, null}
!628 = metadata !{i32 796, i32 0, metadata !622, null}
!629 = metadata !{i32 797, i32 0, metadata !622, null}
!630 = metadata !{i32 798, i32 0, metadata !622, null}
!631 = metadata !{i32 799, i32 0, metadata !622, null}
!632 = metadata !{i32 800, i32 0, metadata !622, null}
!633 = metadata !{i32 801, i32 0, metadata !622, null}
!634 = metadata !{i32 802, i32 0, metadata !622, null}
!635 = metadata !{i32 803, i32 0, metadata !622, null}
!636 = metadata !{i32 804, i32 0, metadata !622, null}
!637 = metadata !{i32 805, i32 0, metadata !622, null}
!638 = metadata !{i32 806, i32 0, metadata !622, null}
!639 = metadata !{i32 807, i32 0, metadata !622, null}
!640 = metadata !{i32 808, i32 0, metadata !622, null}
!641 = metadata !{i32 809, i32 0, metadata !622, null}
!642 = metadata !{i32 810, i32 0, metadata !622, null}
!643 = metadata !{i32 811, i32 0, metadata !622, null}
!644 = metadata !{i32 812, i32 0, metadata !622, null}
!645 = metadata !{i32 813, i32 0, metadata !622, null}
!646 = metadata !{i32 814, i32 0, metadata !622, null}
!647 = metadata !{i32 815, i32 0, metadata !622, null}
!648 = metadata !{i32 818, i32 0, metadata !622, null}
!649 = metadata !{i32 824, i32 0, metadata !619, null}
!650 = metadata !{i32 825, i32 0, metadata !619, null}
!651 = metadata !{i32 828, i32 0, metadata !619, null}
!652 = metadata !{i32 834, i32 0, metadata !619, null}
!653 = metadata !{i32 835, i32 0, metadata !619, null}
!654 = metadata !{i32 838, i32 0, metadata !619, null}
!655 = metadata !{i32 844, i32 0, metadata !619, null}
!656 = metadata !{i32 845, i32 0, metadata !619, null}
!657 = metadata !{i32 848, i32 0, metadata !619, null}
!658 = metadata !{i32 854, i32 0, metadata !659, null}
!659 = metadata !{i32 458763, metadata !619, i32 849, i32 0} ; [ DW_TAG_lexical_block ]
!660 = metadata !{i32 855, i32 0, metadata !659, null}
!661 = metadata !{i32 856, i32 0, metadata !659, null}
!662 = metadata !{i32 857, i32 0, metadata !659, null}
!663 = metadata !{i32 860, i32 0, metadata !659, null}
!664 = metadata !{i32 866, i32 0, metadata !619, null}
!665 = metadata !{i32 867, i32 0, metadata !619, null}
!666 = metadata !{i32 868, i32 0, metadata !619, null}
!667 = metadata !{i32 871, i32 0, metadata !619, null}
!668 = metadata !{i32 876, i32 0, metadata !669, null}
!669 = metadata !{i32 458763, metadata !619, i32 872, i32 0} ; [ DW_TAG_lexical_block ]
!670 = metadata !{i32 877, i32 0, metadata !669, null}
!671 = metadata !{i32 878, i32 0, metadata !669, null}
!672 = metadata !{i32 879, i32 0, metadata !669, null}
!673 = metadata !{i32 880, i32 0, metadata !669, null}
!674 = metadata !{i32 886, i32 0, metadata !669, null}
!675 = metadata !{i32 891, i32 0, metadata !619, null}
!676 = metadata !{i32 892, i32 0, metadata !619, null}
!677 = metadata !{i32 896, i32 0, metadata !619, null}
!678 = metadata !{i32 897, i32 0, metadata !619, null}
!679 = metadata !{i32 901, i32 0, metadata !680, null}
!680 = metadata !{i32 458763, metadata !606, i32 898, i32 0} ; [ DW_TAG_lexical_block ]
!681 = metadata !{i32 902, i32 0, metadata !680, null}
!682 = metadata !{i32 903, i32 0, metadata !680, null}
!683 = metadata !{i32 64, i32 0, metadata !203, metadata !684}
!684 = metadata !{i32 677, i32 0, metadata !685, null}
!685 = metadata !{i32 458763, metadata !686, i32 676, i32 0} ; [ DW_TAG_lexical_block ]
!686 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !"__fd_getdents", metadata !2, i32 676, metadata !687, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!687 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !688, i32 0, null} ; [ DW_TAG_subroutine_type ]
!688 = metadata !{metadata !5, metadata !16, metadata !689, metadata !16}
!689 = metadata !{i32 458767, metadata !2, metadata !"", metadata !2, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !690} ; [ DW_TAG_pointer_type ]
!690 = metadata !{i32 458771, metadata !2, metadata !"dirent64", metadata !691, i32 39, i64 2208, i64 32, i64 0, i32 0, null, metadata !692, i32 0, null} ; [ DW_TAG_structure_type ]
!691 = metadata !{i32 458769, i32 0, i32 1, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!692 = metadata !{metadata !693, metadata !694, metadata !695, metadata !697, metadata !699}
!693 = metadata !{i32 458765, metadata !690, metadata !"d_ino", metadata !691, i32 40, i64 64, i64 64, i64 0, i32 0, metadata !92} ; [ DW_TAG_member ]
!694 = metadata !{i32 458765, metadata !690, metadata !"d_off", metadata !691, i32 41, i64 64, i64 64, i64 64, i32 0, metadata !76} ; [ DW_TAG_member ]
!695 = metadata !{i32 458765, metadata !690, metadata !"d_reclen", metadata !691, i32 42, i64 16, i64 16, i64 128, i32 0, metadata !696} ; [ DW_TAG_member ]
!696 = metadata !{i32 458788, metadata !2, metadata !"short unsigned int", metadata !2, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!697 = metadata !{i32 458765, metadata !690, metadata !"d_type", metadata !691, i32 43, i64 8, i64 8, i64 144, i32 0, metadata !698} ; [ DW_TAG_member ]
!698 = metadata !{i32 458788, metadata !2, metadata !"unsigned char", metadata !2, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!699 = metadata !{i32 458765, metadata !690, metadata !"d_name", metadata !691, i32 44, i64 2048, i64 8, i64 152, i32 0, metadata !700} ; [ DW_TAG_member ]
!700 = metadata !{i32 458753, metadata !2, metadata !"", metadata !2, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !14, metadata !701, i32 0, null} ; [ DW_TAG_array_type ]
!701 = metadata !{metadata !702}
!702 = metadata !{i32 458785, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!703 = metadata !{i32 66, i32 0, metadata !219, metadata !684}
!704 = metadata !{i32 679, i32 0, metadata !685, null}
!705 = metadata !{i32 680, i32 0, metadata !685, null}
!706 = metadata !{i32 752, i32 0, metadata !685, null}
!707 = metadata !{i32 684, i32 0, metadata !685, null}
!708 = metadata !{i32 685, i32 0, metadata !685, null}
!709 = metadata !{i32 686, i32 0, metadata !685, null}
!710 = metadata !{i32 689, i32 0, metadata !685, null}
!711 = metadata !{i32 694, i32 0, metadata !712, null}
!712 = metadata !{i32 458763, metadata !685, i32 689, i32 0} ; [ DW_TAG_lexical_block ]
!713 = metadata !{i32 695, i32 0, metadata !712, null}
!714 = metadata !{i32 700, i32 0, metadata !712, null}
!715 = metadata !{i32 697, i32 0, metadata !712, null}
!716 = metadata !{i32 701, i32 0, metadata !717, null}
!717 = metadata !{i32 458763, metadata !712, i32 698, i32 0} ; [ DW_TAG_lexical_block ]
!718 = metadata !{i32 702, i32 0, metadata !717, null}
!719 = metadata !{i32 703, i32 0, metadata !717, null}
!720 = metadata !{i32 704, i32 0, metadata !717, null}
!721 = metadata !{i32 705, i32 0, metadata !717, null}
!722 = metadata !{i32 706, i32 0, metadata !717, null}
!723 = metadata !{i32 707, i32 0, metadata !717, null}
!724 = metadata !{i32 708, i32 0, metadata !717, null}
!725 = metadata !{i32 713, i32 0, metadata !712, null}
!726 = metadata !{i32 714, i32 0, metadata !712, null}
!727 = metadata !{i32 715, i32 0, metadata !712, null}
!728 = metadata !{i32 716, i32 0, metadata !712, null}
!729 = metadata !{i32 717, i32 0, metadata !712, null}
!730 = metadata !{i32 718, i32 0, metadata !712, null}
!731 = metadata !{i32 719, i32 0, metadata !712, null}
!732 = metadata !{i32 720, i32 0, metadata !712, null}
!733 = metadata !{i32 733, i32 0, metadata !734, null}
!734 = metadata !{i32 458763, metadata !685, i32 721, i32 0} ; [ DW_TAG_lexical_block ]
!735 = metadata !{i32 734, i32 0, metadata !734, null}
!736 = metadata !{i32 735, i32 0, metadata !734, null}
!737 = metadata !{i32 736, i32 0, metadata !734, null}
!738 = metadata !{i32 737, i32 0, metadata !734, null}
!739 = metadata !{i32 738, i32 0, metadata !734, null}
!740 = metadata !{i32 742, i32 0, metadata !741, null}
!741 = metadata !{i32 458763, metadata !734, i32 738, i32 0} ; [ DW_TAG_lexical_block ]
!742 = metadata !{i32 746, i32 0, metadata !741, null}
!743 = metadata !{i32 748, i32 0, metadata !744, null}
!744 = metadata !{i32 458763, metadata !741, i32 742, i32 0} ; [ DW_TAG_lexical_block ]
!745 = metadata !{i32 749, i32 0, metadata !744, null}
!746 = metadata !{i32 64, i32 0, metadata !203, metadata !747}
!747 = metadata !{i32 375, i32 0, metadata !748, null}
!748 = metadata !{i32 458763, metadata !749, i32 373, i32 0} ; [ DW_TAG_lexical_block ]
!749 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !"__fd_lseek", metadata !2, i32 373, metadata !750, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!750 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !751, i32 0, null} ; [ DW_TAG_subroutine_type ]
!751 = metadata !{metadata !6, metadata !5, metadata !6, metadata !5}
!752 = metadata !{i32 66, i32 0, metadata !219, metadata !747}
!753 = metadata !{i32 377, i32 0, metadata !748, null}
!754 = metadata !{i32 378, i32 0, metadata !748, null}
!755 = metadata !{i32 427, i32 0, metadata !748, null}
!756 = metadata !{i32 382, i32 0, metadata !748, null}
!757 = metadata !{i32 389, i32 0, metadata !748, null}
!758 = metadata !{i32 390, i32 0, metadata !748, null}
!759 = metadata !{i32 392, i32 0, metadata !748, null}
!760 = metadata !{i32 396, i32 0, metadata !748, null}
!761 = metadata !{i32 397, i32 0, metadata !748, null}
!762 = metadata !{i32 398, i32 0, metadata !748, null}
!763 = metadata !{i32 402, i32 0, metadata !748, null}
!764 = metadata !{i32 403, i32 0, metadata !748, null}
!765 = metadata !{i32 407, i32 0, metadata !748, null}
!766 = metadata !{i32 411, i32 0, metadata !748, null}
!767 = metadata !{i32 413, i32 0, metadata !748, null}
!768 = metadata !{i32 414, i32 0, metadata !748, null}
!769 = metadata !{i32 416, i32 0, metadata !748, null}
!770 = metadata !{i32 421, i32 0, metadata !748, null}
!771 = metadata !{i32 422, i32 0, metadata !748, null}
!772 = metadata !{i32 426, i32 0, metadata !748, null}
!773 = metadata !{i32 64, i32 0, metadata !203, metadata !774}
!774 = metadata !{i32 621, i32 0, metadata !775, null}
!775 = metadata !{i32 458763, metadata !776, i32 620, i32 0} ; [ DW_TAG_lexical_block ]
!776 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !"__fd_fstat", metadata !2, i32 620, metadata !777, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!777 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !778, i32 0, null} ; [ DW_TAG_subroutine_type ]
!778 = metadata !{metadata !5, metadata !5, metadata !53}
!779 = metadata !{i32 66, i32 0, metadata !219, metadata !774}
!780 = metadata !{i32 623, i32 0, metadata !775, null}
!781 = metadata !{i32 624, i32 0, metadata !775, null}
!782 = metadata !{i32 640, i32 0, metadata !775, null}
!783 = metadata !{i32 628, i32 0, metadata !775, null}
!784 = metadata !{i32 632, i32 0, metadata !785, null}
!785 = metadata !{i32 458763, metadata !775, i32 628, i32 0} ; [ DW_TAG_lexical_block ]
!786 = metadata !{i32 634, i32 0, metadata !785, null}
!787 = metadata !{i32 635, i32 0, metadata !785, null}
!788 = metadata !{i32 639, i32 0, metadata !775, null}
!789 = metadata !{i32 40, i32 0, metadata !41, metadata !790}
!790 = metadata !{i32 450, i32 0, metadata !791, null}
!791 = metadata !{i32 458763, metadata !792, i32 449, i32 0} ; [ DW_TAG_lexical_block ]
!792 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !"__fd_lstat", metadata !2, i32 449, metadata !793, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!793 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !794, i32 0, null} ; [ DW_TAG_subroutine_type ]
!794 = metadata !{metadata !5, metadata !36, metadata !53}
!795 = metadata !{i32 43, i32 0, metadata !41, metadata !790}
!796 = metadata !{i32 46, i32 0, metadata !41, metadata !790}
!797 = metadata !{i32 47, i32 0, metadata !41, metadata !790}
!798 = metadata !{i32 48, i32 0, metadata !102, metadata !790}
!799 = metadata !{i32 49, i32 0, metadata !102, metadata !790}
!800 = metadata !{i32 451, i32 0, metadata !791, null}
!801 = metadata !{i32 452, i32 0, metadata !791, null}
!802 = metadata !{i32 464, i32 0, metadata !791, null}
!803 = metadata !{i32 1266, i32 0, metadata !106, metadata !804}
!804 = metadata !{i32 460, i32 0, metadata !805, null}
!805 = metadata !{i32 458763, metadata !791, i32 453, i32 0} ; [ DW_TAG_lexical_block ]
!806 = metadata !{i32 1269, i32 0, metadata !106, metadata !804}
!807 = metadata !{i32 1270, i32 0, metadata !114, metadata !804}
!808 = metadata !{i32 1271, i32 0, metadata !114, metadata !804}
!809 = metadata !{i32 1273, i32 0, metadata !114, metadata !804}
!810 = metadata !{i32 1276, i32 0, metadata !114, metadata !804}
!811 = metadata !{i32 1279, i32 0, metadata !119, metadata !804}
!812 = metadata !{i32 1280, i32 0, metadata !119, metadata !804}
!813 = metadata !{i32 1281, i32 0, metadata !119, metadata !804}
!814 = metadata !{i32 1282, i32 0, metadata !119, metadata !804}
!815 = metadata !{i32 462, i32 0, metadata !805, null}
!816 = metadata !{i32 463, i32 0, metadata !805, null}
!817 = metadata !{i32 40, i32 0, metadata !41, metadata !818}
!818 = metadata !{i32 431, i32 0, metadata !819, null}
!819 = metadata !{i32 458763, metadata !820, i32 430, i32 0} ; [ DW_TAG_lexical_block ]
!820 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_stat", metadata !"__fd_stat", metadata !"__fd_stat", metadata !2, i32 430, metadata !793, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!821 = metadata !{i32 43, i32 0, metadata !41, metadata !818}
!822 = metadata !{i32 46, i32 0, metadata !41, metadata !818}
!823 = metadata !{i32 47, i32 0, metadata !41, metadata !818}
!824 = metadata !{i32 48, i32 0, metadata !102, metadata !818}
!825 = metadata !{i32 49, i32 0, metadata !102, metadata !818}
!826 = metadata !{i32 432, i32 0, metadata !819, null}
!827 = metadata !{i32 433, i32 0, metadata !819, null}
!828 = metadata !{i32 445, i32 0, metadata !819, null}
!829 = metadata !{i32 1266, i32 0, metadata !106, metadata !830}
!830 = metadata !{i32 441, i32 0, metadata !831, null}
!831 = metadata !{i32 458763, metadata !819, i32 434, i32 0} ; [ DW_TAG_lexical_block ]
!832 = metadata !{i32 1269, i32 0, metadata !106, metadata !830}
!833 = metadata !{i32 1270, i32 0, metadata !114, metadata !830}
!834 = metadata !{i32 1271, i32 0, metadata !114, metadata !830}
!835 = metadata !{i32 1273, i32 0, metadata !114, metadata !830}
!836 = metadata !{i32 1276, i32 0, metadata !114, metadata !830}
!837 = metadata !{i32 1279, i32 0, metadata !119, metadata !830}
!838 = metadata !{i32 1280, i32 0, metadata !119, metadata !830}
!839 = metadata !{i32 1281, i32 0, metadata !119, metadata !830}
!840 = metadata !{i32 1282, i32 0, metadata !119, metadata !830}
!841 = metadata !{i32 443, i32 0, metadata !831, null}
!842 = metadata !{i32 444, i32 0, metadata !831, null}
!843 = metadata !{i32 237, i32 0, metadata !844, null}
!844 = metadata !{i32 458763, metadata !22, i32 233, i32 0} ; [ DW_TAG_lexical_block ]
!845 = metadata !{i32 239, i32 0, metadata !844, null}
!846 = metadata !{i32 242, i32 0, metadata !844, null}
!847 = metadata !{i32 243, i32 0, metadata !844, null}
!848 = metadata !{i32 296, i32 0, metadata !844, null}
!849 = metadata !{i32 64, i32 0, metadata !203, metadata !850}
!850 = metadata !{i32 247, i32 0, metadata !844, null}
!851 = metadata !{i32 66, i32 0, metadata !219, metadata !850}
!852 = metadata !{i32 249, i32 0, metadata !844, null}
!853 = metadata !{i32 250, i32 0, metadata !844, null}
!854 = metadata !{i32 254, i32 0, metadata !844, null}
!855 = metadata !{i32 255, i32 0, metadata !844, null}
!856 = metadata !{i32 256, i32 0, metadata !844, null}
!857 = metadata !{i32 260, i32 0, metadata !844, null}
!858 = metadata !{i32 1254, i32 0, metadata !323, metadata !859}
!859 = metadata !{i32 263, i32 0, metadata !860, null}
!860 = metadata !{i32 458763, metadata !844, i32 260, i32 0} ; [ DW_TAG_lexical_block ]
!861 = metadata !{i32 1255, i32 0, metadata !323, metadata !859}
!862 = metadata !{i32 1260, i32 0, metadata !342, metadata !863}
!863 = metadata !{i32 264, i32 0, metadata !860, null}
!864 = metadata !{i32 1261, i32 0, metadata !342, metadata !863}
!865 = metadata !{i32 268, i32 0, metadata !860, null}
!866 = metadata !{i32 269, i32 0, metadata !860, null}
!867 = metadata !{i32 270, i32 0, metadata !860, null}
!868 = metadata !{i32 272, i32 0, metadata !860, null}
!869 = metadata !{i32 274, i32 0, metadata !860, null}
!870 = metadata !{i32 275, i32 0, metadata !860, null}
!871 = metadata !{i32 279, i32 0, metadata !860, null}
!872 = metadata !{i32 280, i32 0, metadata !860, null}
!873 = metadata !{i32 284, i32 0, metadata !844, null}
!874 = metadata !{i32 285, i32 0, metadata !844, null}
!875 = metadata !{i32 289, i32 0, metadata !844, null}
!876 = metadata !{i32 290, i32 0, metadata !844, null}
!877 = metadata !{i32 293, i32 0, metadata !844, null}
!878 = metadata !{i32 294, i32 0, metadata !844, null}
!879 = metadata !{i32 64, i32 0, metadata !203, metadata !880}
!880 = metadata !{i32 545, i32 0, metadata !881, null}
!881 = metadata !{i32 458763, metadata !28, i32 542, i32 0} ; [ DW_TAG_lexical_block ]
!882 = metadata !{i32 66, i32 0, metadata !219, metadata !880}
!883 = metadata !{i32 547, i32 0, metadata !881, null}
!884 = metadata !{i32 548, i32 0, metadata !881, null}
!885 = metadata !{i32 565, i32 0, metadata !881, null}
!886 = metadata !{i32 552, i32 0, metadata !881, null}
!887 = metadata !{i32 553, i32 0, metadata !881, null}
!888 = metadata !{i32 554, i32 0, metadata !881, null}
!889 = metadata !{i32 555, i32 0, metadata !881, null}
!890 = metadata !{i32 559, i32 0, metadata !881, null}
!891 = metadata !{i32 508, i32 0, metadata !892, metadata !896}
!892 = metadata !{i32 458763, metadata !893, i32 507, i32 0} ; [ DW_TAG_lexical_block ]
!893 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__df_chmod", metadata !"__df_chmod", metadata !"__df_chmod", metadata !2, i32 507, metadata !894, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!894 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !895, i32 0, null} ; [ DW_TAG_subroutine_type ]
!895 = metadata !{metadata !5, metadata !45, metadata !31}
!896 = metadata !{i32 560, i32 0, metadata !881, null}
!897 = metadata !{i32 509, i32 0, metadata !892, metadata !896}
!898 = metadata !{i32 510, i32 0, metadata !892, metadata !896}
!899 = metadata !{i32 511, i32 0, metadata !892, metadata !896}
!900 = metadata !{i32 515, i32 0, metadata !892, metadata !896}
!901 = metadata !{i32 562, i32 0, metadata !902, null}
!902 = metadata !{i32 458763, metadata !881, i32 560, i32 0} ; [ DW_TAG_lexical_block ]
!903 = metadata !{i32 563, i32 0, metadata !902, null}
!904 = metadata !{i32 564, i32 0, metadata !902, null}
!905 = metadata !{i32 40, i32 0, metadata !41, metadata !906}
!906 = metadata !{i32 523, i32 0, metadata !907, null}
!907 = metadata !{i32 458763, metadata !33, i32 520, i32 0} ; [ DW_TAG_lexical_block ]
!908 = metadata !{i32 43, i32 0, metadata !41, metadata !906}
!909 = metadata !{i32 46, i32 0, metadata !41, metadata !906}
!910 = metadata !{i32 47, i32 0, metadata !41, metadata !906}
!911 = metadata !{i32 48, i32 0, metadata !102, metadata !906}
!912 = metadata !{i32 49, i32 0, metadata !102, metadata !906}
!913 = metadata !{i32 525, i32 0, metadata !907, null}
!914 = metadata !{i32 526, i32 0, metadata !907, null}
!915 = metadata !{i32 527, i32 0, metadata !907, null}
!916 = metadata !{i32 528, i32 0, metadata !907, null}
!917 = metadata !{i32 538, i32 0, metadata !907, null}
!918 = metadata !{i32 532, i32 0, metadata !907, null}
!919 = metadata !{i32 508, i32 0, metadata !892, metadata !920}
!920 = metadata !{i32 533, i32 0, metadata !907, null}
!921 = metadata !{i32 509, i32 0, metadata !892, metadata !920}
!922 = metadata !{i32 510, i32 0, metadata !892, metadata !920}
!923 = metadata !{i32 511, i32 0, metadata !892, metadata !920}
!924 = metadata !{i32 515, i32 0, metadata !892, metadata !920}
!925 = metadata !{i32 1266, i32 0, metadata !106, metadata !926}
!926 = metadata !{i32 535, i32 0, metadata !927, null}
!927 = metadata !{i32 458763, metadata !907, i32 533, i32 0} ; [ DW_TAG_lexical_block ]
!928 = metadata !{i32 1269, i32 0, metadata !106, metadata !926}
!929 = metadata !{i32 1270, i32 0, metadata !114, metadata !926}
!930 = metadata !{i32 1271, i32 0, metadata !114, metadata !926}
!931 = metadata !{i32 1273, i32 0, metadata !114, metadata !926}
!932 = metadata !{i32 1276, i32 0, metadata !114, metadata !926}
!933 = metadata !{i32 1279, i32 0, metadata !119, metadata !926}
!934 = metadata !{i32 1280, i32 0, metadata !119, metadata !926}
!935 = metadata !{i32 1281, i32 0, metadata !119, metadata !926}
!936 = metadata !{i32 1282, i32 0, metadata !119, metadata !926}
!937 = metadata !{i32 536, i32 0, metadata !927, null}
!938 = metadata !{i32 537, i32 0, metadata !927, null}
!939 = metadata !{i32 305, i32 0, metadata !940, null}
!940 = metadata !{i32 458763, metadata !39, i32 301, i32 0} ; [ DW_TAG_lexical_block ]
!941 = metadata !{i32 64, i32 0, metadata !203, metadata !942}
!942 = metadata !{i32 307, i32 0, metadata !940, null}
!943 = metadata !{i32 66, i32 0, metadata !219, metadata !942}
!944 = metadata !{i32 309, i32 0, metadata !940, null}
!945 = metadata !{i32 310, i32 0, metadata !940, null}
!946 = metadata !{i32 368, i32 0, metadata !940, null}
!947 = metadata !{i32 314, i32 0, metadata !940, null}
!948 = metadata !{i32 315, i32 0, metadata !940, null}
!949 = metadata !{i32 316, i32 0, metadata !940, null}
!950 = metadata !{i32 320, i32 0, metadata !940, null}
!951 = metadata !{i32 1254, i32 0, metadata !323, metadata !952}
!952 = metadata !{i32 323, i32 0, metadata !953, null}
!953 = metadata !{i32 458763, metadata !940, i32 320, i32 0} ; [ DW_TAG_lexical_block ]
!954 = metadata !{i32 1255, i32 0, metadata !323, metadata !952}
!955 = metadata !{i32 1260, i32 0, metadata !342, metadata !956}
!956 = metadata !{i32 324, i32 0, metadata !953, null}
!957 = metadata !{i32 1261, i32 0, metadata !342, metadata !956}
!958 = metadata !{i32 328, i32 0, metadata !953, null}
!959 = metadata !{i32 329, i32 0, metadata !953, null}
!960 = metadata !{i32 330, i32 0, metadata !953, null}
!961 = metadata !{i32 331, i32 0, metadata !953, null}
!962 = metadata !{i32 333, i32 0, metadata !953, null}
!963 = metadata !{i32 334, i32 0, metadata !953, null}
!964 = metadata !{i32 338, i32 0, metadata !953, null}
!965 = metadata !{i32 339, i32 0, metadata !953, null}
!966 = metadata !{i32 340, i32 0, metadata !953, null}
!967 = metadata !{i32 347, i32 0, metadata !968, null}
!968 = metadata !{i32 458763, metadata !940, i32 342, i32 0} ; [ DW_TAG_lexical_block ]
!969 = metadata !{i32 350, i32 0, metadata !968, null}
!970 = metadata !{i32 351, i32 0, metadata !968, null}
!971 = metadata !{i32 353, i32 0, metadata !968, null}
!972 = metadata !{i32 354, i32 0, metadata !968, null}
!973 = metadata !{i32 358, i32 0, metadata !968, null}
!974 = metadata !{i32 359, i32 0, metadata !968, null}
!975 = metadata !{i32 361, i32 0, metadata !968, null}
!976 = metadata !{i32 362, i32 0, metadata !968, null}
!977 = metadata !{i32 364, i32 0, metadata !968, null}
!978 = metadata !{i32 365, i32 0, metadata !968, null}
!979 = metadata !{i32 367, i32 0, metadata !968, null}
!980 = metadata !{i32 133, i32 0, metadata !981, null}
!981 = metadata !{i32 458763, metadata !982, i32 128, i32 0} ; [ DW_TAG_lexical_block ]
!982 = metadata !{i32 458798, i32 0, metadata !2, metadata !"__fd_open", metadata !"__fd_open", metadata !"__fd_open", metadata !2, i32 128, metadata !983, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!983 = metadata !{i32 458773, metadata !2, metadata !"", metadata !2, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !984, i32 0, null} ; [ DW_TAG_subroutine_type ]
!984 = metadata !{metadata !5, metadata !36, metadata !5, metadata !31}
!985 = metadata !{i32 134, i32 0, metadata !981, null}
!986 = metadata !{i32 136, i32 0, metadata !981, null}
!987 = metadata !{i32 137, i32 0, metadata !981, null}
!988 = metadata !{i32 198, i32 0, metadata !981, null}
!989 = metadata !{i32 144, i32 0, metadata !981, null}
!990 = metadata !{i32 40, i32 0, metadata !41, metadata !991}
!991 = metadata !{i32 146, i32 0, metadata !981, null}
!992 = metadata !{i32 43, i32 0, metadata !41, metadata !991}
!993 = metadata !{i32 46, i32 0, metadata !41, metadata !991}
!994 = metadata !{i32 47, i32 0, metadata !41, metadata !991}
!995 = metadata !{i32 48, i32 0, metadata !102, metadata !991}
!996 = metadata !{i32 49, i32 0, metadata !102, metadata !991}
!997 = metadata !{i32 147, i32 0, metadata !981, null}
!998 = metadata !{i32 150, i32 0, metadata !981, null}
!999 = metadata !{i32 152, i32 0, metadata !981, null}
!1000 = metadata !{i32 153, i32 0, metadata !981, null}
!1001 = metadata !{i32 165, i32 0, metadata !981, null}
!1002 = metadata !{i32 168, i32 0, metadata !981, null}
!1003 = metadata !{i32 169, i32 0, metadata !981, null}
!1004 = metadata !{i32 173, i32 0, metadata !981, null}
!1005 = metadata !{i32 99, i32 0, metadata !1006, metadata !1004}
!1006 = metadata !{i32 458763, metadata !1007, i32 97, i32 0} ; [ DW_TAG_lexical_block ]
!1007 = metadata !{i32 458798, i32 0, metadata !2, metadata !"has_permission", metadata !"has_permission", metadata !"has_permission", metadata !2, i32 97, metadata !777, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!1008 = metadata !{i32 101, i32 0, metadata !1006, metadata !1004}
!1009 = metadata !{i32 105, i32 0, metadata !1006, metadata !1004}
!1010 = metadata !{i32 118, i32 0, metadata !1006, metadata !1004}
!1011 = metadata !{i32 121, i32 0, metadata !1006, metadata !1004}
!1012 = metadata !{i32 174, i32 0, metadata !981, null}
!1013 = metadata !{i32 178, i32 0, metadata !981, null}
!1014 = metadata !{i32 1266, i32 0, metadata !106, metadata !1015}
!1015 = metadata !{i32 181, i32 0, metadata !1016, null}
!1016 = metadata !{i32 458763, metadata !981, i32 178, i32 0} ; [ DW_TAG_lexical_block ]
!1017 = metadata !{i32 1269, i32 0, metadata !106, metadata !1015}
!1018 = metadata !{i32 1270, i32 0, metadata !114, metadata !1015}
!1019 = metadata !{i32 1271, i32 0, metadata !114, metadata !1015}
!1020 = metadata !{i32 1273, i32 0, metadata !114, metadata !1015}
!1021 = metadata !{i32 1276, i32 0, metadata !114, metadata !1015}
!1022 = metadata !{i32 1279, i32 0, metadata !119, metadata !1015}
!1023 = metadata !{i32 1280, i32 0, metadata !119, metadata !1015}
!1024 = metadata !{i32 1281, i32 0, metadata !119, metadata !1015}
!1025 = metadata !{i32 1282, i32 0, metadata !119, metadata !1015}
!1026 = metadata !{i32 182, i32 0, metadata !1016, null}
!1027 = metadata !{i32 183, i32 0, metadata !1016, null}
!1028 = metadata !{i32 186, i32 0, metadata !1016, null}
!1029 = metadata !{i32 189, i32 0, metadata !981, null}
!1030 = metadata !{i32 190, i32 0, metadata !981, null}
!1031 = metadata !{i32 191, i32 0, metadata !981, null}
!1032 = metadata !{i32 193, i32 0, metadata !981, null}
!1033 = metadata !{i32 195, i32 0, metadata !981, null}
