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
	subq	$176, %rsp
	movl	$2, %edi
	movl	$1, %esi
	xorl	%edx, %edx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -68(%rbp)
	callq	_socket
	movl	%eax, -72(%rbp)
	cmpl	$0, -72(%rbp)
	jge	LBB0_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -68(%rbp)
	movl	%eax, -92(%rbp)         ## 4-byte Spill
	jmp	LBB0_7
LBB0_2:
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4097, %edx             ## imm = 0x1001
	leaq	-84(%rbp), %r8
	leaq	-76(%rbp), %rax
	movl	$4, -84(%rbp)
	movl	-72(%rbp), %edi
	movq	%rax, %rcx
	callq	_getsockopt
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4098, %edx             ## imm = 0x1002
	leaq	-84(%rbp), %r8
	leaq	-80(%rbp), %rcx
	movl	-72(%rbp), %edi
	movl	%eax, -96(%rbp)         ## 4-byte Spill
	callq	_getsockopt
	leaq	L_.str.1(%rip), %rdi
	movl	-76(%rbp), %esi
	movl	-80(%rbp), %edx
	movl	%eax, -100(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4098, %edx             ## imm = 0x1002
	leaq	-88(%rbp), %rcx
	movl	$1024, -88(%rbp)        ## imm = 0x400
	movl	-72(%rbp), %edi
	movl	-84(%rbp), %r8d
	movl	%eax, -104(%rbp)        ## 4-byte Spill
	callq	_setsockopt
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4098, %edx             ## imm = 0x1002
	leaq	-84(%rbp), %r8
	leaq	-76(%rbp), %rcx
	movl	-72(%rbp), %edi
	movl	%eax, -108(%rbp)        ## 4-byte Spill
	callq	_getsockopt
	leaq	L_.str.1(%rip), %rdi
	movl	-76(%rbp), %esi
	movl	-80(%rbp), %edx
	movl	%eax, -112(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.2(%rip), %rdi
	movb	$2, -23(%rbp)
	movl	%eax, -116(%rbp)        ## 4-byte Spill
	callq	_inet_addr
	movl	$16, %edx
	leaq	-24(%rbp), %rcx
	xorl	%esi, %esi
	movl	$8, %r9d
	movl	%r9d, %edi
	movl	%eax, -20(%rbp)
	movw	$26658, -22(%rbp)       ## imm = 0x6822
	movq	%rcx, %r8
	addq	$8, %r8
	movq	%rdi, -128(%rbp)        ## 8-byte Spill
	movq	%r8, %rdi
	movq	-128(%rbp), %r8         ## 8-byte Reload
	movl	%edx, -132(%rbp)        ## 4-byte Spill
	movq	%r8, %rdx
	movq	%rcx, -144(%rbp)        ## 8-byte Spill
	callq	_memset
	movl	-72(%rbp), %edi
	movq	-144(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rsi
	movl	-132(%rbp), %edx        ## 4-byte Reload
	callq	_connect
	cmpl	$0, %eax
	jge	LBB0_4
## %bb.3:
	leaq	L_.str.3(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -68(%rbp)
	movl	%eax, -148(%rbp)        ## 4-byte Spill
	jmp	LBB0_7
LBB0_4:
	movl	$40, %eax
	movl	%eax, %edx
	leaq	-64(%rbp), %rsi
	movl	-72(%rbp), %edi
	callq	_read
	cmpq	$0, %rax
	jge	LBB0_6
## %bb.5:
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -68(%rbp)
	movl	%eax, -152(%rbp)        ## 4-byte Spill
	jmp	LBB0_7
LBB0_6:
	leaq	L_.str.5(%rip), %rdi
	leaq	-64(%rbp), %rsi
	movb	$0, %al
	callq	_printf
	movl	-72(%rbp), %edi
	movl	%eax, -156(%rbp)        ## 4-byte Spill
	callq	_close
	movl	$0, -68(%rbp)
	movl	%eax, -160(%rbp)        ## 4-byte Spill
LBB0_7:
	movl	-68(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -164(%rbp)        ## 4-byte Spill
	jne	LBB0_9
## %bb.8:
	movl	-164(%rbp), %eax        ## 4-byte Reload
	addq	$176, %rsp
	popq	%rbp
	retq
LBB0_9:
	callq	___stack_chk_fail
	ud2
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"socket create err\n"

L_.str.1:                               ## @.str.1
	.asciz	"Send Buffer length: %d, Recv buffer length:%d\n"

L_.str.2:                               ## @.str.2
	.asciz	"127.0.0.1"

L_.str.3:                               ## @.str.3
	.asciz	"connect err\n"

L_.str.4:                               ## @.str.4
	.asciz	"read err\n"

L_.str.5:                               ## @.str.5
	.asciz	"Message form server: %s\n"


.subsections_via_symbols
