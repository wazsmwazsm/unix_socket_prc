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
	subq	$256, %rsp              ## imm = 0x100
	movl	$2, %edi
	movl	$1, %esi
	movl	$6, %edx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -148(%rbp)
	callq	_socket
	movl	%eax, -152(%rbp)
	cmpl	$0, -152(%rbp)
	jge	LBB0_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -148(%rbp)
	movl	%eax, -168(%rbp)        ## 4-byte Spill
	jmp	LBB0_15
LBB0_2:
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4, %eax
	leaq	-156(%rbp), %rcx
	movl	$1, -156(%rbp)
	movl	-152(%rbp), %edi
	movl	%eax, %edx
	movl	%eax, %r8d
	callq	_setsockopt
	cmpl	$0, %eax
	jge	LBB0_4
## %bb.3:
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -148(%rbp)
	movl	%eax, -172(%rbp)        ## 4-byte Spill
	jmp	LBB0_15
LBB0_4:
	leaq	L_.str.2(%rip), %rdi
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
	movq	%rdi, -184(%rbp)        ## 8-byte Spill
	movq	%r9, %rdi
	movl	%edx, -188(%rbp)        ## 4-byte Spill
	movq	%r8, %rdx
	callq	_memset
	movl	-152(%rbp), %edi
	movq	-184(%rbp), %rdx        ## 8-byte Reload
	movq	%rdx, %rsi
	movl	-188(%rbp), %edx        ## 4-byte Reload
	callq	_bind
	cmpl	$0, %eax
	jge	LBB0_6
## %bb.5:
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -148(%rbp)
	movl	%eax, -192(%rbp)        ## 4-byte Spill
	jmp	LBB0_15
LBB0_6:
	movl	$20, %esi
	movl	-152(%rbp), %edi
	callq	_listen
	cmpl	$0, %eax
	jge	LBB0_8
## %bb.7:
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -148(%rbp)
	movl	%eax, -196(%rbp)        ## 4-byte Spill
	jmp	LBB0_15
LBB0_8:
	leaq	-160(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movl	$16, -160(%rbp)
	movl	-152(%rbp), %edi
	movq	%rax, %rsi
	callq	_accept
	movl	%eax, -164(%rbp)
	cmpl	$0, -164(%rbp)
	jge	LBB0_10
## %bb.9:
	leaq	L_.str.5(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -148(%rbp)
	movl	%eax, -200(%rbp)        ## 4-byte Spill
	jmp	LBB0_15
LBB0_10:
	movl	-36(%rbp), %edi
	callq	_inet_ntoa
	leaq	L_.str.6(%rip), %rdi
	movzwl	-38(%rbp), %edx
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	$5, %edi
	movl	%eax, -204(%rbp)        ## 4-byte Spill
	callq	_sleep
	movl	$100, %edx
	movl	%edx, %esi
	leaq	-144(%rbp), %rcx
	xorl	%edx, %edx
	movq	%rcx, %r8
	movq	%r8, %rdi
	movq	%rsi, -216(%rbp)        ## 8-byte Spill
	movl	%edx, %esi
	movq	-216(%rbp), %rdx        ## 8-byte Reload
	movl	%eax, -220(%rbp)        ## 4-byte Spill
	movq	%rcx, -232(%rbp)        ## 8-byte Spill
	callq	_memset
	movl	-164(%rbp), %edi
	movq	-232(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rsi
	movq	-216(%rbp), %rdx        ## 8-byte Reload
	callq	_read
	cmpq	$0, %rax
	jge	LBB0_12
## %bb.11:
	leaq	L_.str.7(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -148(%rbp)
	movl	%eax, -236(%rbp)        ## 4-byte Spill
	jmp	LBB0_15
LBB0_12:
	leaq	L_.str.8(%rip), %rdi
	leaq	-144(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movl	$100, %ecx
	movl	%ecx, %edx
	leaq	-144(%rbp), %rsi
	movl	-164(%rbp), %edi
	movl	%eax, -240(%rbp)        ## 4-byte Spill
	callq	_write
	cmpq	$0, %rax
	jge	LBB0_14
## %bb.13:
	leaq	L_.str.9(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -148(%rbp)
	movl	%eax, -244(%rbp)        ## 4-byte Spill
	jmp	LBB0_15
LBB0_14:
	movl	-164(%rbp), %edi
	callq	_close
	movl	-152(%rbp), %edi
	movl	%eax, -248(%rbp)        ## 4-byte Spill
	callq	_close
	movl	$0, -148(%rbp)
	movl	%eax, -252(%rbp)        ## 4-byte Spill
LBB0_15:
	movl	-148(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -256(%rbp)        ## 4-byte Spill
	jne	LBB0_17
## %bb.16:
	movl	-256(%rbp), %eax        ## 4-byte Reload
	addq	$256, %rsp              ## imm = 0x100
	popq	%rbp
	retq
LBB0_17:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"socket create err\n"

L_.str.1:                               ## @.str.1
	.asciz	"set socket reuse addr err\n"

L_.str.2:                               ## @.str.2
	.asciz	"127.0.0.1"

L_.str.3:                               ## @.str.3
	.asciz	"bind err\n"

L_.str.4:                               ## @.str.4
	.asciz	"listen err\n"

L_.str.5:                               ## @.str.5
	.asciz	"conn accept err\n"

L_.str.6:                               ## @.str.6
	.asciz	"conn accepted ip: %s port: %d\n"

L_.str.7:                               ## @.str.7
	.asciz	"read err\n"

L_.str.8:                               ## @.str.8
	.asciz	"request content: %s"

L_.str.9:                               ## @.str.9
	.asciz	"write err\n"


.subsections_via_symbols
