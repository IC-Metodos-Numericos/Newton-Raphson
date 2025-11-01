	.file	"newton_recursive_c.c"
	.text
	.globl	f
	.def	f;	.scl	2;	.type	32;	.endef
	.seh_proc	f
f:
	.seh_endprologue
	mulsd	%xmm0, %xmm0
	subsd	.LC0(%rip), %xmm0
	ret
	.seh_endproc
	.globl	df
	.def	df;	.scl	2;	.type	32;	.endef
	.seh_proc	df
df:
	.seh_endprologue
	addsd	%xmm0, %xmm0
	ret
	.seh_endproc
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, 88(%rsp)
	movq	%r8, 96(%rsp)
	movq	%r9, 104(%rsp)
	leaq	88(%rsp), %rsi
	movq	%rsi, 40(%rsp)
	movl	$1, %ecx
	call	*__imp___acrt_iob_func(%rip)
	movq	%rax, %rcx
	movq	%rsi, %r8
	movq	%rbx, %rdx
	call	__mingw_vfprintf
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
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
	movq	%rcx, %rsi
	movq	%rdx, %rdi
	movapd	%xmm2, %xmm6
	movl	%r9d, %ebx
	movapd	%xmm2, %xmm0
	testl	%r9d, %r9d
	je	.L4
	call	*%rcx
	movapd	%xmm0, %xmm7
	movapd	%xmm6, %xmm0
	call	*%rdi
	divsd	%xmm0, %xmm7
	leal	-1(%rbx), %r9d
	movapd	%xmm6, %xmm2
	subsd	%xmm7, %xmm2
	movq	%rdi, %rdx
	movq	%rsi, %rcx
	call	iterateNewton
.L4:
	movaps	32(%rsp), %xmm6
	movaps	48(%rsp), %xmm7
	addq	$64, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.globl	newtonRecursive
	.def	newtonRecursive;	.scl	2;	.type	32;	.endef
	.seh_proc	newtonRecursive
newtonRecursive:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	iterateNewton
	addq	$40, %rsp
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
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	movl	$10, %r9d
	movsd	.LC1(%rip), %xmm2
	leaq	df(%rip), %rdx
	leaq	f(%rip), %rcx
	call	iterateNewton
	movq	%xmm0, %rdx
	movapd	%xmm0, %xmm1
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$40, %rsp
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
