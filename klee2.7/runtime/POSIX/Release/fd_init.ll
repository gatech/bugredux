; ModuleID = 'fd_init.c'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32"
target triple = "i386-linux-gnu"

%struct.exe_disk_file_t = type { i32, i8*, %struct.stat64* }
%struct.exe_file_system_t = type { i32, %struct.exe_disk_file_t*, %struct.exe_disk_file_t*, i32, %struct.exe_disk_file_t*, i32, i32*, i32*, i32*, i32*, i32*, i32*, i32* }
%struct.exe_file_t = type { i32, i32, i64, %struct.exe_disk_file_t* }
%struct.exe_sym_env_t = type { [32 x %struct.exe_file_t], i32, i32, i32 }
%struct.stat64 = type { i64, i32, i32, i32, i32, i32, i32, i64, i32, i64, i32, i64, %struct.timespec, %struct.timespec, %struct.timespec, i64 }
%struct.timespec = type { i32, i32 }

@__exe_env = global %struct.exe_sym_env_t { [32 x %struct.exe_file_t] [%struct.exe_file_t { i32 0, i32 5, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 1, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t { i32 2, i32 9, i64 0, %struct.exe_disk_file_t* null }, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer, %struct.exe_file_t zeroinitializer], i32 18, i32 0, i32 0 }, align 32 ; <%struct.exe_sym_env_t*> [#uses=4]
@.str = private constant [6 x i8] c"-stat\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str1 = private constant [5 x i8] c"size\00", align 1 ; <[5 x i8]*> [#uses=1]
@.str2 = private constant [10 x i8] c"fd_init.c\00", align 1 ; <[10 x i8]*> [#uses=1]
@__PRETTY_FUNCTION__.4054 = internal constant [19 x i8] c"__create_new_dfile\00" ; <[19 x i8]*> [#uses=1]
@.str4 = private constant [2 x i8] c".\00", align 1 ; <[2 x i8]*> [#uses=1]
@__exe_fs = common global %struct.exe_file_system_t zeroinitializer, align 32 ; <%struct.exe_file_system_t*> [#uses=11]
@.str5 = private constant [6 x i8] c"stdin\00", align 1 ; <[6 x i8]*> [#uses=1]
@.str6 = private constant [10 x i8] c"read_fail\00", align 1 ; <[10 x i8]*> [#uses=1]
@.str7 = private constant [11 x i8] c"write_fail\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str8 = private constant [11 x i8] c"close_fail\00", align 1 ; <[11 x i8]*> [#uses=1]
@.str9 = private constant [15 x i8] c"ftruncate_fail\00", align 1 ; <[15 x i8]*> [#uses=1]
@.str10 = private constant [12 x i8] c"getcwd_fail\00", align 1 ; <[12 x i8]*> [#uses=1]
@.str11 = private constant [7 x i8] c"stdout\00", align 1 ; <[7 x i8]*> [#uses=1]
@.str12 = private constant [14 x i8] c"model_version\00", align 1 ; <[14 x i8]*> [#uses=1]

declare void @klee_make_symbolic(i8*, i32, i8*)

define internal fastcc void @__create_new_dfile(%struct.exe_disk_file_t* nocapture %dfile, i32 %size, i8* %name, %struct.stat64* nocapture %defaults) nounwind {
entry:
  %sname = alloca [64 x i8], align 1              ; <[64 x i8]*> [#uses=3]
  %0 = call noalias i8* @malloc(i32 96) nounwind, !dbg !94 ; <i8*> [#uses=29]
  %1 = bitcast i8* %0 to %struct.stat64*, !dbg !94 ; <%struct.stat64*> [#uses=1]
  %2 = load i8* %name, align 1, !dbg !101         ; <i8> [#uses=2]
  %3 = icmp eq i8 %2, 0, !dbg !101                ; <i1> [#uses=1]
  br i1 %3, label %bb2, label %bb, !dbg !101

bb:                                               ; preds = %entry, %bb.bb_crit_edge
  %4 = phi i8 [ %7, %bb.bb_crit_edge ], [ %2, %entry ] ; <i8> [#uses=1]
  %indvar = phi i32 [ %phitmp, %bb.bb_crit_edge ], [ 1, %entry ] ; <i32> [#uses=4]
  %5 = phi i32 [ %indvar, %bb.bb_crit_edge ], [ 0, %entry ] ; <i32> [#uses=1]
  %6 = getelementptr inbounds [64 x i8]* %sname, i32 0, i32 %5, !dbg !102 ; <i8*> [#uses=1]
  store i8 %4, i8* %6, align 1, !dbg !102
  %scevgep = getelementptr i8* %name, i32 %indvar ; <i8*> [#uses=1]
  %7 = load i8* %scevgep, align 1, !dbg !101      ; <i8> [#uses=2]
  %8 = icmp eq i8 %7, 0, !dbg !101                ; <i1> [#uses=1]
  br i1 %8, label %bb2, label %bb.bb_crit_edge, !dbg !101

bb.bb_crit_edge:                                  ; preds = %bb
  %phitmp = add i32 %indvar, 1                    ; <i32> [#uses=1]
  br label %bb

bb2:                                              ; preds = %bb, %entry
  %.lcssa = phi i32 [ 0, %entry ], [ %indvar, %bb ] ; <i32> [#uses=1]
  %9 = getelementptr inbounds [64 x i8]* %sname, i32 0, i32 %.lcssa, !dbg !103 ; <i8*> [#uses=1]
  call void @llvm.memcpy.i32(i8* %9, i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i32 6, i32 1), !dbg !103
  %10 = icmp eq i32 %size, 0, !dbg !104           ; <i1> [#uses=1]
  br i1 %10, label %bb3, label %bb4, !dbg !104

bb3:                                              ; preds = %bb2
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0), i32 55, i8* getelementptr inbounds ([19 x i8]* @__PRETTY_FUNCTION__.4054, i32 0, i32 0)) noreturn nounwind, !dbg !104
  unreachable, !dbg !104

bb4:                                              ; preds = %bb2
  %11 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i32 0, i32 0, !dbg !105 ; <i32*> [#uses=2]
  store i32 %size, i32* %11, align 4, !dbg !105
  %12 = call noalias i8* @malloc(i32 %size) nounwind, !dbg !106 ; <i8*> [#uses=2]
  %13 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i32 0, i32 1, !dbg !106 ; <i8**> [#uses=1]
  store i8* %12, i8** %13, align 4, !dbg !106
  call void @klee_make_symbolic(i8* %12, i32 %size, i8* %name) nounwind, !dbg !107
  %sname5 = getelementptr inbounds [64 x i8]* %sname, i32 0, i32 0 ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %0, i32 96, i8* %sname5) nounwind, !dbg !108
  %14 = getelementptr inbounds i8* %0, i32 88     ; <i8*> [#uses=1]
  %15 = bitcast i8* %14 to i64*                   ; <i64*> [#uses=3]
  %16 = load i64* %15, align 4, !dbg !109         ; <i64> [#uses=1]
  %17 = trunc i64 %16 to i32, !dbg !109           ; <i32> [#uses=1]
  %18 = call i32 @klee_is_symbolic(i32 %17) nounwind, !dbg !109 ; <i32> [#uses=1]
  %19 = icmp eq i32 %18, 0, !dbg !109             ; <i1> [#uses=1]
  %20 = load i64* %15, align 4, !dbg !109         ; <i64> [#uses=3]
  br i1 %19, label %bb6, label %bb8, !dbg !109

bb6:                                              ; preds = %bb4
  %21 = and i64 %20, 2147483647, !dbg !109        ; <i64> [#uses=1]
  %22 = icmp eq i64 %21, 0, !dbg !109             ; <i1> [#uses=1]
  br i1 %22, label %bb7, label %bb8, !dbg !109

bb7:                                              ; preds = %bb6
  %23 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 15, !dbg !110 ; <i64*> [#uses=1]
  %24 = load i64* %23, align 4, !dbg !110         ; <i64> [#uses=2]
  store i64 %24, i64* %15, align 4, !dbg !110
  br label %bb8, !dbg !110

bb8:                                              ; preds = %bb4, %bb7, %bb6
  %25 = phi i64 [ %24, %bb7 ], [ %20, %bb6 ], [ %20, %bb4 ] ; <i64> [#uses=1]
  %26 = and i64 %25, 2147483647, !dbg !111        ; <i64> [#uses=1]
  %27 = icmp ne i64 %26, 0, !dbg !111             ; <i1> [#uses=1]
  %28 = zext i1 %27 to i32, !dbg !111             ; <i32> [#uses=1]
  call void @klee_assume(i32 %28) nounwind, !dbg !111
  %29 = getelementptr inbounds i8* %0, i32 52     ; <i8*> [#uses=1]
  %30 = bitcast i8* %29 to i32*                   ; <i32*> [#uses=2]
  %31 = load i32* %30, align 4, !dbg !112         ; <i32> [#uses=1]
  %32 = icmp ult i32 %31, 65536                   ; <i1> [#uses=1]
  %33 = zext i1 %32 to i32, !dbg !112             ; <i32> [#uses=1]
  call void @klee_assume(i32 %33) nounwind, !dbg !112
  %34 = getelementptr inbounds i8* %0, i32 16     ; <i8*> [#uses=1]
  %35 = bitcast i8* %34 to i32*                   ; <i32*> [#uses=5]
  %36 = load i32* %35, align 4, !dbg !113         ; <i32> [#uses=1]
  %37 = and i32 %36, -61952, !dbg !113            ; <i32> [#uses=1]
  %38 = icmp eq i32 %37, 0, !dbg !113             ; <i1> [#uses=1]
  %39 = zext i1 %38 to i32, !dbg !113             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %39) nounwind, !dbg !113
  %40 = bitcast i8* %0 to i64*                    ; <i64*> [#uses=1]
  %41 = load i64* %40, align 4, !dbg !114         ; <i64> [#uses=1]
  %42 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 0, !dbg !114 ; <i64*> [#uses=1]
  %43 = load i64* %42, align 4, !dbg !114         ; <i64> [#uses=1]
  %44 = icmp eq i64 %41, %43, !dbg !114           ; <i1> [#uses=1]
  %45 = zext i1 %44 to i32, !dbg !114             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %45) nounwind, !dbg !114
  %46 = getelementptr inbounds i8* %0, i32 32     ; <i8*> [#uses=1]
  %47 = bitcast i8* %46 to i64*                   ; <i64*> [#uses=1]
  %48 = load i64* %47, align 4, !dbg !115         ; <i64> [#uses=1]
  %49 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 7, !dbg !115 ; <i64*> [#uses=1]
  %50 = load i64* %49, align 4, !dbg !115         ; <i64> [#uses=1]
  %51 = icmp eq i64 %48, %50, !dbg !115           ; <i1> [#uses=1]
  %52 = zext i1 %51 to i32, !dbg !115             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %52) nounwind, !dbg !115
  %53 = load i32* %35, align 4, !dbg !116         ; <i32> [#uses=1]
  %54 = and i32 %53, 448, !dbg !116               ; <i32> [#uses=1]
  %55 = icmp eq i32 %54, 384, !dbg !116           ; <i1> [#uses=1]
  %56 = zext i1 %55 to i32, !dbg !116             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %56) nounwind, !dbg !116
  %57 = load i32* %35, align 4, !dbg !117         ; <i32> [#uses=1]
  %58 = and i32 %57, 56, !dbg !117                ; <i32> [#uses=1]
  %59 = icmp eq i32 %58, 16, !dbg !117            ; <i1> [#uses=1]
  %60 = zext i1 %59 to i32, !dbg !117             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %60) nounwind, !dbg !117
  %61 = load i32* %35, align 4, !dbg !118         ; <i32> [#uses=1]
  %62 = and i32 %61, 7, !dbg !118                 ; <i32> [#uses=1]
  %63 = icmp eq i32 %62, 2, !dbg !118             ; <i1> [#uses=1]
  %64 = zext i1 %63 to i32, !dbg !118             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %64) nounwind, !dbg !118
  %65 = load i32* %35, align 4, !dbg !119         ; <i32> [#uses=1]
  %66 = and i32 %65, 61440, !dbg !119             ; <i32> [#uses=1]
  %67 = icmp eq i32 %66, 32768, !dbg !119         ; <i1> [#uses=1]
  %68 = zext i1 %67 to i32, !dbg !119             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %68) nounwind, !dbg !119
  %69 = getelementptr inbounds i8* %0, i32 20     ; <i8*> [#uses=1]
  %70 = bitcast i8* %69 to i32*                   ; <i32*> [#uses=1]
  %71 = load i32* %70, align 4, !dbg !120         ; <i32> [#uses=1]
  %72 = icmp eq i32 %71, 1, !dbg !120             ; <i1> [#uses=1]
  %73 = zext i1 %72 to i32, !dbg !120             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %73) nounwind, !dbg !120
  %74 = getelementptr inbounds i8* %0, i32 24     ; <i8*> [#uses=1]
  %75 = bitcast i8* %74 to i32*                   ; <i32*> [#uses=1]
  %76 = load i32* %75, align 4, !dbg !121         ; <i32> [#uses=1]
  %77 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 5, !dbg !121 ; <i32*> [#uses=1]
  %78 = load i32* %77, align 4, !dbg !121         ; <i32> [#uses=1]
  %79 = icmp eq i32 %76, %78, !dbg !121           ; <i1> [#uses=1]
  %80 = zext i1 %79 to i32, !dbg !121             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %80) nounwind, !dbg !121
  %81 = getelementptr inbounds i8* %0, i32 28     ; <i8*> [#uses=1]
  %82 = bitcast i8* %81 to i32*                   ; <i32*> [#uses=1]
  %83 = load i32* %82, align 4, !dbg !122         ; <i32> [#uses=1]
  %84 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 6, !dbg !122 ; <i32*> [#uses=1]
  %85 = load i32* %84, align 4, !dbg !122         ; <i32> [#uses=1]
  %86 = icmp eq i32 %83, %85, !dbg !122           ; <i1> [#uses=1]
  %87 = zext i1 %86 to i32, !dbg !122             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %87) nounwind, !dbg !122
  %88 = load i32* %30, align 4, !dbg !123         ; <i32> [#uses=1]
  %89 = icmp eq i32 %88, 4096, !dbg !123          ; <i1> [#uses=1]
  %90 = zext i1 %89 to i32, !dbg !123             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %90) nounwind, !dbg !123
  %91 = getelementptr inbounds i8* %0, i32 64     ; <i8*> [#uses=1]
  %92 = bitcast i8* %91 to i32*                   ; <i32*> [#uses=1]
  %93 = load i32* %92, align 4, !dbg !124         ; <i32> [#uses=1]
  %94 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 12, i32 0 ; <i32*> [#uses=1]
  %95 = load i32* %94, align 4, !dbg !124         ; <i32> [#uses=1]
  %96 = icmp eq i32 %93, %95, !dbg !124           ; <i1> [#uses=1]
  %97 = zext i1 %96 to i32, !dbg !124             ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %97) nounwind, !dbg !124
  %98 = getelementptr inbounds i8* %0, i32 72     ; <i8*> [#uses=1]
  %99 = bitcast i8* %98 to i32*                   ; <i32*> [#uses=1]
  %100 = load i32* %99, align 4, !dbg !125        ; <i32> [#uses=1]
  %101 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 13, i32 0 ; <i32*> [#uses=1]
  %102 = load i32* %101, align 4, !dbg !125       ; <i32> [#uses=1]
  %103 = icmp eq i32 %100, %102, !dbg !125        ; <i1> [#uses=1]
  %104 = zext i1 %103 to i32, !dbg !125           ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %104) nounwind, !dbg !125
  %105 = getelementptr inbounds i8* %0, i32 80    ; <i8*> [#uses=1]
  %106 = bitcast i8* %105 to i32*                 ; <i32*> [#uses=1]
  %107 = load i32* %106, align 4, !dbg !126       ; <i32> [#uses=1]
  %108 = getelementptr inbounds %struct.stat64* %defaults, i32 0, i32 14, i32 0 ; <i32*> [#uses=1]
  %109 = load i32* %108, align 4, !dbg !126       ; <i32> [#uses=1]
  %110 = icmp eq i32 %107, %109, !dbg !126        ; <i1> [#uses=1]
  %111 = zext i1 %110 to i32, !dbg !126           ; <i32> [#uses=1]
  call void @klee_prefer_cex(i8* %0, i32 %111) nounwind, !dbg !126
  %112 = load i32* %11, align 4, !dbg !127        ; <i32> [#uses=1]
  %113 = zext i32 %112 to i64, !dbg !127          ; <i64> [#uses=1]
  %114 = getelementptr inbounds i8* %0, i32 44    ; <i8*> [#uses=1]
  %115 = bitcast i8* %114 to i64*                 ; <i64*> [#uses=1]
  store i64 %113, i64* %115, align 4, !dbg !127
  %116 = getelementptr inbounds i8* %0, i32 56    ; <i8*> [#uses=1]
  %117 = bitcast i8* %116 to i64*                 ; <i64*> [#uses=1]
  store i64 8, i64* %117, align 4, !dbg !128
  %118 = getelementptr inbounds %struct.exe_disk_file_t* %dfile, i32 0, i32 2, !dbg !129 ; <%struct.stat64**> [#uses=1]
  store %struct.stat64* %1, %struct.stat64** %118, align 4, !dbg !129
  ret void, !dbg !130
}

declare noalias i8* @malloc(i32) nounwind

declare void @llvm.memcpy.i32(i8* nocapture, i8* nocapture, i32, i32) nounwind

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare i32 @klee_is_symbolic(i32)

declare void @klee_assume(i32)

declare void @klee_prefer_cex(i8*, i32)

define void @klee_init_fds(i32 %n_files, i32 %file_length, i32 %sym_stdout_flag, i32 %save_all_writes_flag, i32 %max_failures) nounwind {
entry:
  %x.i = alloca i32, align 4                      ; <i32*> [#uses=2]
  %name = alloca [7 x i8], align 1                ; <[7 x i8]*> [#uses=7]
  %s = alloca %struct.stat64, align 8             ; <%struct.stat64*> [#uses=4]
  %0 = getelementptr inbounds [7 x i8]* %name, i32 0, i32 0, !dbg !131 ; <i8*> [#uses=3]
  store i8 63, i8* %0, align 1, !dbg !131
  %1 = getelementptr inbounds [7 x i8]* %name, i32 0, i32 1, !dbg !131 ; <i8*> [#uses=1]
  store i8 45, i8* %1, align 1, !dbg !131
  %2 = getelementptr inbounds [7 x i8]* %name, i32 0, i32 2, !dbg !131 ; <i8*> [#uses=1]
  store i8 100, i8* %2, align 1, !dbg !131
  %3 = getelementptr inbounds [7 x i8]* %name, i32 0, i32 3, !dbg !131 ; <i8*> [#uses=1]
  store i8 97, i8* %3, align 1, !dbg !131
  %4 = getelementptr inbounds [7 x i8]* %name, i32 0, i32 4, !dbg !131 ; <i8*> [#uses=1]
  store i8 116, i8* %4, align 1, !dbg !131
  %5 = getelementptr inbounds [7 x i8]* %name, i32 0, i32 5, !dbg !131 ; <i8*> [#uses=1]
  store i8 97, i8* %5, align 1, !dbg !131
  %6 = getelementptr inbounds [7 x i8]* %name, i32 0, i32 6, !dbg !131 ; <i8*> [#uses=1]
  store i8 0, i8* %6, align 1, !dbg !131
  %7 = call i32 @stat64(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0), %struct.stat64* %s) nounwind, !dbg !136 ; <i32> [#uses=0]
  store i32 %n_files, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 0), align 32, !dbg !137
  %8 = mul i32 %n_files, 12, !dbg !138            ; <i32> [#uses=1]
  %9 = call noalias i8* @malloc(i32 %8) nounwind, !dbg !138 ; <i8*> [#uses=1]
  %10 = bitcast i8* %9 to %struct.exe_disk_file_t*, !dbg !138 ; <%struct.exe_disk_file_t*> [#uses=2]
  store %struct.exe_disk_file_t* %10, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 16, !dbg !138
  %11 = icmp eq i32 %n_files, 0                   ; <i1> [#uses=1]
  br i1 %11, label %bb3, label %bb, !dbg !139

bb:                                               ; preds = %entry, %bb.bb_crit_edge
  %12 = phi %struct.exe_disk_file_t* [ %.pre, %bb.bb_crit_edge ], [ %10, %entry ] ; <%struct.exe_disk_file_t*> [#uses=1]
  %k.012 = phi i32 [ %13, %bb.bb_crit_edge ], [ 0, %entry ] ; <i32> [#uses=3]
  %tmp = add i32 %k.012, 65                       ; <i32> [#uses=1]
  %tmp13 = trunc i32 %tmp to i8                   ; <i8> [#uses=1]
  store i8 %tmp13, i8* %0, align 1, !dbg !140
  %scevgep = getelementptr %struct.exe_disk_file_t* %12, i32 %k.012 ; <%struct.exe_disk_file_t*> [#uses=1]
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %scevgep, i32 %file_length, i8* %0, %struct.stat64* %s) nounwind, !dbg !141
  %13 = add i32 %k.012, 1, !dbg !139              ; <i32> [#uses=2]
  %exitcond = icmp eq i32 %13, %n_files           ; <i1> [#uses=1]
  br i1 %exitcond, label %bb3, label %bb.bb_crit_edge, !dbg !139

bb.bb_crit_edge:                                  ; preds = %bb
  %.pre = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 4), align 16 ; <%struct.exe_disk_file_t*> [#uses=1]
  br label %bb

bb3:                                              ; preds = %bb, %entry
  %14 = icmp eq i32 %file_length, 0, !dbg !142    ; <i1> [#uses=1]
  br i1 %14, label %bb5, label %bb4, !dbg !142

bb4:                                              ; preds = %bb3
  %15 = call noalias i8* @malloc(i32 12) nounwind, !dbg !143 ; <i8*> [#uses=1]
  %16 = bitcast i8* %15 to %struct.exe_disk_file_t*, !dbg !143 ; <%struct.exe_disk_file_t*> [#uses=2]
  store %struct.exe_disk_file_t* %16, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 1), align 4, !dbg !143
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %16, i32 %file_length, i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), %struct.stat64* %s) nounwind, !dbg !144
  %17 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 1), align 4, !dbg !145 ; <%struct.exe_disk_file_t*> [#uses=1]
  store %struct.exe_disk_file_t* %17, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 0, i32 3), align 16, !dbg !145
  br label %bb6, !dbg !145

bb5:                                              ; preds = %bb3
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 1), align 4, !dbg !146
  br label %bb6, !dbg !146

bb6:                                              ; preds = %bb5, %bb4
  store i32 %max_failures, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 5), align 4, !dbg !147
  %18 = icmp eq i32 %max_failures, 0, !dbg !148   ; <i1> [#uses=1]
  br i1 %18, label %bb8, label %bb7, !dbg !148

bb7:                                              ; preds = %bb6
  %19 = call noalias i8* @malloc(i32 4) nounwind, !dbg !149 ; <i8*> [#uses=2]
  %20 = bitcast i8* %19 to i32*, !dbg !149        ; <i32*> [#uses=1]
  store i32* %20, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 6), align 8, !dbg !149
  %21 = call noalias i8* @malloc(i32 4) nounwind, !dbg !150 ; <i8*> [#uses=1]
  %22 = bitcast i8* %21 to i32*, !dbg !150        ; <i32*> [#uses=1]
  store i32* %22, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 7), align 4, !dbg !150
  %23 = call noalias i8* @malloc(i32 4) nounwind, !dbg !151 ; <i8*> [#uses=1]
  %24 = bitcast i8* %23 to i32*, !dbg !151        ; <i32*> [#uses=1]
  store i32* %24, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 8), align 32, !dbg !151
  %25 = call noalias i8* @malloc(i32 4) nounwind, !dbg !152 ; <i8*> [#uses=1]
  %26 = bitcast i8* %25 to i32*, !dbg !152        ; <i32*> [#uses=1]
  store i32* %26, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 9), align 4, !dbg !152
  %27 = call noalias i8* @malloc(i32 4) nounwind, !dbg !153 ; <i8*> [#uses=1]
  %28 = bitcast i8* %27 to i32*, !dbg !153        ; <i32*> [#uses=1]
  store i32* %28, i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 10), align 8, !dbg !153
  call void @klee_make_symbolic(i8* %19, i32 4, i8* getelementptr inbounds ([10 x i8]* @.str6, i32 0, i32 0)) nounwind, !dbg !154
  %29 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 7), align 4, !dbg !155 ; <i32*> [#uses=1]
  %30 = bitcast i32* %29 to i8*, !dbg !155        ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %30, i32 4, i8* getelementptr inbounds ([11 x i8]* @.str7, i32 0, i32 0)) nounwind, !dbg !155
  %31 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 8), align 32, !dbg !156 ; <i32*> [#uses=1]
  %32 = bitcast i32* %31 to i8*, !dbg !156        ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %32, i32 4, i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0)) nounwind, !dbg !156
  %33 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 9), align 4, !dbg !157 ; <i32*> [#uses=1]
  %34 = bitcast i32* %33 to i8*, !dbg !157        ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %34, i32 4, i8* getelementptr inbounds ([15 x i8]* @.str9, i32 0, i32 0)) nounwind, !dbg !157
  %35 = load i32** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 10), align 8, !dbg !158 ; <i32*> [#uses=1]
  %36 = bitcast i32* %35 to i8*, !dbg !158        ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %36, i32 4, i8* getelementptr inbounds ([12 x i8]* @.str10, i32 0, i32 0)) nounwind, !dbg !158
  br label %bb8, !dbg !158

bb8:                                              ; preds = %bb6, %bb7
  %37 = icmp eq i32 %sym_stdout_flag, 0, !dbg !159 ; <i1> [#uses=1]
  br i1 %37, label %bb10, label %bb9, !dbg !159

bb9:                                              ; preds = %bb8
  %38 = call noalias i8* @malloc(i32 12) nounwind, !dbg !160 ; <i8*> [#uses=1]
  %39 = bitcast i8* %38 to %struct.exe_disk_file_t*, !dbg !160 ; <%struct.exe_disk_file_t*> [#uses=2]
  store %struct.exe_disk_file_t* %39, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 2), align 8, !dbg !160
  call fastcc void @__create_new_dfile(%struct.exe_disk_file_t* %39, i32 1024, i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0), %struct.stat64* %s) nounwind, !dbg !161
  %40 = load %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 2), align 8, !dbg !162 ; <%struct.exe_disk_file_t*> [#uses=1]
  store %struct.exe_disk_file_t* %40, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 0, i32 1, i32 3), align 4, !dbg !162
  store i32 0, i32* getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 3), align 4, !dbg !163
  br label %bb11, !dbg !163

bb10:                                             ; preds = %bb8
  store %struct.exe_disk_file_t* null, %struct.exe_disk_file_t** getelementptr inbounds (%struct.exe_file_system_t* @__exe_fs, i32 0, i32 2), align 8, !dbg !164
  br label %bb11, !dbg !164

bb11:                                             ; preds = %bb10, %bb9
  store i32 %save_all_writes_flag, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 3), align 8, !dbg !165
  %x1.i = bitcast i32* %x.i to i8*                ; <i8*> [#uses=1]
  call void @klee_make_symbolic(i8* %x1.i, i32 4, i8* getelementptr inbounds ([14 x i8]* @.str12, i32 0, i32 0)) nounwind
  %41 = load i32* %x.i, align 4                   ; <i32> [#uses=2]
  store i32 %41, i32* getelementptr inbounds (%struct.exe_sym_env_t* @__exe_env, i32 0, i32 2), align 4, !dbg !166
  %42 = icmp eq i32 %41, 1, !dbg !167             ; <i1> [#uses=1]
  %43 = zext i1 %42 to i32, !dbg !167             ; <i32> [#uses=1]
  call void @klee_assume(i32 %43) nounwind, !dbg !167
  ret void, !dbg !168
}

declare i32 @stat64(i8*, %struct.stat64*) nounwind

!llvm.dbg.gv = !{!0, !76}

!0 = metadata !{i32 458804, i32 0, metadata !1, metadata !"__exe_env", metadata !"__exe_env", metadata !"", metadata !1, i32 37, metadata !2, i1 false, i1 true, %struct.exe_sym_env_t* @__exe_env} ; [ DW_TAG_variable ]
!1 = metadata !{i32 458769, i32 0, i32 1, metadata !"fd_init.c", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 true, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!2 = metadata !{i32 458774, metadata !1, metadata !"exe_sym_env_t", metadata !3, i32 49, i64 0, i64 0, i64 0, i32 0, metadata !4} ; [ DW_TAG_typedef ]
!3 = metadata !{i32 458769, i32 0, i32 1, metadata !"stdint.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!4 = metadata !{i32 458771, metadata !1, metadata !"", metadata !5, i32 61, i64 5216, i64 32, i64 0, i32 0, null, metadata !6, i32 0, null} ; [ DW_TAG_structure_type ]
!5 = metadata !{i32 458769, i32 0, i32 1, metadata !"fd.h", metadata !"/home/wei/Documents/code/klee2.7/klee/runtime/POSIX/", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!6 = metadata !{metadata !7, metadata !72, metadata !74, metadata !75}
!7 = metadata !{i32 458765, metadata !4, metadata !"fds", metadata !5, i32 62, i64 5120, i64 32, i64 0, i32 0, metadata !8} ; [ DW_TAG_member ]
!8 = metadata !{i32 458753, metadata !1, metadata !"", metadata !1, i32 0, i64 5120, i64 32, i64 0, i32 0, metadata !9, metadata !70, i32 0, null} ; [ DW_TAG_array_type ]
!9 = metadata !{i32 458774, metadata !1, metadata !"exe_file_t", metadata !5, i32 42, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!10 = metadata !{i32 458771, metadata !1, metadata !"", metadata !5, i32 33, i64 160, i64 32, i64 0, i32 0, null, metadata !11, i32 0, null} ; [ DW_TAG_structure_type ]
!11 = metadata !{metadata !12, metadata !14, metadata !16, metadata !20}
!12 = metadata !{i32 458765, metadata !10, metadata !"fd", metadata !5, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_member ]
!13 = metadata !{i32 458788, metadata !1, metadata !"int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!14 = metadata !{i32 458765, metadata !10, metadata !"flags", metadata !5, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !15} ; [ DW_TAG_member ]
!15 = metadata !{i32 458788, metadata !1, metadata !"unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!16 = metadata !{i32 458765, metadata !10, metadata !"off", metadata !5, i32 38, i64 64, i64 64, i64 64, i32 0, metadata !17} ; [ DW_TAG_member ]
!17 = metadata !{i32 458774, metadata !1, metadata !"off64_t", metadata !18, i32 100, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ]
!18 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/sys", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!19 = metadata !{i32 458788, metadata !1, metadata !"long long int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!20 = metadata !{i32 458765, metadata !10, metadata !"dfile", metadata !5, i32 39, i64 32, i64 32, i64 128, i32 0, metadata !21} ; [ DW_TAG_member ]
!21 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ]
!22 = metadata !{i32 458774, metadata !1, metadata !"exe_disk_file_t", metadata !5, i32 26, i64 0, i64 0, i64 0, i32 0, metadata !23} ; [ DW_TAG_typedef ]
!23 = metadata !{i32 458771, metadata !1, metadata !"", metadata !5, i32 20, i64 96, i64 32, i64 0, i32 0, null, metadata !24, i32 0, null} ; [ DW_TAG_structure_type ]
!24 = metadata !{metadata !25, metadata !26, metadata !29}
!25 = metadata !{i32 458765, metadata !23, metadata !"size", metadata !5, i32 21, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ]
!26 = metadata !{i32 458765, metadata !23, metadata !"contents", metadata !5, i32 22, i64 32, i64 32, i64 32, i32 0, metadata !27} ; [ DW_TAG_member ]
!27 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ]
!28 = metadata !{i32 458788, metadata !1, metadata !"char", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ]
!29 = metadata !{i32 458765, metadata !23, metadata !"stat", metadata !5, i32 23, i64 32, i64 32, i64 64, i32 0, metadata !30} ; [ DW_TAG_member ]
!30 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ]
!31 = metadata !{i32 458771, metadata !1, metadata !"stat64", metadata !5, i32 23, i64 768, i64 32, i64 0, i32 0, null, metadata !32, i32 0, null} ; [ DW_TAG_structure_type ]
!32 = metadata !{metadata !33, metadata !38, metadata !39, metadata !42, metadata !44, metadata !46, metadata !48, metadata !50, metadata !51, metadata !52, metadata !54, metadata !57, metadata !59, metadata !66, metadata !67, metadata !68}
!33 = metadata !{i32 458765, metadata !31, metadata !"st_dev", metadata !34, i32 118, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_member ]
!34 = metadata !{i32 458769, i32 0, i32 1, metadata !"stat.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!35 = metadata !{i32 458774, metadata !1, metadata !"__dev_t", metadata !36, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!36 = metadata !{i32 458769, i32 0, i32 1, metadata !"types.h", metadata !"/usr/include/bits", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!37 = metadata !{i32 458788, metadata !1, metadata !"long long unsigned int", metadata !1, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!38 = metadata !{i32 458765, metadata !31, metadata !"__pad1", metadata !34, i32 124, i64 32, i64 32, i64 64, i32 0, metadata !15} ; [ DW_TAG_member ]
!39 = metadata !{i32 458765, metadata !31, metadata !"__st_ino", metadata !34, i32 125, i64 32, i64 32, i64 96, i32 0, metadata !40} ; [ DW_TAG_member ]
!40 = metadata !{i32 458774, metadata !1, metadata !"__ino_t", metadata !36, i32 138, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ]
!41 = metadata !{i32 458788, metadata !1, metadata !"long unsigned int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!42 = metadata !{i32 458765, metadata !31, metadata !"st_mode", metadata !34, i32 126, i64 32, i64 32, i64 128, i32 0, metadata !43} ; [ DW_TAG_member ]
!43 = metadata !{i32 458774, metadata !1, metadata !"__mode_t", metadata !36, i32 140, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!44 = metadata !{i32 458765, metadata !31, metadata !"st_nlink", metadata !34, i32 127, i64 32, i64 32, i64 160, i32 0, metadata !45} ; [ DW_TAG_member ]
!45 = metadata !{i32 458774, metadata !1, metadata !"__nlink_t", metadata !36, i32 141, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!46 = metadata !{i32 458765, metadata !31, metadata !"st_uid", metadata !34, i32 129, i64 32, i64 32, i64 192, i32 0, metadata !47} ; [ DW_TAG_member ]
!47 = metadata !{i32 458774, metadata !1, metadata !"__uid_t", metadata !36, i32 136, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!48 = metadata !{i32 458765, metadata !31, metadata !"st_gid", metadata !34, i32 130, i64 32, i64 32, i64 224, i32 0, metadata !49} ; [ DW_TAG_member ]
!49 = metadata !{i32 458774, metadata !1, metadata !"__gid_t", metadata !36, i32 137, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!50 = metadata !{i32 458765, metadata !31, metadata !"st_rdev", metadata !34, i32 136, i64 64, i64 64, i64 256, i32 0, metadata !35} ; [ DW_TAG_member ]
!51 = metadata !{i32 458765, metadata !31, metadata !"__pad2", metadata !34, i32 137, i64 32, i64 32, i64 320, i32 0, metadata !15} ; [ DW_TAG_member ]
!52 = metadata !{i32 458765, metadata !31, metadata !"st_size", metadata !34, i32 138, i64 64, i64 64, i64 352, i32 0, metadata !53} ; [ DW_TAG_member ]
!53 = metadata !{i32 458774, metadata !1, metadata !"__off64_t", metadata !36, i32 143, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ]
!54 = metadata !{i32 458765, metadata !31, metadata !"st_blksize", metadata !34, i32 140, i64 32, i64 32, i64 416, i32 0, metadata !55} ; [ DW_TAG_member ]
!55 = metadata !{i32 458774, metadata !1, metadata !"__blksize_t", metadata !36, i32 169, i64 0, i64 0, i64 0, i32 0, metadata !56} ; [ DW_TAG_typedef ]
!56 = metadata !{i32 458788, metadata !1, metadata !"long int", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!57 = metadata !{i32 458765, metadata !31, metadata !"st_blocks", metadata !34, i32 141, i64 64, i64 64, i64 448, i32 0, metadata !58} ; [ DW_TAG_member ]
!58 = metadata !{i32 458774, metadata !1, metadata !"__blkcnt64_t", metadata !36, i32 173, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ]
!59 = metadata !{i32 458765, metadata !31, metadata !"st_atim", metadata !34, i32 149, i64 64, i64 32, i64 512, i32 0, metadata !60} ; [ DW_TAG_member ]
!60 = metadata !{i32 458771, metadata !1, metadata !"timespec", metadata !61, i32 121, i64 64, i64 32, i64 0, i32 0, null, metadata !62, i32 0, null} ; [ DW_TAG_structure_type ]
!61 = metadata !{i32 458769, i32 0, i32 1, metadata !"time.h", metadata !"/usr/include", metadata !"4.2.1 (Based on Apple Inc. build 5658) (LLVM build)", i1 false, i1 true, metadata !"", i32 0} ; [ DW_TAG_compile_unit ]
!62 = metadata !{metadata !63, metadata !65}
!63 = metadata !{i32 458765, metadata !60, metadata !"tv_sec", metadata !61, i32 122, i64 32, i64 32, i64 0, i32 0, metadata !64} ; [ DW_TAG_member ]
!64 = metadata !{i32 458774, metadata !1, metadata !"__time_t", metadata !36, i32 150, i64 0, i64 0, i64 0, i32 0, metadata !56} ; [ DW_TAG_typedef ]
!65 = metadata !{i32 458765, metadata !60, metadata !"tv_nsec", metadata !61, i32 123, i64 32, i64 32, i64 32, i32 0, metadata !56} ; [ DW_TAG_member ]
!66 = metadata !{i32 458765, metadata !31, metadata !"st_mtim", metadata !34, i32 150, i64 64, i64 32, i64 576, i32 0, metadata !60} ; [ DW_TAG_member ]
!67 = metadata !{i32 458765, metadata !31, metadata !"st_ctim", metadata !34, i32 151, i64 64, i64 32, i64 640, i32 0, metadata !60} ; [ DW_TAG_member ]
!68 = metadata !{i32 458765, metadata !31, metadata !"st_ino", metadata !34, i32 166, i64 64, i64 64, i64 704, i32 0, metadata !69} ; [ DW_TAG_member ]
!69 = metadata !{i32 458774, metadata !1, metadata !"__ino64_t", metadata !36, i32 139, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!70 = metadata !{metadata !71}
!71 = metadata !{i32 458785, i64 0, i64 31}       ; [ DW_TAG_subrange_type ]
!72 = metadata !{i32 458765, metadata !4, metadata !"umask", metadata !5, i32 63, i64 32, i64 32, i64 5120, i32 0, metadata !73} ; [ DW_TAG_member ]
!73 = metadata !{i32 458774, metadata !1, metadata !"mode_t", metadata !18, i32 77, i64 0, i64 0, i64 0, i32 0, metadata !15} ; [ DW_TAG_typedef ]
!74 = metadata !{i32 458765, metadata !4, metadata !"version", metadata !5, i32 64, i64 32, i64 32, i64 5152, i32 0, metadata !15} ; [ DW_TAG_member ]
!75 = metadata !{i32 458765, metadata !4, metadata !"save_all_writes", metadata !5, i32 68, i64 32, i64 32, i64 5184, i32 0, metadata !13} ; [ DW_TAG_member ]
!76 = metadata !{i32 458804, i32 0, metadata !1, metadata !"__exe_fs", metadata !"__exe_fs", metadata !"", metadata !1, i32 24, metadata !77, i1 false, i1 true, %struct.exe_file_system_t* @__exe_fs} ; [ DW_TAG_variable ]
!77 = metadata !{i32 458774, metadata !1, metadata !"exe_file_system_t", metadata !5, i32 61, i64 0, i64 0, i64 0, i32 0, metadata !78} ; [ DW_TAG_typedef ]
!78 = metadata !{i32 458771, metadata !1, metadata !"", metadata !5, i32 42, i64 416, i64 32, i64 0, i32 0, null, metadata !79, i32 0, null} ; [ DW_TAG_structure_type ]
!79 = metadata !{metadata !80, metadata !81, metadata !82, metadata !83, metadata !84, metadata !85, metadata !86, metadata !88, metadata !89, metadata !90, metadata !91, metadata !92, metadata !93}
!80 = metadata !{i32 458765, metadata !78, metadata !"n_sym_files", metadata !5, i32 43, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ]
!81 = metadata !{i32 458765, metadata !78, metadata !"sym_stdin", metadata !5, i32 44, i64 32, i64 32, i64 32, i32 0, metadata !21} ; [ DW_TAG_member ]
!82 = metadata !{i32 458765, metadata !78, metadata !"sym_stdout", metadata !5, i32 44, i64 32, i64 32, i64 64, i32 0, metadata !21} ; [ DW_TAG_member ]
!83 = metadata !{i32 458765, metadata !78, metadata !"stdout_writes", metadata !5, i32 45, i64 32, i64 32, i64 96, i32 0, metadata !15} ; [ DW_TAG_member ]
!84 = metadata !{i32 458765, metadata !78, metadata !"sym_files", metadata !5, i32 46, i64 32, i64 32, i64 128, i32 0, metadata !21} ; [ DW_TAG_member ]
!85 = metadata !{i32 458765, metadata !78, metadata !"max_failures", metadata !5, i32 49, i64 32, i64 32, i64 160, i32 0, metadata !15} ; [ DW_TAG_member ]
!86 = metadata !{i32 458765, metadata !78, metadata !"read_fail", metadata !5, i32 52, i64 32, i64 32, i64 192, i32 0, metadata !87} ; [ DW_TAG_member ]
!87 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!88 = metadata !{i32 458765, metadata !78, metadata !"write_fail", metadata !5, i32 52, i64 32, i64 32, i64 224, i32 0, metadata !87} ; [ DW_TAG_member ]
!89 = metadata !{i32 458765, metadata !78, metadata !"close_fail", metadata !5, i32 52, i64 32, i64 32, i64 256, i32 0, metadata !87} ; [ DW_TAG_member ]
!90 = metadata !{i32 458765, metadata !78, metadata !"ftruncate_fail", metadata !5, i32 52, i64 32, i64 32, i64 288, i32 0, metadata !87} ; [ DW_TAG_member ]
!91 = metadata !{i32 458765, metadata !78, metadata !"getcwd_fail", metadata !5, i32 52, i64 32, i64 32, i64 320, i32 0, metadata !87} ; [ DW_TAG_member ]
!92 = metadata !{i32 458765, metadata !78, metadata !"chmod_fail", metadata !5, i32 53, i64 32, i64 32, i64 352, i32 0, metadata !87} ; [ DW_TAG_member ]
!93 = metadata !{i32 458765, metadata !78, metadata !"fchmod_fail", metadata !5, i32 53, i64 32, i64 32, i64 384, i32 0, metadata !87} ; [ DW_TAG_member ]
!94 = metadata !{i32 48, i32 0, metadata !95, null}
!95 = metadata !{i32 458763, metadata !96, i32 47, i32 0} ; [ DW_TAG_lexical_block ]
!96 = metadata !{i32 458798, i32 0, metadata !1, metadata !"__create_new_dfile", metadata !"__create_new_dfile", metadata !"__create_new_dfile", metadata !1, i32 47, metadata !97, i1 true, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!97 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !98, i32 0, null} ; [ DW_TAG_subroutine_type ]
!98 = metadata !{null, metadata !21, metadata !15, metadata !99, metadata !30}
!99 = metadata !{i32 458767, metadata !1, metadata !"", metadata !1, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !100} ; [ DW_TAG_pointer_type ]
!100 = metadata !{i32 458790, metadata !1, metadata !"", metadata !1, i32 0, i64 8, i64 8, i64 0, i32 0, metadata !28} ; [ DW_TAG_const_type ]
!101 = metadata !{i32 51, i32 0, metadata !95, null}
!102 = metadata !{i32 52, i32 0, metadata !95, null}
!103 = metadata !{i32 53, i32 0, metadata !95, null}
!104 = metadata !{i32 55, i32 0, metadata !95, null}
!105 = metadata !{i32 57, i32 0, metadata !95, null}
!106 = metadata !{i32 58, i32 0, metadata !95, null}
!107 = metadata !{i32 59, i32 0, metadata !95, null}
!108 = metadata !{i32 61, i32 0, metadata !95, null}
!109 = metadata !{i32 64, i32 0, metadata !95, null}
!110 = metadata !{i32 66, i32 0, metadata !95, null}
!111 = metadata !{i32 71, i32 0, metadata !95, null}
!112 = metadata !{i32 75, i32 0, metadata !95, null}
!113 = metadata !{i32 77, i32 0, metadata !95, null}
!114 = metadata !{i32 78, i32 0, metadata !95, null}
!115 = metadata !{i32 79, i32 0, metadata !95, null}
!116 = metadata !{i32 80, i32 0, metadata !95, null}
!117 = metadata !{i32 81, i32 0, metadata !95, null}
!118 = metadata !{i32 82, i32 0, metadata !95, null}
!119 = metadata !{i32 83, i32 0, metadata !95, null}
!120 = metadata !{i32 84, i32 0, metadata !95, null}
!121 = metadata !{i32 85, i32 0, metadata !95, null}
!122 = metadata !{i32 86, i32 0, metadata !95, null}
!123 = metadata !{i32 87, i32 0, metadata !95, null}
!124 = metadata !{i32 88, i32 0, metadata !95, null}
!125 = metadata !{i32 89, i32 0, metadata !95, null}
!126 = metadata !{i32 90, i32 0, metadata !95, null}
!127 = metadata !{i32 92, i32 0, metadata !95, null}
!128 = metadata !{i32 93, i32 0, metadata !95, null}
!129 = metadata !{i32 94, i32 0, metadata !95, null}
!130 = metadata !{i32 95, i32 0, metadata !95, null}
!131 = metadata !{i32 114, i32 0, metadata !132, null}
!132 = metadata !{i32 458763, metadata !133, i32 112, i32 0} ; [ DW_TAG_lexical_block ]
!133 = metadata !{i32 458798, i32 0, metadata !1, metadata !"klee_init_fds", metadata !"klee_init_fds", metadata !"klee_init_fds", metadata !1, i32 112, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i1 false} ; [ DW_TAG_subprogram ]
!134 = metadata !{i32 458773, metadata !1, metadata !"", metadata !1, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, null} ; [ DW_TAG_subroutine_type ]
!135 = metadata !{null, metadata !15, metadata !15, metadata !13, metadata !13, metadata !15}
!136 = metadata !{i32 117, i32 0, metadata !132, null}
!137 = metadata !{i32 119, i32 0, metadata !132, null}
!138 = metadata !{i32 120, i32 0, metadata !132, null}
!139 = metadata !{i32 121, i32 0, metadata !132, null}
!140 = metadata !{i32 122, i32 0, metadata !132, null}
!141 = metadata !{i32 123, i32 0, metadata !132, null}
!142 = metadata !{i32 127, i32 0, metadata !132, null}
!143 = metadata !{i32 128, i32 0, metadata !132, null}
!144 = metadata !{i32 129, i32 0, metadata !132, null}
!145 = metadata !{i32 130, i32 0, metadata !132, null}
!146 = metadata !{i32 132, i32 0, metadata !132, null}
!147 = metadata !{i32 134, i32 0, metadata !132, null}
!148 = metadata !{i32 135, i32 0, metadata !132, null}
!149 = metadata !{i32 136, i32 0, metadata !132, null}
!150 = metadata !{i32 137, i32 0, metadata !132, null}
!151 = metadata !{i32 138, i32 0, metadata !132, null}
!152 = metadata !{i32 139, i32 0, metadata !132, null}
!153 = metadata !{i32 140, i32 0, metadata !132, null}
!154 = metadata !{i32 142, i32 0, metadata !132, null}
!155 = metadata !{i32 143, i32 0, metadata !132, null}
!156 = metadata !{i32 144, i32 0, metadata !132, null}
!157 = metadata !{i32 145, i32 0, metadata !132, null}
!158 = metadata !{i32 146, i32 0, metadata !132, null}
!159 = metadata !{i32 150, i32 0, metadata !132, null}
!160 = metadata !{i32 151, i32 0, metadata !132, null}
!161 = metadata !{i32 152, i32 0, metadata !132, null}
!162 = metadata !{i32 153, i32 0, metadata !132, null}
!163 = metadata !{i32 154, i32 0, metadata !132, null}
!164 = metadata !{i32 156, i32 0, metadata !132, null}
!165 = metadata !{i32 158, i32 0, metadata !132, null}
!166 = metadata !{i32 159, i32 0, metadata !132, null}
!167 = metadata !{i32 160, i32 0, metadata !132, null}
!168 = metadata !{i32 161, i32 0, metadata !132, null}
