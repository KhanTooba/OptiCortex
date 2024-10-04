; ModuleID = 'stack.c'
source_filename = "stack.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Stack = type { %struct.Node*, %union.pthread_mutex_t }
%struct.Node = type { i32, %struct.Node* }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.pthread_mutexattr_t = type { i32 }
%union.pthread_attr_t = type { i64, [48 x i8] }

@.str = private unnamed_addr constant [26 x i8] c"Memory allocation failed\0A\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"Pushed %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Stack underflow\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"Popped %d\0A\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"Stack is empty\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"Pushed: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"Popped: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"Final stack size: %d\0A\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @stack_init(%struct.Stack* %0) #0 {
  %2 = alloca %struct.Stack*, align 8
  store %struct.Stack* %0, %struct.Stack** %2, align 8
  %3 = load %struct.Stack*, %struct.Stack** %2, align 8
  %4 = getelementptr inbounds %struct.Stack, %struct.Stack* %3, i32 0, i32 0
  store %struct.Node* null, %struct.Node** %4, align 8
  %5 = load %struct.Stack*, %struct.Stack** %2, align 8
  %6 = getelementptr inbounds %struct.Stack, %struct.Stack* %5, i32 0, i32 1
  %7 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %6, %union.pthread_mutexattr_t* null) #3
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @stack_is_empty(%struct.Stack* %0) #0 {
  %2 = alloca %struct.Stack*, align 8
  store %struct.Stack* %0, %struct.Stack** %2, align 8
  %3 = load %struct.Stack*, %struct.Stack** %2, align 8
  %4 = getelementptr inbounds %struct.Stack, %struct.Stack* %3, i32 0, i32 0
  %5 = load %struct.Node*, %struct.Node** %4, align 8
  %6 = icmp eq %struct.Node* %5, null
  %7 = zext i1 %6 to i32
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @stack_push(%struct.Stack* %0, i32 %1) #0 {
  %3 = alloca %struct.Stack*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.Node*, align 8
  store %struct.Stack* %0, %struct.Stack** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.Stack*, %struct.Stack** %3, align 8
  %7 = getelementptr inbounds %struct.Stack, %struct.Stack* %6, i32 0, i32 1
  %8 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %7) #3
  %9 = call noalias i8* @malloc(i64 16) #3
  %10 = bitcast i8* %9 to %struct.Node*
  store %struct.Node* %10, %struct.Node** %5, align 8
  %11 = load %struct.Node*, %struct.Node** %5, align 8
  %12 = icmp eq %struct.Node* %11, null
  br i1 %12, label %13, label %18

13:                                               ; preds = %2
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i64 0, i64 0))
  %15 = load %struct.Stack*, %struct.Stack** %3, align 8
  %16 = getelementptr inbounds %struct.Stack, %struct.Stack* %15, i32 0, i32 1
  %17 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %16) #3
  br label %35

18:                                               ; preds = %2
  %19 = load i32, i32* %4, align 4
  %20 = load %struct.Node*, %struct.Node** %5, align 8
  %21 = getelementptr inbounds %struct.Node, %struct.Node* %20, i32 0, i32 0
  store i32 %19, i32* %21, align 8
  %22 = load %struct.Stack*, %struct.Stack** %3, align 8
  %23 = getelementptr inbounds %struct.Stack, %struct.Stack* %22, i32 0, i32 0
  %24 = load %struct.Node*, %struct.Node** %23, align 8
  %25 = load %struct.Node*, %struct.Node** %5, align 8
  %26 = getelementptr inbounds %struct.Node, %struct.Node* %25, i32 0, i32 1
  store %struct.Node* %24, %struct.Node** %26, align 8
  %27 = load %struct.Node*, %struct.Node** %5, align 8
  %28 = load %struct.Stack*, %struct.Stack** %3, align 8
  %29 = getelementptr inbounds %struct.Stack, %struct.Stack* %28, i32 0, i32 0
  store %struct.Node* %27, %struct.Node** %29, align 8
  %30 = load i32, i32* %4, align 4
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 %30)
  %32 = load %struct.Stack*, %struct.Stack** %3, align 8
  %33 = getelementptr inbounds %struct.Stack, %struct.Stack* %32, i32 0, i32 1
  %34 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %33) #3
  br label %35

35:                                               ; preds = %18, %13
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_lock(%union.pthread_mutex_t*) #1

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @stack_pop(%struct.Stack* %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.Stack*, align 8
  %4 = alloca %struct.Node*, align 8
  %5 = alloca i32, align 4
  store %struct.Stack* %0, %struct.Stack** %3, align 8
  %6 = load %struct.Stack*, %struct.Stack** %3, align 8
  %7 = getelementptr inbounds %struct.Stack, %struct.Stack* %6, i32 0, i32 1
  %8 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %7) #3
  %9 = load %struct.Stack*, %struct.Stack** %3, align 8
  %10 = call i32 @stack_is_empty(%struct.Stack* %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %17

12:                                               ; preds = %1
  %13 = load %struct.Stack*, %struct.Stack** %3, align 8
  %14 = getelementptr inbounds %struct.Stack, %struct.Stack* %13, i32 0, i32 1
  %15 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %14) #3
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0))
  store i32 -1, i32* %2, align 4
  br label %37

17:                                               ; preds = %1
  %18 = load %struct.Stack*, %struct.Stack** %3, align 8
  %19 = getelementptr inbounds %struct.Stack, %struct.Stack* %18, i32 0, i32 0
  %20 = load %struct.Node*, %struct.Node** %19, align 8
  store %struct.Node* %20, %struct.Node** %4, align 8
  %21 = load %struct.Node*, %struct.Node** %4, align 8
  %22 = getelementptr inbounds %struct.Node, %struct.Node* %21, i32 0, i32 0
  %23 = load i32, i32* %22, align 8
  store i32 %23, i32* %5, align 4
  %24 = load %struct.Node*, %struct.Node** %4, align 8
  %25 = getelementptr inbounds %struct.Node, %struct.Node* %24, i32 0, i32 1
  %26 = load %struct.Node*, %struct.Node** %25, align 8
  %27 = load %struct.Stack*, %struct.Stack** %3, align 8
  %28 = getelementptr inbounds %struct.Stack, %struct.Stack* %27, i32 0, i32 0
  store %struct.Node* %26, %struct.Node** %28, align 8
  %29 = load %struct.Node*, %struct.Node** %4, align 8
  %30 = bitcast %struct.Node* %29 to i8*
  call void @free(i8* %30) #3
  %31 = load i32, i32* %5, align 4
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 %31)
  %33 = load %struct.Stack*, %struct.Stack** %3, align 8
  %34 = getelementptr inbounds %struct.Stack, %struct.Stack* %33, i32 0, i32 1
  %35 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %34) #3
  %36 = load i32, i32* %5, align 4
  store i32 %36, i32* %2, align 4
  br label %37

37:                                               ; preds = %17, %12
  %38 = load i32, i32* %2, align 4
  ret i32 %38
}

; Function Attrs: nounwind
declare dso_local void @free(i8*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @stack_peek(%struct.Stack* %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.Stack*, align 8
  %4 = alloca i32, align 4
  store %struct.Stack* %0, %struct.Stack** %3, align 8
  %5 = load %struct.Stack*, %struct.Stack** %3, align 8
  %6 = getelementptr inbounds %struct.Stack, %struct.Stack* %5, i32 0, i32 1
  %7 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %6) #3
  %8 = load %struct.Stack*, %struct.Stack** %3, align 8
  %9 = call i32 @stack_is_empty(%struct.Stack* %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %16

11:                                               ; preds = %1
  %12 = load %struct.Stack*, %struct.Stack** %3, align 8
  %13 = getelementptr inbounds %struct.Stack, %struct.Stack* %12, i32 0, i32 1
  %14 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %13) #3
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0))
  store i32 -1, i32* %2, align 4
  br label %26

16:                                               ; preds = %1
  %17 = load %struct.Stack*, %struct.Stack** %3, align 8
  %18 = getelementptr inbounds %struct.Stack, %struct.Stack* %17, i32 0, i32 0
  %19 = load %struct.Node*, %struct.Node** %18, align 8
  %20 = getelementptr inbounds %struct.Node, %struct.Node* %19, i32 0, i32 0
  %21 = load i32, i32* %20, align 8
  store i32 %21, i32* %4, align 4
  %22 = load %struct.Stack*, %struct.Stack** %3, align 8
  %23 = getelementptr inbounds %struct.Stack, %struct.Stack* %22, i32 0, i32 1
  %24 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %23) #3
  %25 = load i32, i32* %4, align 4
  store i32 %25, i32* %2, align 4
  br label %26

26:                                               ; preds = %16, %11
  %27 = load i32, i32* %2, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @stack_size(%struct.Stack* %0) #0 {
  %2 = alloca %struct.Stack*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.Node*, align 8
  store %struct.Stack* %0, %struct.Stack** %2, align 8
  %5 = load %struct.Stack*, %struct.Stack** %2, align 8
  %6 = getelementptr inbounds %struct.Stack, %struct.Stack* %5, i32 0, i32 1
  %7 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %6) #3
  store i32 0, i32* %3, align 4
  %8 = load %struct.Stack*, %struct.Stack** %2, align 8
  %9 = getelementptr inbounds %struct.Stack, %struct.Stack* %8, i32 0, i32 0
  %10 = load %struct.Node*, %struct.Node** %9, align 8
  store %struct.Node* %10, %struct.Node** %4, align 8
  br label %11

11:                                               ; preds = %14, %1
  %12 = load %struct.Node*, %struct.Node** %4, align 8
  %13 = icmp ne %struct.Node* %12, null
  br i1 %13, label %14, label %20

14:                                               ; preds = %11
  %15 = load i32, i32* %3, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %3, align 4
  %17 = load %struct.Node*, %struct.Node** %4, align 8
  %18 = getelementptr inbounds %struct.Node, %struct.Node* %17, i32 0, i32 1
  %19 = load %struct.Node*, %struct.Node** %18, align 8
  store %struct.Node* %19, %struct.Node** %4, align 8
  br label %11

20:                                               ; preds = %11
  %21 = load %struct.Stack*, %struct.Stack** %2, align 8
  %22 = getelementptr inbounds %struct.Stack, %struct.Stack* %21, i32 0, i32 1
  %23 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %22) #3
  %24 = load i32, i32* %3, align 4
  ret i32 %24
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @stack_clear(%struct.Stack* %0) #0 {
  %2 = alloca %struct.Stack*, align 8
  %3 = alloca %struct.Node*, align 8
  store %struct.Stack* %0, %struct.Stack** %2, align 8
  %4 = load %struct.Stack*, %struct.Stack** %2, align 8
  %5 = getelementptr inbounds %struct.Stack, %struct.Stack* %4, i32 0, i32 1
  %6 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %5) #3
  br label %7

7:                                                ; preds = %12, %1
  %8 = load %struct.Stack*, %struct.Stack** %2, align 8
  %9 = call i32 @stack_is_empty(%struct.Stack* %8)
  %10 = icmp ne i32 %9, 0
  %11 = xor i1 %10, true
  br i1 %11, label %12, label %23

12:                                               ; preds = %7
  %13 = load %struct.Stack*, %struct.Stack** %2, align 8
  %14 = getelementptr inbounds %struct.Stack, %struct.Stack* %13, i32 0, i32 0
  %15 = load %struct.Node*, %struct.Node** %14, align 8
  store %struct.Node* %15, %struct.Node** %3, align 8
  %16 = load %struct.Node*, %struct.Node** %3, align 8
  %17 = getelementptr inbounds %struct.Node, %struct.Node* %16, i32 0, i32 1
  %18 = load %struct.Node*, %struct.Node** %17, align 8
  %19 = load %struct.Stack*, %struct.Stack** %2, align 8
  %20 = getelementptr inbounds %struct.Stack, %struct.Stack* %19, i32 0, i32 0
  store %struct.Node* %18, %struct.Node** %20, align 8
  %21 = load %struct.Node*, %struct.Node** %3, align 8
  %22 = bitcast %struct.Node* %21 to i8*
  call void @free(i8* %22) #3
  br label %7

23:                                               ; preds = %7
  %24 = load %struct.Stack*, %struct.Stack** %2, align 8
  %25 = getelementptr inbounds %struct.Stack, %struct.Stack* %24, i32 0, i32 1
  %26 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %25) #3
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @stack_destroy(%struct.Stack* %0) #0 {
  %2 = alloca %struct.Stack*, align 8
  store %struct.Stack* %0, %struct.Stack** %2, align 8
  %3 = load %struct.Stack*, %struct.Stack** %2, align 8
  %4 = getelementptr inbounds %struct.Stack, %struct.Stack* %3, i32 0, i32 1
  %5 = call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* %4) #3
  ret void
}

; Function Attrs: nounwind
declare dso_local i32 @pthread_mutex_destroy(%union.pthread_mutex_t*) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i8* @thread_func(i8* %0) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.Stack*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %9 = call i32 @rand() #3
  store i32 %9, i32* %3, align 4
  %10 = load i8*, i8** %2, align 8
  %11 = bitcast i8* %10 to %struct.Stack*
  store %struct.Stack* %11, %struct.Stack** %4, align 8
  %12 = load i32, i32* %3, align 4
  store i32 %12, i32* %5, align 4
  br label %13

13:                                               ; preds = %23, %1
  %14 = load i32, i32* %5, align 4
  %15 = load i32, i32* %3, align 4
  %16 = add nsw i32 %15, 10
  %17 = icmp slt i32 %14, %16
  br i1 %17, label %18, label %26

18:                                               ; preds = %13
  %19 = load %struct.Stack*, %struct.Stack** %4, align 8
  %20 = load i32, i32* %5, align 4
  call void @stack_push(%struct.Stack* %19, i32 %20)
  %21 = load i32, i32* %5, align 4
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0), i32 %21)
  br label %23

23:                                               ; preds = %18
  %24 = load i32, i32* %5, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %5, align 4
  br label %13

26:                                               ; preds = %13
  store i32 0, i32* %6, align 4
  br label %27

27:                                               ; preds = %41, %26
  %28 = load i32, i32* %6, align 4
  %29 = icmp slt i32 %28, 15
  br i1 %29, label %30, label %44

30:                                               ; preds = %27
  %31 = load %struct.Stack*, %struct.Stack** %4, align 8
  %32 = call i32 @stack_pop(%struct.Stack* %31)
  store i32 %32, i32* %7, align 4
  %33 = load i32, i32* %7, align 4
  %34 = icmp ne i32 %33, -1
  br i1 %34, label %35, label %38

35:                                               ; preds = %30
  %36 = load i32, i32* %7, align 4
  %37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i32 %36)
  br label %40

38:                                               ; preds = %30
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0))
  br label %40

40:                                               ; preds = %38, %35
  br label %41

41:                                               ; preds = %40
  %42 = load i32, i32* %6, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %6, align 4
  br label %27

44:                                               ; preds = %27
  %45 = load %struct.Stack*, %struct.Stack** %4, align 8
  %46 = call i32 @stack_pop(%struct.Stack* %45)
  store i32 %46, i32* %8, align 4
  %47 = load i32, i32* %8, align 4
  %48 = icmp ne i32 %47, -1
  br i1 %48, label %49, label %54

49:                                               ; preds = %44
  %50 = load i32, i32* %8, align 4
  %51 = add nsw i32 %50, 10
  store i32 %51, i32* %8, align 4
  %52 = load %struct.Stack*, %struct.Stack** %4, align 8
  %53 = load i32, i32* %8, align 4
  call void @stack_push(%struct.Stack* %52, i32 %53)
  br label %54

54:                                               ; preds = %49, %44
  ret i8* null
}

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.Stack, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  store i32 2, i32* %2, align 4
  %8 = load i32, i32* %2, align 4
  %9 = zext i32 %8 to i64
  %10 = call i8* @llvm.stacksave()
  store i8* %10, i8** %4, align 8
  %11 = alloca i64, i64 %9, align 16
  store i64 %9, i64* %5, align 8
  call void @stack_init(%struct.Stack* %3)
  call void @stack_push(%struct.Stack* %3, i32 5)
  call void @stack_push(%struct.Stack* %3, i32 10)
  store i32 0, i32* %6, align 4
  br label %12

12:                                               ; preds = %22, %0
  %13 = load i32, i32* %6, align 4
  %14 = load i32, i32* %2, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %25

16:                                               ; preds = %12
  %17 = load i32, i32* %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i64, i64* %11, i64 %18
  %20 = bitcast %struct.Stack* %3 to i8*
  %21 = call i32 @pthread_create(i64* %19, %union.pthread_attr_t* null, i8* (i8*)* @thread_func, i8* %20) #3
  br label %22

22:                                               ; preds = %16
  %23 = load i32, i32* %6, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %6, align 4
  br label %12

25:                                               ; preds = %12
  store i32 0, i32* %7, align 4
  br label %26

26:                                               ; preds = %36, %25
  %27 = load i32, i32* %7, align 4
  %28 = load i32, i32* %2, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %39

30:                                               ; preds = %26
  %31 = load i32, i32* %7, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i64, i64* %11, i64 %32
  %34 = load i64, i64* %33, align 8
  %35 = call i32 @pthread_join(i64 %34, i8** null)
  br label %36

36:                                               ; preds = %30
  %37 = load i32, i32* %7, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %7, align 4
  br label %26

39:                                               ; preds = %26
  %40 = call i32 @stack_size(%struct.Stack* %3)
  %41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.7, i64 0, i64 0), i32 %40)
  br label %42

42:                                               ; preds = %46, %39
  %43 = call i32 @stack_is_empty(%struct.Stack* %3)
  %44 = icmp ne i32 %43, 0
  %45 = xor i1 %44, true
  br i1 %45, label %46, label %49

46:                                               ; preds = %42
  %47 = call i32 @stack_pop(%struct.Stack* %3)
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i64 0, i64 0), i32 %47)
  br label %42

49:                                               ; preds = %42
  call void @stack_destroy(%struct.Stack* %3)
  store i32 0, i32* %1, align 4
  %50 = load i8*, i8** %4, align 8
  call void @llvm.stackrestore(i8* %50)
  %51 = load i32, i32* %1, align 4
  ret i32 %51
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: nounwind
declare !callback !2 dso_local i32 @pthread_create(i64*, %union.pthread_attr_t*, i8* (i8*)*, i8*) #1

declare dso_local i32 @pthread_join(i64, i8**) #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3}
!3 = !{i64 2, i64 3, i1 false}
