.section .rdata
.align 1
.align 1
.globl Main_main4_bytes
Main_main4_bytes:
	.string "A raiz aproximada \303\251: "
.section .rdata
.align 1
.align 1
.globl Main_zdtrModule2_bytes
Main_zdtrModule2_bytes:
	.string "Main"
.section .rdata
.align 1
.align 1
.globl Main_zdtrModule4_bytes
Main_zdtrModule4_bytes:
	.string "main"
.section .data
.align 8
.align 1
.globl Main_zdtrModule3_closure
Main_zdtrModule3_closure:
	.quad	ghczmprim_GHCziTypes_TrNameS_con_info
	.quad	Main_zdtrModule4_bytes
.section .data
.align 8
.align 1
.globl Main_zdtrModule1_closure
Main_zdtrModule1_closure:
	.quad	ghczmprim_GHCziTypes_TrNameS_con_info
	.quad	Main_zdtrModule2_bytes
.section .data
.align 8
.align 1
.globl Main_zdtrModule_closure
Main_zdtrModule_closure:
	.quad	ghczmprim_GHCziTypes_Module_con_info
	.quad	Main_zdtrModule3_closure+1
	.quad	Main_zdtrModule1_closure+1
	.quad	3
.section .text
.align 8
.align 8
	.quad	4294967301
	.quad	0
	.long	14
	.long	0
.globl Main_fzq_info
Main_fzq_info:
.Lc1Tp:
	leaq -8(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1Tw
.Lc1Tx:
	leaq .Lc1Tm_info(%rip),%rax
	movq %rax,-8(%rbp)
	movq %r14,%rbx
	addq $-8,%rbp
	testb $7,%bl
	jne .Lc1Tm
.Lc1Tn:
	jmp *(%rbx)
.align 8
	.quad	0
	.long	30
	.long	0
.Lc1Tm_info:
.Lc1Tm:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1TA
.Lc1Tz:
	movsd 7(%rbx),%xmm0
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd %xmm0,%xmm1
	addsd %xmm0,%xmm1
	movsd %xmm1,(%r12)
	leaq -7(%r12),%rbx
	addq $8,%rbp
	jmp *(%rbp)
.Lc1TA:
	movq $16,904(%r13)
	jmp stg_gc_unpt_r1
.Lc1Tw:
	leaq Main_fzq_closure(%rip),%rbx
	jmp *-8(%r13)
.section .data
.align 8
.align 1
.globl Main_fzq_closure
Main_fzq_closure:
	.quad	Main_fzq_info
.section .text
.align 8
.align 8
	.quad	4294967301
	.quad	0
	.long	14
	.long	0
.globl Main_f_info
Main_f_info:
.Lc1TQ:
	leaq -8(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1U0
.Lc1U1:
	leaq .Lc1TN_info(%rip),%rax
	movq %rax,-8(%rbp)
	movq %r14,%rbx
	addq $-8,%rbp
	testb $7,%bl
	jne .Lc1TN
.Lc1TO:
	jmp *(%rbx)
.align 8
	.quad	0
	.long	30
	.long	0
.Lc1TN_info:
.Lc1TN:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1U4
.Lc1U3:
	movsd 7(%rbx),%xmm0
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd %xmm0,%xmm1
	mulsd %xmm0,%xmm1
	subsd .Ln1U9(%rip),%xmm1
	movsd %xmm1,(%r12)
	leaq -7(%r12),%rbx
	addq $8,%rbp
	jmp *(%rbp)
.Lc1U4:
	movq $16,904(%r13)
	jmp stg_gc_unpt_r1
.Lc1U0:
	leaq Main_f_closure(%rip),%rbx
	jmp *-8(%r13)
.section .rdata
.align 8
.align 8
.Ln1U9:
	.double	2.0
.section .data
.align 8
.align 1
.globl Main_f_closure
Main_f_closure:
	.quad	Main_f_info
.section .text
.align 8
.align 8
	.quad	17179869208
	.quad	0
	.long	14
	.long	0
.globl Main_newtonRecursive_info
Main_newtonRecursive_info:
.Lc1Um:
	leaq -48(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1Un
.Lc1Uo:
	leaq .Lc1Uj_info(%rip),%rax
	movq %rax,-32(%rbp)
	movq %r8,%rbx
	movq %r14,-24(%rbp)
	movq %rsi,-16(%rbp)
	movq %rdi,-8(%rbp)
	addq $-32,%rbp
	testb $7,%bl
	jne .Lc1Uj
.Lc1Uk:
	jmp *(%rbx)
.align 8
	.quad	3
	.long	30
	.long	0
.Lc1Uj_info:
.Lc1Uj:
	movq 24(%rbp),%rax
	movq 7(%rbx),%rbx
	testq %rbx,%rbx
	jne .Lc1V5
.Lc1Vc:
	movq %rax,%rbx
	andq $-8,%rbx
	addq $32,%rbp
	jmp *(%rbx)
.Lc1V5:
	leaq .Lc1UU_info(%rip),%rcx
	movq %rcx,(%rbp)
	movq %rbx,%rcx
	movq %rax,%rbx
	movq %rcx,24(%rbp)
	testb $7,%bl
	jne .Lc1UU
.Lc1UV:
	jmp *(%rbx)
.align 8
	.quad	259
	.long	30
	.long	0
.Lc1UU_info:
.Lc1UU:
	leaq .Lc1UZ_info(%rip),%rax
	movq %rax,-16(%rbp)
	movq %rbx,%r14
	movq %rbx,%rax
	movsd 7(%rbx),%xmm0
	movq 8(%rbp),%rbx
	movsd %xmm0,-8(%rbp)
	movq %rax,(%rbp)
	addq $-16,%rbp
	jmp stg_ap_p_fast
.Lc1Un:
	leaq Main_newtonRecursive_closure(%rip),%rbx
	jmp *-8(%r13)
.align 8
	.quad	1093
	.long	30
	.long	0
.Lc1UZ_info:
.Lc1UZ:
	leaq .Lc1V3_info(%rip),%rax
	movq %rax,(%rbp)
	movq 16(%rbp),%r14
	movsd 7(%rbx),%xmm0
	movq 32(%rbp),%rbx
	movsd %xmm0,16(%rbp)
	jmp stg_ap_p_fast
.align 8
	.quad	1221
	.long	30
	.long	0
.Lc1V3_info:
.Lc1V3:
	movq 24(%rbp),%rax
	addq $7,%rbx
	movsd 16(%rbp),%xmm0
	divsd (%rbx),%xmm0
	movsd 8(%rbp),%xmm1
	subsd %xmm0,%xmm1
	movq 40(%rbp),%rbx
	decq %rbx
	jmp .Lc1Uu
.align 8
	.quad	580
	.long	30
	.long	0
.Lc1Uv_info:
.Lc1Uv:
	movq 16(%rbp),%rax
	movq 32(%rbp),%rbx
	movsd 8(%rbp),%xmm1
	addq $-8,%rbp
	jmp .Lc1Uu
.align 8
	.quad	1221
	.long	30
	.long	0
.Lc1UH_info:
.Lc1UH:
	movq 24(%rbp),%rax
	addq $7,%rbx
	movsd 40(%rbp),%xmm0
	divsd (%rbx),%xmm0
	movsd 16(%rbp),%xmm1
	subsd %xmm0,%xmm1
	movq 8(%rbp),%rbx
	decq %rbx
.Lc1Uu:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1Uz
.Lc1Uy:
	testq %rbx,%rbx
	je .Lc1UR
.Lc1UJ:
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rcx
	movq %rcx,-8(%r12)
	movsd %xmm1,(%r12)
	leaq .Lc1UD_info(%rip),%rcx
	movq %rcx,(%rbp)
	leaq -7(%r12),%rcx
	movq %rcx,%r14
	movq %rbx,%rdx
	movq %rax,%rbx
	movq %rdx,8(%rbp)
	movsd %xmm1,16(%rbp)
	movq %rcx,40(%rbp)
	jmp stg_ap_p_fast
.Lc1UR:
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd %xmm1,(%r12)
	leaq -7(%r12),%rbx
	addq $48,%rbp
	jmp *(%rbp)
.Lc1Uz:
	movq $16,904(%r13)
	leaq .Lc1Uv_info(%rip),%rax
	movq %rax,8(%rbp)
	movsd %xmm1,16(%rbp)
	movq %rbx,40(%rbp)
	addq $8,%rbp
	jmp stg_gc_noregs
.align 8
	.quad	197
	.long	30
	.long	0
.Lc1UD_info:
.Lc1UD:
	leaq .Lc1UH_info(%rip),%rax
	movq %rax,(%rbp)
	movq 40(%rbp),%r14
	movsd 7(%rbx),%xmm0
	movq 32(%rbp),%rbx
	movsd %xmm0,40(%rbp)
	jmp stg_ap_p_fast
.section .data
.align 8
.align 1
.globl Main_newtonRecursive_closure
Main_newtonRecursive_closure:
	.quad	Main_newtonRecursive_info
.section .text
.align 8
.globl Main_zdwiterateNewton_slow
Main_zdwiterateNewton_slow:
.Lc1VR:
	movq 8(%rbp),%r14
	movsd (%rbp),%xmm1
	addq $16,%rbp
	jmp Main_zdwiterateNewton_info
.section .text
.align 8
.align 8
	.quad	Main_zdwiterateNewton_slow-(Main_zdwiterateNewton_info)+0
	.quad	194
	.quad	8589934592
	.quad	0
	.long	14
	.long	0
.globl Main_zdwiterateNewton_info
Main_zdwiterateNewton_info:
.Lc1VZ:
	jmp .Lc1VS
.Lc1VX:
	decq %r14
	movsd %xmm1,%xmm0
	addsd %xmm1,%xmm0
	movsd %xmm1,%xmm2
	mulsd %xmm1,%xmm2
	subsd .Ln1Wo(%rip),%xmm2
	divsd %xmm0,%xmm2
	subsd %xmm2,%xmm1
.Lc1VS:
	testq %r14,%r14
	jne .Lc1VX
.Lc1VY:
	jmp *(%rbp)
.section .rdata
.align 8
.align 8
.Ln1Wo:
	.double	2.0
.section .data
.align 8
.align 1
.globl Main_zdwiterateNewton_closure
Main_zdwiterateNewton_closure:
	.quad	Main_zdwiterateNewton_info
.section .text
.align 8
.align 8
	.quad	0
	.long	21
	.long	base_GHCziFloat_zdfShowDouble2_closure-(Main_main3_info)+0
.globl Main_main3_info
Main_main3_info:
.Lc1WE:
	leaq -32(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1WI
.Lc1WJ:
	subq $8,%rsp
	movq %r13,%rcx
	movq %rbx,%rdx
	subq $32,%rsp
	xorl %eax,%eax
	call newCAF
	addq $40,%rsp
	testq %rax,%rax
	je .Lc1WB
.Lc1WA:
	leaq stg_bh_upd_frame_info(%rip),%rbx
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	leaq .Lc1WC_info(%rip),%rax
	movq %rax,-24(%rbp)
	movl $10,%r14d
	movsd .Ln1WR(%rip),%xmm1
	addq $-24,%rbp
	jmp Main_zdwiterateNewton_info
.Lc1WB:
	jmp *(%rbx)
.Lc1WI:
	jmp *-16(%r13)
.align 8
	.quad	0
	.long	30
	.long	base_GHCziFloat_zdfShowDouble2_closure-(.Lc1WC_info)+0
.Lc1WC_info:
.Lc1WC:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1WM
.Lc1WL:
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd %xmm1,(%r12)
	leaq -7(%r12),%rdi
	leaq base_GHCziFloat_minExpt_closure+1(%rip),%rsi
	leaq base_GHCziFloat_zdfShowDouble2_closure+1(%rip),%r14
	leaq stg_ap_p_info(%rip),%rax
	movq %rax,-8(%rbp)
	leaq ghczmprim_GHCziTypes_ZMZN_closure+1(%rip),%rax
	movq %rax,(%rbp)
	addq $-8,%rbp
	jmp base_GHCziFloat_zdfShowDoublezuzdsshowSignedFloat_info
.Lc1WM:
	movq $16,904(%r13)
	jmp stg_gc_d1
.section .rdata
.align 8
.align 8
.Ln1WR:
	.double	1.0
.section .data
.align 8
.align 1
.globl Main_main3_closure
Main_main3_closure:
	.quad	Main_main3_info
	.quad	0
	.quad	0
	.quad	0
.section .text
.align 8
.align 8
	.quad	0
	.long	21
	.long	Main_main3_closure-(Main_main2_info)+0
.globl Main_main2_info
Main_main2_info:
.Lc1X3:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1X4
.Lc1X5:
	subq $8,%rsp
	movq %r13,%rcx
	movq %rbx,%rdx
	subq $32,%rsp
	xorl %eax,%eax
	call newCAF
	addq $40,%rsp
	testq %rax,%rax
	je .Lc1X2
.Lc1X1:
	leaq stg_bh_upd_frame_info(%rip),%rbx
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	leaq Main_main3_closure(%rip),%rsi
	leaq Main_main4_bytes(%rip),%r14
	addq $-16,%rbp
	jmp ghczmprim_GHCziCString_unpackAppendCStringUtf8zh_info
.Lc1X2:
	jmp *(%rbx)
.Lc1X4:
	jmp *-16(%r13)
.section .data
.align 8
.align 1
.globl Main_main2_closure
Main_main2_closure:
	.quad	Main_main2_info
	.quad	0
	.quad	0
	.quad	0
.section .text
.align 8
.align 8
	.quad	4294967299
	.quad	3
	.long	14
	.long	0
.globl Main_main1_info
Main_main1_info:
.Lc1Xf:
	leaq ghczmprim_GHCziTypes_True_closure+2(%rip),%rdi
	leaq Main_main2_closure(%rip),%rsi
	leaq base_GHCziIOziStdHandles_stdout_closure(%rip),%r14
	jmp base_GHCziIOziHandleziText_hPutStr2_info
.section .data
.align 8
.align 1
.globl Main_main1_closure
Main_main1_closure:
	.quad	Main_main1_info
	.quad	base_GHCziIOziHandleziText_hPutStr2_closure
	.quad	base_GHCziIOziStdHandles_stdout_closure
	.quad	Main_main2_closure
	.quad	0
.section .text
.align 8
.align 8
	.quad	4294967299
	.quad	0
	.long	14
	.long	Main_main1_closure-(Main_main_info)+0
.globl Main_main_info
Main_main_info:
.Lc1Xp:
	jmp Main_main1_info
.section .data
.align 8
.align 1
.globl Main_main_closure
Main_main_closure:
	.quad	Main_main_info
	.quad	0
.section .text
.align 8
.align 8
	.quad	4294967299
	.quad	2
	.long	14
	.long	0
.globl Main_main5_info
Main_main5_info:
.Lc1Xz:
	leaq Main_main1_closure+1(%rip),%r14
	jmp base_GHCziTopHandler_runMainIO1_info
.section .data
.align 8
.align 1
.globl Main_main5_closure
Main_main5_closure:
	.quad	Main_main5_info
	.quad	Main_main1_closure
	.quad	base_GHCziTopHandler_runMainIO1_closure
	.quad	0
.section .text
.align 8
.align 8
	.quad	4294967299
	.quad	0
	.long	14
	.long	Main_main5_closure-(ZCMain_main_info)+0
.globl ZCMain_main_info
ZCMain_main_info:
.Lc1XJ:
	jmp Main_main5_info
.section .data
.align 8
.align 1
.globl ZCMain_main_closure
ZCMain_main_closure:
	.quad	ZCMain_main_info
	.quad	0
