; ModuleID = 'stubs.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%0 = type { [29 x i32] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i32, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i32, i32, [40 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.__sigset_t = type { [32 x i32] }
%struct.anon = type { i32, i32 }
%struct.exit_status = type { i16, i16 }
%struct.rlimit64 = type { i64, i64 }
%struct.rusage = type { %struct.anon, %struct.anon, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.sigaction = type { %union.anon, %struct.__sigset_t, i32, void ()* }
%struct.siginfo_t = type { i32, i32, i32, %0 }
%struct.tms = type { i32, i32, i32, i32 }
%struct.utmp = type { i16, i32, [32 x i8], [4 x i8], [32 x i8], [256 x i8], %struct.exit_status, i32, %struct.anon, [4 x i32], [20 x i8] }
%struct.utmpx = type opaque
%union.anon = type { void (i32)* }

@.str = private constant [32 x i8] c"silently ignoring (returning 0)\00", align 4 ; <[32 x i8]*> [#uses=1]
@.str1 = private constant [21 x i8] c"ignoring (-1 result)\00", align 1 ; <[21 x i8]*> [#uses=1]
@.str2 = private constant [17 x i8] c"ignoring (EPERM)\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str3 = private constant [18 x i8] c"ignoring (ECHILD)\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str4 = private constant [17 x i8] c"ignoring (EBADF)\00", align 1 ; <[17 x i8]*> [#uses=1]
@.str5 = private constant [18 x i8] c"ignoring (ENFILE)\00", align 1 ; <[18 x i8]*> [#uses=1]
@.str6 = private constant [15 x i8] c"ignoring (EIO)\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str7 = private constant [24 x i8] c"ignoring (EAFNOSUPPORT)\00", align 1 ; <[24 x i8]*> [#uses=1]
@.str8 = private constant [18 x i8] c"silently ignoring\00", align 1 ; <[18 x i8]*> [#uses=1]

define weak i32 @__syscall_rt_sigaction(i32 %signum, %struct.sigaction* %act, %struct.sigaction* %oldact, i32 %_something) nounwind {
entry:
  tail call void @klee_warning_once(i8* getelementptr inbounds ([18 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !0
  ret i32 0, !dbg !104
}

define weak i32 @sigaction(i32 %signum, %struct.sigaction* %act, %struct.sigaction* %oldact) nounwind {
entry:
  tail call void @klee_warning_once(i8* getelementptr inbounds ([18 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !105
  ret i32 0, !dbg !110
}

define weak i32 @sigprocmask(i32 %how, %struct.__sigset_t* %set, %struct.__sigset_t* %oldset) nounwind {
entry:
  tail call void @klee_warning_once(i8* getelementptr inbounds ([18 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !111
  ret i32 0, !dbg !118
}

define weak i32 @fdatasync(i32 %fd) nounwind {
entry:
  ret i32 0, !dbg !119
}

define weak void @sync() nounwind {
entry:
  ret void, !dbg !124
}

define weak i32 @__socketcall(i32 %type, i32* %args) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([24 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !127
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !133 ; <i32*> [#uses=1]
  store i32 97, i32* %0, align 4, !dbg !133
  ret i32 -1, !dbg !134
}

define weak i32 @_IO_getc(%struct._IO_FILE* %f) nounwind {
entry:
  %0 = tail call i32 @__fgetc_unlocked(%struct._IO_FILE* %f) nounwind, !dbg !135 ; <i32> [#uses=1]
  ret i32 %0, !dbg !135
}

define weak i32 @_IO_putc(i32 %c, %struct._IO_FILE* %f) nounwind {
entry:
  %0 = tail call i32 @__fputc_unlocked(i32 %c, %struct._IO_FILE* %f) nounwind, !dbg !195 ; <i32> [#uses=1]
  ret i32 %0, !dbg !195
}

define weak i32 @mkdir(i8* %pathname, i32 %mode) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([15 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !200
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !209 ; <i32*> [#uses=1]
  store i32 5, i32* %0, align 4, !dbg !209
  ret i32 -1, !dbg !210
}

define weak i32 @mkfifo(i8* %pathname, i32 %mode) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([15 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !211
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !214 ; <i32*> [#uses=1]
  store i32 5, i32* %0, align 4, !dbg !214
  ret i32 -1, !dbg !215
}

define weak i32 @mknod(i8* %pathname, i32 %mode, i64 %dev) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([15 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !216
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !223 ; <i32*> [#uses=1]
  store i32 5, i32* %0, align 4, !dbg !223
  ret i32 -1, !dbg !224
}

define weak i32 @pipe(i32* %filedes) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0)) nounwind, !dbg !225
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !230 ; <i32*> [#uses=1]
  store i32 23, i32* %0, align 4, !dbg !230
  ret i32 -1, !dbg !231
}

define weak i32 @link(i8* %oldpath, i8* %newpath) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !232
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !237 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !237
  ret i32 -1, !dbg !238
}

define weak i32 @symlink(i8* %oldpath, i8* %newpath) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !239
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !242 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !242
  ret i32 -1, !dbg !243
}

define weak i32 @rename(i8* %oldpath, i8* %newpath) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !244
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !247 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !247
  ret i32 -1, !dbg !248
}

define weak i32 @nanosleep(%struct.anon* %req, %struct.anon* %rem) nounwind {
entry:
  ret i32 0, !dbg !249
}

define weak i32 @clock_gettime(i32 %clk_id, %struct.anon* %res) nounwind {
entry:
  %tv = alloca %struct.anon, align 8              ; <%struct.anon*> [#uses=3]
  %0 = call i32 @gettimeofday(%struct.anon* noalias %tv, %struct.anon* noalias null) nounwind, !dbg !263 ; <i32> [#uses=0]
  %1 = getelementptr inbounds %struct.anon* %tv, i32 0, i32 0, !dbg !269 ; <i32*> [#uses=1]
  %2 = load i32* %1, align 8, !dbg !269           ; <i32> [#uses=1]
  %3 = getelementptr inbounds %struct.anon* %res, i32 0, i32 0, !dbg !269 ; <i32*> [#uses=1]
  store i32 %2, i32* %3, align 4, !dbg !269
  %4 = getelementptr inbounds %struct.anon* %tv, i32 0, i32 1, !dbg !270 ; <i32*> [#uses=1]
  %5 = load i32* %4, align 4, !dbg !270           ; <i32> [#uses=1]
  %6 = mul nsw i32 %5, 1000, !dbg !270            ; <i32> [#uses=1]
  %7 = getelementptr inbounds %struct.anon* %res, i32 0, i32 1, !dbg !270 ; <i32*> [#uses=1]
  store i32 %6, i32* %7, align 4, !dbg !270
  ret i32 0, !dbg !271
}

define weak i32 @clock_settime(i32 %clk_id, %struct.anon* %res) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !272
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !277 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !277
  ret i32 -1, !dbg !278
}

define i32 @time(i32* %t) nounwind {
entry:
  %tv = alloca %struct.anon, align 8              ; <%struct.anon*> [#uses=2]
  %0 = call i32 @gettimeofday(%struct.anon* noalias %tv, %struct.anon* noalias null) nounwind, !dbg !279 ; <i32> [#uses=0]
  %1 = icmp eq i32* %t, null, !dbg !286           ; <i1> [#uses=1]
  %.phi.trans.insert = getelementptr inbounds %struct.anon* %tv, i32 0, i32 0 ; <i32*> [#uses=1]
  %.pre = load i32* %.phi.trans.insert, align 8   ; <i32> [#uses=3]
  br i1 %1, label %entry.bb1_crit_edge, label %bb, !dbg !286

entry.bb1_crit_edge:                              ; preds = %entry
  ret i32 %.pre, !dbg !287

bb:                                               ; preds = %entry
  store i32 %.pre, i32* %t, align 4, !dbg !288
  ret i32 %.pre, !dbg !287
}

define weak i32 @gnu_dev_major(i64 %__dev) nounwind {
entry:
  %0 = lshr i64 %__dev, 8, !dbg !289              ; <i64> [#uses=1]
  %1 = trunc i64 %0 to i32, !dbg !289             ; <i32> [#uses=1]
  %2 = and i32 %1, 4095, !dbg !289                ; <i32> [#uses=1]
  %3 = lshr i64 %__dev, 32, !dbg !289             ; <i64> [#uses=1]
  %4 = trunc i64 %3 to i32, !dbg !289             ; <i32> [#uses=1]
  %5 = and i32 %4, -4096, !dbg !289               ; <i32> [#uses=1]
  %6 = or i32 %2, %5, !dbg !289                   ; <i32> [#uses=1]
  ret i32 %6, !dbg !289
}

define weak i32 @gnu_dev_minor(i64 %__dev) nounwind {
entry:
  %0 = trunc i64 %__dev to i32, !dbg !294         ; <i32> [#uses=1]
  %1 = and i32 %0, 255, !dbg !294                 ; <i32> [#uses=1]
  %2 = lshr i64 %__dev, 12, !dbg !294             ; <i64> [#uses=1]
  %3 = trunc i64 %2 to i32, !dbg !294             ; <i32> [#uses=1]
  %4 = and i32 %3, -256, !dbg !294                ; <i32> [#uses=1]
  %5 = or i32 %4, %1, !dbg !294                   ; <i32> [#uses=1]
  ret i32 %5, !dbg !294
}

define weak i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind {
entry:
  %0 = and i32 %__minor, 255, !dbg !297           ; <i32> [#uses=1]
  %1 = shl i32 %__major, 8                        ; <i32> [#uses=1]
  %2 = and i32 %1, 1048320                        ; <i32> [#uses=1]
  %3 = or i32 %0, %2, !dbg !297                   ; <i32> [#uses=1]
  %4 = zext i32 %3 to i64, !dbg !297              ; <i64> [#uses=1]
  %5 = zext i32 %__minor to i64, !dbg !297        ; <i64> [#uses=1]
  %6 = shl i64 %5, 12                             ; <i64> [#uses=1]
  %7 = and i64 %6, 17592184995840                 ; <i64> [#uses=1]
  %8 = zext i32 %__major to i64, !dbg !297        ; <i64> [#uses=1]
  %9 = shl i64 %8, 32                             ; <i64> [#uses=1]
  %10 = and i64 %9, -17592186044416               ; <i64> [#uses=1]
  %11 = or i64 %7, %10, !dbg !297                 ; <i64> [#uses=1]
  %12 = or i64 %11, %4, !dbg !297                 ; <i64> [#uses=1]
  ret i64 %12, !dbg !297
}

define i32 @times(%struct.tms* nocapture %buf) nounwind {
entry:
  %0 = getelementptr inbounds %struct.tms* %buf, i32 0, i32 0, !dbg !302 ; <i32*> [#uses=1]
  store i32 0, i32* %0, align 4, !dbg !302
  %1 = getelementptr inbounds %struct.tms* %buf, i32 0, i32 1, !dbg !316 ; <i32*> [#uses=1]
  store i32 0, i32* %1, align 4, !dbg !316
  %2 = getelementptr inbounds %struct.tms* %buf, i32 0, i32 2, !dbg !317 ; <i32*> [#uses=1]
  store i32 0, i32* %2, align 4, !dbg !317
  %3 = getelementptr inbounds %struct.tms* %buf, i32 0, i32 3, !dbg !318 ; <i32*> [#uses=1]
  store i32 0, i32* %3, align 4, !dbg !318
  ret i32 0, !dbg !319
}

define weak i32 @setuid(i32 %uid) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !320
  ret i32 0, !dbg !326
}

declare void @klee_warning(i8*)

define weak i32 @setgid(i32 %gid) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([32 x i8]* @.str, i32 0, i32 0)) nounwind, !dbg !327
  ret i32 0, !dbg !333
}

define weak i32 @getloadavg(double* %loadavg, i32 %nelem) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !334
  ret i32 -1, !dbg !341
}

define weak i32 @munmap(i8* %start, i32 %length) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !342
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !347 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !347
  ret i32 -1, !dbg !348
}

declare i32* @__errno_location() nounwind readnone

define weak i8* @mmap64(i8* %start, i32 %length, i32 %prot, i32 %flags, i32 %fd, i64 %offset) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !349
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !355 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !355
  ret i8* inttoptr (i64 4294967295 to i8*), !dbg !356
}

define weak i8* @mmap(i8* %start, i32 %length, i32 %prot, i32 %flags, i32 %fd, i32 %offset) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !357
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !363 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !363
  ret i8* inttoptr (i64 4294967295 to i8*), !dbg !364
}

define weak i32 @readahead(i32 %fd, i64* %offset, i32 %count) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !365
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !372 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !372
  ret i32 -1, !dbg !373
}

define weak i32 @pause() nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !374
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !379 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !379
  ret i32 -1, !dbg !380
}

define weak i32 @munlock(i8* %addr, i32 %len) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !381
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !384 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !384
  ret i32 -1, !dbg !385
}

define weak i32 @mlock(i8* %addr, i32 %len) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !386
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !389 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !389
  ret i32 -1, !dbg !390
}

define weak i32 @reboot(i32 %flag) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !391
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !394 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !394
  ret i32 -1, !dbg !395
}

define weak i32 @settimeofday(%struct.anon* %tv, %struct.anon* %tz) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !396
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !416 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !416
  ret i32 -1, !dbg !417
}

define weak i32 @setsid() nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !418
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !424 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !424
  ret i32 -1, !dbg !425
}

define weak i32 @setrlimit64(i32 %resource, %struct.rlimit64* %rlim) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !426
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !461 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !461
  ret i32 -1, !dbg !462
}

define weak i32 @setrlimit(i32 %resource, %struct.anon* %rlim) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !463
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !475 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !475
  ret i32 -1, !dbg !476
}

define weak i32 @setresuid(i32 %ruid, i32 %euid, i32 %suid) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !477
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !482 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !482
  ret i32 -1, !dbg !483
}

define weak i32 @setresgid(i32 %rgid, i32 %egid, i32 %sgid) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !484
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !489 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !489
  ret i32 -1, !dbg !490
}

define weak i32 @setpriority(i32 %which, i32 %who, i32 %prio) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !491
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !504 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !504
  ret i32 -1, !dbg !505
}

define weak i32 @setpgrp() nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !506
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !509 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !509
  ret i32 -1, !dbg !510
}

define weak i32 @setpgid(i32 %pid, i32 %pgid) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !511
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !516 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !516
  ret i32 -1, !dbg !517
}

define weak i32 @sethostname(i8* %name, i32 %len) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !518
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !523 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !523
  ret i32 -1, !dbg !524
}

define weak i32 @setgroups(i32 %size, i32* %list) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !525
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !531 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !531
  ret i32 -1, !dbg !532
}

define weak i32 @swapoff(i8* %path) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !533
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !538 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !538
  ret i32 -1, !dbg !539
}

define weak i32 @swapon(i8* %path, i32 %swapflags) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !540
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !545 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !545
  ret i32 -1, !dbg !546
}

define weak i32 @umount2(i8* %target, i32 %flags) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !547
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !550 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !550
  ret i32 -1, !dbg !551
}

define weak i32 @umount(i8* %target) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !552
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !555 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !555
  ret i32 -1, !dbg !556
}

define weak i32 @mount(i8* %source, i8* %target, i8* %filesystemtype, i32 %mountflags, i8* %data) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !557
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !562 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !562
  ret i32 -1, !dbg !563
}

define weak i32 @waitid(i32 %idtype, i32 %id, %struct.siginfo_t* %infop, i32 %options) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !564
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !575 ; <i32*> [#uses=1]
  store i32 10, i32* %0, align 4, !dbg !575
  ret i32 -1, !dbg !576
}

define weak i32 @waitpid(i32 %pid, i32* %status, i32 %options) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !577
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !582 ; <i32*> [#uses=1]
  store i32 10, i32* %0, align 4, !dbg !582
  ret i32 -1, !dbg !583
}

define weak i32 @wait4(i32 %pid, i32* %status, i32 %options, %struct.rusage* %rusage) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !584
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !608 ; <i32*> [#uses=1]
  store i32 10, i32* %0, align 4, !dbg !608
  ret i32 -1, !dbg !609
}

define weak i32 @wait3(i32* %status, i32 %options, %struct.rusage* %rusage) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !610
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !615 ; <i32*> [#uses=1]
  store i32 10, i32* %0, align 4, !dbg !615
  ret i32 -1, !dbg !616
}

define weak i32 @wait(i32* %status) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0)) nounwind, !dbg !617
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !622 ; <i32*> [#uses=1]
  store i32 10, i32* %0, align 4, !dbg !622
  ret i32 -1, !dbg !623
}

define weak i32 @futimes(i32 %fd, %struct.anon* %times) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str4, i32 0, i32 0)) nounwind, !dbg !624
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !629 ; <i32*> [#uses=1]
  store i32 9, i32* %0, align 4, !dbg !629
  ret i32 -1, !dbg !630
}

define weak i32 @utimes(i8* %filename, %struct.anon* %times) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !631
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !636 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !636
  ret i32 -1, !dbg !637
}

define weak i32 @utime(i8* %filename, %struct.anon* %buf) nounwind {
entry:
  tail call void @klee_warning(i8* getelementptr inbounds ([17 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !638
  %0 = tail call i32* @__errno_location() nounwind readnone, !dbg !650 ; <i32*> [#uses=1]
  store i32 1, i32* %0, align 4, !dbg !650
  ret i32 -1, !dbg !651
}

define weak i8* @canonicalize_file_name(i8* %name) nounwind {
entry:
  %0 = tail call noalias i8* @malloc(i32 4096) nounwind, !dbg !652 ; <i8*> [#uses=2]
  %1 = tail call i8* @realpath(i8* noalias %name, i8* noalias %0) nounwind, !dbg !657 ; <i8*> [#uses=3]
  %2 = icmp eq i8* %1, null, !dbg !658            ; <i1> [#uses=1]
  br i1 %2, label %bb, label %bb1, !dbg !658

bb:                                               ; preds = %entry
  tail call void @free(i8* %0) nounwind, !dbg !659
  ret i8* %1, !dbg !660

bb1:                                              ; preds = %entry
  ret i8* %1, !dbg !660
}

declare noalias i8* @malloc(i32) nounwind

declare i8* @realpath(i8* noalias nocapture, i8* noalias) nounwind

declare void @free(i8* nocapture) nounwind

define i32 @strverscmp(i8* nocapture %__s1, i8* nocapture %__s2) nounwind readonly {
entry:
  %0 = tail call i32 @strcmp(i8* %__s1, i8* %__s2) nounwind readonly, !dbg !661 ; <i32> [#uses=1]
  ret i32 %0, !dbg !665
}

declare i32 @strcmp(i8* nocapture, i8* nocapture) nounwind readonly

define weak i32 @group_member(i32 %__gid) nounwind {
entry:
  %0 = tail call i32 @getgid() nounwind, !dbg !666 ; <i32> [#uses=1]
  %1 = icmp eq i32 %0, %__gid, !dbg !666          ; <i1> [#uses=1]
  br i1 %1, label %bb3, label %bb, !dbg !666

bb:                                               ; preds = %entry
  %2 = tail call i32 @getegid() nounwind, !dbg !666 ; <i32> [#uses=1]
  %3 = icmp eq i32 %2, %__gid, !dbg !666          ; <i1> [#uses=1]
  %retval = zext i1 %3 to i32                     ; <i32> [#uses=1]
  ret i32 %retval

bb3:                                              ; preds = %entry
  ret i32 1, !dbg !666
}

declare i32 @getgid() nounwind

declare i32 @getegid() nounwind

define weak i32 @euidaccess(i8* %pathname, i32 %mode) nounwind {
entry:
  %0 = tail call i32 @access(i8* %pathname, i32 %mode) nounwind, !dbg !669 ; <i32> [#uses=1]
  ret i32 %0, !dbg !669
}

declare i32 @access(i8* nocapture, i32) nounwind

define weak i32 @eaccess(i8* %pathname, i32 %mode) nounwind {
entry:
  %0 = tail call i32 @euidaccess(i8* %pathname, i32 %mode) nounwind, !dbg !672 ; <i32> [#uses=1]
  ret i32 %0, !dbg !672
}

define weak i32 @utmpxname(i8* %file) nounwind {
entry:
  %0 = tail call i32 @utmpname(i8* %file) nounwind, !dbg !675 ; <i32> [#uses=0]
  ret i32 0, !dbg !678
}

declare i32 @utmpname(i8*) nounwind

define weak void @endutxent() nounwind {
entry:
  tail call void @endutent() nounwind, !dbg !679
  ret void, !dbg !682
}

declare void @endutent() nounwind

define weak void @setutxent() nounwind {
entry:
  tail call void @setutent() nounwind, !dbg !683
  ret void, !dbg !686
}

declare void @setutent() nounwind

define weak %struct.utmpx* @getutxent() nounwind {
entry:
  %0 = tail call %struct.utmp* @getutent() nounwind, !dbg !687 ; <%struct.utmp*> [#uses=1]
  %1 = bitcast %struct.utmp* %0 to %struct.utmpx*, !dbg !687 ; <%struct.utmpx*> [#uses=1]
  ret %struct.utmpx* %1, !dbg !687
}

declare %struct.utmp* @getutent() nounwind

declare i32 @gettimeofday(%struct.anon* noalias, %struct.anon* noalias) nounwind

declare i32 @__fputc_unlocked(i32, %struct._IO_FILE*)

declare i32 @__fgetc_unlocked(%struct._IO_FILE*)

declare void @klee_warning_once(i8*)

!0 = metadata !{i32 39, i32 0, metadata !1, null}
!1 = metadata !{i32 458763, metadata !2, i32 38, i32 0} ; [ DW_TAG_lexical_block ]
!2 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__syscall_rt_sigaction", metadata !"__syscall_rt_sigaction", metadata !"__syscall_rt_sigaction", metadata !3, i32 38, metadata !4, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"stubs.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !5, i32 0, null} ; [ DW_TAG_subroutine_type ]
!5 = metadata !{metadata !6, metadata !6, metadata !7, metadata !101, metadata !102}
!6 = metadata !{i32 458788, metadata !3, metadata !"int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!7 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_pointer_type ]
!8 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 1120, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ]
!9 = metadata !{i32 458771, metadata !3, metadata !"sigaction", metadata !10, i32 26, i64 1120, i64 32, i64 0, i32 0, null, metadata !11, i32 0, null} ; [ DW_TAG_structure_type ]
!10 = metadata !{i32 458769, i32 0, i32 1, metadata !"sigaction.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!11 = metadata !{metadata !12, metadata !86, metadata !96, metadata !97}
!12 = metadata !{i32 458765, metadata !9, metadata !"__sigaction_handler", metadata !10, i32 36, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ]
!13 = metadata !{i32 458775, metadata !3, metadata !"", metadata !10, i32 30, i64 32, i64 32, i64 0, i32 0, null, metadata !14, i32 0, null} ; [ DW_TAG_union_type ]
!14 = metadata !{metadata !15, metadata !21}
!15 = metadata !{i32 458765, metadata !13, metadata !"sa_handler", metadata !10, i32 32, i64 32, i64 32, i64 0, i32 0, metadata !16} ; [ DW_TAG_member ]
!16 = metadata !{i32 458774, metadata !3, metadata !"__sighandler_t", metadata !17, i32 211, i64 0, i64 0, i64 0, i32 0, metadata !18} ; [ DW_TAG_typedef ]
!17 = metadata !{i32 458769, i32 0, i32 1, metadata !"signal.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!18 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ]
!19 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !20, i32 0, null} ; [ DW_TAG_subroutine_type ]
!20 = metadata !{null, metadata !6}
!21 = metadata !{i32 458765, metadata !13, metadata !"sa_sigaction", metadata !10, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_member ]
!22 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !23} ; [ DW_TAG_pointer_type ]
!23 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !24, i32 0, null} ; [ DW_TAG_subroutine_type ]
!24 = metadata !{null, metadata !6, metadata !25, metadata !60}
!25 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !26} ; [ DW_TAG_pointer_type ]
!26 = metadata !{i32 458774, metadata !3, metadata !"siginfo_t", metadata !27, i32 130, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_typedef ]
!27 = metadata !{i32 458769, i32 0, i32 1, metadata !"siginfo.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!28 = metadata !{i32 458771, metadata !3, metadata !"siginfo", metadata !27, i32 52, i64 1024, i64 32, i64 0, i32 0, null, metadata !29, i32 0, null} ; [ DW_TAG_structure_type ]
!29 = metadata !{metadata !30, metadata !31, metadata !32, metadata !33}
!30 = metadata !{i32 458765, metadata !28, metadata !"si_signo", metadata !27, i32 53, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!31 = metadata !{i32 458765, metadata !28, metadata !"si_errno", metadata !27, i32 54, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!32 = metadata !{i32 458765, metadata !28, metadata !"si_code", metadata !27, i32 56, i64 32, i64 32, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!33 = metadata !{i32 458765, metadata !28, metadata !"_sifields", metadata !27, i32 107, i64 928, i64 32, i64 96, i32 0, metadata !34} ; [ DW_TAG_member ]
!34 = metadata !{i32 458775, metadata !3, metadata !"", metadata !27, i32 59, i64 928, i64 32, i64 0, i32 0, null, metadata !35, i32 0, null} ; [ DW_TAG_union_type ]
!35 = metadata !{metadata !36, metadata !40, metadata !49, metadata !61, metadata !67, metadata !77, metadata !81}
!36 = metadata !{i32 458765, metadata !34, metadata !"_pad", metadata !27, i32 60, i64 928, i64 32, i64 0, i32 0, metadata !37} ; [ DW_TAG_member ]
!37 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 928, i64 32, i64 0, i32 0, metadata !6, metadata !38, i32 0, null} ; [ DW_TAG_array_type ]
!38 = metadata !{metadata !39}
!39 = metadata !{i32 458785, i64 0, i64 28}       ; [ DW_TAG_subrange_type ]
!40 = metadata !{i32 458765, metadata !34, metadata !"_kill", metadata !27, i32 67, i64 64, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ]
!41 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 64, i64 64, i64 32, i64 0, i32 0, null, metadata !42, i32 0, null} ; [ DW_TAG_structure_type ]
!42 = metadata !{metadata !43, metadata !46}
!43 = metadata !{i32 458765, metadata !41, metadata !"si_pid", metadata !27, i32 65, i64 32, i64 32, i64 0, i32 0, metadata !44} ; [ DW_TAG_member ]
!44 = metadata !{i32 458774, metadata !3, metadata !"__pid_t", metadata !45, i32 144, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!45 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!46 = metadata !{i32 458765, metadata !41, metadata !"si_uid", metadata !27, i32 66, i64 32, i64 32, i64 32, i32 0, metadata !47} ; [ DW_TAG_member ]
!47 = metadata !{i32 458774, metadata !3, metadata !"__uid_t", metadata !45, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!48 = metadata !{i32 458788, metadata !3, metadata !"unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!49 = metadata !{i32 458765, metadata !34, metadata !"_timer", metadata !27, i32 75, i64 96, i64 32, i64 0, i32 0, metadata !50} ; [ DW_TAG_member ]
!50 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 71, i64 96, i64 32, i64 0, i32 0, null, metadata !51, i32 0, null} ; [ DW_TAG_structure_type ]
!51 = metadata !{metadata !52, metadata !53, metadata !54}
!52 = metadata !{i32 458765, metadata !50, metadata !"si_tid", metadata !27, i32 72, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!53 = metadata !{i32 458765, metadata !50, metadata !"si_overrun", metadata !27, i32 73, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!54 = metadata !{i32 458765, metadata !50, metadata !"si_sigval", metadata !27, i32 74, i64 32, i64 32, i64 64, i32 0, metadata !55} ; [ DW_TAG_member ]
!55 = metadata !{i32 458774, metadata !3, metadata !"sigval_t", metadata !27, i32 52, i64 0, i64 0, i64 0, i32 0, metadata !56} ; [ DW_TAG_typedef ]
!56 = metadata !{i32 458775, metadata !3, metadata !"sigval", metadata !27, i32 34, i64 32, i64 32, i64 0, i32 0, null, metadata !57, i32 0, null} ; [ DW_TAG_union_type ]
!57 = metadata !{metadata !58, metadata !59}
!58 = metadata !{i32 458765, metadata !56, metadata !"sival_int", metadata !27, i32 35, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!59 = metadata !{i32 458765, metadata !56, metadata !"sival_ptr", metadata !27, i32 36, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!60 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ]
!61 = metadata !{i32 458765, metadata !34, metadata !"_rt", metadata !27, i32 83, i64 96, i64 32, i64 0, i32 0, metadata !62} ; [ DW_TAG_member ]
!62 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 79, i64 96, i64 32, i64 0, i32 0, null, metadata !63, i32 0, null} ; [ DW_TAG_structure_type ]
!63 = metadata !{metadata !64, metadata !65, metadata !66}
!64 = metadata !{i32 458765, metadata !62, metadata !"si_pid", metadata !27, i32 80, i64 32, i64 32, i64 0, i32 0, metadata !44} ; [ DW_TAG_member ]
!65 = metadata !{i32 458765, metadata !62, metadata !"si_uid", metadata !27, i32 81, i64 32, i64 32, i64 32, i32 0, metadata !47} ; [ DW_TAG_member ]
!66 = metadata !{i32 458765, metadata !62, metadata !"si_sigval", metadata !27, i32 82, i64 32, i64 32, i64 64, i32 0, metadata !55} ; [ DW_TAG_member ]
!67 = metadata !{i32 458765, metadata !34, metadata !"_sigchld", metadata !27, i32 93, i64 160, i64 32, i64 0, i32 0, metadata !68} ; [ DW_TAG_member ]
!68 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 87, i64 160, i64 32, i64 0, i32 0, null, metadata !69, i32 0, null} ; [ DW_TAG_structure_type ]
!69 = metadata !{metadata !70, metadata !71, metadata !72, metadata !73, metadata !76}
!70 = metadata !{i32 458765, metadata !68, metadata !"si_pid", metadata !27, i32 88, i64 32, i64 32, i64 0, i32 0, metadata !44} ; [ DW_TAG_member ]
!71 = metadata !{i32 458765, metadata !68, metadata !"si_uid", metadata !27, i32 89, i64 32, i64 32, i64 32, i32 0, metadata !47} ; [ DW_TAG_member ]
!72 = metadata !{i32 458765, metadata !68, metadata !"si_status", metadata !27, i32 90, i64 32, i64 32, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!73 = metadata !{i32 458765, metadata !68, metadata !"si_utime", metadata !27, i32 91, i64 32, i64 32, i64 96, i32 0, metadata !74} ; [ DW_TAG_member ]
!74 = metadata !{i32 458774, metadata !3, metadata !"__clock_t", metadata !45, i32 146, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!75 = metadata !{i32 458788, metadata !3, metadata !"long int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!76 = metadata !{i32 458765, metadata !68, metadata !"si_stime", metadata !27, i32 92, i64 32, i64 32, i64 128, i32 0, metadata !74} ; [ DW_TAG_member ]
!77 = metadata !{i32 458765, metadata !34, metadata !"_sigfault", metadata !27, i32 99, i64 32, i64 32, i64 0, i32 0, metadata !78} ; [ DW_TAG_member ]
!78 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 97, i64 32, i64 32, i64 0, i32 0, null, metadata !79, i32 0, null} ; [ DW_TAG_structure_type ]
!79 = metadata !{metadata !80}
!80 = metadata !{i32 458765, metadata !78, metadata !"si_addr", metadata !27, i32 98, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!81 = metadata !{i32 458765, metadata !34, metadata !"_sigpoll", metadata !27, i32 106, i64 64, i64 32, i64 0, i32 0, metadata !82} ; [ DW_TAG_member ]
!82 = metadata !{i32 458771, metadata !3, metadata !"", metadata !27, i32 103, i64 64, i64 32, i64 0, i32 0, null, metadata !83, i32 0, null} ; [ DW_TAG_structure_type ]
!83 = metadata !{metadata !84, metadata !85}
!84 = metadata !{i32 458765, metadata !82, metadata !"si_band", metadata !27, i32 104, i64 32, i64 32, i64 0, i32 0, metadata !75} ; [ DW_TAG_member ]
!85 = metadata !{i32 458765, metadata !82, metadata !"si_fd", metadata !27, i32 105, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!86 = metadata !{i32 458765, metadata !9, metadata !"sa_mask", metadata !10, i32 44, i64 1024, i64 32, i64 32, i32 0, metadata !87} ; [ DW_TAG_member ]
!87 = metadata !{i32 458774, metadata !3, metadata !"__sigset_t", metadata !17, i32 41, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_typedef ]
!88 = metadata !{i32 458771, metadata !3, metadata !"", metadata !89, i32 30, i64 1024, i64 32, i64 0, i32 0, null, metadata !90, i32 0, null} ; [ DW_TAG_structure_type ]
!89 = metadata !{i32 458769, i32 0, i32 1, metadata !"sigset.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!90 = metadata !{metadata !91}
!91 = metadata !{i32 458765, metadata !88, metadata !"__val", metadata !89, i32 31, i64 1024, i64 32, i64 0, i32 0, metadata !92} ; [ DW_TAG_member ]
!92 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 1024, i64 32, i64 0, i32 0, metadata !93, metadata !94, i32 0, null} ; [ DW_TAG_array_type ]
!93 = metadata !{i32 458788, metadata !3, metadata !"long unsigned int", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 458785, i64 0, i64 31}       ; [ DW_TAG_subrange_type ]
!96 = metadata !{i32 458765, metadata !9, metadata !"sa_flags", metadata !10, i32 47, i64 32, i64 32, i64 1056, i32 0, metadata !6} ; [ DW_TAG_member ]
!97 = metadata !{i32 458765, metadata !9, metadata !"sa_restorer", metadata !10, i32 50, i64 32, i64 32, i64 1088, i32 0, metadata !98} ; [ DW_TAG_member ]
!98 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !99} ; [ DW_TAG_pointer_type ]
!99 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !100, i32 0, null} ; [ DW_TAG_subroutine_type ]
!100 = metadata !{null}
!101 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!102 = metadata !{i32 458774, metadata !3, metadata !"size_t", metadata !103, i32 29, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!103 = metadata !{i32 458769, i32 0, i32 1, metadata !"xlocale.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!104 = metadata !{i32 40, i32 0, metadata !1, null}
!105 = metadata !{i32 48, i32 0, metadata !106, null}
!106 = metadata !{i32 458763, metadata !107, i32 47, i32 0} ; [ DW_TAG_lexical_block ]
!107 = metadata !{i32 458798, i32 0, metadata !3, metadata !"sigaction", metadata !"sigaction", metadata !"sigaction", metadata !3, i32 47, metadata !108, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!108 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !109, i32 0, null} ; [ DW_TAG_subroutine_type ]
!109 = metadata !{metadata !6, metadata !6, metadata !7, metadata !101}
!110 = metadata !{i32 49, i32 0, metadata !106, null}
!111 = metadata !{i32 55, i32 0, metadata !112, null}
!112 = metadata !{i32 458763, metadata !113, i32 54, i32 0} ; [ DW_TAG_lexical_block ]
!113 = metadata !{i32 458798, i32 0, metadata !3, metadata !"sigprocmask", metadata !"sigprocmask", metadata !"sigprocmask", metadata !3, i32 54, metadata !114, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!114 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !115, i32 0, null} ; [ DW_TAG_subroutine_type ]
!115 = metadata !{metadata !6, metadata !6, metadata !116, metadata !116}
!116 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !117} ; [ DW_TAG_pointer_type ]
!117 = metadata !{i32 458774, metadata !3, metadata !"sigset_t", metadata !17, i32 62, i64 0, i64 0, i64 0, i32 0, metadata !88} ; [ DW_TAG_typedef ]
!118 = metadata !{i32 56, i32 0, metadata !112, null}
!119 = metadata !{i32 62, i32 0, metadata !120, null}
!120 = metadata !{i32 458763, metadata !121, i32 61, i32 0} ; [ DW_TAG_lexical_block ]
!121 = metadata !{i32 458798, i32 0, metadata !3, metadata !"fdatasync", metadata !"fdatasync", metadata !"fdatasync", metadata !3, i32 61, metadata !122, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!122 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !123, i32 0, null} ; [ DW_TAG_subroutine_type ]
!123 = metadata !{metadata !6, metadata !6}
!124 = metadata !{i32 68, i32 0, metadata !125, null}
!125 = metadata !{i32 458763, metadata !126, i32 67, i32 0} ; [ DW_TAG_lexical_block ]
!126 = metadata !{i32 458798, i32 0, metadata !3, metadata !"sync", metadata !"sync", metadata !"sync", metadata !3, i32 67, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!127 = metadata !{i32 77, i32 0, metadata !128, null}
!128 = metadata !{i32 458763, metadata !129, i32 76, i32 0} ; [ DW_TAG_lexical_block ]
!129 = metadata !{i32 458798, i32 0, metadata !3, metadata !"__socketcall", metadata !"__socketcall", metadata !"__socketcall", metadata !3, i32 76, metadata !130, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!130 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !131, i32 0, null} ; [ DW_TAG_subroutine_type ]
!131 = metadata !{metadata !6, metadata !6, metadata !132}
!132 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_pointer_type ]
!133 = metadata !{i32 78, i32 0, metadata !128, null}
!134 = metadata !{i32 79, i32 0, metadata !128, null}
!135 = metadata !{i32 84, i32 0, metadata !136, null}
!136 = metadata !{i32 458763, metadata !137, i32 83, i32 0} ; [ DW_TAG_lexical_block ]
!137 = metadata !{i32 458798, i32 0, metadata !3, metadata !"_IO_getc", metadata !"_IO_getc", metadata !"_IO_getc", metadata !3, i32 83, metadata !138, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!138 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !139, i32 0, null} ; [ DW_TAG_subroutine_type ]
!139 = metadata !{metadata !6, metadata !140}
!140 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !141} ; [ DW_TAG_pointer_type ]
!141 = metadata !{i32 458774, metadata !3, metadata !"FILE", metadata !142, i32 65, i64 0, i64 0, i64 0, i32 0, metadata !143} ; [ DW_TAG_typedef ]
!142 = metadata !{i32 458769, i32 0, i32 1, metadata !"stdio.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!143 = metadata !{i32 458771, metadata !3, metadata !"_IO_FILE", metadata !142, i32 45, i64 1184, i64 32, i64 0, i32 0, null, metadata !144, i32 0, null} ; [ DW_TAG_structure_type ]
!144 = metadata !{metadata !145, metadata !147, metadata !150, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !157, metadata !158, metadata !159, metadata !160, metadata !168, metadata !169, metadata !170, metadata !171, metadata !173, metadata !175, metadata !177, metadata !181, metadata !182, metadata !185, metadata !186, metadata !187, metadata !188, metadata !189, metadata !190, metadata !191}
!145 = metadata !{i32 458765, metadata !143, metadata !"_flags", metadata !146, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!146 = metadata !{i32 458769, i32 0, i32 1, metadata !"libio.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!147 = metadata !{i32 458765, metadata !143, metadata !"_IO_read_ptr", metadata !146, i32 277, i64 32, i64 32, i64 32, i32 0, metadata !148} ; [ DW_TAG_member ]
!148 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !149} ; [ DW_TAG_pointer_type ]
!149 = metadata !{i32 458788, metadata !3, metadata !"char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!150 = metadata !{i32 458765, metadata !143, metadata !"_IO_read_end", metadata !146, i32 278, i64 32, i64 32, i64 64, i32 0, metadata !148} ; [ DW_TAG_member ]
!151 = metadata !{i32 458765, metadata !143, metadata !"_IO_read_base", metadata !146, i32 279, i64 32, i64 32, i64 96, i32 0, metadata !148} ; [ DW_TAG_member ]
!152 = metadata !{i32 458765, metadata !143, metadata !"_IO_write_base", metadata !146, i32 280, i64 32, i64 32, i64 128, i32 0, metadata !148} ; [ DW_TAG_member ]
!153 = metadata !{i32 458765, metadata !143, metadata !"_IO_write_ptr", metadata !146, i32 281, i64 32, i64 32, i64 160, i32 0, metadata !148} ; [ DW_TAG_member ]
!154 = metadata !{i32 458765, metadata !143, metadata !"_IO_write_end", metadata !146, i32 282, i64 32, i64 32, i64 192, i32 0, metadata !148} ; [ DW_TAG_member ]
!155 = metadata !{i32 458765, metadata !143, metadata !"_IO_buf_base", metadata !146, i32 283, i64 32, i64 32, i64 224, i32 0, metadata !148} ; [ DW_TAG_member ]
!156 = metadata !{i32 458765, metadata !143, metadata !"_IO_buf_end", metadata !146, i32 284, i64 32, i64 32, i64 256, i32 0, metadata !148} ; [ DW_TAG_member ]
!157 = metadata !{i32 458765, metadata !143, metadata !"_IO_save_base", metadata !146, i32 286, i64 32, i64 32, i64 288, i32 0, metadata !148} ; [ DW_TAG_member ]
!158 = metadata !{i32 458765, metadata !143, metadata !"_IO_backup_base", metadata !146, i32 287, i64 32, i64 32, i64 320, i32 0, metadata !148} ; [ DW_TAG_member ]
!159 = metadata !{i32 458765, metadata !143, metadata !"_IO_save_end", metadata !146, i32 288, i64 32, i64 32, i64 352, i32 0, metadata !148} ; [ DW_TAG_member ]
!160 = metadata !{i32 458765, metadata !143, metadata !"_markers", metadata !146, i32 290, i64 32, i64 32, i64 384, i32 0, metadata !161} ; [ DW_TAG_member ]
!161 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !162} ; [ DW_TAG_pointer_type ]
!162 = metadata !{i32 458771, metadata !3, metadata !"_IO_marker", metadata !146, i32 186, i64 96, i64 32, i64 0, i32 0, null, metadata !163, i32 0, null} ; [ DW_TAG_structure_type ]
!163 = metadata !{metadata !164, metadata !165, metadata !167}
!164 = metadata !{i32 458765, metadata !162, metadata !"_next", metadata !146, i32 187, i64 32, i64 32, i64 0, i32 0, metadata !161} ; [ DW_TAG_member ]
!165 = metadata !{i32 458765, metadata !162, metadata !"_sbuf", metadata !146, i32 188, i64 32, i64 32, i64 32, i32 0, metadata !166} ; [ DW_TAG_member ]
!166 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !143} ; [ DW_TAG_pointer_type ]
!167 = metadata !{i32 458765, metadata !162, metadata !"_pos", metadata !146, i32 192, i64 32, i64 32, i64 64, i32 0, metadata !6} ; [ DW_TAG_member ]
!168 = metadata !{i32 458765, metadata !143, metadata !"_chain", metadata !146, i32 292, i64 32, i64 32, i64 416, i32 0, metadata !166} ; [ DW_TAG_member ]
!169 = metadata !{i32 458765, metadata !143, metadata !"_fileno", metadata !146, i32 294, i64 32, i64 32, i64 448, i32 0, metadata !6} ; [ DW_TAG_member ]
!170 = metadata !{i32 458765, metadata !143, metadata !"_flags2", metadata !146, i32 298, i64 32, i64 32, i64 480, i32 0, metadata !6} ; [ DW_TAG_member ]
!171 = metadata !{i32 458765, metadata !143, metadata !"_old_offset", metadata !146, i32 300, i64 32, i64 32, i64 512, i32 0, metadata !172} ; [ DW_TAG_member ]
!172 = metadata !{i32 458774, metadata !3, metadata !"__off_t", metadata !45, i32 142, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!173 = metadata !{i32 458765, metadata !143, metadata !"_cur_column", metadata !146, i32 304, i64 16, i64 16, i64 544, i32 0, metadata !174} ; [ DW_TAG_member ]
!174 = metadata !{i32 458788, metadata !3, metadata !"short unsigned int", metadata !3, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!175 = metadata !{i32 458765, metadata !143, metadata !"_vtable_offset", metadata !146, i32 305, i64 8, i64 8, i64 560, i32 0, metadata !176} ; [ DW_TAG_member ]
!176 = metadata !{i32 458788, metadata !3, metadata !"signed char", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!177 = metadata !{i32 458765, metadata !143, metadata !"_shortbuf", metadata !146, i32 306, i64 8, i64 8, i64 568, i32 0, metadata !178} ; [ DW_TAG_member ]
!178 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !149, metadata !179, i32 0, null} ; [ DW_TAG_array_type ]
!179 = metadata !{metadata !180}
!180 = metadata !{i32 458785, i64 0, i64 0}       ; [ DW_TAG_subrange_type ]
!181 = metadata !{i32 458765, metadata !143, metadata !"_lock", metadata !146, i32 310, i64 32, i64 32, i64 576, i32 0, metadata !60} ; [ DW_TAG_member ]
!182 = metadata !{i32 458765, metadata !143, metadata !"_offset", metadata !146, i32 319, i64 64, i64 64, i64 608, i32 0, metadata !183} ; [ DW_TAG_member ]
!183 = metadata !{i32 458774, metadata !3, metadata !"__off64_t", metadata !45, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !184} ; [ DW_TAG_typedef ]
!184 = metadata !{i32 458788, metadata !3, metadata !"long long int", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!185 = metadata !{i32 458765, metadata !143, metadata !"__pad1", metadata !146, i32 328, i64 32, i64 32, i64 672, i32 0, metadata !60} ; [ DW_TAG_member ]
!186 = metadata !{i32 458765, metadata !143, metadata !"__pad2", metadata !146, i32 329, i64 32, i64 32, i64 704, i32 0, metadata !60} ; [ DW_TAG_member ]
!187 = metadata !{i32 458765, metadata !143, metadata !"__pad3", metadata !146, i32 330, i64 32, i64 32, i64 736, i32 0, metadata !60} ; [ DW_TAG_member ]
!188 = metadata !{i32 458765, metadata !143, metadata !"__pad4", metadata !146, i32 331, i64 32, i64 32, i64 768, i32 0, metadata !60} ; [ DW_TAG_member ]
!189 = metadata !{i32 458765, metadata !143, metadata !"__pad5", metadata !146, i32 332, i64 32, i64 32, i64 800, i32 0, metadata !102} ; [ DW_TAG_member ]
!190 = metadata !{i32 458765, metadata !143, metadata !"_mode", metadata !146, i32 334, i64 32, i64 32, i64 832, i32 0, metadata !6} ; [ DW_TAG_member ]
!191 = metadata !{i32 458765, metadata !143, metadata !"_unused2", metadata !146, i32 336, i64 320, i64 8, i64 864, i32 0, metadata !192} ; [ DW_TAG_member ]
!192 = metadata !{i32 458753, metadata !3, metadata !"", metadata !3, i32 0, i64 320, i64 8, i64 0, i32 0, metadata !149, metadata !193, i32 0, null} ; [ DW_TAG_array_type ]
!193 = metadata !{metadata !194}
!194 = metadata !{i32 458785, i64 0, i64 39}      ; [ DW_TAG_subrange_type ]
!195 = metadata !{i32 89, i32 0, metadata !196, null}
!196 = metadata !{i32 458763, metadata !197, i32 88, i32 0} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 458798, i32 0, metadata !3, metadata !"_IO_putc", metadata !"_IO_putc", metadata !"_IO_putc", metadata !3, i32 88, metadata !198, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!198 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !199, i32 0, null} ; [ DW_TAG_subroutine_type ]
!199 = metadata !{metadata !6, metadata !6, metadata !140}
!200 = metadata !{i32 94, i32 0, metadata !201, null}
!201 = metadata !{i32 458763, metadata !202, i32 93, i32 0} ; [ DW_TAG_lexical_block ]
!202 = metadata !{i32 458798, i32 0, metadata !3, metadata !"mkdir", metadata !"mkdir", metadata !"mkdir", metadata !3, i32 93, metadata !203, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!203 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !204, i32 0, null} ; [ DW_TAG_subroutine_type ]
!204 = metadata !{metadata !6, metadata !205, metadata !207}
!205 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !206} ; [ DW_TAG_pointer_type ]
!206 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !149} ; [ DW_TAG_const_type ]
!207 = metadata !{i32 458774, metadata !3, metadata !"mode_t", metadata !208, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!208 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!209 = metadata !{i32 95, i32 0, metadata !201, null}
!210 = metadata !{i32 96, i32 0, metadata !201, null}
!211 = metadata !{i32 101, i32 0, metadata !212, null}
!212 = metadata !{i32 458763, metadata !213, i32 100, i32 0} ; [ DW_TAG_lexical_block ]
!213 = metadata !{i32 458798, i32 0, metadata !3, metadata !"mkfifo", metadata !"mkfifo", metadata !"mkfifo", metadata !3, i32 100, metadata !203, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!214 = metadata !{i32 102, i32 0, metadata !212, null}
!215 = metadata !{i32 103, i32 0, metadata !212, null}
!216 = metadata !{i32 108, i32 0, metadata !217, null}
!217 = metadata !{i32 458763, metadata !218, i32 107, i32 0} ; [ DW_TAG_lexical_block ]
!218 = metadata !{i32 458798, i32 0, metadata !3, metadata !"mknod", metadata !"mknod", metadata !"mknod", metadata !3, i32 107, metadata !219, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!219 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !220, i32 0, null} ; [ DW_TAG_subroutine_type ]
!220 = metadata !{metadata !6, metadata !205, metadata !207, metadata !221}
!221 = metadata !{i32 458774, metadata !3, metadata !"dev_t", metadata !208, i32 67, i64 0, i64 0, i64 0, i32 0, metadata !222} ; [ DW_TAG_typedef ]
!222 = metadata !{i32 458788, metadata !3, metadata !"long long unsigned int", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!223 = metadata !{i32 109, i32 0, metadata !217, null}
!224 = metadata !{i32 110, i32 0, metadata !217, null}
!225 = metadata !{i32 115, i32 0, metadata !226, null}
!226 = metadata !{i32 458763, metadata !227, i32 114, i32 0} ; [ DW_TAG_lexical_block ]
!227 = metadata !{i32 458798, i32 0, metadata !3, metadata !"pipe", metadata !"pipe", metadata !"pipe", metadata !3, i32 114, metadata !228, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!228 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !229, i32 0, null} ; [ DW_TAG_subroutine_type ]
!229 = metadata !{metadata !6, metadata !132}
!230 = metadata !{i32 116, i32 0, metadata !226, null}
!231 = metadata !{i32 117, i32 0, metadata !226, null}
!232 = metadata !{i32 122, i32 0, metadata !233, null}
!233 = metadata !{i32 458763, metadata !234, i32 121, i32 0} ; [ DW_TAG_lexical_block ]
!234 = metadata !{i32 458798, i32 0, metadata !3, metadata !"link", metadata !"link", metadata !"link", metadata !3, i32 121, metadata !235, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!235 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !236, i32 0, null} ; [ DW_TAG_subroutine_type ]
!236 = metadata !{metadata !6, metadata !205, metadata !205}
!237 = metadata !{i32 123, i32 0, metadata !233, null}
!238 = metadata !{i32 124, i32 0, metadata !233, null}
!239 = metadata !{i32 129, i32 0, metadata !240, null}
!240 = metadata !{i32 458763, metadata !241, i32 128, i32 0} ; [ DW_TAG_lexical_block ]
!241 = metadata !{i32 458798, i32 0, metadata !3, metadata !"symlink", metadata !"symlink", metadata !"symlink", metadata !3, i32 128, metadata !235, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!242 = metadata !{i32 130, i32 0, metadata !240, null}
!243 = metadata !{i32 131, i32 0, metadata !240, null}
!244 = metadata !{i32 136, i32 0, metadata !245, null}
!245 = metadata !{i32 458763, metadata !246, i32 135, i32 0} ; [ DW_TAG_lexical_block ]
!246 = metadata !{i32 458798, i32 0, metadata !3, metadata !"rename", metadata !"rename", metadata !"rename", metadata !3, i32 135, metadata !235, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!247 = metadata !{i32 137, i32 0, metadata !245, null}
!248 = metadata !{i32 138, i32 0, metadata !245, null}
!249 = metadata !{i32 143, i32 0, metadata !250, null}
!250 = metadata !{i32 458763, metadata !251, i32 142, i32 0} ; [ DW_TAG_lexical_block ]
!251 = metadata !{i32 458798, i32 0, metadata !3, metadata !"nanosleep", metadata !"nanosleep", metadata !"nanosleep", metadata !3, i32 142, metadata !252, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!252 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !253, i32 0, null} ; [ DW_TAG_subroutine_type ]
!253 = metadata !{metadata !6, metadata !254, metadata !262}
!254 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !255} ; [ DW_TAG_pointer_type ]
!255 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !256} ; [ DW_TAG_const_type ]
!256 = metadata !{i32 458771, metadata !3, metadata !"timespec", metadata !257, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !258, i32 0, null} ; [ DW_TAG_structure_type ]
!257 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!258 = metadata !{metadata !259, metadata !261}
!259 = metadata !{i32 458765, metadata !256, metadata !"tv_sec", metadata !257, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !260} ; [ DW_TAG_member ]
!260 = metadata !{i32 458774, metadata !3, metadata !"__time_t", metadata !45, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!261 = metadata !{i32 458765, metadata !256, metadata !"tv_nsec", metadata !257, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !75} ; [ DW_TAG_member ]
!262 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !256} ; [ DW_TAG_pointer_type ]
!263 = metadata !{i32 151, i32 0, metadata !264, null}
!264 = metadata !{i32 458763, metadata !265, i32 148, i32 0} ; [ DW_TAG_lexical_block ]
!265 = metadata !{i32 458798, i32 0, metadata !3, metadata !"clock_gettime", metadata !"clock_gettime", metadata !"clock_gettime", metadata !3, i32 148, metadata !266, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!266 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !267, i32 0, null} ; [ DW_TAG_subroutine_type ]
!267 = metadata !{metadata !6, metadata !268, metadata !262}
!268 = metadata !{i32 458774, metadata !3, metadata !"clockid_t", metadata !257, i32 104, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!269 = metadata !{i32 152, i32 0, metadata !264, null}
!270 = metadata !{i32 153, i32 0, metadata !264, null}
!271 = metadata !{i32 154, i32 0, metadata !264, null}
!272 = metadata !{i32 159, i32 0, metadata !273, null}
!273 = metadata !{i32 458763, metadata !274, i32 158, i32 0} ; [ DW_TAG_lexical_block ]
!274 = metadata !{i32 458798, i32 0, metadata !3, metadata !"clock_settime", metadata !"clock_settime", metadata !"clock_settime", metadata !3, i32 158, metadata !275, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!275 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !276, i32 0, null} ; [ DW_TAG_subroutine_type ]
!276 = metadata !{metadata !6, metadata !268, metadata !254}
!277 = metadata !{i32 160, i32 0, metadata !273, null}
!278 = metadata !{i32 161, i32 0, metadata !273, null}
!279 = metadata !{i32 166, i32 0, metadata !280, null}
!280 = metadata !{i32 458763, metadata !281, i32 164, i32 0} ; [ DW_TAG_lexical_block ]
!281 = metadata !{i32 458798, i32 0, metadata !3, metadata !"time", metadata !"time", metadata !"time", metadata !3, i32 164, metadata !282, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!282 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !283, i32 0, null} ; [ DW_TAG_subroutine_type ]
!283 = metadata !{metadata !284, metadata !285}
!284 = metadata !{i32 458774, metadata !3, metadata !"time_t", metadata !257, i32 92, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!285 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !284} ; [ DW_TAG_pointer_type ]
!286 = metadata !{i32 167, i32 0, metadata !280, null}
!287 = metadata !{i32 169, i32 0, metadata !280, null}
!288 = metadata !{i32 168, i32 0, metadata !280, null}
!289 = metadata !{i32 244, i32 0, metadata !290, null}
!290 = metadata !{i32 458763, metadata !291, i32 243, i32 0} ; [ DW_TAG_lexical_block ]
!291 = metadata !{i32 458798, i32 0, metadata !3, metadata !"gnu_dev_major", metadata !"gnu_dev_major", metadata !"gnu_dev_major", metadata !3, i32 243, metadata !292, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!292 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !293, i32 0, null} ; [ DW_TAG_subroutine_type ]
!293 = metadata !{metadata !48, metadata !222}
!294 = metadata !{i32 249, i32 0, metadata !295, null}
!295 = metadata !{i32 458763, metadata !296, i32 248, i32 0} ; [ DW_TAG_lexical_block ]
!296 = metadata !{i32 458798, i32 0, metadata !3, metadata !"gnu_dev_minor", metadata !"gnu_dev_minor", metadata !"gnu_dev_minor", metadata !3, i32 248, metadata !292, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!297 = metadata !{i32 254, i32 0, metadata !298, null}
!298 = metadata !{i32 458763, metadata !299, i32 253, i32 0} ; [ DW_TAG_lexical_block ]
!299 = metadata !{i32 458798, i32 0, metadata !3, metadata !"gnu_dev_makedev", metadata !"gnu_dev_makedev", metadata !"gnu_dev_makedev", metadata !3, i32 253, metadata !300, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!300 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !301, i32 0, null} ; [ DW_TAG_subroutine_type ]
!301 = metadata !{metadata !222, metadata !48, metadata !48}
!302 = metadata !{i32 174, i32 0, metadata !303, null}
!303 = metadata !{i32 458763, metadata !304, i32 172, i32 0} ; [ DW_TAG_lexical_block ]
!304 = metadata !{i32 458798, i32 0, metadata !3, metadata !"times", metadata !"times", metadata !"times", metadata !3, i32 172, metadata !305, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!305 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !306, i32 0, null} ; [ DW_TAG_subroutine_type ]
!306 = metadata !{metadata !307, metadata !308}
!307 = metadata !{i32 458774, metadata !3, metadata !"clock_t", metadata !257, i32 76, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!308 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !309} ; [ DW_TAG_pointer_type ]
!309 = metadata !{i32 458771, metadata !3, metadata !"tms", metadata !310, i32 36, i64 128, i64 32, i64 0, i32 0, null, metadata !311, i32 0, null} ; [ DW_TAG_structure_type ]
!310 = metadata !{i32 458769, i32 0, i32 1, metadata !"times.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!311 = metadata !{metadata !312, metadata !313, metadata !314, metadata !315}
!312 = metadata !{i32 458765, metadata !309, metadata !"tms_utime", metadata !310, i32 37, i64 32, i64 32, i64 0, i32 0, metadata !307} ; [ DW_TAG_member ]
!313 = metadata !{i32 458765, metadata !309, metadata !"tms_stime", metadata !310, i32 38, i64 32, i64 32, i64 32, i32 0, metadata !307} ; [ DW_TAG_member ]
!314 = metadata !{i32 458765, metadata !309, metadata !"tms_cutime", metadata !310, i32 40, i64 32, i64 32, i64 64, i32 0, metadata !307} ; [ DW_TAG_member ]
!315 = metadata !{i32 458765, metadata !309, metadata !"tms_cstime", metadata !310, i32 41, i64 32, i64 32, i64 96, i32 0, metadata !307} ; [ DW_TAG_member ]
!316 = metadata !{i32 175, i32 0, metadata !303, null}
!317 = metadata !{i32 176, i32 0, metadata !303, null}
!318 = metadata !{i32 177, i32 0, metadata !303, null}
!319 = metadata !{i32 178, i32 0, metadata !303, null}
!320 = metadata !{i32 502, i32 0, metadata !321, null}
!321 = metadata !{i32 458763, metadata !322, i32 501, i32 0} ; [ DW_TAG_lexical_block ]
!322 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setuid", metadata !"setuid", metadata !"setuid", metadata !3, i32 501, metadata !323, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!323 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !324, i32 0, null} ; [ DW_TAG_subroutine_type ]
!324 = metadata !{metadata !6, metadata !325}
!325 = metadata !{i32 458774, metadata !3, metadata !"uid_t", metadata !257, i32 121, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!326 = metadata !{i32 503, i32 0, metadata !321, null}
!327 = metadata !{i32 419, i32 0, metadata !328, null}
!328 = metadata !{i32 458763, metadata !329, i32 418, i32 0} ; [ DW_TAG_lexical_block ]
!329 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setgid", metadata !"setgid", metadata !"setgid", metadata !3, i32 418, metadata !330, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!330 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !331, i32 0, null} ; [ DW_TAG_subroutine_type ]
!331 = metadata !{metadata !6, metadata !332}
!332 = metadata !{i32 458774, metadata !3, metadata !"gid_t", metadata !208, i32 72, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!333 = metadata !{i32 420, i32 0, metadata !328, null}
!334 = metadata !{i32 270, i32 0, metadata !335, null}
!335 = metadata !{i32 458763, metadata !336, i32 269, i32 0} ; [ DW_TAG_lexical_block ]
!336 = metadata !{i32 458798, i32 0, metadata !3, metadata !"getloadavg", metadata !"getloadavg", metadata !"getloadavg", metadata !3, i32 269, metadata !337, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!337 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !338, i32 0, null} ; [ DW_TAG_subroutine_type ]
!338 = metadata !{metadata !6, metadata !339, metadata !6}
!339 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !340} ; [ DW_TAG_pointer_type ]
!340 = metadata !{i32 458788, metadata !3, metadata !"double", metadata !3, i32 0, i64 64, i64 64, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!341 = metadata !{i32 271, i32 0, metadata !335, null}
!342 = metadata !{i32 557, i32 0, metadata !343, null}
!343 = metadata !{i32 458763, metadata !344, i32 556, i32 0} ; [ DW_TAG_lexical_block ]
!344 = metadata !{i32 458798, i32 0, metadata !3, metadata !"munmap", metadata !"munmap", metadata !"munmap", metadata !3, i32 556, metadata !345, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!345 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !346, i32 0, null} ; [ DW_TAG_subroutine_type ]
!346 = metadata !{metadata !6, metadata !60, metadata !102}
!347 = metadata !{i32 558, i32 0, metadata !343, null}
!348 = metadata !{i32 559, i32 0, metadata !343, null}
!349 = metadata !{i32 550, i32 0, metadata !350, null}
!350 = metadata !{i32 458763, metadata !351, i32 549, i32 0} ; [ DW_TAG_lexical_block ]
!351 = metadata !{i32 458798, i32 0, metadata !3, metadata !"mmap64", metadata !"mmap64", metadata !"mmap64", metadata !3, i32 549, metadata !352, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!352 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !353, i32 0, null} ; [ DW_TAG_subroutine_type ]
!353 = metadata !{metadata !60, metadata !60, metadata !102, metadata !6, metadata !6, metadata !6, metadata !354}
!354 = metadata !{i32 458774, metadata !3, metadata !"off64_t", metadata !208, i32 105, i64 0, i64 0, i64 0, i32 0, metadata !184} ; [ DW_TAG_typedef ]
!355 = metadata !{i32 551, i32 0, metadata !350, null}
!356 = metadata !{i32 552, i32 0, metadata !350, null}
!357 = metadata !{i32 543, i32 0, metadata !358, null}
!358 = metadata !{i32 458763, metadata !359, i32 542, i32 0} ; [ DW_TAG_lexical_block ]
!359 = metadata !{i32 458798, i32 0, metadata !3, metadata !"mmap", metadata !"mmap", metadata !"mmap", metadata !3, i32 542, metadata !360, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!360 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !361, i32 0, null} ; [ DW_TAG_subroutine_type ]
!361 = metadata !{metadata !60, metadata !60, metadata !102, metadata !6, metadata !6, metadata !6, metadata !362}
!362 = metadata !{i32 458774, metadata !3, metadata !"off_t", metadata !208, i32 95, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!363 = metadata !{i32 544, i32 0, metadata !358, null}
!364 = metadata !{i32 545, i32 0, metadata !358, null}
!365 = metadata !{i32 536, i32 0, metadata !366, null}
!366 = metadata !{i32 458763, metadata !367, i32 535, i32 0} ; [ DW_TAG_lexical_block ]
!367 = metadata !{i32 458798, i32 0, metadata !3, metadata !"readahead", metadata !"readahead", metadata !"readahead", metadata !3, i32 535, metadata !368, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!368 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !369, i32 0, null} ; [ DW_TAG_subroutine_type ]
!369 = metadata !{metadata !370, metadata !6, metadata !371, metadata !102}
!370 = metadata !{i32 458774, metadata !3, metadata !"ssize_t", metadata !208, i32 116, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!371 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !354} ; [ DW_TAG_pointer_type ]
!372 = metadata !{i32 537, i32 0, metadata !366, null}
!373 = metadata !{i32 538, i32 0, metadata !366, null}
!374 = metadata !{i32 529, i32 0, metadata !375, null}
!375 = metadata !{i32 458763, metadata !376, i32 528, i32 0} ; [ DW_TAG_lexical_block ]
!376 = metadata !{i32 458798, i32 0, metadata !3, metadata !"pause", metadata !"pause", metadata !"pause", metadata !3, i32 528, metadata !377, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!377 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !378, i32 0, null} ; [ DW_TAG_subroutine_type ]
!378 = metadata !{metadata !6}
!379 = metadata !{i32 530, i32 0, metadata !375, null}
!380 = metadata !{i32 531, i32 0, metadata !375, null}
!381 = metadata !{i32 522, i32 0, metadata !382, null}
!382 = metadata !{i32 458763, metadata !383, i32 521, i32 0} ; [ DW_TAG_lexical_block ]
!383 = metadata !{i32 458798, i32 0, metadata !3, metadata !"munlock", metadata !"munlock", metadata !"munlock", metadata !3, i32 521, metadata !345, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!384 = metadata !{i32 523, i32 0, metadata !382, null}
!385 = metadata !{i32 524, i32 0, metadata !382, null}
!386 = metadata !{i32 515, i32 0, metadata !387, null}
!387 = metadata !{i32 458763, metadata !388, i32 514, i32 0} ; [ DW_TAG_lexical_block ]
!388 = metadata !{i32 458798, i32 0, metadata !3, metadata !"mlock", metadata !"mlock", metadata !"mlock", metadata !3, i32 514, metadata !345, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!389 = metadata !{i32 516, i32 0, metadata !387, null}
!390 = metadata !{i32 517, i32 0, metadata !387, null}
!391 = metadata !{i32 508, i32 0, metadata !392, null}
!392 = metadata !{i32 458763, metadata !393, i32 507, i32 0} ; [ DW_TAG_lexical_block ]
!393 = metadata !{i32 458798, i32 0, metadata !3, metadata !"reboot", metadata !"reboot", metadata !"reboot", metadata !3, i32 507, metadata !122, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!394 = metadata !{i32 509, i32 0, metadata !392, null}
!395 = metadata !{i32 510, i32 0, metadata !392, null}
!396 = metadata !{i32 495, i32 0, metadata !397, null}
!397 = metadata !{i32 458763, metadata !398, i32 494, i32 0} ; [ DW_TAG_lexical_block ]
!398 = metadata !{i32 458798, i32 0, metadata !3, metadata !"settimeofday", metadata !"settimeofday", metadata !"settimeofday", metadata !3, i32 494, metadata !399, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!399 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !400, i32 0, null} ; [ DW_TAG_subroutine_type ]
!400 = metadata !{metadata !6, metadata !401, metadata !409}
!401 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !402} ; [ DW_TAG_pointer_type ]
!402 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !403} ; [ DW_TAG_const_type ]
!403 = metadata !{i32 458771, metadata !3, metadata !"timeval", metadata !404, i32 70, i64 64, i64 32, i64 0, i32 0, null, metadata !405, i32 0, null} ; [ DW_TAG_structure_type ]
!404 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!405 = metadata !{metadata !406, metadata !407}
!406 = metadata !{i32 458765, metadata !403, metadata !"tv_sec", metadata !404, i32 71, i64 32, i64 32, i64 0, i32 0, metadata !260} ; [ DW_TAG_member ]
!407 = metadata !{i32 458765, metadata !403, metadata !"tv_usec", metadata !404, i32 72, i64 32, i64 32, i64 32, i32 0, metadata !408} ; [ DW_TAG_member ]
!408 = metadata !{i32 458774, metadata !3, metadata !"__suseconds_t", metadata !45, i32 153, i64 0, i64 0, i64 0, i32 0, metadata !75} ; [ DW_TAG_typedef ]
!409 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !410} ; [ DW_TAG_pointer_type ]
!410 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !411} ; [ DW_TAG_const_type ]
!411 = metadata !{i32 458771, metadata !3, metadata !"timezone", metadata !412, i32 58, i64 64, i64 32, i64 0, i32 0, null, metadata !413, i32 0, null} ; [ DW_TAG_structure_type ]
!412 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!413 = metadata !{metadata !414, metadata !415}
!414 = metadata !{i32 458765, metadata !411, metadata !"tz_minuteswest", metadata !412, i32 59, i64 32, i64 32, i64 0, i32 0, metadata !6} ; [ DW_TAG_member ]
!415 = metadata !{i32 458765, metadata !411, metadata !"tz_dsttime", metadata !412, i32 60, i64 32, i64 32, i64 32, i32 0, metadata !6} ; [ DW_TAG_member ]
!416 = metadata !{i32 496, i32 0, metadata !397, null}
!417 = metadata !{i32 497, i32 0, metadata !397, null}
!418 = metadata !{i32 488, i32 0, metadata !419, null}
!419 = metadata !{i32 458763, metadata !420, i32 487, i32 0} ; [ DW_TAG_lexical_block ]
!420 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setsid", metadata !"setsid", metadata !"setsid", metadata !3, i32 487, metadata !421, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!421 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !422, i32 0, null} ; [ DW_TAG_subroutine_type ]
!422 = metadata !{metadata !423}
!423 = metadata !{i32 458774, metadata !3, metadata !"pid_t", metadata !17, i32 68, i64 0, i64 0, i64 0, i32 0, metadata !6} ; [ DW_TAG_typedef ]
!424 = metadata !{i32 489, i32 0, metadata !419, null}
!425 = metadata !{i32 490, i32 0, metadata !419, null}
!426 = metadata !{i32 481, i32 0, metadata !427, null}
!427 = metadata !{i32 458763, metadata !428, i32 480, i32 0} ; [ DW_TAG_lexical_block ]
!428 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setrlimit64", metadata !"setrlimit64", metadata !"setrlimit64", metadata !3, i32 480, metadata !429, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!429 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !430, i32 0, null} ; [ DW_TAG_subroutine_type ]
!430 = metadata !{metadata !6, metadata !431, metadata !454}
!431 = metadata !{i32 458774, metadata !3, metadata !"__rlimit_resource_t", metadata !432, i32 40, i64 0, i64 0, i64 0, i32 0, metadata !433} ; [ DW_TAG_typedef ]
!432 = metadata !{i32 458769, i32 0, i32 1, metadata !"resource.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!433 = metadata !{i32 458756, metadata !3, metadata !"__rlimit_resource", metadata !434, i32 34, i64 32, i64 32, i64 0, i32 0, null, metadata !435, i32 0, null} ; [ DW_TAG_enumeration_type ]
!434 = metadata !{i32 458769, i32 0, i32 1, metadata !"resource.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!435 = metadata !{metadata !436, metadata !437, metadata !438, metadata !439, metadata !440, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !449, metadata !450, metadata !451, metadata !452, metadata !453}
!436 = metadata !{i32 458792, metadata !"RLIMIT_CPU", i64 0} ; [ DW_TAG_enumerator ]
!437 = metadata !{i32 458792, metadata !"RLIMIT_FSIZE", i64 1} ; [ DW_TAG_enumerator ]
!438 = metadata !{i32 458792, metadata !"RLIMIT_DATA", i64 2} ; [ DW_TAG_enumerator ]
!439 = metadata !{i32 458792, metadata !"RLIMIT_STACK", i64 3} ; [ DW_TAG_enumerator ]
!440 = metadata !{i32 458792, metadata !"RLIMIT_CORE", i64 4} ; [ DW_TAG_enumerator ]
!441 = metadata !{i32 458792, metadata !"__RLIMIT_RSS", i64 5} ; [ DW_TAG_enumerator ]
!442 = metadata !{i32 458792, metadata !"RLIMIT_NOFILE", i64 7} ; [ DW_TAG_enumerator ]
!443 = metadata !{i32 458792, metadata !"__RLIMIT_OFILE", i64 7} ; [ DW_TAG_enumerator ]
!444 = metadata !{i32 458792, metadata !"RLIMIT_AS", i64 9} ; [ DW_TAG_enumerator ]
!445 = metadata !{i32 458792, metadata !"__RLIMIT_NPROC", i64 6} ; [ DW_TAG_enumerator ]
!446 = metadata !{i32 458792, metadata !"__RLIMIT_MEMLOCK", i64 8} ; [ DW_TAG_enumerator ]
!447 = metadata !{i32 458792, metadata !"__RLIMIT_LOCKS", i64 10} ; [ DW_TAG_enumerator ]
!448 = metadata !{i32 458792, metadata !"__RLIMIT_SIGPENDING", i64 11} ; [ DW_TAG_enumerator ]
!449 = metadata !{i32 458792, metadata !"__RLIMIT_MSGQUEUE", i64 12} ; [ DW_TAG_enumerator ]
!450 = metadata !{i32 458792, metadata !"__RLIMIT_NICE", i64 13} ; [ DW_TAG_enumerator ]
!451 = metadata !{i32 458792, metadata !"__RLIMIT_RTPRIO", i64 14} ; [ DW_TAG_enumerator ]
!452 = metadata !{i32 458792, metadata !"__RLIMIT_NLIMITS", i64 15} ; [ DW_TAG_enumerator ]
!453 = metadata !{i32 458792, metadata !"__RLIM_NLIMITS", i64 15} ; [ DW_TAG_enumerator ]
!454 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !455} ; [ DW_TAG_pointer_type ]
!455 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 128, i64 32, i64 0, i32 0, metadata !456} ; [ DW_TAG_const_type ]
!456 = metadata !{i32 458771, metadata !3, metadata !"rlimit64", metadata !434, i32 145, i64 128, i64 32, i64 0, i32 0, null, metadata !457, i32 0, null} ; [ DW_TAG_structure_type ]
!457 = metadata !{metadata !458, metadata !460}
!458 = metadata !{i32 458765, metadata !456, metadata !"rlim_cur", metadata !434, i32 147, i64 64, i64 64, i64 0, i32 0, metadata !459} ; [ DW_TAG_member ]
!459 = metadata !{i32 458774, metadata !3, metadata !"rlim64_t", metadata !434, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !222} ; [ DW_TAG_typedef ]
!460 = metadata !{i32 458765, metadata !456, metadata !"rlim_max", metadata !434, i32 149, i64 64, i64 64, i64 64, i32 0, metadata !459} ; [ DW_TAG_member ]
!461 = metadata !{i32 482, i32 0, metadata !427, null}
!462 = metadata !{i32 483, i32 0, metadata !427, null}
!463 = metadata !{i32 474, i32 0, metadata !464, null}
!464 = metadata !{i32 458763, metadata !465, i32 473, i32 0} ; [ DW_TAG_lexical_block ]
!465 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setrlimit", metadata !"setrlimit", metadata !"setrlimit", metadata !3, i32 473, metadata !466, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!466 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !467, i32 0, null} ; [ DW_TAG_subroutine_type ]
!467 = metadata !{metadata !6, metadata !431, metadata !468}
!468 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !469} ; [ DW_TAG_pointer_type ]
!469 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !470} ; [ DW_TAG_const_type ]
!470 = metadata !{i32 458771, metadata !3, metadata !"rlimit", metadata !434, i32 136, i64 64, i64 32, i64 0, i32 0, null, metadata !471, i32 0, null} ; [ DW_TAG_structure_type ]
!471 = metadata !{metadata !472, metadata !474}
!472 = metadata !{i32 458765, metadata !470, metadata !"rlim_cur", metadata !434, i32 138, i64 32, i64 32, i64 0, i32 0, metadata !473} ; [ DW_TAG_member ]
!473 = metadata !{i32 458774, metadata !3, metadata !"rlim_t", metadata !434, i32 132, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_typedef ]
!474 = metadata !{i32 458765, metadata !470, metadata !"rlim_max", metadata !434, i32 140, i64 32, i64 32, i64 32, i32 0, metadata !473} ; [ DW_TAG_member ]
!475 = metadata !{i32 475, i32 0, metadata !464, null}
!476 = metadata !{i32 476, i32 0, metadata !464, null}
!477 = metadata !{i32 467, i32 0, metadata !478, null}
!478 = metadata !{i32 458763, metadata !479, i32 466, i32 0} ; [ DW_TAG_lexical_block ]
!479 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setresuid", metadata !"setresuid", metadata !"setresuid", metadata !3, i32 466, metadata !480, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!480 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !481, i32 0, null} ; [ DW_TAG_subroutine_type ]
!481 = metadata !{metadata !6, metadata !325, metadata !325, metadata !325}
!482 = metadata !{i32 468, i32 0, metadata !478, null}
!483 = metadata !{i32 469, i32 0, metadata !478, null}
!484 = metadata !{i32 460, i32 0, metadata !485, null}
!485 = metadata !{i32 458763, metadata !486, i32 459, i32 0} ; [ DW_TAG_lexical_block ]
!486 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setresgid", metadata !"setresgid", metadata !"setresgid", metadata !3, i32 459, metadata !487, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!487 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !488, i32 0, null} ; [ DW_TAG_subroutine_type ]
!488 = metadata !{metadata !6, metadata !332, metadata !332, metadata !332}
!489 = metadata !{i32 461, i32 0, metadata !485, null}
!490 = metadata !{i32 462, i32 0, metadata !485, null}
!491 = metadata !{i32 453, i32 0, metadata !492, null}
!492 = metadata !{i32 458763, metadata !493, i32 452, i32 0} ; [ DW_TAG_lexical_block ]
!493 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setpriority", metadata !"setpriority", metadata !"setpriority", metadata !3, i32 452, metadata !494, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!494 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !495, i32 0, null} ; [ DW_TAG_subroutine_type ]
!495 = metadata !{metadata !6, metadata !496, metadata !503, metadata !6}
!496 = metadata !{i32 458774, metadata !3, metadata !"__priority_which_t", metadata !497, i32 103, i64 0, i64 0, i64 0, i32 0, metadata !498} ; [ DW_TAG_typedef ]
!497 = metadata !{i32 458769, i32 0, i32 1, metadata !"wait.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!498 = metadata !{i32 458756, metadata !3, metadata !"__priority_which", metadata !434, i32 227, i64 32, i64 32, i64 0, i32 0, null, metadata !499, i32 0, null} ; [ DW_TAG_enumeration_type ]
!499 = metadata !{metadata !500, metadata !501, metadata !502}
!500 = metadata !{i32 458792, metadata !"PRIO_PROCESS", i64 0} ; [ DW_TAG_enumerator ]
!501 = metadata !{i32 458792, metadata !"PRIO_PGRP", i64 1} ; [ DW_TAG_enumerator ]
!502 = metadata !{i32 458792, metadata !"PRIO_USER", i64 2} ; [ DW_TAG_enumerator ]
!503 = metadata !{i32 458774, metadata !3, metadata !"id_t", metadata !208, i32 110, i64 0, i64 0, i64 0, i32 0, metadata !48} ; [ DW_TAG_typedef ]
!504 = metadata !{i32 454, i32 0, metadata !492, null}
!505 = metadata !{i32 455, i32 0, metadata !492, null}
!506 = metadata !{i32 446, i32 0, metadata !507, null}
!507 = metadata !{i32 458763, metadata !508, i32 445, i32 0} ; [ DW_TAG_lexical_block ]
!508 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setpgrp", metadata !"setpgrp", metadata !"setpgrp", metadata !3, i32 445, metadata !377, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!509 = metadata !{i32 447, i32 0, metadata !507, null}
!510 = metadata !{i32 448, i32 0, metadata !507, null}
!511 = metadata !{i32 439, i32 0, metadata !512, null}
!512 = metadata !{i32 458763, metadata !513, i32 438, i32 0} ; [ DW_TAG_lexical_block ]
!513 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setpgid", metadata !"setpgid", metadata !"setpgid", metadata !3, i32 438, metadata !514, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!514 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !515, i32 0, null} ; [ DW_TAG_subroutine_type ]
!515 = metadata !{metadata !6, metadata !423, metadata !423}
!516 = metadata !{i32 440, i32 0, metadata !512, null}
!517 = metadata !{i32 441, i32 0, metadata !512, null}
!518 = metadata !{i32 432, i32 0, metadata !519, null}
!519 = metadata !{i32 458763, metadata !520, i32 431, i32 0} ; [ DW_TAG_lexical_block ]
!520 = metadata !{i32 458798, i32 0, metadata !3, metadata !"sethostname", metadata !"sethostname", metadata !"sethostname", metadata !3, i32 431, metadata !521, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!521 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !522, i32 0, null} ; [ DW_TAG_subroutine_type ]
!522 = metadata !{metadata !6, metadata !205, metadata !102}
!523 = metadata !{i32 433, i32 0, metadata !519, null}
!524 = metadata !{i32 434, i32 0, metadata !519, null}
!525 = metadata !{i32 425, i32 0, metadata !526, null}
!526 = metadata !{i32 458763, metadata !527, i32 424, i32 0} ; [ DW_TAG_lexical_block ]
!527 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setgroups", metadata !"setgroups", metadata !"setgroups", metadata !3, i32 424, metadata !528, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!528 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !529, i32 0, null} ; [ DW_TAG_subroutine_type ]
!529 = metadata !{metadata !6, metadata !102, metadata !530}
!530 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !332} ; [ DW_TAG_pointer_type ]
!531 = metadata !{i32 426, i32 0, metadata !526, null}
!532 = metadata !{i32 427, i32 0, metadata !526, null}
!533 = metadata !{i32 412, i32 0, metadata !534, null}
!534 = metadata !{i32 458763, metadata !535, i32 411, i32 0} ; [ DW_TAG_lexical_block ]
!535 = metadata !{i32 458798, i32 0, metadata !3, metadata !"swapoff", metadata !"swapoff", metadata !"swapoff", metadata !3, i32 411, metadata !536, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!536 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !537, i32 0, null} ; [ DW_TAG_subroutine_type ]
!537 = metadata !{metadata !6, metadata !205}
!538 = metadata !{i32 413, i32 0, metadata !534, null}
!539 = metadata !{i32 414, i32 0, metadata !534, null}
!540 = metadata !{i32 405, i32 0, metadata !541, null}
!541 = metadata !{i32 458763, metadata !542, i32 404, i32 0} ; [ DW_TAG_lexical_block ]
!542 = metadata !{i32 458798, i32 0, metadata !3, metadata !"swapon", metadata !"swapon", metadata !"swapon", metadata !3, i32 404, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!543 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !544, i32 0, null} ; [ DW_TAG_subroutine_type ]
!544 = metadata !{metadata !6, metadata !205, metadata !6}
!545 = metadata !{i32 406, i32 0, metadata !541, null}
!546 = metadata !{i32 407, i32 0, metadata !541, null}
!547 = metadata !{i32 398, i32 0, metadata !548, null}
!548 = metadata !{i32 458763, metadata !549, i32 397, i32 0} ; [ DW_TAG_lexical_block ]
!549 = metadata !{i32 458798, i32 0, metadata !3, metadata !"umount2", metadata !"umount2", metadata !"umount2", metadata !3, i32 397, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!550 = metadata !{i32 399, i32 0, metadata !548, null}
!551 = metadata !{i32 400, i32 0, metadata !548, null}
!552 = metadata !{i32 391, i32 0, metadata !553, null}
!553 = metadata !{i32 458763, metadata !554, i32 390, i32 0} ; [ DW_TAG_lexical_block ]
!554 = metadata !{i32 458798, i32 0, metadata !3, metadata !"umount", metadata !"umount", metadata !"umount", metadata !3, i32 390, metadata !536, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!555 = metadata !{i32 392, i32 0, metadata !553, null}
!556 = metadata !{i32 393, i32 0, metadata !553, null}
!557 = metadata !{i32 384, i32 0, metadata !558, null}
!558 = metadata !{i32 458763, metadata !559, i32 383, i32 0} ; [ DW_TAG_lexical_block ]
!559 = metadata !{i32 458798, i32 0, metadata !3, metadata !"mount", metadata !"mount", metadata !"mount", metadata !3, i32 383, metadata !560, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!560 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !561, i32 0, null} ; [ DW_TAG_subroutine_type ]
!561 = metadata !{metadata !6, metadata !205, metadata !205, metadata !205, metadata !93, metadata !60}
!562 = metadata !{i32 385, i32 0, metadata !558, null}
!563 = metadata !{i32 386, i32 0, metadata !558, null}
!564 = metadata !{i32 304, i32 0, metadata !565, null}
!565 = metadata !{i32 458763, metadata !566, i32 303, i32 0} ; [ DW_TAG_lexical_block ]
!566 = metadata !{i32 458798, i32 0, metadata !3, metadata !"waitid", metadata !"waitid", metadata !"waitid", metadata !3, i32 303, metadata !567, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!567 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !568, i32 0, null} ; [ DW_TAG_subroutine_type ]
!568 = metadata !{metadata !423, metadata !569, metadata !503, metadata !25, metadata !6}
!569 = metadata !{i32 458774, metadata !3, metadata !"idtype_t", metadata !3, i32 181, i64 0, i64 0, i64 0, i32 0, metadata !570} ; [ DW_TAG_typedef ]
!570 = metadata !{i32 458756, metadata !3, metadata !"", metadata !497, i32 103, i64 32, i64 32, i64 0, i32 0, null, metadata !571, i32 0, null} ; [ DW_TAG_enumeration_type ]
!571 = metadata !{metadata !572, metadata !573, metadata !574}
!572 = metadata !{i32 458792, metadata !"P_ALL", i64 0} ; [ DW_TAG_enumerator ]
!573 = metadata !{i32 458792, metadata !"P_PID", i64 1} ; [ DW_TAG_enumerator ]
!574 = metadata !{i32 458792, metadata !"P_PGID", i64 2} ; [ DW_TAG_enumerator ]
!575 = metadata !{i32 305, i32 0, metadata !565, null}
!576 = metadata !{i32 306, i32 0, metadata !565, null}
!577 = metadata !{i32 297, i32 0, metadata !578, null}
!578 = metadata !{i32 458763, metadata !579, i32 296, i32 0} ; [ DW_TAG_lexical_block ]
!579 = metadata !{i32 458798, i32 0, metadata !3, metadata !"waitpid", metadata !"waitpid", metadata !"waitpid", metadata !3, i32 296, metadata !580, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!580 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !581, i32 0, null} ; [ DW_TAG_subroutine_type ]
!581 = metadata !{metadata !423, metadata !423, metadata !132, metadata !6}
!582 = metadata !{i32 298, i32 0, metadata !578, null}
!583 = metadata !{i32 299, i32 0, metadata !578, null}
!584 = metadata !{i32 290, i32 0, metadata !585, null}
!585 = metadata !{i32 458763, metadata !586, i32 289, i32 0} ; [ DW_TAG_lexical_block ]
!586 = metadata !{i32 458798, i32 0, metadata !3, metadata !"wait4", metadata !"wait4", metadata !"wait4", metadata !3, i32 289, metadata !587, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!587 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !588, i32 0, null} ; [ DW_TAG_subroutine_type ]
!588 = metadata !{metadata !423, metadata !423, metadata !132, metadata !6, metadata !589}
!589 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !590} ; [ DW_TAG_pointer_type ]
!590 = metadata !{i32 458771, metadata !3, metadata !"rusage", metadata !434, i32 179, i64 576, i64 32, i64 0, i32 0, null, metadata !591, i32 0, null} ; [ DW_TAG_structure_type ]
!591 = metadata !{metadata !592, metadata !593, metadata !594, metadata !595, metadata !596, metadata !597, metadata !598, metadata !599, metadata !600, metadata !601, metadata !602, metadata !603, metadata !604, metadata !605, metadata !606, metadata !607}
!592 = metadata !{i32 458765, metadata !590, metadata !"ru_utime", metadata !434, i32 181, i64 64, i64 32, i64 0, i32 0, metadata !403} ; [ DW_TAG_member ]
!593 = metadata !{i32 458765, metadata !590, metadata !"ru_stime", metadata !434, i32 183, i64 64, i64 32, i64 64, i32 0, metadata !403} ; [ DW_TAG_member ]
!594 = metadata !{i32 458765, metadata !590, metadata !"ru_maxrss", metadata !434, i32 185, i64 32, i64 32, i64 128, i32 0, metadata !75} ; [ DW_TAG_member ]
!595 = metadata !{i32 458765, metadata !590, metadata !"ru_ixrss", metadata !434, i32 188, i64 32, i64 32, i64 160, i32 0, metadata !75} ; [ DW_TAG_member ]
!596 = metadata !{i32 458765, metadata !590, metadata !"ru_idrss", metadata !434, i32 190, i64 32, i64 32, i64 192, i32 0, metadata !75} ; [ DW_TAG_member ]
!597 = metadata !{i32 458765, metadata !590, metadata !"ru_isrss", metadata !434, i32 192, i64 32, i64 32, i64 224, i32 0, metadata !75} ; [ DW_TAG_member ]
!598 = metadata !{i32 458765, metadata !590, metadata !"ru_minflt", metadata !434, i32 195, i64 32, i64 32, i64 256, i32 0, metadata !75} ; [ DW_TAG_member ]
!599 = metadata !{i32 458765, metadata !590, metadata !"ru_majflt", metadata !434, i32 197, i64 32, i64 32, i64 288, i32 0, metadata !75} ; [ DW_TAG_member ]
!600 = metadata !{i32 458765, metadata !590, metadata !"ru_nswap", metadata !434, i32 199, i64 32, i64 32, i64 320, i32 0, metadata !75} ; [ DW_TAG_member ]
!601 = metadata !{i32 458765, metadata !590, metadata !"ru_inblock", metadata !434, i32 202, i64 32, i64 32, i64 352, i32 0, metadata !75} ; [ DW_TAG_member ]
!602 = metadata !{i32 458765, metadata !590, metadata !"ru_oublock", metadata !434, i32 204, i64 32, i64 32, i64 384, i32 0, metadata !75} ; [ DW_TAG_member ]
!603 = metadata !{i32 458765, metadata !590, metadata !"ru_msgsnd", metadata !434, i32 206, i64 32, i64 32, i64 416, i32 0, metadata !75} ; [ DW_TAG_member ]
!604 = metadata !{i32 458765, metadata !590, metadata !"ru_msgrcv", metadata !434, i32 208, i64 32, i64 32, i64 448, i32 0, metadata !75} ; [ DW_TAG_member ]
!605 = metadata !{i32 458765, metadata !590, metadata !"ru_nsignals", metadata !434, i32 210, i64 32, i64 32, i64 480, i32 0, metadata !75} ; [ DW_TAG_member ]
!606 = metadata !{i32 458765, metadata !590, metadata !"ru_nvcsw", metadata !434, i32 214, i64 32, i64 32, i64 512, i32 0, metadata !75} ; [ DW_TAG_member ]
!607 = metadata !{i32 458765, metadata !590, metadata !"ru_nivcsw", metadata !434, i32 217, i64 32, i64 32, i64 544, i32 0, metadata !75} ; [ DW_TAG_member ]
!608 = metadata !{i32 291, i32 0, metadata !585, null}
!609 = metadata !{i32 292, i32 0, metadata !585, null}
!610 = metadata !{i32 283, i32 0, metadata !611, null}
!611 = metadata !{i32 458763, metadata !612, i32 282, i32 0} ; [ DW_TAG_lexical_block ]
!612 = metadata !{i32 458798, i32 0, metadata !3, metadata !"wait3", metadata !"wait3", metadata !"wait3", metadata !3, i32 282, metadata !613, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!613 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !614, i32 0, null} ; [ DW_TAG_subroutine_type ]
!614 = metadata !{metadata !423, metadata !132, metadata !6, metadata !589}
!615 = metadata !{i32 284, i32 0, metadata !611, null}
!616 = metadata !{i32 285, i32 0, metadata !611, null}
!617 = metadata !{i32 276, i32 0, metadata !618, null}
!618 = metadata !{i32 458763, metadata !619, i32 275, i32 0} ; [ DW_TAG_lexical_block ]
!619 = metadata !{i32 458798, i32 0, metadata !3, metadata !"wait", metadata !"wait", metadata !"wait", metadata !3, i32 275, metadata !620, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!620 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !621, i32 0, null} ; [ DW_TAG_subroutine_type ]
!621 = metadata !{metadata !423, metadata !132}
!622 = metadata !{i32 277, i32 0, metadata !618, null}
!623 = metadata !{i32 278, i32 0, metadata !618, null}
!624 = metadata !{i32 233, i32 0, metadata !625, null}
!625 = metadata !{i32 458763, metadata !626, i32 232, i32 0} ; [ DW_TAG_lexical_block ]
!626 = metadata !{i32 458798, i32 0, metadata !3, metadata !"futimes", metadata !"futimes", metadata !"futimes", metadata !3, i32 232, metadata !627, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!627 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !628, i32 0, null} ; [ DW_TAG_subroutine_type ]
!628 = metadata !{metadata !6, metadata !6, metadata !401}
!629 = metadata !{i32 234, i32 0, metadata !625, null}
!630 = metadata !{i32 235, i32 0, metadata !625, null}
!631 = metadata !{i32 226, i32 0, metadata !632, null}
!632 = metadata !{i32 458763, metadata !633, i32 225, i32 0} ; [ DW_TAG_lexical_block ]
!633 = metadata !{i32 458798, i32 0, metadata !3, metadata !"utimes", metadata !"utimes", metadata !"utimes", metadata !3, i32 225, metadata !634, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!634 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !635, i32 0, null} ; [ DW_TAG_subroutine_type ]
!635 = metadata !{metadata !6, metadata !205, metadata !401}
!636 = metadata !{i32 227, i32 0, metadata !632, null}
!637 = metadata !{i32 228, i32 0, metadata !632, null}
!638 = metadata !{i32 219, i32 0, metadata !639, null}
!639 = metadata !{i32 458763, metadata !640, i32 218, i32 0} ; [ DW_TAG_lexical_block ]
!640 = metadata !{i32 458798, i32 0, metadata !3, metadata !"utime", metadata !"utime", metadata !"utime", metadata !3, i32 218, metadata !641, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!641 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !642, i32 0, null} ; [ DW_TAG_subroutine_type ]
!642 = metadata !{metadata !6, metadata !205, metadata !643}
!643 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !644} ; [ DW_TAG_pointer_type ]
!644 = metadata !{i32 458790, metadata !3, metadata !"", metadata !3, i32 0, i64 64, i64 32, i64 0, i32 0, metadata !645} ; [ DW_TAG_const_type ]
!645 = metadata !{i32 458771, metadata !3, metadata !"utimbuf", metadata !646, i32 39, i64 64, i64 32, i64 0, i32 0, null, metadata !647, i32 0, null} ; [ DW_TAG_structure_type ]
!646 = metadata !{i32 458769, i32 0, i32 1, metadata !"utime.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!647 = metadata !{metadata !648, metadata !649}
!648 = metadata !{i32 458765, metadata !645, metadata !"actime", metadata !646, i32 40, i64 32, i64 32, i64 0, i32 0, metadata !260} ; [ DW_TAG_member ]
!649 = metadata !{i32 458765, metadata !645, metadata !"modtime", metadata !646, i32 41, i64 32, i64 32, i64 32, i32 0, metadata !260} ; [ DW_TAG_member ]
!650 = metadata !{i32 220, i32 0, metadata !639, null}
!651 = metadata !{i32 221, i32 0, metadata !639, null}
!652 = metadata !{i32 261, i32 0, metadata !653, null}
!653 = metadata !{i32 458763, metadata !654, i32 260, i32 0} ; [ DW_TAG_lexical_block ]
!654 = metadata !{i32 458798, i32 0, metadata !3, metadata !"canonicalize_file_name", metadata !"canonicalize_file_name", metadata !"canonicalize_file_name", metadata !3, i32 260, metadata !655, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!655 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !656, i32 0, null} ; [ DW_TAG_subroutine_type ]
!656 = metadata !{metadata !148, metadata !205}
!657 = metadata !{i32 262, i32 0, metadata !653, null}
!658 = metadata !{i32 263, i32 0, metadata !653, null}
!659 = metadata !{i32 264, i32 0, metadata !653, null}
!660 = metadata !{i32 265, i32 0, metadata !653, null}
!661 = metadata !{i32 239, i32 0, metadata !662, null}
!662 = metadata !{i32 458763, metadata !663, i32 238, i32 0} ; [ DW_TAG_lexical_block ]
!663 = metadata !{i32 458763, metadata !664, i32 238, i32 0} ; [ DW_TAG_lexical_block ]
!664 = metadata !{i32 458798, i32 0, metadata !3, metadata !"strverscmp", metadata !"strverscmp", metadata !"strverscmp", metadata !3, i32 238, metadata !235, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!665 = metadata !{i32 239, i32 0, metadata !663, null}
!666 = metadata !{i32 214, i32 0, metadata !667, null}
!667 = metadata !{i32 458763, metadata !668, i32 213, i32 0} ; [ DW_TAG_lexical_block ]
!668 = metadata !{i32 458798, i32 0, metadata !3, metadata !"group_member", metadata !"group_member", metadata !"group_member", metadata !3, i32 213, metadata !330, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!669 = metadata !{i32 204, i32 0, metadata !670, null}
!670 = metadata !{i32 458763, metadata !671, i32 203, i32 0} ; [ DW_TAG_lexical_block ]
!671 = metadata !{i32 458798, i32 0, metadata !3, metadata !"euidaccess", metadata !"euidaccess", metadata !"euidaccess", metadata !3, i32 203, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!672 = metadata !{i32 209, i32 0, metadata !673, null}
!673 = metadata !{i32 458763, metadata !674, i32 208, i32 0} ; [ DW_TAG_lexical_block ]
!674 = metadata !{i32 458798, i32 0, metadata !3, metadata !"eaccess", metadata !"eaccess", metadata !"eaccess", metadata !3, i32 208, metadata !543, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!675 = metadata !{i32 198, i32 0, metadata !676, null}
!676 = metadata !{i32 458763, metadata !677, i32 197, i32 0} ; [ DW_TAG_lexical_block ]
!677 = metadata !{i32 458798, i32 0, metadata !3, metadata !"utmpxname", metadata !"utmpxname", metadata !"utmpxname", metadata !3, i32 197, metadata !536, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!678 = metadata !{i32 199, i32 0, metadata !676, null}
!679 = metadata !{i32 193, i32 0, metadata !680, null}
!680 = metadata !{i32 458763, metadata !681, i32 192, i32 0} ; [ DW_TAG_lexical_block ]
!681 = metadata !{i32 458798, i32 0, metadata !3, metadata !"endutxent", metadata !"endutxent", metadata !"endutxent", metadata !3, i32 192, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!682 = metadata !{i32 194, i32 0, metadata !680, null}
!683 = metadata !{i32 188, i32 0, metadata !684, null}
!684 = metadata !{i32 458763, metadata !685, i32 187, i32 0} ; [ DW_TAG_lexical_block ]
!685 = metadata !{i32 458798, i32 0, metadata !3, metadata !"setutxent", metadata !"setutxent", metadata !"setutxent", metadata !3, i32 187, metadata !99, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!686 = metadata !{i32 189, i32 0, metadata !684, null}
!687 = metadata !{i32 183, i32 0, metadata !688, null}
!688 = metadata !{i32 458763, metadata !689, i32 182, i32 0} ; [ DW_TAG_lexical_block ]
!689 = metadata !{i32 458798, i32 0, metadata !3, metadata !"getutxent", metadata !"getutxent", metadata !"getutxent", metadata !3, i32 182, metadata !690, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!690 = metadata !{i32 458773, metadata !3, metadata !"", metadata !3, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !691, i32 0, null} ; [ DW_TAG_subroutine_type ]
!691 = metadata !{metadata !692}
!692 = metadata !{i32 458767, metadata !3, metadata !"", metadata !3, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !693} ; [ DW_TAG_pointer_type ]
!693 = metadata !{i32 458771, metadata !3, metadata !"utmpx", metadata !3, i32 181, i64 0, i64 0, i64 0, i32 4, null, null, i32 0, null} ; [ DW_TAG_structure_type ]
