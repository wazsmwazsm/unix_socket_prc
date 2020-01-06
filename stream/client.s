	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 13
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$208, %rsp
	movl	$2, %edi
	movl	$1, %esi
	xorl	%edx, %edx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -132(%rbp)
	callq	_socket
	movl	%eax, -136(%rbp)
	cmpl	$0, -136(%rbp)
	jge	LBB0_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -132(%rbp)
	movl	%eax, -152(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_2:
	leaq	L_.str.1(%rip), %rdi
	movb	$2, -23(%rbp)
	callq	_inet_addr
	movl	$16, %edx
	leaq	-24(%rbp), %rdi
	xorl	%esi, %esi
	movl	$8, %ecx
	movl	%ecx, %r8d
	movl	%eax, -20(%rbp)
	movw	$26658, -22(%rbp)       ## imm = 0x6822
	movq	%rdi, %r9
	addq	$8, %r9
	movq	%rdi, -160(%rbp)        ## 8-byte Spill
	movq	%r9, %rdi
	movl	%edx, -164(%rbp)        ## 4-byte Spill
	movq	%r8, %rdx
	callq	_memset
	movl	-136(%rbp), %edi
	movq	-160(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, %rsi
	movl	-164(%rbp), %edx        ## 4-byte Reload
	callq	_connect
	cmpl	$0, %eax
	jge	LBB0_4
## %bb.3:
	leaq	L_.str.2(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -132(%rbp)
	movl	%eax, -168(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_4:
	leaq	L_.str.3(%rip), %rax
	movq	%rax, -144(%rbp)
	movl	$0, -148(%rbp)
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	cmpl	$3, -148(%rbp)
	jge	LBB0_10
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=1
	movl	-136(%rbp), %edi
	movq	-144(%rbp), %rsi
	movq	-144(%rbp), %rax
	movl	%edi, -172(%rbp)        ## 4-byte Spill
	movq	%rax, %rdi
	movq	%rsi, -184(%rbp)        ## 8-byte Spill
	callq	_strlen
	movl	-172(%rbp), %edi        ## 4-byte Reload
	movq	-184(%rbp), %rsi        ## 8-byte Reload
	movq	%rax, %rdx
	callq	_write
	cmpq	$0, %rax
	jge	LBB0_8
## %bb.7:
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -132(%rbp)
	movl	%eax, -188(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_8:                                 ##   in Loop: Header=BB0_5 Depth=1
	jmp	LBB0_9
LBB0_9:                                 ##   in Loop: Header=BB0_5 Depth=1
	movl	-148(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -148(%rbp)
	jmp	LBB0_5
LBB0_10:
	movl	$100, %eax
	movl	%eax, %edx
	leaq	-128(%rbp), %rcx
	movl	-136(%rbp), %edi
	movq	%rcx, %rsi
	callq	_read
	cmpq	$0, %rax
	jge	LBB0_12
## %bb.11:
	leaq	L_.str.5(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -132(%rbp)
	movl	%eax, -192(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_12:
	leaq	L_.str.6(%rip), %rdi
	leaq	-128(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movl	-136(%rbp), %edi
	movl	%eax, -196(%rbp)        ## 4-byte Spill
	callq	_close
	movl	$0, -132(%rbp)
	movl	%eax, -200(%rbp)        ## 4-byte Spill
LBB0_13:
	movl	-132(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -204(%rbp)        ## 4-byte Spill
	jne	LBB0_15
## %bb.14:
	movl	-204(%rbp), %eax        ## 4-byte Reload
	addq	$208, %rsp
	popq	%rbp
	retq
LBB0_15:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"socket create err\n"

L_.str.1:                               ## @.str.1
	.asciz	"127.0.0.1"

L_.str.2:                               ## @.str.2
	.asciz	"connect err\n"

L_.str.3:                               ## @.str.3
	.asciz	"hello"

L_.str.4:                               ## @.str.4
	.asciz	"write err\n"

L_.str.5:                               ## @.str.5
	.asciz	"read err\n"

L_.str.6:                               ## @.str.6
	.asciz	"Message form server: %s\n"


.subsections_via_symbols
