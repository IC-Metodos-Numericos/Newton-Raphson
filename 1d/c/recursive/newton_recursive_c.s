	.file	"newton_recursive_c.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	iterateNewton
	.def	iterateNewton;	.scl	2;	.type	32;	.endef
	.seh_proc	iterateNewton
iterateNewton:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movsd	%xmm2, 48(%rbp)
	movl	%r9d, 56(%rbp)
	cmpl	$0, 56(%rbp)
	jne	.L4
	movq	48(%rbp), %rax
	jmp	.L5
.L4:
	movq	48(%rbp), %rax
	movq	32(%rbp), %rdx
	movq	%rax, %xmm0
	call	*%rdx
	movq	%xmm0, %rbx
	movq	48(%rbp), %rax
	movq	40(%rbp), %rdx
	movq	%rax, %xmm0
	call	*%rdx
	movq	%rbx, %xmm1
	divsd	%xmm0, %xmm1
	movsd	48(%rbp), %xmm0
	subsd	%xmm1, %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	56(%rbp), %eax
	leal	-1(%rax), %edx
	movsd	-8(%rbp), %xmm0
	movq	40(%rbp), %rax
	movl	%edx, %r9d
	movapd	%xmm0, %xmm2
	movq	%rax, %rdx
	movq	32(%rbp), %rcx
	call	iterateNewton
	movq	%xmm0, %rax
.L5:
	movq	%rax, %xmm0
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	newtonRecursive
	.def	newtonRecursive;	.scl	2;	.type	32;	.endef
	.seh_proc	newtonRecursive
newtonRecursive:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	movsd	%xmm2, 32(%rbp)
	movl	%r9d, 40(%rbp)
	movl	40(%rbp), %edx
	movsd	32(%rbp), %xmm0
	movq	24(%rbp), %rax
	movl	%edx, %r9d
	movapd	%xmm0, %xmm2
	movq	%rax, %rdx
	movq	16(%rbp), %rcx
	call	iterateNewton
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	f
	.def	f;	.scl	2;	.type	32;	.endef
	.seh_proc	f
f:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	16(%rbp), %xmm0
	mulsd	%xmm0, %xmm0
	movsd	.LC0(%rip), %xmm1
	subsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.globl	df
	.def	df;	.scl	2;	.type	32;	.endef
	.seh_proc	df
df:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movsd	%xmm0, 16(%rbp)
	movsd	16(%rbp), %xmm0
	addsd	%xmm0, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC2:
	.ascii "%.8f\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movsd	.LC1(%rip), %xmm0
	movsd	%xmm0, -8(%rbp)
	movl	$10, -12(%rbp)
	movl	-12(%rbp), %eax
	movsd	-8(%rbp), %xmm0
	movl	%eax, %r9d
	movapd	%xmm0, %xmm2
	leaq	df(%rip), %rdx
	leaq	f(%rip), %rcx
	call	newtonRecursive
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movsd	-24(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.ident	"GCC: (tdm64-1) 10.3.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
