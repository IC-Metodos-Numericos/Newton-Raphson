.section .rdata
.align 1
.align 1
.Lr1g4_bytes:
	.string "Main"
.section .rdata
.align 1
.align 1
.Lr1g2_bytes:
	.string "main"
.section .data
.align 8
.align 1
.Lr1g3_closure:
	.quad	ghczmprim_GHCziTypes_TrNameS_con_info
	.quad	.Lr1g2_bytes
.section .data
.align 8
.align 1
.Lr1g5_closure:
	.quad	ghczmprim_GHCziTypes_TrNameS_con_info
	.quad	.Lr1g4_bytes
.section .data
.align 8
.align 1
.globl Main_zdtrModule_closure
Main_zdtrModule_closure:
	.quad	ghczmprim_GHCziTypes_Module_con_info
	.quad	.Lr1g3_closure+1
	.quad	.Lr1g5_closure+1
	.quad	3
.section .text
.align 8
.align 8
	.quad	4294967301
	.quad	0
	.long	14
	.long	base_GHCziFloat_zdfNumDouble_closure-(Main_fzq_info)+0
.globl Main_fzq_info
Main_fzq_info:
.Lc1jk:
	leaq -24(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1jl
.Lc1jm:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1jo
.Lc1jn:
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd .Ln1js(%rip),%xmm0
	movsd %xmm0,(%r12)
	leaq -7(%r12),%rax
	movq %r14,%rbx
	leaq base_GHCziFloat_zdfNumDouble_closure(%rip),%r14
	leaq stg_ap_pp_info(%rip),%rcx
	movq %rcx,-24(%rbp)
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	addq $-24,%rbp
	jmp base_GHCziNum_zt_info
.Lc1jo:
	movq $16,904(%r13)
.Lc1jl:
	leaq Main_fzq_closure(%rip),%rbx
	jmp *-8(%r13)
.section .rdata
.align 8
.align 8
.Ln1js:
	.double	2.0
.section .data
.align 8
.align 1
.globl Main_fzq_closure
Main_fzq_closure:
	.quad	Main_fzq_info
	.quad	0
.section .data
.align 8
.align 1
.Lu1jR_srt:
	.quad	stg_SRT_3_info
	.quad	base_GHCziReal_zc_closure
	.quad	base_GHCziFloat_zdfNumDouble_closure
	.quad	base_GHCziReal_zdfIntegralInteger_closure
	.quad	0
.section .text
.align 8
.align 8
	.quad	1
	.long	16
	.long	.Lu1jR_srt-(.Ls1iL_info)+0
.Ls1iL_info:
.Lc1jH:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1jI
.Lc1jJ:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1jL
.Lc1jK:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	movq 16(%rbx),%rax
	leaq ghczmbignum_GHCziNumziInteger_IS_con_info(%rip),%rbx
	movq %rbx,-8(%r12)
	movq $2,(%r12)
	leaq -7(%r12),%rbx
	movq %rbx,%r8
	movq %rax,%rdi
	leaq base_GHCziReal_zdfIntegralInteger_closure(%rip),%rsi
	leaq base_GHCziFloat_zdfNumDouble_closure(%rip),%r14
	leaq base_GHCziReal_zc_closure(%rip),%rbx
	addq $-16,%rbp
	jmp stg_ap_pppp_fast
.Lc1jL:
	movq $16,904(%r13)
.Lc1jI:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	4294967301
	.quad	0
	.long	14
	.long	.Lu1jR_srt-(Main_f_info)+0
.globl Main_f_info
Main_f_info:
.Lc1jM:
	leaq -24(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1jN
.Lc1jO:
	addq $40,%r12
	cmpq 856(%r13),%r12
	ja .Lc1jQ
.Lc1jP:
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-32(%r12)
	movsd .Ln1k1(%rip),%xmm0
	movsd %xmm0,-24(%r12)
	leaq -31(%r12),%rax
	leaq .Ls1iL_info(%rip),%rbx
	movq %rbx,-16(%r12)
	movq %r14,(%r12)
	leaq -16(%r12),%rbx
	leaq base_GHCziFloat_zdfNumDouble_closure(%rip),%r14
	leaq stg_ap_pp_info(%rip),%rcx
	movq %rcx,-24(%rbp)
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	addq $-24,%rbp
	jmp base_GHCziNum_zm_info
.Lc1jQ:
	movq $40,904(%r13)
.Lc1jN:
	leaq Main_f_closure(%rip),%rbx
	jmp *-8(%r13)
.section .rdata
.align 8
.align 8
.Ln1k1:
	.double	2.0
.section .data
.align 8
.align 1
.globl Main_f_closure
Main_f_closure:
	.quad	Main_f_info
	.quad	0
.section .data
.align 8
.align 1
.Lu1lB_srt:
	.quad	stg_SRT_2_info
	.quad	base_GHCziFloat_zdfFractionalDouble_closure
	.quad	base_GHCziFloat_zdfNumDouble_closure
	.quad	0
.section .data
.align 8
.align 1
.Lu1lC_srt:
	.quad	stg_SRT_3_info
	.quad	base_GHCziNum_zdfNumInt_closure
	.quad	ghczmprim_GHCziClasses_zdfEqInt_closure
	.quad	.Lu1lB_srt
	.quad	0
.section .text
.align 8
.align 8
	.quad	0
	.long	15
	.long	base_GHCziNum_zdfNumInt_closure-(.Ls1iV_info)+0
.Ls1iV_info:
.Lc1ks:
	leaq -32(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1kt
.Lc1ku:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1kw
.Lc1kv:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	leaq ghczmbignum_GHCziNumziInteger_IS_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movq $0,(%r12)
	leaq -7(%r12),%rax
	leaq base_GHCziNum_zdfNumInt_closure(%rip),%r14
	leaq stg_ap_p_info(%rip),%rbx
	movq %rbx,-32(%rbp)
	movq %rax,-24(%rbp)
	addq $-32,%rbp
	jmp base_GHCziNum_fromInteger_info
.Lc1kw:
	movq $16,904(%r13)
.Lc1kt:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	0
	.long	15
	.long	base_GHCziNum_zdfNumInt_closure-(.Ls1j2_info)+0
.Ls1j2_info:
.Lc1kE:
	leaq -32(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1kF
.Lc1kG:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1kI
.Lc1kH:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	leaq ghczmbignum_GHCziNumziInteger_IS_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movq $1,(%r12)
	leaq -7(%r12),%rax
	leaq base_GHCziNum_zdfNumInt_closure(%rip),%r14
	leaq stg_ap_p_info(%rip),%rbx
	movq %rbx,-32(%rbp)
	movq %rax,-24(%rbp)
	addq $-32,%rbp
	jmp base_GHCziNum_fromInteger_info
.Lc1kI:
	movq $16,904(%r13)
.Lc1kF:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	1
	.long	16
	.long	base_GHCziNum_zdfNumInt_closure-(.Ls1j3_info)+0
.Ls1j3_info:
.Lc1kJ:
	leaq -40(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1kK
.Lc1kL:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1kN
.Lc1kM:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	movq 16(%rbx),%rax
	leaq .Ls1j2_info(%rip),%rbx
	movq %rbx,-8(%r12)
	leaq -8(%r12),%rbx
	leaq base_GHCziNum_zdfNumInt_closure(%rip),%r14
	leaq stg_ap_pp_info(%rip),%rcx
	movq %rcx,-40(%rbp)
	movq %rax,-32(%rbp)
	movq %rbx,-24(%rbp)
	addq $-40,%rbp
	jmp base_GHCziNum_zm_info
.Lc1kN:
	movq $16,904(%r13)
.Lc1kK:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	2
	.long	18
	.long	0
.Ls1iY_info:
.Lc1kZ:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1l0
.Lc1l1:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	movq 16(%rbx),%rax
	movq 24(%rbx),%rbx
	movq %rax,%r14
	addq $-16,%rbp
	jmp stg_ap_p_fast
.Lc1l0:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	2
	.long	18
	.long	0
.Ls1iX_info:
.Lc1l6:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1l7
.Lc1l8:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	movq 16(%rbx),%rax
	movq 24(%rbx),%rbx
	movq %rax,%r14
	addq $-16,%rbp
	jmp stg_ap_p_fast
.Lc1l7:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	3
	.long	15
	.long	base_GHCziFloat_zdfFractionalDouble_closure-(.Ls1iZ_info)+0
.Ls1iZ_info:
.Lc1l9:
	leaq -40(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1la
.Lc1lb:
	addq $64,%r12
	cmpq 856(%r13),%r12
	ja .Lc1ld
.Lc1lc:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	movq 16(%rbx),%rax
	movq 24(%rbx),%rcx
	movq 32(%rbx),%rbx
	leaq .Ls1iY_info(%rip),%rdx
	movq %rdx,-56(%r12)
	movq %rax,-40(%r12)
	movq %rbx,-32(%r12)
	leaq -56(%r12),%rbx
	leaq .Ls1iX_info(%rip),%rdx
	movq %rdx,-24(%r12)
	movq %rax,-8(%r12)
	movq %rcx,(%r12)
	leaq -24(%r12),%rax
	leaq base_GHCziFloat_zdfFractionalDouble_closure(%rip),%r14
	leaq stg_ap_pp_info(%rip),%rcx
	movq %rcx,-40(%rbp)
	movq %rax,-32(%rbp)
	movq %rbx,-24(%rbp)
	addq $-40,%rbp
	jmp base_GHCziReal_zs_info
.Lc1ld:
	movq $64,904(%r13)
.Lc1la:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	3
	.long	15
	.long	.Lu1lB_srt-(.Ls1j0_info)+0
.Ls1j0_info:
.Lc1le:
	leaq -40(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1lf
.Lc1lg:
	addq $40,%r12
	cmpq 856(%r13),%r12
	ja .Lc1li
.Lc1lh:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	movq 16(%rbx),%rax
	movq 24(%rbx),%rcx
	movq 32(%rbx),%rbx
	leaq .Ls1iZ_info(%rip),%rdx
	movq %rdx,-32(%r12)
	movq %rax,-16(%r12)
	movq %rcx,-8(%r12)
	movq %rbx,(%r12)
	leaq -32(%r12),%rbx
	leaq base_GHCziFloat_zdfNumDouble_closure(%rip),%r14
	leaq stg_ap_pp_info(%rip),%rcx
	movq %rcx,-40(%rbp)
	movq %rax,-32(%rbp)
	movq %rbx,-24(%rbp)
	addq $-40,%rbp
	jmp base_GHCziNum_zm_info
.Lc1li:
	movq $40,904(%r13)
.Lc1lf:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	17179869208
	.quad	0
	.long	14
	.long	.Lu1lC_srt-(Main_newtonRecursive_info)+0
.globl Main_newtonRecursive_info
Main_newtonRecursive_info:
.Lc1lj:
	leaq -64(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1lk
.Lc1ll:
.Ln1mu:
	movq %r8,%rbx
	movq %rdi,%rax
.Lc1ke:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1lo
.Lc1ln:
	leaq .Ls1iV_info(%rip),%rcx
	movq %rcx,-8(%r12)
	leaq -8(%r12),%rcx
	leaq .Lc1ki_info(%rip),%rdx
	movq %rdx,-40(%rbp)
	movq %r14,%rdx
	leaq ghczmprim_GHCziClasses_zdfEqInt_closure(%rip),%r14
	leaq stg_ap_pp_info(%rip),%rdi
	movq %rdi,-64(%rbp)
	movq %rbx,-56(%rbp)
	movq %rcx,-48(%rbp)
	movq %rdx,-32(%rbp)
	movq %rsi,-24(%rbp)
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	addq $-64,%rbp
	jmp ghczmprim_GHCziClasses_zeze_info
.align 8
	.quad	2
	.long	30
	.long	.Lu1lC_srt-(.Lc1kd_info)+0
.Lc1kd_info:
.Lc1kd:
	movq 8(%rbp),%rax
	movq 16(%rbp),%rsi
.Lu1lz:
	addq $24,%rbp
.Ln1mt:
	movq %rax,64(%rsp)
	movq %rbx,%rax
	movq %r14,%rbx
	movq 64(%rsp),%r14
	jmp .Lc1ke
.align 8
	.quad	4
	.long	30
	.long	.Lu1lC_srt-(.Lc1ki_info)+0
.Lc1ki_info:
.Lc1ki:
	movq 8(%rbp),%r14
	movq 16(%rbp),%rsi
	movq 24(%rbp),%rax
	movq 32(%rbp),%rcx
	movq %rbx,%rdx
	andl $7,%edx
	cmpq $1,%rdx
	jne .Lc1lx
.Lc1lq:
	addq $64,%r12
	cmpq 856(%r13),%r12
	ja .Lc1lt
.Lc1ls:
	leaq .Ls1j3_info(%rip),%rbx
	movq %rbx,-56(%r12)
	movq %rcx,-40(%r12)
	leaq -56(%r12),%rbx
	leaq .Ls1j0_info(%rip),%rcx
	movq %rcx,-32(%r12)
	movq %rax,-16(%r12)
	movq %r14,-8(%r12)
	movq %rsi,(%r12)
	leaq -32(%r12),%rax
.Lu1lA:
	addq $40,%rbp
	jmp .Lc1ke
.Lc1lk:
	leaq Main_newtonRecursive_closure(%rip),%rbx
	jmp *-8(%r13)
.Lc1lo:
	movq $16,904(%r13)
	leaq .Lc1kd_info(%rip),%rcx
	movq %rcx,-24(%rbp)
	movq %r14,%rcx
	movq %rbx,%r14
	movq %rax,%rbx
	movq %rcx,-16(%rbp)
	movq %rsi,-8(%rbp)
	addq $-24,%rbp
	jmp stg_gc_pp
.Lc1lt:
	movq $64,904(%r13)
	jmp stg_gc_unpt_r1
.Lc1lx:
	movq %rax,%rbx
	andq $-8,%rbx
	addq $40,%rbp
	jmp *(%rbx)
.section .data
.align 8
.align 1
.globl Main_newtonRecursive_closure
Main_newtonRecursive_closure:
	.quad	Main_newtonRecursive_info
	.quad	0
.section .data
.align 8
.align 1
.Lu1n8_srt:
	.quad	stg_SRT_3_info
	.quad	Main_f_closure
	.quad	Main_fzq_closure
	.quad	Main_newtonRecursive_closure
	.quad	0
.section .data
.align 8
.align 1
.Lu1n9_srt:
	.quad	stg_SRT_2_info
	.quad	base_GHCziFloat_zdfShowDouble_closure
	.quad	.Lu1n8_srt
	.quad	0
.section .data
.align 8
.align 1
.Lu1na_srt:
	.quad	stg_SRT_3_info
	.quad	base_GHCziBase_zpzp_closure
	.quad	ghczmprim_GHCziCString_unpackCStringUtf8zh_closure
	.quad	.Lu1n9_srt
	.quad	0
.section .rdata
.align 1
.align 1
c1mZ_str:
	.string "A raiz aproximada \303\251: "
.section .text
.align 8
.align 8
	.quad	0
	.long	15
	.long	.Lu1n8_srt-(.Ls1j7_info)+0
.Ls1j7_info:
.Lc1mL:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1mM
.Lc1mN:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1mP
.Lc1mO:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd .Ln1nj(%rip),%xmm0
	movsd %xmm0,(%r12)
	leaq -7(%r12),%rax
	leaq stg_INTLIKE_closure+417(%rip),%r8
	movq %rax,%rdi
	leaq Main_fzq_closure+1(%rip),%rsi
	leaq Main_f_closure+1(%rip),%r14
	addq $-16,%rbp
	jmp Main_newtonRecursive_info
.Lc1mP:
	movq $16,904(%r13)
.Lc1mM:
	jmp *-16(%r13)
.section .rdata
.align 8
.align 8
.Ln1nj:
	.double	1.0
.section .text
.align 8
.align 8
	.quad	0
	.long	15
	.long	.Lu1n9_srt-(.Ls1j8_info)+0
.Ls1j8_info:
.Lc1mQ:
	leaq -32(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1mR
.Lc1mS:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1mU
.Lc1mT:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	leaq .Ls1j7_info(%rip),%rax
	movq %rax,-8(%r12)
	leaq -8(%r12),%rax
	leaq base_GHCziFloat_zdfShowDouble_closure(%rip),%r14
	leaq stg_ap_p_info(%rip),%rbx
	movq %rbx,-32(%rbp)
	movq %rax,-24(%rbp)
	addq $-32,%rbp
	jmp base_GHCziShow_show_info
.Lc1mU:
	movq $16,904(%r13)
.Lc1mR:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	0
	.long	15
	.long	ghczmprim_GHCziCString_unpackCStringUtf8zh_closure-(.Ls1j4_info)+0
.Ls1j4_info:
.Lc1n0:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1n1
.Lc1n2:
	leaq stg_upd_frame_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,-8(%rbp)
	leaq c1mZ_str(%rip),%r14
	leaq ghczmprim_GHCziCString_unpackCStringUtf8zh_closure(%rip),%rbx
	addq $-16,%rbp
	jmp stg_ap_n_fast
.Lc1n1:
	jmp *-16(%r13)
.section .text
.align 8
.align 8
	.quad	0
	.long	21
	.long	.Lu1na_srt-(.Ls1j9_info)+0
.Ls1j9_info:
.Lc1n3:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1n4
.Lc1n5:
	addq $32,%r12
	cmpq 856(%r13),%r12
	ja .Lc1n7
.Lc1n6:
	subq $8,%rsp
	movq %r13,%rcx
	movq %rbx,%rdx
	subq $32,%rsp
	xorl %eax,%eax
	call newCAF
	addq $40,%rsp
	testq %rax,%rax
	je .Lc1mB
.Lc1mA:
	leaq stg_bh_upd_frame_info(%rip),%rbx
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	leaq .Ls1j8_info(%rip),%rax
	movq %rax,-24(%r12)
	leaq -24(%r12),%rax
	leaq .Ls1j4_info(%rip),%rbx
	movq %rbx,-8(%r12)
	leaq -8(%r12),%rbx
	movq %rax,%rsi
	movq %rbx,%r14
	leaq base_GHCziBase_zpzp_closure(%rip),%rbx
	addq $-16,%rbp
	jmp stg_ap_pp_fast
.Lc1mB:
	jmp *(%rbx)
.Lc1n7:
	movq $32,904(%r13)
.Lc1n4:
	jmp *-16(%r13)
.section .data
.align 8
.align 1
.Ls1j9_closure:
	.quad	.Ls1j9_info
	.quad	0
	.quad	0
	.quad	0
.section .data
.align 8
.align 1
.Lu1nM_srt:
	.quad	stg_SRT_3_info
	.quad	base_GHCziBase_zd_closure
	.quad	base_SystemziIO_putStrLn_closure
	.quad	.Ls1j9_closure
	.quad	0
.section .text
.align 8
.align 8
	.quad	0
	.long	21
	.long	.Lu1nM_srt-(Main_main_info)+0
.globl Main_main_info
Main_main_info:
.Lc1nJ:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1nK
.Lc1nL:
	subq $8,%rsp
	movq %r13,%rcx
	movq %rbx,%rdx
	subq $32,%rsp
	xorl %eax,%eax
	call newCAF
	addq $40,%rsp
	testq %rax,%rax
	je .Lc1nI
.Lc1nH:
	leaq stg_bh_upd_frame_info(%rip),%rbx
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	leaq .Ls1j9_closure(%rip),%rsi
	leaq base_SystemziIO_putStrLn_closure(%rip),%r14
	leaq base_GHCziBase_zd_closure(%rip),%rbx
	addq $-16,%rbp
	jmp stg_ap_pp_fast
.Lc1nI:
	jmp *(%rbx)
.Lc1nK:
	jmp *-16(%r13)
.section .data
.align 8
.align 1
.globl Main_main_closure
Main_main_closure:
	.quad	Main_main_info
	.quad	0
	.quad	0
	.quad	0
.section .data
.align 8
.align 1
.Lu1o2_srt:
	.quad	stg_SRT_2_info
	.quad	base_GHCziTopHandler_runMainIO_closure
	.quad	Main_main_closure
	.quad	0
.section .text
.align 8
.align 8
	.quad	0
	.long	21
	.long	.Lu1o2_srt-(ZCMain_main_info)+0
.globl ZCMain_main_info
ZCMain_main_info:
.Lc1nZ:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1o0
.Lc1o1:
	subq $8,%rsp
	movq %r13,%rcx
	movq %rbx,%rdx
	subq $32,%rsp
	xorl %eax,%eax
	call newCAF
	addq $40,%rsp
	testq %rax,%rax
	je .Lc1nY
.Lc1nX:
	leaq stg_bh_upd_frame_info(%rip),%rbx
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	leaq Main_main_closure(%rip),%r14
	leaq base_GHCziTopHandler_runMainIO_closure(%rip),%rbx
	addq $-16,%rbp
	jmp stg_ap_p_fast
.Lc1nY:
	jmp *(%rbx)
.Lc1o0:
	jmp *-16(%r13)
.section .data
.align 8
.align 1
.globl ZCMain_main_closure
ZCMain_main_closure:
	.quad	ZCMain_main_info
	.quad	0
	.quad	0
	.quad	0
