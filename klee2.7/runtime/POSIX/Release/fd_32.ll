; ModuleID = 'fd_32.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%struct.__fsid_t = type { [2 x i32] }
%struct.dirent = type { i32, i32, i16, i8, [256 x i8] }
%struct.dirent64 = type { i64, i64, i16, i8, [256 x i8] }
%struct.stat = type { i64, i16, i32, i32, i32, i32, i32, i64, i16, i32, i32, i32, %struct.timespec, %struct.timespec, %struct.timespec, i32, i32 }
%struct.stat64 = type { i64, i32, i32, i32, i32, i32, i32, i64, i32, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.statfs = type { i32, i32, i32, i32, i32, i32, i32, %struct.__fsid_t, i32, i32, [5 x i32] }
%struct.timespec = type { i32, i32 }

@__getdents = alias i32 (i32, %struct.dirent*, i32)* @getdents ; <i32 (i32, %struct.dirent*, i32)*> [#uses=0]

define i32 @open(i8* %pathname, i32 %flags, ...) nounwind {
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

define weak i32 @fstat64(i32 %fd, %struct.stat64* %buf) nounwind {
entry:
  %0 = tail call i32 @__fd_fstat(i32 %fd, %struct.stat64* %buf) nounwind, !dbg !15 ; <i32> [#uses=1]
  ret i32 %0, !dbg !15
}

declare i32 @__fd_fstat(i32, %struct.stat64*)

define i32 @fstat(i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8           ; <%struct.stat64*> [#uses=14]
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) nounwind, !dbg !63 ; <i32> [#uses=1]
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !91 ; <i64*> [#uses=1]
  %2 = load i64* %1, align 8, !dbg !91            ; <i64> [#uses=1]
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !91 ; <i64*> [#uses=1]
  store i64 %2, i64* %3, align 4, !dbg !91
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !97 ; <i64*> [#uses=1]
  %5 = load i64* %4, align 8, !dbg !97            ; <i64> [#uses=1]
  %6 = trunc i64 %5 to i32, !dbg !97              ; <i32> [#uses=1]
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !97 ; <i32*> [#uses=1]
  store i32 %6, i32* %7, align 4, !dbg !97
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !98 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 8, !dbg !98            ; <i32> [#uses=1]
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !98 ; <i32*> [#uses=1]
  store i32 %9, i32* %10, align 4, !dbg !98
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !99 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !99          ; <i32> [#uses=1]
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !99 ; <i32*> [#uses=1]
  store i32 %12, i32* %13, align 4, !dbg !99
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !100 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 8, !dbg !100         ; <i32> [#uses=1]
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !100 ; <i32*> [#uses=1]
  store i32 %15, i32* %16, align 4, !dbg !100
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !101 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4, !dbg !101         ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !101 ; <i32*> [#uses=1]
  store i32 %18, i32* %19, align 4, !dbg !101
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !102 ; <i64*> [#uses=1]
  %21 = load i64* %20, align 8, !dbg !102         ; <i64> [#uses=1]
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !102 ; <i64*> [#uses=1]
  store i64 %21, i64* %22, align 4, !dbg !102
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !103 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !103         ; <i64> [#uses=1]
  %25 = trunc i64 %24 to i32, !dbg !103           ; <i32> [#uses=1]
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !103 ; <i32*> [#uses=1]
  store i32 %25, i32* %26, align 4, !dbg !103
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 8, !dbg !104         ; <i32> [#uses=1]
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  store i32 %28, i32* %29, align 4, !dbg !104
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  %31 = load i32* %30, align 8, !dbg !105         ; <i32> [#uses=1]
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  store i32 %31, i32* %32, align 4, !dbg !105
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 8, !dbg !106         ; <i32> [#uses=1]
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  store i32 %34, i32* %35, align 4, !dbg !106
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !107 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4, !dbg !107         ; <i32> [#uses=1]
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !107 ; <i32*> [#uses=1]
  store i32 %37, i32* %38, align 4, !dbg !107
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !108 ; <i64*> [#uses=1]
  %40 = load i64* %39, align 8, !dbg !108         ; <i64> [#uses=1]
  %41 = trunc i64 %40 to i32, !dbg !108           ; <i32> [#uses=1]
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !108 ; <i32*> [#uses=1]
  store i32 %41, i32* %42, align 4, !dbg !108
  ret i32 %0, !dbg !109
}

define i32 @__fxstat(i32 %vers, i32 %fd, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8           ; <%struct.stat64*> [#uses=14]
  %0 = call i32 @__fd_fstat(i32 %fd, %struct.stat64* %tmp) nounwind, !dbg !110 ; <i32> [#uses=1]
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !115 ; <i64*> [#uses=1]
  %2 = load i64* %1, align 8, !dbg !115           ; <i64> [#uses=1]
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !115 ; <i64*> [#uses=1]
  store i64 %2, i64* %3, align 4, !dbg !115
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !117 ; <i64*> [#uses=1]
  %5 = load i64* %4, align 8, !dbg !117           ; <i64> [#uses=1]
  %6 = trunc i64 %5 to i32, !dbg !117             ; <i32> [#uses=1]
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !117 ; <i32*> [#uses=1]
  store i32 %6, i32* %7, align 4, !dbg !117
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !118 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 8, !dbg !118           ; <i32> [#uses=1]
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !118 ; <i32*> [#uses=1]
  store i32 %9, i32* %10, align 4, !dbg !118
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !119 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !119         ; <i32> [#uses=1]
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !119 ; <i32*> [#uses=1]
  store i32 %12, i32* %13, align 4, !dbg !119
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !120 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 8, !dbg !120         ; <i32> [#uses=1]
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !120 ; <i32*> [#uses=1]
  store i32 %15, i32* %16, align 4, !dbg !120
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !121 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4, !dbg !121         ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !121 ; <i32*> [#uses=1]
  store i32 %18, i32* %19, align 4, !dbg !121
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !122 ; <i64*> [#uses=1]
  %21 = load i64* %20, align 8, !dbg !122         ; <i64> [#uses=1]
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !122 ; <i64*> [#uses=1]
  store i64 %21, i64* %22, align 4, !dbg !122
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !123 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !123         ; <i64> [#uses=1]
  %25 = trunc i64 %24 to i32, !dbg !123           ; <i32> [#uses=1]
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !123 ; <i32*> [#uses=1]
  store i32 %25, i32* %26, align 4, !dbg !123
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 8, !dbg !124         ; <i32> [#uses=1]
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  store i32 %28, i32* %29, align 4, !dbg !124
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  %31 = load i32* %30, align 8, !dbg !125         ; <i32> [#uses=1]
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  store i32 %31, i32* %32, align 4, !dbg !125
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 8, !dbg !126         ; <i32> [#uses=1]
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  store i32 %34, i32* %35, align 4, !dbg !126
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !127 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4, !dbg !127         ; <i32> [#uses=1]
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !127 ; <i32*> [#uses=1]
  store i32 %37, i32* %38, align 4, !dbg !127
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !128 ; <i64*> [#uses=1]
  %40 = load i64* %39, align 8, !dbg !128         ; <i64> [#uses=1]
  %41 = trunc i64 %40 to i32, !dbg !128           ; <i32> [#uses=1]
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !128 ; <i32*> [#uses=1]
  store i32 %41, i32* %42, align 4, !dbg !128
  ret i32 %0, !dbg !129
}

define weak i32 @lstat64(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  %0 = tail call i32 @__fd_lstat(i8* %path, %struct.stat64* %buf) nounwind, !dbg !130 ; <i32> [#uses=1]
  ret i32 %0, !dbg !130
}

declare i32 @__fd_lstat(i8*, %struct.stat64*)

define i32 @lstat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8           ; <%struct.stat64*> [#uses=14]
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !135 ; <i32> [#uses=1]
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !140 ; <i64*> [#uses=1]
  %2 = load i64* %1, align 8, !dbg !140           ; <i64> [#uses=1]
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !140 ; <i64*> [#uses=1]
  store i64 %2, i64* %3, align 4, !dbg !140
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !142 ; <i64*> [#uses=1]
  %5 = load i64* %4, align 8, !dbg !142           ; <i64> [#uses=1]
  %6 = trunc i64 %5 to i32, !dbg !142             ; <i32> [#uses=1]
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !142 ; <i32*> [#uses=1]
  store i32 %6, i32* %7, align 4, !dbg !142
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !143 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 8, !dbg !143           ; <i32> [#uses=1]
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !143 ; <i32*> [#uses=1]
  store i32 %9, i32* %10, align 4, !dbg !143
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !144 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !144         ; <i32> [#uses=1]
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !144 ; <i32*> [#uses=1]
  store i32 %12, i32* %13, align 4, !dbg !144
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !145 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 8, !dbg !145         ; <i32> [#uses=1]
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !145 ; <i32*> [#uses=1]
  store i32 %15, i32* %16, align 4, !dbg !145
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !146 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4, !dbg !146         ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !146 ; <i32*> [#uses=1]
  store i32 %18, i32* %19, align 4, !dbg !146
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !147 ; <i64*> [#uses=1]
  %21 = load i64* %20, align 8, !dbg !147         ; <i64> [#uses=1]
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !147 ; <i64*> [#uses=1]
  store i64 %21, i64* %22, align 4, !dbg !147
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !148 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !148         ; <i64> [#uses=1]
  %25 = trunc i64 %24 to i32, !dbg !148           ; <i32> [#uses=1]
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !148 ; <i32*> [#uses=1]
  store i32 %25, i32* %26, align 4, !dbg !148
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 8, !dbg !149         ; <i32> [#uses=1]
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  store i32 %28, i32* %29, align 4, !dbg !149
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  %31 = load i32* %30, align 8, !dbg !150         ; <i32> [#uses=1]
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  store i32 %31, i32* %32, align 4, !dbg !150
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 8, !dbg !151         ; <i32> [#uses=1]
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  store i32 %34, i32* %35, align 4, !dbg !151
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !152 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4, !dbg !152         ; <i32> [#uses=1]
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !152 ; <i32*> [#uses=1]
  store i32 %37, i32* %38, align 4, !dbg !152
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !153 ; <i64*> [#uses=1]
  %40 = load i64* %39, align 8, !dbg !153         ; <i64> [#uses=1]
  %41 = trunc i64 %40 to i32, !dbg !153           ; <i32> [#uses=1]
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !153 ; <i32*> [#uses=1]
  store i32 %41, i32* %42, align 4, !dbg !153
  ret i32 %0, !dbg !154
}

define i32 @__lxstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8           ; <%struct.stat64*> [#uses=14]
  %0 = call i32 @__fd_lstat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !155 ; <i32> [#uses=1]
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !160 ; <i64*> [#uses=1]
  %2 = load i64* %1, align 8, !dbg !160           ; <i64> [#uses=1]
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !160 ; <i64*> [#uses=1]
  store i64 %2, i64* %3, align 4, !dbg !160
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !162 ; <i64*> [#uses=1]
  %5 = load i64* %4, align 8, !dbg !162           ; <i64> [#uses=1]
  %6 = trunc i64 %5 to i32, !dbg !162             ; <i32> [#uses=1]
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !162 ; <i32*> [#uses=1]
  store i32 %6, i32* %7, align 4, !dbg !162
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !163 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 8, !dbg !163           ; <i32> [#uses=1]
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !163 ; <i32*> [#uses=1]
  store i32 %9, i32* %10, align 4, !dbg !163
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !164 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !164         ; <i32> [#uses=1]
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !164 ; <i32*> [#uses=1]
  store i32 %12, i32* %13, align 4, !dbg !164
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !165 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 8, !dbg !165         ; <i32> [#uses=1]
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !165 ; <i32*> [#uses=1]
  store i32 %15, i32* %16, align 4, !dbg !165
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !166 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4, !dbg !166         ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !166 ; <i32*> [#uses=1]
  store i32 %18, i32* %19, align 4, !dbg !166
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !167 ; <i64*> [#uses=1]
  %21 = load i64* %20, align 8, !dbg !167         ; <i64> [#uses=1]
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !167 ; <i64*> [#uses=1]
  store i64 %21, i64* %22, align 4, !dbg !167
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !168 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !168         ; <i64> [#uses=1]
  %25 = trunc i64 %24 to i32, !dbg !168           ; <i32> [#uses=1]
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !168 ; <i32*> [#uses=1]
  store i32 %25, i32* %26, align 4, !dbg !168
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 8, !dbg !169         ; <i32> [#uses=1]
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  store i32 %28, i32* %29, align 4, !dbg !169
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  %31 = load i32* %30, align 8, !dbg !170         ; <i32> [#uses=1]
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  store i32 %31, i32* %32, align 4, !dbg !170
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 8, !dbg !171         ; <i32> [#uses=1]
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  store i32 %34, i32* %35, align 4, !dbg !171
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !172 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4, !dbg !172         ; <i32> [#uses=1]
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !172 ; <i32*> [#uses=1]
  store i32 %37, i32* %38, align 4, !dbg !172
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !173 ; <i64*> [#uses=1]
  %40 = load i64* %39, align 8, !dbg !173         ; <i64> [#uses=1]
  %41 = trunc i64 %40 to i32, !dbg !173           ; <i32> [#uses=1]
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !173 ; <i32*> [#uses=1]
  store i32 %41, i32* %42, align 4, !dbg !173
  ret i32 %0, !dbg !174
}

define weak i32 @stat64(i8* %path, %struct.stat64* %buf) nounwind {
entry:
  %0 = tail call i32 @__fd_stat(i8* %path, %struct.stat64* %buf) nounwind, !dbg !175 ; <i32> [#uses=1]
  ret i32 %0, !dbg !175
}

declare i32 @__fd_stat(i8*, %struct.stat64*)

define i32 @stat(i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8           ; <%struct.stat64*> [#uses=14]
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !178 ; <i32> [#uses=1]
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !181 ; <i64*> [#uses=1]
  %2 = load i64* %1, align 8, !dbg !181           ; <i64> [#uses=1]
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !181 ; <i64*> [#uses=1]
  store i64 %2, i64* %3, align 4, !dbg !181
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !183 ; <i64*> [#uses=1]
  %5 = load i64* %4, align 8, !dbg !183           ; <i64> [#uses=1]
  %6 = trunc i64 %5 to i32, !dbg !183             ; <i32> [#uses=1]
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !183 ; <i32*> [#uses=1]
  store i32 %6, i32* %7, align 4, !dbg !183
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !184 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 8, !dbg !184           ; <i32> [#uses=1]
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !184 ; <i32*> [#uses=1]
  store i32 %9, i32* %10, align 4, !dbg !184
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !185 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !185         ; <i32> [#uses=1]
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !185 ; <i32*> [#uses=1]
  store i32 %12, i32* %13, align 4, !dbg !185
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !186 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 8, !dbg !186         ; <i32> [#uses=1]
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !186 ; <i32*> [#uses=1]
  store i32 %15, i32* %16, align 4, !dbg !186
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !187 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4, !dbg !187         ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !187 ; <i32*> [#uses=1]
  store i32 %18, i32* %19, align 4, !dbg !187
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !188 ; <i64*> [#uses=1]
  %21 = load i64* %20, align 8, !dbg !188         ; <i64> [#uses=1]
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !188 ; <i64*> [#uses=1]
  store i64 %21, i64* %22, align 4, !dbg !188
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !189 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !189         ; <i64> [#uses=1]
  %25 = trunc i64 %24 to i32, !dbg !189           ; <i32> [#uses=1]
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !189 ; <i32*> [#uses=1]
  store i32 %25, i32* %26, align 4, !dbg !189
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 8, !dbg !190         ; <i32> [#uses=1]
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  store i32 %28, i32* %29, align 4, !dbg !190
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  %31 = load i32* %30, align 8, !dbg !191         ; <i32> [#uses=1]
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  store i32 %31, i32* %32, align 4, !dbg !191
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 8, !dbg !192         ; <i32> [#uses=1]
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  store i32 %34, i32* %35, align 4, !dbg !192
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !193 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4, !dbg !193         ; <i32> [#uses=1]
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !193 ; <i32*> [#uses=1]
  store i32 %37, i32* %38, align 4, !dbg !193
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !194 ; <i64*> [#uses=1]
  %40 = load i64* %39, align 8, !dbg !194         ; <i64> [#uses=1]
  %41 = trunc i64 %40 to i32, !dbg !194           ; <i32> [#uses=1]
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !194 ; <i32*> [#uses=1]
  store i32 %41, i32* %42, align 4, !dbg !194
  ret i32 %0, !dbg !195
}

define i32 @__xstat(i32 %vers, i8* %path, %struct.stat* nocapture %buf) nounwind {
entry:
  %tmp = alloca %struct.stat64, align 8           ; <%struct.stat64*> [#uses=14]
  %0 = call i32 @__fd_stat(i8* %path, %struct.stat64* %tmp) nounwind, !dbg !196 ; <i32> [#uses=1]
  %1 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 0, !dbg !199 ; <i64*> [#uses=1]
  %2 = load i64* %1, align 8, !dbg !199           ; <i64> [#uses=1]
  %3 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 0, !dbg !199 ; <i64*> [#uses=1]
  store i64 %2, i64* %3, align 4, !dbg !199
  %4 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 15, !dbg !201 ; <i64*> [#uses=1]
  %5 = load i64* %4, align 8, !dbg !201           ; <i64> [#uses=1]
  %6 = trunc i64 %5 to i32, !dbg !201             ; <i32> [#uses=1]
  %7 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 2, !dbg !201 ; <i32*> [#uses=1]
  store i32 %6, i32* %7, align 4, !dbg !201
  %8 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 3, !dbg !202 ; <i32*> [#uses=1]
  %9 = load i32* %8, align 8, !dbg !202           ; <i32> [#uses=1]
  %10 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 3, !dbg !202 ; <i32*> [#uses=1]
  store i32 %9, i32* %10, align 4, !dbg !202
  %11 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 4, !dbg !203 ; <i32*> [#uses=1]
  %12 = load i32* %11, align 4, !dbg !203         ; <i32> [#uses=1]
  %13 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 4, !dbg !203 ; <i32*> [#uses=1]
  store i32 %12, i32* %13, align 4, !dbg !203
  %14 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 5, !dbg !204 ; <i32*> [#uses=1]
  %15 = load i32* %14, align 8, !dbg !204         ; <i32> [#uses=1]
  %16 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 5, !dbg !204 ; <i32*> [#uses=1]
  store i32 %15, i32* %16, align 4, !dbg !204
  %17 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 6, !dbg !205 ; <i32*> [#uses=1]
  %18 = load i32* %17, align 4, !dbg !205         ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 6, !dbg !205 ; <i32*> [#uses=1]
  store i32 %18, i32* %19, align 4, !dbg !205
  %20 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 7, !dbg !206 ; <i64*> [#uses=1]
  %21 = load i64* %20, align 8, !dbg !206         ; <i64> [#uses=1]
  %22 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 7, !dbg !206 ; <i64*> [#uses=1]
  store i64 %21, i64* %22, align 4, !dbg !206
  %23 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 9, !dbg !207 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !207         ; <i64> [#uses=1]
  %25 = trunc i64 %24 to i32, !dbg !207           ; <i32> [#uses=1]
  %26 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 9, !dbg !207 ; <i32*> [#uses=1]
  store i32 %25, i32* %26, align 4, !dbg !207
  %27 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  %28 = load i32* %27, align 8, !dbg !208         ; <i32> [#uses=1]
  %29 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  store i32 %28, i32* %29, align 4, !dbg !208
  %30 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  %31 = load i32* %30, align 8, !dbg !209         ; <i32> [#uses=1]
  %32 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  store i32 %31, i32* %32, align 4, !dbg !209
  %33 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  %34 = load i32* %33, align 8, !dbg !210         ; <i32> [#uses=1]
  %35 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  store i32 %34, i32* %35, align 4, !dbg !210
  %36 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 10, !dbg !211 ; <i32*> [#uses=1]
  %37 = load i32* %36, align 4, !dbg !211         ; <i32> [#uses=1]
  %38 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 10, !dbg !211 ; <i32*> [#uses=1]
  store i32 %37, i32* %38, align 4, !dbg !211
  %39 = getelementptr inbounds %struct.stat64* %tmp, i32 0, i32 11, !dbg !212 ; <i64*> [#uses=1]
  %40 = load i64* %39, align 8, !dbg !212         ; <i64> [#uses=1]
  %41 = trunc i64 %40 to i32, !dbg !212           ; <i32> [#uses=1]
  %42 = getelementptr inbounds %struct.stat* %buf, i32 0, i32 11, !dbg !212 ; <i32*> [#uses=1]
  store i32 %41, i32* %42, align 4, !dbg !212
  ret i32 %0, !dbg !213
}

define weak i64 @lseek64(i32 %fd, i64 %off, i32 %whence) nounwind {
entry:
  %0 = tail call i64 @__fd_lseek(i32 %fd, i64 %off, i32 %whence) nounwind, !dbg !214 ; <i64> [#uses=1]
  ret i64 %0, !dbg !214
}

declare i64 @__fd_lseek(i32, i64, i32)

define i32 @lseek(i32 %fd, i32 %off, i32 %whence) nounwind {
entry:
  %0 = sext i32 %off to i64, !dbg !221            ; <i64> [#uses=1]
  %1 = tail call i64 @__fd_lseek(i32 %fd, i64 %0, i32 %whence) nounwind, !dbg !221 ; <i64> [#uses=1]
  %2 = trunc i64 %1 to i32, !dbg !221             ; <i32> [#uses=1]
  ret i32 %2, !dbg !221
}

define weak i32 @open64(i8* %pathname, i32 %flags, ...) nounwind {
entry:
  %ap = alloca i8*, align 4                       ; <i8**> [#uses=3]
  %0 = and i32 %flags, 64, !dbg !227              ; <i32> [#uses=1]
  %1 = icmp eq i32 %0, 0, !dbg !227               ; <i1> [#uses=1]
  br i1 %1, label %bb3, label %bb, !dbg !227

bb:                                               ; preds = %entry
  %ap1 = bitcast i8** %ap to i8*, !dbg !230       ; <i8*> [#uses=2]
  call void @llvm.va_start(i8* %ap1), !dbg !230
  %2 = load i8** %ap, align 4, !dbg !232          ; <i8*> [#uses=2]
  %3 = getelementptr inbounds i8* %2, i32 4, !dbg !232 ; <i8*> [#uses=1]
  store i8* %3, i8** %ap, align 4, !dbg !232
  %4 = bitcast i8* %2 to i32*, !dbg !232          ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4, !dbg !232           ; <i32> [#uses=1]
  call void @llvm.va_end(i8* %ap1), !dbg !233
  br label %bb3, !dbg !233

bb3:                                              ; preds = %entry, %bb
  %mode.0 = phi i32 [ %5, %bb ], [ 0, %entry ]    ; <i32> [#uses=1]
  %6 = call i32 @__fd_open(i8* %pathname, i32 %flags, i32 %mode.0) nounwind, !dbg !234 ; <i32> [#uses=1]
  ret i32 %6, !dbg !234
}

declare void @llvm.va_start(i8*) nounwind

declare void @llvm.va_end(i8*) nounwind

declare i32 @__fd_open(i8*, i32, i32)

define i32 @getdents(i32 %fd, %struct.dirent* %dirp, i32 %nbytes) nounwind {
entry:
  %0 = bitcast %struct.dirent* %dirp to %struct.dirent64*, !dbg !235 ; <%struct.dirent64*> [#uses=2]
  %1 = tail call i32 @__fd_getdents(i32 %fd, %struct.dirent64* %0, i32 %nbytes) nounwind, !dbg !255 ; <i32> [#uses=3]
  %2 = icmp sgt i32 %1, 0, !dbg !256              ; <i1> [#uses=1]
  br i1 %2, label %bb, label %bb3, !dbg !256

bb:                                               ; preds = %entry
  %3 = bitcast %struct.dirent* %dirp to i8*       ; <i8*> [#uses=1]
  %4 = getelementptr inbounds i8* %3, i32 %1, !dbg !257 ; <i8*> [#uses=2]
  %5 = bitcast i8* %4 to %struct.dirent*          ; <%struct.dirent*> [#uses=1]
  %6 = icmp ugt %struct.dirent* %5, %dirp         ; <i1> [#uses=1]
  br i1 %6, label %bb1, label %bb3, !dbg !259

bb1:                                              ; preds = %bb, %bb1
  %dp64.05 = phi %struct.dirent64* [ %28, %bb1 ], [ %0, %bb ] ; <%struct.dirent64*> [#uses=8]
  %7 = bitcast %struct.dirent64* %dp64.05 to %struct.dirent*, !dbg !260 ; <%struct.dirent*> [#uses=3]
  %8 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 2, !dbg !262 ; <i16*> [#uses=1]
  %9 = load i16* %8, align 4, !dbg !262           ; <i16> [#uses=2]
  %10 = zext i16 %9 to i32, !dbg !262             ; <i32> [#uses=2]
  %11 = add i32 %10, -19                          ; <i32> [#uses=1]
  %12 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 0, !dbg !263 ; <i64*> [#uses=1]
  %13 = load i64* %12, align 4, !dbg !263         ; <i64> [#uses=1]
  %14 = trunc i64 %13 to i32, !dbg !263           ; <i32> [#uses=1]
  %15 = bitcast %struct.dirent64* %dp64.05 to i32* ; <i32*> [#uses=1]
  store i32 %14, i32* %15, align 4, !dbg !263
  %16 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 1, !dbg !264 ; <i64*> [#uses=2]
  %17 = load i64* %16, align 4, !dbg !264         ; <i64> [#uses=1]
  %18 = trunc i64 %17 to i32, !dbg !264           ; <i32> [#uses=1]
  %19 = getelementptr inbounds %struct.dirent* %7, i32 0, i32 1, !dbg !264 ; <i32*> [#uses=1]
  store i32 %18, i32* %19, align 4, !dbg !264
  %20 = bitcast i64* %16 to i16*                  ; <i16*> [#uses=1]
  store i16 %9, i16* %20, align 4, !dbg !265
  %21 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 3, !dbg !266 ; <i8*> [#uses=1]
  %22 = load i8* %21, align 2, !dbg !266          ; <i8> [#uses=1]
  %23 = getelementptr inbounds %struct.dirent* %7, i32 0, i32 3, !dbg !266 ; <i8*> [#uses=1]
  store i8 %22, i8* %23, align 2, !dbg !266
  %24 = getelementptr inbounds %struct.dirent64* %dp64.05, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  %25 = getelementptr inbounds %struct.dirent* %7, i32 0, i32 4, i32 0 ; <i8*> [#uses=1]
  tail call void @llvm.memmove.i32(i8* %25, i8* %24, i32 %11, i32 1), !dbg !267
  %26 = bitcast %struct.dirent64* %dp64.05 to i8*, !dbg !268 ; <i8*> [#uses=1]
  %27 = getelementptr inbounds i8* %26, i32 %10, !dbg !268 ; <i8*> [#uses=2]
  %28 = bitcast i8* %27 to %struct.dirent64*, !dbg !268 ; <%struct.dirent64*> [#uses=1]
  %29 = icmp ult i8* %27, %4                      ; <i1> [#uses=1]
  br i1 %29, label %bb1, label %bb3, !dbg !259

bb3:                                              ; preds = %bb, %bb1, %entry
  ret i32 %1, !dbg !269
}

declare i32 @__fd_getdents(i32, %struct.dirent64*, i32)

declare void @llvm.memmove.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

define i32 @statfs(i8* %path, %struct.statfs* %buf32) nounwind {
entry:
  %0 = tail call i32 @__fd_statfs(i8* %path, %struct.statfs* %buf32) nounwind, !dbg !270 ; <i32> [#uses=1]
  ret i32 %0, !dbg !270
}

declare i32 @__fd_statfs(i8*, %struct.statfs*)

define i32 @ftruncate(i32 %fd, i32 %length) nounwind {
entry:
  %0 = sext i32 %length to i64, !dbg !302         ; <i64> [#uses=1]
  %1 = tail call i32 @__fd_ftruncate(i32 %fd, i64 %0) nounwind, !dbg !302 ; <i32> [#uses=1]
  ret i32 %1, !dbg !302
}

declare i32 @__fd_ftruncate(i32, i64)

!0 = metadata !{i32 51, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 48, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"open", metadata !"open", metadata !"open", metadata !3, i32 48, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"fd_32.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !6}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ]
!9 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 54, i32 0, metadata !11, null}
!11 = metadata !{i32 458763, metadata !1, i32 51, i32 0} ; [ DW_TAG_lexical_block ]
!12 = metadata !{i32 55, i32 0, metadata !11, null}
!13 = metadata !{i32 56, i32 0, metadata !11, null}
!14 = metadata !{i32 59, i32 0, metadata !1, null}
!15 = metadata !{i32 195, i32 0, metadata !16, null}
!16 = metadata !{i32 458763, metadata !17, i32 194, i32 0} ; [ DW_TAG_lexical_block ]
!17 = metadata !{i32 458798, i32 0, metadata !3, metadata !"fstat64", metadata !"fstat64", metadata !"fstat64", metadata !3, i32 194, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, null} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{metadata !6, metadata !6, metadata !20}
!20 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ]
!21 = metadata !{i32 458771, metadata !3, metadata !"stat64", metadata !22, i32 23, i64 768, i64 32, i64 0, i32 0, null, metadata !23, i32 0, null} ; [ DW_TAG_structure_type ]
!22 = metadata !{i32 458769, i32 0, i32 1, metadata !"fd.h", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!23 = metadata !{metadata !24, metadata !29, metadata !31, metadata !34, metadata !36, metadata !38, metadata !40, metadata !42, metadata !43, metadata !44, metadata !47, metadata !50, metadata !52, metadata !59, metadata !60, metadata !61}
!24 = metadata !{i32 458765, metadata !21, metadata !"st_dev", metadata !25, i32 118, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_member ]
!25 = metadata !{i32 458769, i32 0, i32 1, metadata !"stat.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!26 = metadata !{i32 458774, metadata !3, metadata !"__dev_t", metadata !27, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!27 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!28 = metadata !{i32 458788, metadata !3, metadata !"long long unsigned int", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!29 = metadata !{i32 458765, metadata !21, metadata !"__pad1", metadata !25, i32 124, i64 32, i64 32, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!30 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!31 = metadata !{i32 458765, metadata !21, metadata !"__st_ino", metadata !25, i32 125, i64 32, i64 32, i64 96, i32 0, metadata !32} ; [ DW_TAG_member ]
!32 = metadata !{i32 458774, metadata !3, metadata !"__ino_t", metadata !27, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!33 = metadata !{i32 458788, metadata !3, metadata !"long unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!34 = metadata !{i32 458765, metadata !21, metadata !"st_mode", metadata !25, i32 126, i64 32, i64 32, i64 128, i32 0, metadata !35} ; [ DW_TAG_member ]
!35 = metadata !{i32 458774, metadata !3, metadata !"__mode_t", metadata !27, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!36 = metadata !{i32 458765, metadata !21, metadata !"st_nlink", metadata !25, i32 127, i64 32, i64 32, i64 160, i32 0, metadata !37} ; [ DW_TAG_member ]
!37 = metadata !{i32 458774, metadata !3, metadata !"__nlink_t", metadata !27, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!38 = metadata !{i32 458765, metadata !21, metadata !"st_uid", metadata !25, i32 129, i64 32, i64 32, i64 192, i32 0, metadata !39} ; [ DW_TAG_member ]
!39 = metadata !{i32 458774, metadata !3, metadata !"__uid_t", metadata !27, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!40 = metadata !{i32 458765, metadata !21, metadata !"st_gid", metadata !25, i32 130, i64 32, i64 32, i64 224, i32 0, metadata !41} ; [ DW_TAG_member ]
!41 = metadata !{i32 458774, metadata !3, metadata !"__gid_t", metadata !27, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!42 = metadata !{i32 458765, metadata !21, metadata !"st_rdev", metadata !25, i32 136, i64 64, i64 64, i64 256, i32 0, metadata !26} ; [ DW_TAG_member ]
!43 = metadata !{i32 458765, metadata !21, metadata !"__pad2", metadata !25, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !30} ; [ DW_TAG_member ]
!44 = metadata !{i32 458765, metadata !21, metadata !"st_size", metadata !25, i32 138, i64 64, i64 64, i64 352, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 458774, metadata !3, metadata !"__off64_t", metadata !27, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_typedef ]
!46 = metadata !{i32 458788, metadata !3, metadata !"long long int", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!47 = metadata !{i32 458765, metadata !21, metadata !"st_blksize", metadata !25, i32 140, i64 32, i64 32, i64 416, i32 0, metadata !48} ; [ DW_TAG_member ]
!48 = metadata !{i32 458774, metadata !3, metadata !"__blksize_t", metadata !27, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ]
!49 = metadata !{i32 458788, metadata !3, metadata !"long int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!50 = metadata !{i32 458765, metadata !21, metadata !"st_blocks", metadata !25, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !51} ; [ DW_TAG_member ]
!51 = metadata !{i32 458774, metadata !3, metadata !"__blkcnt64_t", metadata !27, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_typedef ]
!52 = metadata !{i32 458765, metadata !21, metadata !"st_atim", metadata !25, i32 149, i64 64, i64 32, i64 512, i32 0, metadata !53} ; [ DW_TAG_member ]
!53 = metadata !{i32 458771, metadata !3, metadata !"timespec", metadata !54, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !55, i32 0, null} ; [ DW_TAG_structure_type ]
!54 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!55 = metadata !{metadata !56, metadata !58}
!56 = metadata !{i32 458765, metadata !53, metadata !"tv_sec", metadata !54, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !57} ; [ DW_TAG_member ]
!57 = metadata !{i32 458774, metadata !3, metadata !"__time_t", metadata !27, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ]
!58 = metadata !{i32 458765, metadata !53, metadata !"tv_nsec", metadata !54, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !49} ; [ DW_TAG_member ]
!59 = metadata !{i32 458765, metadata !21, metadata !"st_mtim", metadata !25, i32 150, i64 64, i64 32, i64 576, i32 0, metadata !53} ; [ DW_TAG_member ]
!60 = metadata !{i32 458765, metadata !21, metadata !"st_ctim", metadata !25, i32 151, i64 64, i64 32, i64 640, i32 0, metadata !53} ; [ DW_TAG_member ]
!61 = metadata !{i32 458765, metadata !21, metadata !"st_ino", metadata !25, i32 166, i64 64, i64 64, i64 704, i32 0, metadata !62} ; [ DW_TAG_member ]
!62 = metadata !{i32 458774, metadata !3, metadata !"__ino64_t", metadata !27, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!63 = metadata !{i32 103, i32 0, metadata !64, null}
!64 = metadata !{i32 458763, metadata !65, i32 101, i32 0} ; [ DW_TAG_lexical_block ]
!65 = metadata !{i32 458798, i32 0, metadata !3, metadata !"fstat", metadata !"fstat", metadata !"fstat", metadata !3, i32 101, metadata !66, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!66 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !67, i32 0, null} ; [ DW_TAG_subroutine_type ]
!67 = metadata !{metadata !6, metadata !6, metadata !68}
!68 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !69} ; [ DW_TAG_pointer_type ]
!69 = metadata !{i32 458771, metadata !3, metadata !"stat", metadata !25, i32 44, i64 704, i64 32, i64 0, i32 0, null, metadata !70, i32 0, null} ; [ DW_TAG_structure_type ]
!70 = metadata !{metadata !71, metadata !72, metadata !74, metadata !75, metadata !76, metadata !77, metadata !78, metadata !79, metadata !80, metadata !81, metadata !83, metadata !84, metadata !86, metadata !87, metadata !88, metadata !89, metadata !90}
!71 = metadata !{i32 458765, metadata !69, metadata !"st_dev", metadata !25, i32 45, i64 64, i64 64, i64 0, i32 0, metadata !26} ; [ DW_TAG_member ]
!72 = metadata !{i32 458765, metadata !69, metadata !"__pad1", metadata !25, i32 47, i64 16, i64 16, i64 64, i32 0, metadata !73} ; [ DW_TAG_member ]
!73 = metadata !{i32 458788, metadata !3, metadata !"short unsigned int", metadata !3, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!74 = metadata !{i32 458765, metadata !69, metadata !"st_ino", metadata !25, i32 50, i64 32, i64 32, i64 96, i32 0, metadata !32} ; [ DW_TAG_member ]
!75 = metadata !{i32 458765, metadata !69, metadata !"st_mode", metadata !25, i32 55, i64 32, i64 32, i64 128, i32 0, metadata !35} ; [ DW_TAG_member ]
!76 = metadata !{i32 458765, metadata !69, metadata !"st_nlink", metadata !25, i32 56, i64 32, i64 32, i64 160, i32 0, metadata !37} ; [ DW_TAG_member ]
!77 = metadata !{i32 458765, metadata !69, metadata !"st_uid", metadata !25, i32 61, i64 32, i64 32, i64 192, i32 0, metadata !39} ; [ DW_TAG_member ]
!78 = metadata !{i32 458765, metadata !69, metadata !"st_gid", metadata !25, i32 62, i64 32, i64 32, i64 224, i32 0, metadata !41} ; [ DW_TAG_member ]
!79 = metadata !{i32 458765, metadata !69, metadata !"st_rdev", metadata !25, i32 66, i64 64, i64 64, i64 256, i32 0, metadata !26} ; [ DW_TAG_member ]
!80 = metadata !{i32 458765, metadata !69, metadata !"__pad2", metadata !25, i32 68, i64 16, i64 16, i64 320, i32 0, metadata !73} ; [ DW_TAG_member ]
!81 = metadata !{i32 458765, metadata !69, metadata !"st_size", metadata !25, i32 71, i64 32, i64 32, i64 352, i32 0, metadata !82} ; [ DW_TAG_member ]
!82 = metadata !{i32 458774, metadata !3, metadata !"__off_t", metadata !27, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ]
!83 = metadata !{i32 458765, metadata !69, metadata !"st_blksize", metadata !25, i32 75, i64 32, i64 32, i64 384, i32 0, metadata !48} ; [ DW_TAG_member ]
!84 = metadata !{i32 458765, metadata !69, metadata !"st_blocks", metadata !25, i32 77, i64 32, i64 32, i64 416, i32 0, metadata !85} ; [ DW_TAG_member ]
!85 = metadata !{i32 458774, metadata !3, metadata !"__blkcnt_t", metadata !27, i32 170, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ]
!86 = metadata !{i32 458765, metadata !69, metadata !"st_atim", metadata !25, i32 88, i64 64, i64 32, i64 448, i32 0, metadata !53} ; [ DW_TAG_member ]
!87 = metadata !{i32 458765, metadata !69, metadata !"st_mtim", metadata !25, i32 89, i64 64, i64 32, i64 512, i32 0, metadata !53} ; [ DW_TAG_member ]
!88 = metadata !{i32 458765, metadata !69, metadata !"st_ctim", metadata !25, i32 90, i64 64, i64 32, i64 576, i32 0, metadata !53} ; [ DW_TAG_member ]
!89 = metadata !{i32 458765, metadata !69, metadata !"__unused4", metadata !25, i32 106, i64 32, i64 32, i64 640, i32 0, metadata !33} ; [ DW_TAG_member ]
!90 = metadata !{i32 458765, metadata !69, metadata !"__unused5", metadata !25, i32 107, i64 32, i64 32, i64 672, i32 0, metadata !33} ; [ DW_TAG_member ]
!91 = metadata !{i32 31, i32 0, metadata !92, metadata !96}
!92 = metadata !{i32 458763, metadata !93, i32 30, i32 0} ; [ DW_TAG_lexical_block ]
!93 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__stat64_to_stat", metadata !"__stat64_to_stat", metadata !"__stat64_to_stat", metadata !3, i32 30, metadata !94, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!94 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, null} ; [ DW_TAG_subroutine_type ]
!95 = metadata !{null, metadata !20, metadata !68}
!96 = metadata !{i32 104, i32 0, metadata !64, null}
!97 = metadata !{i32 32, i32 0, metadata !92, metadata !96}
!98 = metadata !{i32 33, i32 0, metadata !92, metadata !96}
!99 = metadata !{i32 34, i32 0, metadata !92, metadata !96}
!100 = metadata !{i32 35, i32 0, metadata !92, metadata !96}
!101 = metadata !{i32 36, i32 0, metadata !92, metadata !96}
!102 = metadata !{i32 37, i32 0, metadata !92, metadata !96}
!103 = metadata !{i32 38, i32 0, metadata !92, metadata !96}
!104 = metadata !{i32 39, i32 0, metadata !92, metadata !96}
!105 = metadata !{i32 40, i32 0, metadata !92, metadata !96}
!106 = metadata !{i32 41, i32 0, metadata !92, metadata !96}
!107 = metadata !{i32 42, i32 0, metadata !92, metadata !96}
!108 = metadata !{i32 43, i32 0, metadata !92, metadata !96}
!109 = metadata !{i32 105, i32 0, metadata !64, null}
!110 = metadata !{i32 96, i32 0, metadata !111, null}
!111 = metadata !{i32 458763, metadata !112, i32 94, i32 0} ; [ DW_TAG_lexical_block ]
!112 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__fxstat", metadata !"__fxstat", metadata !"__fxstat", metadata !3, i32 94, metadata !113, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!113 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !114, i32 0, null} ; [ DW_TAG_subroutine_type ]
!114 = metadata !{metadata !6, metadata !6, metadata !6, metadata !68}
!115 = metadata !{i32 31, i32 0, metadata !92, metadata !116}
!116 = metadata !{i32 97, i32 0, metadata !111, null}
!117 = metadata !{i32 32, i32 0, metadata !92, metadata !116}
!118 = metadata !{i32 33, i32 0, metadata !92, metadata !116}
!119 = metadata !{i32 34, i32 0, metadata !92, metadata !116}
!120 = metadata !{i32 35, i32 0, metadata !92, metadata !116}
!121 = metadata !{i32 36, i32 0, metadata !92, metadata !116}
!122 = metadata !{i32 37, i32 0, metadata !92, metadata !116}
!123 = metadata !{i32 38, i32 0, metadata !92, metadata !116}
!124 = metadata !{i32 39, i32 0, metadata !92, metadata !116}
!125 = metadata !{i32 40, i32 0, metadata !92, metadata !116}
!126 = metadata !{i32 41, i32 0, metadata !92, metadata !116}
!127 = metadata !{i32 42, i32 0, metadata !92, metadata !116}
!128 = metadata !{i32 43, i32 0, metadata !92, metadata !116}
!129 = metadata !{i32 98, i32 0, metadata !111, null}
!130 = metadata !{i32 190, i32 0, metadata !131, null}
!131 = metadata !{i32 458763, metadata !132, i32 189, i32 0} ; [ DW_TAG_lexical_block ]
!132 = metadata !{i32 458798, i32 0, metadata !3, metadata !"lstat64", metadata !"lstat64", metadata !"lstat64", metadata !3, i32 189, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!133 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !134, i32 0, null} ; [ DW_TAG_subroutine_type ]
!134 = metadata !{metadata !6, metadata !7, metadata !20}
!135 = metadata !{i32 89, i32 0, metadata !136, null}
!136 = metadata !{i32 458763, metadata !137, i32 87, i32 0} ; [ DW_TAG_lexical_block ]
!137 = metadata !{i32 458798, i32 0, metadata !3, metadata !"lstat", metadata !"lstat", metadata !"lstat", metadata !3, i32 87, metadata !138, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!138 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !139, i32 0, null} ; [ DW_TAG_subroutine_type ]
!139 = metadata !{metadata !6, metadata !7, metadata !68}
!140 = metadata !{i32 31, i32 0, metadata !92, metadata !141}
!141 = metadata !{i32 90, i32 0, metadata !136, null}
!142 = metadata !{i32 32, i32 0, metadata !92, metadata !141}
!143 = metadata !{i32 33, i32 0, metadata !92, metadata !141}
!144 = metadata !{i32 34, i32 0, metadata !92, metadata !141}
!145 = metadata !{i32 35, i32 0, metadata !92, metadata !141}
!146 = metadata !{i32 36, i32 0, metadata !92, metadata !141}
!147 = metadata !{i32 37, i32 0, metadata !92, metadata !141}
!148 = metadata !{i32 38, i32 0, metadata !92, metadata !141}
!149 = metadata !{i32 39, i32 0, metadata !92, metadata !141}
!150 = metadata !{i32 40, i32 0, metadata !92, metadata !141}
!151 = metadata !{i32 41, i32 0, metadata !92, metadata !141}
!152 = metadata !{i32 42, i32 0, metadata !92, metadata !141}
!153 = metadata !{i32 43, i32 0, metadata !92, metadata !141}
!154 = metadata !{i32 91, i32 0, metadata !136, null}
!155 = metadata !{i32 82, i32 0, metadata !156, null}
!156 = metadata !{i32 458763, metadata !157, i32 80, i32 0} ; [ DW_TAG_lexical_block ]
!157 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__lxstat", metadata !"__lxstat", metadata !"__lxstat", metadata !3, i32 80, metadata !158, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!158 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !159, i32 0, null} ; [ DW_TAG_subroutine_type ]
!159 = metadata !{metadata !6, metadata !6, metadata !7, metadata !68}
!160 = metadata !{i32 31, i32 0, metadata !92, metadata !161}
!161 = metadata !{i32 83, i32 0, metadata !156, null}
!162 = metadata !{i32 32, i32 0, metadata !92, metadata !161}
!163 = metadata !{i32 33, i32 0, metadata !92, metadata !161}
!164 = metadata !{i32 34, i32 0, metadata !92, metadata !161}
!165 = metadata !{i32 35, i32 0, metadata !92, metadata !161}
!166 = metadata !{i32 36, i32 0, metadata !92, metadata !161}
!167 = metadata !{i32 37, i32 0, metadata !92, metadata !161}
!168 = metadata !{i32 38, i32 0, metadata !92, metadata !161}
!169 = metadata !{i32 39, i32 0, metadata !92, metadata !161}
!170 = metadata !{i32 40, i32 0, metadata !92, metadata !161}
!171 = metadata !{i32 41, i32 0, metadata !92, metadata !161}
!172 = metadata !{i32 42, i32 0, metadata !92, metadata !161}
!173 = metadata !{i32 43, i32 0, metadata !92, metadata !161}
!174 = metadata !{i32 84, i32 0, metadata !156, null}
!175 = metadata !{i32 185, i32 0, metadata !176, null}
!176 = metadata !{i32 458763, metadata !177, i32 184, i32 0} ; [ DW_TAG_lexical_block ]
!177 = metadata !{i32 458798, i32 0, metadata !3, metadata !"stat64", metadata !"stat64", metadata !"stat64", metadata !3, i32 184, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!178 = metadata !{i32 75, i32 0, metadata !179, null}
!179 = metadata !{i32 458763, metadata !180, i32 73, i32 0} ; [ DW_TAG_lexical_block ]
!180 = metadata !{i32 458798, i32 0, metadata !3, metadata !"stat", metadata !"stat", metadata !"stat", metadata !3, i32 73, metadata !138, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!181 = metadata !{i32 31, i32 0, metadata !92, metadata !182}
!182 = metadata !{i32 76, i32 0, metadata !179, null}
!183 = metadata !{i32 32, i32 0, metadata !92, metadata !182}
!184 = metadata !{i32 33, i32 0, metadata !92, metadata !182}
!185 = metadata !{i32 34, i32 0, metadata !92, metadata !182}
!186 = metadata !{i32 35, i32 0, metadata !92, metadata !182}
!187 = metadata !{i32 36, i32 0, metadata !92, metadata !182}
!188 = metadata !{i32 37, i32 0, metadata !92, metadata !182}
!189 = metadata !{i32 38, i32 0, metadata !92, metadata !182}
!190 = metadata !{i32 39, i32 0, metadata !92, metadata !182}
!191 = metadata !{i32 40, i32 0, metadata !92, metadata !182}
!192 = metadata !{i32 41, i32 0, metadata !92, metadata !182}
!193 = metadata !{i32 42, i32 0, metadata !92, metadata !182}
!194 = metadata !{i32 43, i32 0, metadata !92, metadata !182}
!195 = metadata !{i32 77, i32 0, metadata !179, null}
!196 = metadata !{i32 68, i32 0, metadata !197, null}
!197 = metadata !{i32 458763, metadata !198, i32 66, i32 0} ; [ DW_TAG_lexical_block ]
!198 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__xstat", metadata !"__xstat", metadata !"__xstat", metadata !3, i32 66, metadata !158, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!199 = metadata !{i32 31, i32 0, metadata !92, metadata !200}
!200 = metadata !{i32 69, i32 0, metadata !197, null}
!201 = metadata !{i32 32, i32 0, metadata !92, metadata !200}
!202 = metadata !{i32 33, i32 0, metadata !92, metadata !200}
!203 = metadata !{i32 34, i32 0, metadata !92, metadata !200}
!204 = metadata !{i32 35, i32 0, metadata !92, metadata !200}
!205 = metadata !{i32 36, i32 0, metadata !92, metadata !200}
!206 = metadata !{i32 37, i32 0, metadata !92, metadata !200}
!207 = metadata !{i32 38, i32 0, metadata !92, metadata !200}
!208 = metadata !{i32 39, i32 0, metadata !92, metadata !200}
!209 = metadata !{i32 40, i32 0, metadata !92, metadata !200}
!210 = metadata !{i32 41, i32 0, metadata !92, metadata !200}
!211 = metadata !{i32 42, i32 0, metadata !92, metadata !200}
!212 = metadata !{i32 43, i32 0, metadata !92, metadata !200}
!213 = metadata !{i32 70, i32 0, metadata !197, null}
!214 = metadata !{i32 180, i32 0, metadata !215, null}
!215 = metadata !{i32 458763, metadata !216, i32 179, i32 0} ; [ DW_TAG_lexical_block ]
!216 = metadata !{i32 458798, i32 0, metadata !3, metadata !"lseek64", metadata !"lseek64", metadata !"lseek64", metadata !3, i32 179, metadata !217, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!217 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !218, i32 0, null} ; [ DW_TAG_subroutine_type ]
!218 = metadata !{metadata !219, metadata !6, metadata !219, metadata !6}
!219 = metadata !{i32 458774, metadata !3, metadata !"off64_t", metadata !220, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !46} ; [ DW_TAG_typedef ]
!220 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!221 = metadata !{i32 63, i32 0, metadata !222, null}
!222 = metadata !{i32 458763, metadata !223, i32 62, i32 0} ; [ DW_TAG_lexical_block ]
!223 = metadata !{i32 458798, i32 0, metadata !3, metadata !"lseek", metadata !"lseek", metadata !"lseek", metadata !3, i32 62, metadata !224, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!224 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !225, i32 0, null} ; [ DW_TAG_subroutine_type ]
!225 = metadata !{metadata !226, metadata !6, metadata !226, metadata !6}
!226 = metadata !{i32 458774, metadata !3, metadata !"off_t", metadata !220, i32 95, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_typedef ]
!227 = metadata !{i32 167, i32 0, metadata !228, null}
!228 = metadata !{i32 458763, metadata !229, i32 164, i32 0} ; [ DW_TAG_lexical_block ]
!229 = metadata !{i32 458798, i32 0, metadata !3, metadata !"open64", metadata !"open64", metadata !"open64", metadata !3, i32 164, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!230 = metadata !{i32 170, i32 0, metadata !231, null}
!231 = metadata !{i32 458763, metadata !228, i32 167, i32 0} ; [ DW_TAG_lexical_block ]
!232 = metadata !{i32 171, i32 0, metadata !231, null}
!233 = metadata !{i32 172, i32 0, metadata !231, null}
!234 = metadata !{i32 175, i32 0, metadata !228, null}
!235 = metadata !{i32 138, i32 0, metadata !236, null}
!236 = metadata !{i32 458763, metadata !237, i32 137, i32 0} ; [ DW_TAG_lexical_block ]
!237 = metadata !{i32 458798, i32 0, metadata !3, metadata !"getdents", metadata !"getdents", metadata !"getdents", metadata !3, i32 137, metadata !238, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!238 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !239, i32 0, null} ; [ DW_TAG_subroutine_type ]
!239 = metadata !{metadata !240, metadata !6, metadata !241, metadata !254}
!240 = metadata !{i32 458774, metadata !3, metadata !"ssize_t", metadata !220, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!241 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !242} ; [ DW_TAG_pointer_type ]
!242 = metadata !{i32 458771, metadata !3, metadata !"dirent", metadata !243, i32 24, i64 2144, i64 32, i64 0, i32 0, null, metadata !244, i32 0, null} ; [ DW_TAG_structure_type ]
!243 = metadata !{i32 458769, i32 0, i32 1, metadata !"dirent.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!244 = metadata !{metadata !245, metadata !246, metadata !247, metadata !248, metadata !250}
!245 = metadata !{i32 458765, metadata !242, metadata !"d_ino", metadata !243, i32 26, i64 32, i64 32, i64 0, i32 0, metadata !32} ; [ DW_TAG_member ]
!246 = metadata !{i32 458765, metadata !242, metadata !"d_off", metadata !243, i32 27, i64 32, i64 32, i64 32, i32 0, metadata !82} ; [ DW_TAG_member ]
!247 = metadata !{i32 458765, metadata !242, metadata !"d_reclen", metadata !243, i32 32, i64 16, i64 16, i64 64, i32 0, metadata !73} ; [ DW_TAG_member ]
!248 = metadata !{i32 458765, metadata !242, metadata !"d_type", metadata !243, i32 33, i64 8, i64 8, i64 80, i32 0, metadata !249} ; [ DW_TAG_member ]
!249 = metadata !{i32 458788, metadata !3, metadata !"unsigned char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ]
!250 = metadata !{i32 458765, metadata !242, metadata !"d_name", metadata !243, i32 34, i64 2048, i64 8, i64 88, i32 0, metadata !251} ; [ DW_TAG_member ]
!251 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 2048, i64 8, i64 0, i32 0, metadata !9, metadata !252, i32 0, null} ; [ DW_TAG_array_type ]
!252 = metadata !{metadata !253}
!253 = metadata !{i32 458785, i64 0, i64 255}     ; [ DW_TAG_subrange_type ]
!254 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !220, i32 151, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_typedef ]
!255 = metadata !{i32 139, i32 0, metadata !236, null}
!256 = metadata !{i32 141, i32 0, metadata !236, null}
!257 = metadata !{i32 142, i32 0, metadata !258, null}
!258 = metadata !{i32 458763, metadata !236, i32 141, i32 0} ; [ DW_TAG_lexical_block ]
!259 = metadata !{i32 143, i32 0, metadata !258, null}
!260 = metadata !{i32 144, i32 0, metadata !261, null}
!261 = metadata !{i32 458763, metadata !258, i32 142, i32 0} ; [ DW_TAG_lexical_block ]
!262 = metadata !{i32 146, i32 0, metadata !261, null}
!263 = metadata !{i32 147, i32 0, metadata !261, null}
!264 = metadata !{i32 148, i32 0, metadata !261, null}
!265 = metadata !{i32 149, i32 0, metadata !261, null}
!266 = metadata !{i32 150, i32 0, metadata !261, null}
!267 = metadata !{i32 151, i32 0, metadata !261, null}
!268 = metadata !{i32 152, i32 0, metadata !261, null}
!269 = metadata !{i32 156, i32 0, metadata !236, null}
!270 = metadata !{i32 131, i32 0, metadata !271, null}
!271 = metadata !{i32 458763, metadata !272, i32 112, i32 0} ; [ DW_TAG_lexical_block ]
!272 = metadata !{i32 458798, i32 0, metadata !3, metadata !"statfs", metadata !"statfs", metadata !"statfs", metadata !3, i32 112, metadata !273, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!273 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !274, i32 0, null} ; [ DW_TAG_subroutine_type ]
!274 = metadata !{metadata !6, metadata !7, metadata !275}
!275 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !276} ; [ DW_TAG_pointer_type ]
!276 = metadata !{i32 458771, metadata !3, metadata !"statfs", metadata !277, i32 26, i64 512, i64 32, i64 0, i32 0, null, metadata !278, i32 0, null} ; [ DW_TAG_structure_type ]
!277 = metadata !{i32 458769, i32 0, i32 1, metadata !"statfs.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!278 = metadata !{metadata !279, metadata !280, metadata !281, metadata !283, metadata !284, metadata !285, metadata !287, metadata !288, metadata !296, metadata !297, metadata !298}
!279 = metadata !{i32 458765, metadata !276, metadata !"f_type", metadata !277, i32 27, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!280 = metadata !{i32 458765, metadata !276, metadata !"f_bsize", metadata !277, i32 28, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!281 = metadata !{i32 458765, metadata !276, metadata !"f_blocks", metadata !277, i32 30, i64 32, i64 32, i64 64, i32 0, metadata !282} ; [ DW_TAG_member ]
!282 = metadata !{i32 458774, metadata !3, metadata !"__fsblkcnt_t", metadata !27, i32 174, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!283 = metadata !{i32 458765, metadata !276, metadata !"f_bfree", metadata !277, i32 31, i64 32, i64 32, i64 96, i32 0, metadata !282} ; [ DW_TAG_member ]
!284 = metadata !{i32 458765, metadata !276, metadata !"f_bavail", metadata !277, i32 32, i64 32, i64 32, i64 128, i32 0, metadata !282} ; [ DW_TAG_member ]
!285 = metadata !{i32 458765, metadata !276, metadata !"f_files", metadata !277, i32 33, i64 32, i64 32, i64 160, i32 0, metadata !286} ; [ DW_TAG_member ]
!286 = metadata !{i32 458774, metadata !3, metadata !"__fsfilcnt_t", metadata !27, i32 178, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ]
!287 = metadata !{i32 458765, metadata !276, metadata !"f_ffree", metadata !277, i32 34, i64 32, i64 32, i64 192, i32 0, metadata !286} ; [ DW_TAG_member ]
!288 = metadata !{i32 458765, metadata !276, metadata !"f_fsid", metadata !277, i32 42, i64 64, i64 32, i64 224, i32 0, metadata !289} ; [ DW_TAG_member ]
!289 = metadata !{i32 458774, metadata !3, metadata !"__fsid_t", metadata !27, i32 145, i64 0, i64 0, i64 0, i32 0, metadata !290} ; [ DW_TAG_typedef ]
!290 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 144, i64 64, i64 32, i64 0, i32 0, null, metadata !291, i32 0, null} ; [ DW_TAG_structure_type ]
!291 = metadata !{metadata !292}
!292 = metadata !{i32 458765, metadata !290, metadata !"__val", metadata !27, i32 144, i64 64, i64 32, i64 0, i32 0, metadata !293} ; [ DW_TAG_member ]
!293 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !6, metadata !294, i32 0, null} ; [ DW_TAG_array_type ]
!294 = metadata !{metadata !295}
!295 = metadata !{i32 458785, i64 0, i64 1}       ; [ DW_TAG_subrange_type ]
!296 = metadata !{i32 458765, metadata !276, metadata !"f_namelen", metadata !277, i32 43, i64 32, i64 32, i64 288, i32 0, metadata !6} ; [ DW_TAG_member ]
!297 = metadata !{i32 458765, metadata !276, metadata !"f_frsize", metadata !277, i32 44, i64 32, i64 32, i64 320, i32 0, metadata !6} ; [ DW_TAG_member ]
!298 = metadata !{i32 458765, metadata !276, metadata !"f_spare", metadata !277, i32 45, i64 160, i64 32, i64 352, i32 0, metadata !299} ; [ DW_TAG_member ]
!299 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 160, i64 32, i64 0, i32 0, metadata !6, metadata !300, i32 0, null} ; [ DW_TAG_array_type ]
!300 = metadata !{metadata !301}
!301 = metadata !{i32 458785, i64 0, i64 4}       ; [ DW_TAG_subrange_type ]
!302 = metadata !{i32 109, i32 0, metadata !303, null}
!303 = metadata !{i32 458763, metadata !304, i32 108, i32 0} ; [ DW_TAG_lexical_block ]
!304 = metadata !{i32 458798, i32 0, metadata !3, metadata !"ftruncate", metadata !"ftruncate", metadata !"ftruncate", metadata !3, i32 108, metadata !305, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!305 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !306, i32 0, null} ; [ DW_TAG_subroutine_type ]
!306 = metadata !{metadata !6, metadata !6, metadata !226}
