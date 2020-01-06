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
	subq	$240, %rsp
	movl	$2, %edi
	movl	$1, %esi
	movl	$6, %edx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -84(%rbp)
	callq	_socket
	movl	%eax, -88(%rbp)
	cmpl	$0, -88(%rbp)
	jge	LBB0_2
## %bb.1:
	leaq	L_.str(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -84(%rbp)
	movl	%eax, -120(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_2:
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4, %eax
	leaq	-92(%rbp), %rcx
	movl	$1, -92(%rbp)
	movl	-88(%rbp), %edi
	movl	%eax, %edx
	movl	%eax, %r8d
	callq	_setsockopt
	cmpl	$0, %eax
	jge	LBB0_4
## %bb.3:
	leaq	L_.str.1(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -84(%rbp)
	movl	%eax, -124(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_4:
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4097, %edx             ## imm = 0x1001
	leaq	-104(%rbp), %r8
	leaq	-96(%rbp), %rax
	movl	$4, -104(%rbp)
	movl	-88(%rbp), %edi
	movq	%rax, %rcx
	callq	_getsockopt
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4098, %edx             ## imm = 0x1002
	leaq	-104(%rbp), %r8
	leaq	-100(%rbp), %rcx
	movl	-88(%rbp), %edi
	movl	%eax, -128(%rbp)        ## 4-byte Spill
	callq	_getsockopt
	leaq	L_.str.2(%rip), %rdi
	movl	-96(%rbp), %esi
	movl	-100(%rbp), %edx
	movl	%eax, -132(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4097, %edx             ## imm = 0x1001
	leaq	-108(%rbp), %rcx
	movl	$1024, -108(%rbp)       ## imm = 0x400
	movl	-88(%rbp), %edi
	movl	-104(%rbp), %r8d
	movl	%eax, -136(%rbp)        ## 4-byte Spill
	callq	_setsockopt
	movl	$65535, %esi            ## imm = 0xFFFF
	movl	$4097, %edx             ## imm = 0x1001
	leaq	-104(%rbp), %r8
	leaq	-96(%rbp), %rcx
	movl	-88(%rbp), %edi
	movl	%eax, -140(%rbp)        ## 4-byte Spill
	callq	_getsockopt
	leaq	L_.str.2(%rip), %rdi
	movl	-96(%rbp), %esi
	movl	-100(%rbp), %edx
	movl	%eax, -144(%rbp)        ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str.3(%rip), %rdi
	movb	$2, -23(%rbp)
	movl	%eax, -148(%rbp)        ## 4-byte Spill
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
	movq	%rdi, -160(%rbp)        ## 8-byte Spill
	movq	%r8, %rdi
	movq	-160(%rbp), %r8         ## 8-byte Reload
	movl	%edx, -164(%rbp)        ## 4-byte Spill
	movq	%r8, %rdx
	movq	%rcx, -176(%rbp)        ## 8-byte Spill
	callq	_memset
	movl	-88(%rbp), %edi
	movq	-176(%rbp), %rcx        ## 8-byte Reload
	movq	%rcx, %rsi
	movl	-164(%rbp), %edx        ## 4-byte Reload
	callq	_bind
	cmpl	$0, %eax
	jge	LBB0_6
## %bb.5:
	leaq	L_.str.4(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -84(%rbp)
	movl	%eax, -180(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_6:
	movl	$20, %esi
	movl	-88(%rbp), %edi
	callq	_listen
	cmpl	$0, %eax
	jge	LBB0_8
## %bb.7:
	leaq	L_.str.5(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -84(%rbp)
	movl	%eax, -184(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_8:
	leaq	-112(%rbp), %rdx
	leaq	-40(%rbp), %rax
	movl	$16, -112(%rbp)
	movl	-88(%rbp), %edi
	movq	%rax, %rsi
	callq	_accept
	movl	%eax, -116(%rbp)
	cmpl	$0, -116(%rbp)
	jge	LBB0_10
## %bb.9:
	leaq	L_.str.6(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -84(%rbp)
	movl	%eax, -188(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_10:
	movl	-36(%rbp), %edi
	callq	_inet_ntoa
	leaq	L_.str.7(%rip), %rdi
	movzwl	-38(%rbp), %edx
	movq	%rax, %rsi
	movb	$0, %al
	callq	_printf
	movl	$34, %edx
	movl	%edx, %esi
	leaq	-80(%rbp), %rdi
	leaq	L_main.str(%rip), %rcx
	movq	%rdi, %r8
	movq	%rdi, -200(%rbp)        ## 8-byte Spill
	movq	%r8, %rdi
	movq	%rsi, -208(%rbp)        ## 8-byte Spill
	movq	%rcx, %rsi
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	movl	%eax, -212(%rbp)        ## 4-byte Spill
	callq	_memcpy
	movl	-116(%rbp), %edi
	movq	-200(%rbp), %rsi        ## 8-byte Reload
	movq	-208(%rbp), %rdx        ## 8-byte Reload
	callq	_write
	cmpq	$0, %rax
	jge	LBB0_12
## %bb.11:
	leaq	L_.str.8(%rip), %rdi
	movb	$0, %al
	callq	_printf
	movl	$0, -84(%rbp)
	movl	%eax, -216(%rbp)        ## 4-byte Spill
	jmp	LBB0_13
LBB0_12:
	movl	-116(%rbp), %edi
	callq	_close
	movl	-88(%rbp), %edi
	movl	%eax, -220(%rbp)        ## 4-byte Spill
	callq	_close
	movl	$0, -84(%rbp)
	movl	%eax, -224(%rbp)        ## 4-byte Spill
LBB0_13:
	movl	-84(%rbp), %eax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	-8(%rbp), %rdx
	cmpq	%rdx, %rcx
	movl	%eax, -228(%rbp)        ## 4-byte Spill
	jne	LBB0_15
## %bb.14:
	movl	-228(%rbp), %eax        ## 4-byte Reload
	addq	$240, %rsp
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
	.asciz	"set socket reuse addr err\n"

L_.str.2:                               ## @.str.2
	.asciz	"Send Buffer length: %d, Recv buffer length:%d\n"

L_.str.3:                               ## @.str.3
	.asciz	"127.0.0.1"

L_.str.4:                               ## @.str.4
	.asciz	"bind err\n"

L_.str.5:                               ## @.str.5
	.asciz	"listen err\n"

L_.str.6:                               ## @.str.6
	.asciz	"conn accept err\n"

L_.str.7:                               ## @.str.7
	.asciz	"conn accepted ip: %s port: %d\n"

	.p2align	4               ## @main.str
L_main.str:
	.asciz	"hello, my name is little server!\n"

L_.str.8:                               ## @.str.8
	.asciz	"write err\n"


.subsections_via_symbols
