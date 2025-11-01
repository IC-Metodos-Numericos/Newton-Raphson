	.file	"newton_recursive_c.c"
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "%.8f\0"
	.text
	.p2align 4
	.def	printf.constprop.0;	.scl	3;	.type	32;	.endef
	.seh_proc	printf.constprop.0
printf.constprop.0:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	$1, %ecx
	leaq	72(%rsp), %rbx
	movq	%rdx, 72(%rsp)
	movq	%r8, 80(%rsp)
	movq	%r9, 88(%rsp)
	movq	%rbx, 40(%rsp)
	call	*__imp___acrt_iob_func(%rip)
	movq	%rbx, %r8
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	addq	$48, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.p2align 4
	.globl	iterateNewton
	.def	iterateNewton;	.scl	2;	.type	32;	.endef
	.seh_proc	iterateNewton
iterateNewton:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	movaps	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	movaps	%xmm7, 48(%rsp)
	.seh_savexmm	%xmm7, 48
	.seh_endprologue
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movapd	%xmm2, %xmm7
	movl	%r9d, %ebx
	testl	%r9d, %r9d
	je	.L7
	.p2align 4,,10
	.p2align 3
.L4:
	movapd	%xmm7, %xmm0
	call	*%rdi
	movapd	%xmm0, %xmm6
	movapd	%xmm7, %xmm0
	call	*%rsi
	divsd	%xmm0, %xmm6
	subsd	%xmm6, %xmm7
	subl	$1, %ebx
	jne	.L4
.L7:
	movapd	%xmm7, %xmm0
	movaps	32(%rsp), %xmm6
	movaps	48(%rsp), %xmm7
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4
	.globl	newtonRecursive
	.def	newtonRecursive;	.scl	2;	.type	32;	.endef
	.seh_proc	newtonRecursive
newtonRecursive:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$64, %rsp
	.seh_stackalloc	64
	movaps	%xmm6, 32(%rsp)
	.seh_savexmm	%xmm6, 32
	movaps	%xmm7, 48(%rsp)
	.seh_savexmm	%xmm7, 48
	.seh_endprologue
	movq	%rcx, %rdi
	movq	%rdx, %rsi
	movapd	%xmm2, %xmm7
	movl	%r9d, %ebx
	testl	%r9d, %r9d
	je	.L15
	.p2align 4,,10
	.p2align 3
.L12:
	movapd	%xmm7, %xmm0
	call	*%rdi
	movapd	%xmm0, %xmm6
	movapd	%xmm7, %xmm0
	call	*%rsi
	divsd	%xmm0, %xmm6
	subsd	%xmm6, %xmm7
	subl	$1, %ebx
	jne	.L12
.L15:
	movapd	%xmm7, %xmm0
	movaps	32(%rsp), %xmm6
	movaps	48(%rsp), %xmm7
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.p2align 4
	.globl	f
	.def	f;	.scl	2;	.type	32;	.endef
	.seh_proc	f
f:
	.seh_endprologue
	mulsd	%xmm0, %xmm0
	subsd	.LC1(%rip), %xmm0
	ret
	.seh_endproc
	.p2align 4
	.globl	df
	.def	df;	.scl	2;	.type	32;	.endef
	.seh_proc	df
df:
	.seh_endprologue
	addsd	%xmm0, %xmm0
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	movq	.LC2(%rip), %rax
	movabsq	$0x3ff6a09e667f3bcc, %rdx
	leaq	.LC0(%rip), %rcx
	movq	%rax, %xmm1
	call	printf.constprop.0
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.align 8
.LC2:
	.long	1719614412
	.long	1073127582
	.ident	"GCC: (tdm64-1) 10.3.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
