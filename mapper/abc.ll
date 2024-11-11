; ModuleID = 'abc.bc'
source_filename = "test/test1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"Enter a positive integer: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Factorial of %d is %d\0A\00", align 1
@str = private unnamed_addr constant [47 x i8] c"Factorial is not defined for negative numbers.\00", align 1

; Function Attrs: nounwind readnone uwtable
define dso_local i32 @factorial(i32 %0) local_unnamed_addr #0 !dbg !7 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !12, metadata !DIExpression()), !dbg !13
  %2 = icmp slt i32 %0, 2, !dbg !14
  br i1 %2, label %79, label %3, !dbg !16

3:                                                ; preds = %1
  %4 = add i32 %0, -1, !dbg !16
  %5 = icmp ult i32 %4, 8, !dbg !16
  br i1 %5, label %70, label %6, !dbg !16

6:                                                ; preds = %3
  %7 = and i32 %4, -8, !dbg !16
  %8 = sub i32 %0, %7, !dbg !16
  %9 = insertelement <4 x i32> undef, i32 %0, i32 0, !dbg !16
  %10 = shufflevector <4 x i32> %9, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !16
  %11 = add <4 x i32> %10, <i32 0, i32 -1, i32 -2, i32 -3>, !dbg !16
  %12 = add i32 %7, -8, !dbg !16
  %13 = lshr exact i32 %12, 3, !dbg !16
  %14 = add nuw nsw i32 %13, 1, !dbg !16
  %15 = and i32 %14, 3, !dbg !16
  %16 = icmp ult i32 %12, 24, !dbg !16
  br i1 %16, label %42, label %17, !dbg !16

17:                                               ; preds = %6
  %18 = sub nsw i32 %14, %15, !dbg !16
  br label %19, !dbg !16

19:                                               ; preds = %19, %17
  %20 = phi <4 x i32> [ %11, %17 ], [ %39, %19 ]
  %21 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %17 ], [ %37, %19 ]
  %22 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %17 ], [ %38, %19 ]
  %23 = phi i32 [ %18, %17 ], [ %40, %19 ]
  %24 = add <4 x i32> %20, <i32 -4, i32 -4, i32 -4, i32 -4>
  %25 = mul <4 x i32> %20, %21, !dbg !17
  %26 = mul <4 x i32> %24, %22, !dbg !17
  %27 = add <4 x i32> %20, <i32 -8, i32 -8, i32 -8, i32 -8>
  %28 = add <4 x i32> %20, <i32 -12, i32 -12, i32 -12, i32 -12>
  %29 = mul <4 x i32> %27, %25, !dbg !17
  %30 = mul <4 x i32> %28, %26, !dbg !17
  %31 = add <4 x i32> %20, <i32 -16, i32 -16, i32 -16, i32 -16>
  %32 = add <4 x i32> %20, <i32 -20, i32 -20, i32 -20, i32 -20>
  %33 = mul <4 x i32> %31, %29, !dbg !17
  %34 = mul <4 x i32> %32, %30, !dbg !17
  %35 = add <4 x i32> %20, <i32 -24, i32 -24, i32 -24, i32 -24>
  %36 = add <4 x i32> %20, <i32 -28, i32 -28, i32 -28, i32 -28>
  %37 = mul <4 x i32> %35, %33, !dbg !17
  %38 = mul <4 x i32> %36, %34, !dbg !17
  %39 = add <4 x i32> %20, <i32 -32, i32 -32, i32 -32, i32 -32>
  %40 = add i32 %23, -4
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %42, label %19, !llvm.loop !18

42:                                               ; preds = %19, %6
  %43 = phi <4 x i32> [ undef, %6 ], [ %37, %19 ]
  %44 = phi <4 x i32> [ undef, %6 ], [ %38, %19 ]
  %45 = phi <4 x i32> [ %11, %6 ], [ %39, %19 ]
  %46 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %6 ], [ %37, %19 ]
  %47 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %6 ], [ %38, %19 ]
  %48 = icmp eq i32 %15, 0
  br i1 %48, label %60, label %49

49:                                               ; preds = %42, %49
  %50 = phi <4 x i32> [ %57, %49 ], [ %45, %42 ]
  %51 = phi <4 x i32> [ %55, %49 ], [ %46, %42 ]
  %52 = phi <4 x i32> [ %56, %49 ], [ %47, %42 ]
  %53 = phi i32 [ %58, %49 ], [ %15, %42 ]
  %54 = add <4 x i32> %50, <i32 -4, i32 -4, i32 -4, i32 -4>
  %55 = mul <4 x i32> %50, %51, !dbg !17
  %56 = mul <4 x i32> %54, %52, !dbg !17
  %57 = add <4 x i32> %50, <i32 -8, i32 -8, i32 -8, i32 -8>
  %58 = add i32 %53, -1
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %60, label %49, !llvm.loop !20

60:                                               ; preds = %49, %42
  %61 = phi <4 x i32> [ %43, %42 ], [ %55, %49 ], !dbg !17
  %62 = phi <4 x i32> [ %44, %42 ], [ %56, %49 ], !dbg !17
  %63 = mul <4 x i32> %62, %61, !dbg !16
  %64 = shufflevector <4 x i32> %63, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !16
  %65 = mul <4 x i32> %63, %64, !dbg !16
  %66 = shufflevector <4 x i32> %65, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !16
  %67 = mul <4 x i32> %65, %66, !dbg !16
  %68 = extractelement <4 x i32> %67, i32 0, !dbg !16
  %69 = icmp eq i32 %4, %7, !dbg !16
  br i1 %69, label %79, label %70, !dbg !16

70:                                               ; preds = %60, %3
  %71 = phi i32 [ %0, %3 ], [ %8, %60 ]
  %72 = phi i32 [ 1, %3 ], [ %68, %60 ]
  br label %73, !dbg !16

73:                                               ; preds = %70, %73
  %74 = phi i32 [ %76, %73 ], [ %71, %70 ]
  %75 = phi i32 [ %77, %73 ], [ %72, %70 ]
  call void @llvm.dbg.value(metadata i32 %74, metadata !12, metadata !DIExpression()), !dbg !13
  %76 = add nsw i32 %74, -1, !dbg !22
  %77 = mul nsw i32 %74, %75, !dbg !17
  call void @llvm.dbg.value(metadata i32 %76, metadata !12, metadata !DIExpression()), !dbg !13
  %78 = icmp slt i32 %74, 3, !dbg !14
  br i1 %78, label %79, label %73, !dbg !16, !llvm.loop !23

79:                                               ; preds = %73, %60, %1
  %80 = phi i32 [ 1, %1 ], [ %68, %60 ], [ %77, %73 ]
  ret i32 %80, !dbg !25
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #1 !dbg !26 {
  %1 = alloca i32, align 4
  %2 = bitcast i32* %1 to i8*, !dbg !31
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %2) #6, !dbg !31
  %3 = tail call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([27 x i8], [27 x i8]* @.str, i64 0, i64 0)), !dbg !32
  call void @llvm.dbg.value(metadata i32* %1, metadata !30, metadata !DIExpression(DW_OP_deref)), !dbg !33
  %4 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32* nonnull %1), !dbg !34
  %5 = load i32, i32* %1, align 4, !dbg !35, !tbaa !37
  call void @llvm.dbg.value(metadata i32 %5, metadata !30, metadata !DIExpression()), !dbg !33
  %6 = icmp slt i32 %5, 0, !dbg !41
  br i1 %6, label %7, label %9, !dbg !42

7:                                                ; preds = %0
  %8 = call i32 @puts(i8* nonnull dereferenceable(1) getelementptr inbounds ([47 x i8], [47 x i8]* @str, i64 0, i64 0)), !dbg !43
  br label %90, !dbg !43

9:                                                ; preds = %0
  call void @llvm.dbg.value(metadata i32 %5, metadata !12, metadata !DIExpression()), !dbg !44
  %10 = icmp slt i32 %5, 2, !dbg !46
  br i1 %10, label %87, label %11, !dbg !47

11:                                               ; preds = %9
  %12 = add i32 %5, -1, !dbg !47
  %13 = icmp ult i32 %12, 8, !dbg !47
  br i1 %13, label %78, label %14, !dbg !47

14:                                               ; preds = %11
  %15 = and i32 %12, -8, !dbg !47
  %16 = sub i32 %5, %15, !dbg !47
  %17 = insertelement <4 x i32> undef, i32 %5, i32 0, !dbg !47
  %18 = shufflevector <4 x i32> %17, <4 x i32> undef, <4 x i32> zeroinitializer, !dbg !47
  %19 = add <4 x i32> %18, <i32 0, i32 -1, i32 -2, i32 -3>, !dbg !47
  %20 = add i32 %15, -8, !dbg !47
  %21 = lshr exact i32 %20, 3, !dbg !47
  %22 = add nuw nsw i32 %21, 1, !dbg !47
  %23 = and i32 %22, 3, !dbg !47
  %24 = icmp ult i32 %20, 24, !dbg !47
  br i1 %24, label %50, label %25, !dbg !47

25:                                               ; preds = %14
  %26 = sub nsw i32 %22, %23, !dbg !47
  br label %27, !dbg !47

27:                                               ; preds = %27, %25
  %28 = phi <4 x i32> [ %19, %25 ], [ %47, %27 ]
  %29 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %25 ], [ %45, %27 ]
  %30 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %25 ], [ %46, %27 ]
  %31 = phi i32 [ %26, %25 ], [ %48, %27 ]
  %32 = add <4 x i32> %28, <i32 -4, i32 -4, i32 -4, i32 -4>
  %33 = mul <4 x i32> %29, %28, !dbg !48
  %34 = mul <4 x i32> %30, %32, !dbg !48
  %35 = add <4 x i32> %28, <i32 -8, i32 -8, i32 -8, i32 -8>
  %36 = add <4 x i32> %28, <i32 -12, i32 -12, i32 -12, i32 -12>
  %37 = mul <4 x i32> %33, %35, !dbg !48
  %38 = mul <4 x i32> %34, %36, !dbg !48
  %39 = add <4 x i32> %28, <i32 -16, i32 -16, i32 -16, i32 -16>
  %40 = add <4 x i32> %28, <i32 -20, i32 -20, i32 -20, i32 -20>
  %41 = mul <4 x i32> %37, %39, !dbg !48
  %42 = mul <4 x i32> %38, %40, !dbg !48
  %43 = add <4 x i32> %28, <i32 -24, i32 -24, i32 -24, i32 -24>
  %44 = add <4 x i32> %28, <i32 -28, i32 -28, i32 -28, i32 -28>
  %45 = mul <4 x i32> %41, %43, !dbg !48
  %46 = mul <4 x i32> %42, %44, !dbg !48
  %47 = add <4 x i32> %28, <i32 -32, i32 -32, i32 -32, i32 -32>
  %48 = add i32 %31, -4
  %49 = icmp eq i32 %48, 0
  br i1 %49, label %50, label %27, !llvm.loop !49

50:                                               ; preds = %27, %14
  %51 = phi <4 x i32> [ undef, %14 ], [ %45, %27 ]
  %52 = phi <4 x i32> [ undef, %14 ], [ %46, %27 ]
  %53 = phi <4 x i32> [ %19, %14 ], [ %47, %27 ]
  %54 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %14 ], [ %45, %27 ]
  %55 = phi <4 x i32> [ <i32 1, i32 1, i32 1, i32 1>, %14 ], [ %46, %27 ]
  %56 = icmp eq i32 %23, 0
  br i1 %56, label %68, label %57

57:                                               ; preds = %50, %57
  %58 = phi <4 x i32> [ %65, %57 ], [ %53, %50 ]
  %59 = phi <4 x i32> [ %63, %57 ], [ %54, %50 ]
  %60 = phi <4 x i32> [ %64, %57 ], [ %55, %50 ]
  %61 = phi i32 [ %66, %57 ], [ %23, %50 ]
  %62 = add <4 x i32> %58, <i32 -4, i32 -4, i32 -4, i32 -4>
  %63 = mul <4 x i32> %59, %58, !dbg !48
  %64 = mul <4 x i32> %60, %62, !dbg !48
  %65 = add <4 x i32> %58, <i32 -8, i32 -8, i32 -8, i32 -8>
  %66 = add i32 %61, -1
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %57, !llvm.loop !50

68:                                               ; preds = %57, %50
  %69 = phi <4 x i32> [ %51, %50 ], [ %63, %57 ], !dbg !48
  %70 = phi <4 x i32> [ %52, %50 ], [ %64, %57 ], !dbg !48
  %71 = mul <4 x i32> %70, %69, !dbg !47
  %72 = shufflevector <4 x i32> %71, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>, !dbg !47
  %73 = mul <4 x i32> %71, %72, !dbg !47
  %74 = shufflevector <4 x i32> %73, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>, !dbg !47
  %75 = mul <4 x i32> %73, %74, !dbg !47
  %76 = extractelement <4 x i32> %75, i32 0, !dbg !47
  %77 = icmp eq i32 %12, %15, !dbg !47
  br i1 %77, label %87, label %78, !dbg !47

78:                                               ; preds = %68, %11
  %79 = phi i32 [ %5, %11 ], [ %16, %68 ]
  %80 = phi i32 [ 1, %11 ], [ %76, %68 ]
  br label %81, !dbg !47

81:                                               ; preds = %78, %81
  %82 = phi i32 [ %84, %81 ], [ %79, %78 ]
  %83 = phi i32 [ %85, %81 ], [ %80, %78 ]
  call void @llvm.dbg.value(metadata i32 %82, metadata !12, metadata !DIExpression()), !dbg !44
  %84 = add nsw i32 %82, -1, !dbg !51
  %85 = mul nsw i32 %83, %82, !dbg !48
  call void @llvm.dbg.value(metadata i32 %84, metadata !12, metadata !DIExpression()), !dbg !44
  %86 = icmp slt i32 %82, 3, !dbg !46
  br i1 %86, label %87, label %81, !dbg !47, !llvm.loop !52

87:                                               ; preds = %81, %68, %9
  %88 = phi i32 [ 1, %9 ], [ %76, %68 ], [ %85, %81 ]
  %89 = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i64 0, i64 0), i32 %5, i32 %88), !dbg !53
  br label %90

90:                                               ; preds = %87, %7
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %2) #6, !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nofree nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare dso_local i32 @__isoc99_scanf(i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #4

; Function Attrs: nofree nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #5

attributes #0 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { nofree nounwind }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test/test1.c", directory: "/home/toobak/OptiCortex/mapper")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "factorial", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !11)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{!12}
!12 = !DILocalVariable(name: "n", arg: 1, scope: !7, file: !1, line: 3, type: !10)
!13 = !DILocation(line: 0, scope: !7)
!14 = !DILocation(line: 4, column: 11, scope: !15)
!15 = distinct !DILexicalBlock(scope: !7, file: !1, line: 4, column: 9)
!16 = !DILocation(line: 4, column: 9, scope: !7)
!17 = !DILocation(line: 7, column: 18, scope: !15)
!18 = distinct !{!18, !19}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = !DILocation(line: 7, column: 32, scope: !15)
!23 = distinct !{!23, !24, !19}
!24 = !{!"llvm.loop.unroll.runtime.disable"}
!25 = !DILocation(line: 8, column: 1, scope: !7)
!26 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 10, type: !27, scopeLine: 10, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !29)
!27 = !DISubroutineType(types: !28)
!28 = !{!10}
!29 = !{!30}
!30 = !DILocalVariable(name: "num", scope: !26, file: !1, line: 11, type: !10)
!31 = !DILocation(line: 11, column: 5, scope: !26)
!32 = !DILocation(line: 12, column: 5, scope: !26)
!33 = !DILocation(line: 0, scope: !26)
!34 = !DILocation(line: 13, column: 5, scope: !26)
!35 = !DILocation(line: 15, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !26, file: !1, line: 15, column: 9)
!37 = !{!38, !38, i64 0}
!38 = !{!"int", !39, i64 0}
!39 = !{!"omnipotent char", !40, i64 0}
!40 = !{!"Simple C/C++ TBAA"}
!41 = !DILocation(line: 15, column: 13, scope: !36)
!42 = !DILocation(line: 15, column: 9, scope: !26)
!43 = !DILocation(line: 16, column: 9, scope: !36)
!44 = !DILocation(line: 0, scope: !7, inlinedAt: !45)
!45 = distinct !DILocation(line: 18, column: 48, scope: !36)
!46 = !DILocation(line: 4, column: 11, scope: !15, inlinedAt: !45)
!47 = !DILocation(line: 4, column: 9, scope: !7, inlinedAt: !45)
!48 = !DILocation(line: 7, column: 18, scope: !15, inlinedAt: !45)
!49 = distinct !{!49, !19}
!50 = distinct !{!50, !21}
!51 = !DILocation(line: 7, column: 32, scope: !15, inlinedAt: !45)
!52 = distinct !{!52, !24, !19}
!53 = !DILocation(line: 18, column: 9, scope: !36)
!54 = !DILocation(line: 21, column: 1, scope: !26)
!55 = !DILocation(line: 20, column: 5, scope: !26)
