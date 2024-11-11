	.text
	.file	"test1.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function factorial
.LCPI0_0:
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	4294967294              # 0xfffffffe
	.long	4294967293              # 0xfffffffd
.LCPI0_1:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
.LCPI0_2:
	.long	4294967292              # 0xfffffffc
	.long	4294967292              # 0xfffffffc
	.long	4294967292              # 0xfffffffc
	.long	4294967292              # 0xfffffffc
.LCPI0_3:
	.long	4294967288              # 0xfffffff8
	.long	4294967288              # 0xfffffff8
	.long	4294967288              # 0xfffffff8
	.long	4294967288              # 0xfffffff8
.LCPI0_4:
	.long	4294967284              # 0xfffffff4
	.long	4294967284              # 0xfffffff4
	.long	4294967284              # 0xfffffff4
	.long	4294967284              # 0xfffffff4
.LCPI0_5:
	.long	4294967280              # 0xfffffff0
	.long	4294967280              # 0xfffffff0
	.long	4294967280              # 0xfffffff0
	.long	4294967280              # 0xfffffff0
.LCPI0_6:
	.long	4294967276              # 0xffffffec
	.long	4294967276              # 0xffffffec
	.long	4294967276              # 0xffffffec
	.long	4294967276              # 0xffffffec
.LCPI0_7:
	.long	4294967272              # 0xffffffe8
	.long	4294967272              # 0xffffffe8
	.long	4294967272              # 0xffffffe8
	.long	4294967272              # 0xffffffe8
.LCPI0_8:
	.long	4294967268              # 0xffffffe4
	.long	4294967268              # 0xffffffe4
	.long	4294967268              # 0xffffffe4
	.long	4294967268              # 0xffffffe4
.LCPI0_9:
	.long	4294967264              # 0xffffffe0
	.long	4294967264              # 0xffffffe0
	.long	4294967264              # 0xffffffe0
	.long	4294967264              # 0xffffffe0
	.text
	.globl	factorial
	.p2align	4, 0x90
	.type	factorial,@function
factorial:                              # @factorial
.Lfunc_begin0:
	.file	1 "/home/toobak/OptiCortex/mapper/test/test1.c"
	.loc	1 3 0                   # test/test1.c:3:0
	.cfi_startproc
# %bb.0:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset %esi, -16
	.cfi_offset %edi, -12
	.cfi_offset %ebx, -8
	movl	16(%esp), %ecx
	movl	$1, %eax
.Ltmp0:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	.loc	1 4 11 prologue_end     # test/test1.c:4:11
	cmpl	$2, %ecx
.Ltmp1:
	.loc	1 4 9 is_stmt 0         # test/test1.c:4:9
	jl	.LBB0_12
.Ltmp2:
# %bb.1:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	leal	-1(%ecx), %edx
	movl	$1, %eax
	cmpl	$8, %edx
	jb	.LBB0_11
.Ltmp3:
# %bb.2:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	movl	%edx, %esi
	andl	$-8, %esi
	movd	%ecx, %xmm0
	pshufd	$0, %xmm0, %xmm6        # xmm6 = xmm0[0,0,0,0]
	paddd	.LCPI0_0, %xmm6
	leal	-8(%esi), %edi
	movl	%edi, %ebx
	shrl	$3, %ebx
	addl	$1, %ebx
	movl	%ebx, %eax
	andl	$3, %eax
	cmpl	$24, %edi
	jae	.LBB0_4
.Ltmp4:
# %bb.3:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	.loc	1 0 9                   # test/test1.c:0:9
	movdqa	.LCPI0_1, %xmm1         # xmm1 = [1,1,1,1]
	movdqa	%xmm1, %xmm4
	jmp	.LBB0_6
.Ltmp5:
.LBB0_4:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	.loc	1 4 9                   # test/test1.c:4:9
	movl	%eax, %edi
	subl	%ebx, %edi
	movdqa	.LCPI0_1, %xmm1         # xmm1 = [1,1,1,1]
	movdqa	%xmm1, %xmm4
.Ltmp6:
	.p2align	4, 0x90
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	.loc	1 0 9                   # test/test1.c:0:9
	movdqa	%xmm6, %xmm0
	paddd	.LCPI0_2, %xmm0
.Ltmp7:
	.loc	1 7 18 is_stmt 1        # test/test1.c:7:18
	pshufd	$245, %xmm1, %xmm5      # xmm5 = xmm1[1,1,3,3]
	pshufd	$245, %xmm6, %xmm7      # xmm7 = xmm6[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pmuludq	%xmm6, %xmm1
	pshufd	$245, %xmm4, %xmm5      # xmm5 = xmm4[1,1,3,3]
	pshufd	$245, %xmm0, %xmm2      # xmm2 = xmm0[1,1,3,3]
	pmuludq	%xmm5, %xmm2
	pmuludq	%xmm4, %xmm0
	movdqa	%xmm6, %xmm4
	paddd	.LCPI0_3, %xmm4
	movdqa	%xmm6, %xmm5
	paddd	.LCPI0_4, %xmm5
	pmuludq	%xmm4, %xmm1
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm7, %xmm4
	pmuludq	%xmm5, %xmm0
	pshufd	$245, %xmm5, %xmm5      # xmm5 = xmm5[1,1,3,3]
	pmuludq	%xmm2, %xmm5
	movdqa	%xmm6, %xmm2
	paddd	.LCPI0_5, %xmm2
	pshufd	$245, %xmm2, %xmm7      # xmm7 = xmm2[1,1,3,3]
	pmuludq	%xmm4, %xmm7
	movdqa	%xmm6, %xmm4
	paddd	.LCPI0_6, %xmm4
	pmuludq	%xmm1, %xmm2
	pshufd	$245, %xmm4, %xmm3      # xmm3 = xmm4[1,1,3,3]
	pmuludq	%xmm5, %xmm3
	pmuludq	%xmm0, %xmm4
	movdqa	%xmm6, %xmm0
	paddd	.LCPI0_7, %xmm0
	pmuludq	%xmm0, %xmm2
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm7, %xmm0
	pshufd	$232, %xmm2, %xmm1      # xmm1 = xmm2[0,2,2,3]
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movdqa	%xmm6, %xmm0
	paddd	.LCPI0_8, %xmm0
	pmuludq	%xmm0, %xmm4
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm3, %xmm0
	pshufd	$232, %xmm4, %xmm4      # xmm4 = xmm4[0,2,2,3]
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm4    # xmm4 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
	paddd	.LCPI0_9, %xmm6
	addl	$4, %edi
	jne	.LBB0_5
.Ltmp8:
.LBB0_6:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	movdqa	%xmm1, %xmm5
	movdqa	%xmm4, %xmm0
	testl	%eax, %eax
	je	.LBB0_9
.Ltmp9:
# %bb.7:                                # %.preheader
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	.loc	1 0 18 is_stmt 0        # test/test1.c:0:18
	negl	%eax
	movdqa	.LCPI0_2, %xmm2         # xmm2 = [4294967292,4294967292,4294967292,4294967292]
	movdqa	.LCPI0_3, %xmm3         # xmm3 = [4294967288,4294967288,4294967288,4294967288]
.Ltmp10:
	.p2align	4, 0x90
.LBB0_8:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	movdqa	%xmm6, %xmm0
	paddd	%xmm2, %xmm0
	.loc	1 7 18                  # test/test1.c:7:18
	movdqa	%xmm6, %xmm5
	pmuludq	%xmm1, %xmm5
	pshufd	$232, %xmm5, %xmm5      # xmm5 = xmm5[0,2,2,3]
	pshufd	$245, %xmm1, %xmm1      # xmm1 = xmm1[1,1,3,3]
	pshufd	$245, %xmm6, %xmm7      # xmm7 = xmm6[1,1,3,3]
	pmuludq	%xmm1, %xmm7
	pshufd	$232, %xmm7, %xmm1      # xmm1 = xmm7[0,2,2,3]
	punpckldq	%xmm1, %xmm5    # xmm5 = xmm5[0],xmm1[0],xmm5[1],xmm1[1]
	pshufd	$245, %xmm0, %xmm1      # xmm1 = xmm0[1,1,3,3]
	pmuludq	%xmm4, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	pshufd	$245, %xmm4, %xmm4      # xmm4 = xmm4[1,1,3,3]
	pmuludq	%xmm1, %xmm4
	pshufd	$232, %xmm4, %xmm1      # xmm1 = xmm4[0,2,2,3]
	punpckldq	%xmm1, %xmm0    # xmm0 = xmm0[0],xmm1[0],xmm0[1],xmm1[1]
	paddd	%xmm3, %xmm6
	movdqa	%xmm5, %xmm1
	movdqa	%xmm0, %xmm4
	incl	%eax
	jne	.LBB0_8
.Ltmp11:
.LBB0_9:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	.loc	1 4 9 is_stmt 1         # test/test1.c:4:9
	pshufd	$245, %xmm5, %xmm1      # xmm1 = xmm5[1,1,3,3]
	pshufd	$245, %xmm0, %xmm2      # xmm2 = xmm0[1,1,3,3]
	pmuludq	%xmm1, %xmm2
	pmuludq	%xmm5, %xmm0
	pshufd	$78, %xmm0, %xmm1       # xmm1 = xmm0[2,3,0,1]
	pmuludq	%xmm0, %xmm1
	pshufd	$10, %xmm2, %xmm0       # xmm0 = xmm2[2,2,0,0]
	pmuludq	%xmm2, %xmm0
	pmuludq	%xmm1, %xmm0
	movd	%xmm0, %eax
	cmpl	%esi, %edx
	je	.LBB0_12
.Ltmp12:
# %bb.10:
	#DEBUG_VALUE: factorial:n <- [DW_OP_plus_uconst 16] [$esp+0]
	.loc	1 0 9 is_stmt 0         # test/test1.c:0:9
	subl	%esi, %ecx
.Ltmp13:
	.p2align	4, 0x90
.LBB0_11:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: factorial:n <- $ecx
	.loc	1 7 18 is_stmt 1        # test/test1.c:7:18
	imull	%ecx, %eax
	.loc	1 4 11                  # test/test1.c:4:11
	cmpl	$2, %ecx
	.loc	1 7 32                  # test/test1.c:7:32
	leal	-1(%ecx), %ecx
.Ltmp14:
	.loc	1 4 9                   # test/test1.c:4:9
	jg	.LBB0_11
.LBB0_12:
	.loc	1 8 1                   # test/test1.c:8:1
	popl	%esi
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_def_cfa_offset 4
	retl
.Ltmp15:
.Lfunc_end0:
	.size	factorial, .Lfunc_end0-factorial
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4               # -- Begin function main
.LCPI1_0:
	.long	0                       # 0x0
	.long	4294967295              # 0xffffffff
	.long	4294967294              # 0xfffffffe
	.long	4294967293              # 0xfffffffd
.LCPI1_1:
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
	.long	1                       # 0x1
.LCPI1_2:
	.long	4294967292              # 0xfffffffc
	.long	4294967292              # 0xfffffffc
	.long	4294967292              # 0xfffffffc
	.long	4294967292              # 0xfffffffc
.LCPI1_3:
	.long	4294967288              # 0xfffffff8
	.long	4294967288              # 0xfffffff8
	.long	4294967288              # 0xfffffff8
	.long	4294967288              # 0xfffffff8
.LCPI1_4:
	.long	4294967284              # 0xfffffff4
	.long	4294967284              # 0xfffffff4
	.long	4294967284              # 0xfffffff4
	.long	4294967284              # 0xfffffff4
.LCPI1_5:
	.long	4294967280              # 0xfffffff0
	.long	4294967280              # 0xfffffff0
	.long	4294967280              # 0xfffffff0
	.long	4294967280              # 0xfffffff0
.LCPI1_6:
	.long	4294967276              # 0xffffffec
	.long	4294967276              # 0xffffffec
	.long	4294967276              # 0xffffffec
	.long	4294967276              # 0xffffffec
.LCPI1_7:
	.long	4294967272              # 0xffffffe8
	.long	4294967272              # 0xffffffe8
	.long	4294967272              # 0xffffffe8
	.long	4294967272              # 0xffffffe8
.LCPI1_8:
	.long	4294967268              # 0xffffffe4
	.long	4294967268              # 0xffffffe4
	.long	4294967268              # 0xffffffe4
	.long	4294967268              # 0xffffffe4
.LCPI1_9:
	.long	4294967264              # 0xffffffe0
	.long	4294967264              # 0xffffffe0
	.long	4294967264              # 0xffffffe0
	.long	4294967264              # 0xffffffe0
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
.Lfunc_begin1:
	.loc	1 10 0                  # test/test1.c:10:0
	.cfi_startproc
# %bb.0:
	pushl	%ebx
	.cfi_def_cfa_offset 8
	pushl	%edi
	.cfi_def_cfa_offset 12
	pushl	%esi
	.cfi_def_cfa_offset 16
	subl	$16, %esp
	.cfi_def_cfa_offset 32
	.cfi_offset %esi, -16
	.cfi_offset %edi, -12
	.cfi_offset %ebx, -8
	.loc	1 12 5 prologue_end     # test/test1.c:12:5
	movl	$.L.str, (%esp)
	calll	printf
.Ltmp16:
	#DEBUG_VALUE: main:num <- [DW_OP_plus_uconst 12, DW_OP_deref] $esp
	.loc	1 0 5 is_stmt 0         # test/test1.c:0:5
	leal	12(%esp), %eax
	.loc	1 13 5 is_stmt 1        # test/test1.c:13:5
	movl	%eax, 4(%esp)
	movl	$.L.str.1, (%esp)
	calll	__isoc99_scanf
.Ltmp17:
	.loc	1 15 9                  # test/test1.c:15:9
	movl	12(%esp), %eax
.Ltmp18:
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 15 13 is_stmt 0       # test/test1.c:15:13
	testl	%eax, %eax
.Ltmp19:
	.loc	1 15 9                  # test/test1.c:15:9
	js	.LBB1_1
.Ltmp20:
# %bb.2:
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 0 9                   # test/test1.c:0:9
	movl	$1, %esi
.Ltmp21:
	#DEBUG_VALUE: factorial:n <- $eax
	.loc	1 4 11 is_stmt 1        # test/test1.c:4:11
	cmpl	$2, %eax
.Ltmp22:
	.loc	1 4 9 is_stmt 0         # test/test1.c:4:9
	jl	.LBB1_14
.Ltmp23:
# %bb.3:
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	leal	-1(%eax), %ecx
	movl	$1, %esi
	movl	%eax, %edi
	cmpl	$8, %ecx
	jb	.LBB1_13
.Ltmp24:
# %bb.4:
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	movl	%ecx, %edx
	andl	$-8, %edx
	movd	%eax, %xmm0
	pshufd	$0, %xmm0, %xmm6        # xmm6 = xmm0[0,0,0,0]
	paddd	.LCPI1_0, %xmm6
	leal	-8(%edx), %edi
	movl	%edi, %ebx
	shrl	$3, %ebx
	addl	$1, %ebx
	movl	%ebx, %esi
	andl	$3, %esi
	cmpl	$24, %edi
	jae	.LBB1_6
.Ltmp25:
# %bb.5:
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 0 9                   # test/test1.c:0:9
	movdqa	.LCPI1_1, %xmm1         # xmm1 = [1,1,1,1]
	movdqa	%xmm1, %xmm2
	jmp	.LBB1_8
.Ltmp26:
.LBB1_1:
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 16 9 is_stmt 1        # test/test1.c:16:9
	movl	$.Lstr, (%esp)
	calll	puts
.Ltmp27:
	.loc	1 0 9 is_stmt 0         # test/test1.c:0:9
	jmp	.LBB1_15
.LBB1_6:
.Ltmp28:
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 4 9 is_stmt 1         # test/test1.c:4:9
	movl	%esi, %edi
	subl	%ebx, %edi
	movdqa	.LCPI1_1, %xmm1         # xmm1 = [1,1,1,1]
	movdqa	%xmm1, %xmm2
.Ltmp29:
	.p2align	4, 0x90
.LBB1_7:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 0 9 is_stmt 0         # test/test1.c:0:9
	movdqa	%xmm6, %xmm0
	paddd	.LCPI1_2, %xmm0
.Ltmp30:
	.loc	1 7 18 is_stmt 1        # test/test1.c:7:18
	pshufd	$245, %xmm6, %xmm7      # xmm7 = xmm6[1,1,3,3]
	pshufd	$245, %xmm1, %xmm3      # xmm3 = xmm1[1,1,3,3]
	pmuludq	%xmm7, %xmm3
	pmuludq	%xmm6, %xmm1
	pshufd	$245, %xmm2, %xmm7      # xmm7 = xmm2[1,1,3,3]
	pshufd	$245, %xmm0, %xmm4      # xmm4 = xmm0[1,1,3,3]
	pmuludq	%xmm7, %xmm4
	pmuludq	%xmm2, %xmm0
	movdqa	%xmm6, %xmm2
	paddd	.LCPI1_3, %xmm2
	movdqa	%xmm6, %xmm7
	paddd	.LCPI1_4, %xmm7
	pmuludq	%xmm2, %xmm1
	pshufd	$245, %xmm2, %xmm2      # xmm2 = xmm2[1,1,3,3]
	pmuludq	%xmm3, %xmm2
	pmuludq	%xmm7, %xmm0
	pshufd	$245, %xmm7, %xmm3      # xmm3 = xmm7[1,1,3,3]
	pmuludq	%xmm4, %xmm3
	movdqa	%xmm6, %xmm4
	paddd	.LCPI1_5, %xmm4
	pshufd	$245, %xmm4, %xmm7      # xmm7 = xmm4[1,1,3,3]
	pmuludq	%xmm2, %xmm7
	movdqa	%xmm6, %xmm2
	paddd	.LCPI1_6, %xmm2
	pmuludq	%xmm1, %xmm4
	pshufd	$245, %xmm2, %xmm5      # xmm5 = xmm2[1,1,3,3]
	pmuludq	%xmm3, %xmm5
	pmuludq	%xmm0, %xmm2
	movdqa	%xmm6, %xmm0
	paddd	.LCPI1_7, %xmm0
	pmuludq	%xmm0, %xmm4
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm7, %xmm0
	pshufd	$232, %xmm4, %xmm1      # xmm1 = xmm4[0,2,2,3]
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm1    # xmm1 = xmm1[0],xmm0[0],xmm1[1],xmm0[1]
	movdqa	%xmm6, %xmm0
	paddd	.LCPI1_8, %xmm0
	pmuludq	%xmm0, %xmm2
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm5, %xmm0
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	.LCPI1_9, %xmm6
	addl	$4, %edi
	jne	.LBB1_7
.Ltmp31:
.LBB1_8:
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 0 18 is_stmt 0        # test/test1.c:0:18
	testl	%esi, %esi
	je	.LBB1_11
.Ltmp32:
# %bb.9:                                # %.preheader
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	negl	%esi
	movdqa	.LCPI1_2, %xmm3         # xmm3 = [4294967292,4294967292,4294967292,4294967292]
	movdqa	.LCPI1_3, %xmm4         # xmm4 = [4294967288,4294967288,4294967288,4294967288]
.Ltmp33:
	.p2align	4, 0x90
.LBB1_10:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	movdqa	%xmm6, %xmm0
	paddd	%xmm3, %xmm0
	.loc	1 7 18                  # test/test1.c:7:18
	pshufd	$245, %xmm1, %xmm5      # xmm5 = xmm1[1,1,3,3]
	pmuludq	%xmm6, %xmm1
	pshufd	$232, %xmm1, %xmm1      # xmm1 = xmm1[0,2,2,3]
	pshufd	$245, %xmm6, %xmm7      # xmm7 = xmm6[1,1,3,3]
	pmuludq	%xmm5, %xmm7
	pshufd	$232, %xmm7, %xmm5      # xmm5 = xmm7[0,2,2,3]
	punpckldq	%xmm5, %xmm1    # xmm1 = xmm1[0],xmm5[0],xmm1[1],xmm5[1]
	pshufd	$245, %xmm2, %xmm5      # xmm5 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm2
	pshufd	$232, %xmm2, %xmm2      # xmm2 = xmm2[0,2,2,3]
	pshufd	$245, %xmm0, %xmm0      # xmm0 = xmm0[1,1,3,3]
	pmuludq	%xmm5, %xmm0
	pshufd	$232, %xmm0, %xmm0      # xmm0 = xmm0[0,2,2,3]
	punpckldq	%xmm0, %xmm2    # xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
	paddd	%xmm4, %xmm6
	incl	%esi
	jne	.LBB1_10
.Ltmp34:
.LBB1_11:
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 4 9 is_stmt 1         # test/test1.c:4:9
	pshufd	$245, %xmm1, %xmm0      # xmm0 = xmm1[1,1,3,3]
	pshufd	$245, %xmm2, %xmm3      # xmm3 = xmm2[1,1,3,3]
	pmuludq	%xmm0, %xmm3
	pmuludq	%xmm1, %xmm2
	pshufd	$78, %xmm2, %xmm0       # xmm0 = xmm2[2,3,0,1]
	pmuludq	%xmm2, %xmm0
	pshufd	$10, %xmm3, %xmm1       # xmm1 = xmm3[2,2,0,0]
	pmuludq	%xmm3, %xmm1
	pmuludq	%xmm0, %xmm1
	movd	%xmm1, %esi
	cmpl	%edx, %ecx
	je	.LBB1_14
.Ltmp35:
# %bb.12:
	#DEBUG_VALUE: factorial:n <- $eax
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 0 9 is_stmt 0         # test/test1.c:0:9
	movl	%eax, %edi
	subl	%edx, %edi
.Ltmp36:
	.p2align	4, 0x90
.LBB1_13:                               # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:num <- $eax
	#DEBUG_VALUE: factorial:n <- $edi
	.loc	1 7 18 is_stmt 1        # test/test1.c:7:18
	imull	%edi, %esi
	.loc	1 4 11                  # test/test1.c:4:11
	cmpl	$2, %edi
	.loc	1 7 32                  # test/test1.c:7:32
	leal	-1(%edi), %edi
.Ltmp37:
	.loc	1 4 9                   # test/test1.c:4:9
	jg	.LBB1_13
.Ltmp38:
.LBB1_14:
	#DEBUG_VALUE: main:num <- $eax
	.loc	1 18 9                  # test/test1.c:18:9
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.L.str.3, (%esp)
	calll	printf
.Ltmp39:
.LBB1_15:
	.loc	1 20 5                  # test/test1.c:20:5
	xorl	%eax, %eax
	addl	$16, %esp
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_def_cfa_offset 4
	retl
.Ltmp40:
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Enter a positive integer: "
	.size	.L.str, 27

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"%d"
	.size	.L.str.1, 3

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"Factorial of %d is %d\n"
	.size	.L.str.3, 23

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"Factorial is not defined for negative numbers."
	.size	.Lstr, 47

	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 10.0.0-4ubuntu1 " # string offset=0
.Linfo_string1:
	.asciz	"test/test1.c"          # string offset=31
.Linfo_string2:
	.asciz	"/home/toobak/OptiCortex/mapper" # string offset=44
.Linfo_string3:
	.asciz	"factorial"             # string offset=75
.Linfo_string4:
	.asciz	"int"                   # string offset=85
.Linfo_string5:
	.asciz	"n"                     # string offset=89
.Linfo_string6:
	.asciz	"main"                  # string offset=91
.Linfo_string7:
	.asciz	"num"                   # string offset=96
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
	.long	.Ltmp0-.Lfunc_begin0
	.long	.Ltmp13-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	116                     # DW_OP_breg4
	.byte	16                      # 16
	.long	.Ltmp13-.Lfunc_begin0
	.long	.Ltmp14-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	81                      # DW_OP_reg1
	.long	0
	.long	0
.Ldebug_loc1:
	.long	.Ltmp16-.Lfunc_begin0
	.long	.Ltmp18-.Lfunc_begin0
	.short	2                       # Loc expr size
	.byte	116                     # DW_OP_breg4
	.byte	12                      # 12
	.long	.Ltmp18-.Lfunc_begin0
	.long	.Ltmp27-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.long	.Ltmp28-.Lfunc_begin0
	.long	.Ltmp39-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.long	0
	.long	0
.Ldebug_loc2:
	.long	.Ltmp21-.Lfunc_begin0
	.long	.Ltmp26-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.long	.Ltmp28-.Lfunc_begin0
	.long	.Ltmp36-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	80                      # DW_OP_reg0
	.long	.Ltmp36-.Lfunc_begin0
	.long	.Ltmp37-.Lfunc_begin0
	.short	1                       # Loc expr size
	.byte	87                      # DW_OP_reg7
	.long	0
	.long	0
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\227B"                 # DW_AT_GNU_all_call_sites
	.byte	25                      # DW_FORM_flag_present
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	32                      # DW_AT_inline
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.ascii	"\227B"                 # DW_AT_GNU_all_call_sites
	.byte	25                      # DW_FORM_flag_present
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	23                      # DW_FORM_sec_offset
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	29                      # DW_TAG_inlined_subroutine
	.byte	1                       # DW_CHILDREN_yes
	.byte	49                      # DW_AT_abstract_origin
	.byte	19                      # DW_FORM_ref4
	.byte	85                      # DW_AT_ranges
	.byte	23                      # DW_FORM_sec_offset
	.byte	88                      # DW_AT_call_file
	.byte	11                      # DW_FORM_data1
	.byte	89                      # DW_AT_call_line
	.byte	11                      # DW_FORM_data1
	.byte	87                      # DW_AT_call_column
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	.Ldebug_info_end0-.Ldebug_info_start0 # Length of Unit
.Ldebug_info_start0:
	.short	4                       # DWARF version number
	.long	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	4                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x8f DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
	.long	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x26:0x19 DW_TAG_subprogram
	.long	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	84
                                        # DW_AT_GNU_all_call_sites
	.long	63                      # DW_AT_abstract_origin
	.byte	3                       # Abbrev [3] 0x35:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc0            # DW_AT_location
	.long	75                      # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	4                       # Abbrev [4] 0x3f:0x18 DW_TAG_subprogram
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	87                      # DW_AT_type
                                        # DW_AT_external
	.byte	1                       # DW_AT_inline
	.byte	5                       # Abbrev [5] 0x4b:0xb DW_TAG_formal_parameter
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	87                      # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x57:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0x5e:0x3b DW_TAG_subprogram
	.long	.Lfunc_begin1           # DW_AT_low_pc
	.long	.Lfunc_end1-.Lfunc_begin1 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	84
                                        # DW_AT_GNU_all_call_sites
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	10                      # DW_AT_decl_line
	.long	87                      # DW_AT_type
                                        # DW_AT_external
	.byte	8                       # Abbrev [8] 0x73:0xf DW_TAG_variable
	.long	.Ldebug_loc1            # DW_AT_location
	.long	.Linfo_string7          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	11                      # DW_AT_decl_line
	.long	87                      # DW_AT_type
	.byte	9                       # Abbrev [9] 0x82:0x16 DW_TAG_inlined_subroutine
	.long	63                      # DW_AT_abstract_origin
	.long	.Ldebug_ranges0         # DW_AT_ranges
	.byte	1                       # DW_AT_call_file
	.byte	18                      # DW_AT_call_line
	.byte	48                      # DW_AT_call_column
	.byte	3                       # Abbrev [3] 0x8e:0x9 DW_TAG_formal_parameter
	.long	.Ldebug_loc2            # DW_AT_location
	.long	75                      # DW_AT_abstract_origin
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
	.byte	0                       # End Of Children Mark
.Ldebug_info_end0:
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltmp21-.Lfunc_begin0
	.long	.Ltmp25-.Lfunc_begin0
	.long	.Ltmp28-.Lfunc_begin0
	.long	.Ltmp38-.Lfunc_begin0
	.long	0
	.long	0
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
