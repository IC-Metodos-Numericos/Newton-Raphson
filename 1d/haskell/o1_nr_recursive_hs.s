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
.Lc1T7:
	leaq -8(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1Te
.Lc1Tf:
	leaq .Lc1T4_info(%rip),%rax
	movq %rax,-8(%rbp)
	movq %r14,%rbx
	addq $-8,%rbp
	testb $7,%bl
	jne .Lc1T4
.Lc1T5:
	jmp *(%rbx)
.align 8
	.quad	0
	.long	30
	.long	0
.Lc1T4_info:
.Lc1T4:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1Ti
.Lc1Th:
	movsd 7(%rbx),%xmm0
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd %xmm0,%xmm1
	addsd %xmm0,%xmm1
	movsd %xmm1,(%r12)
	leaq -7(%r12),%rbx
	addq $8,%rbp
	jmp *(%rbp)
.Lc1Ti:
	movq $16,904(%r13)
	jmp stg_gc_unpt_r1
.Lc1Te:
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
.Lc1Ty:
	leaq -8(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1TI
.Lc1TJ:
	leaq .Lc1Tv_info(%rip),%rax
	movq %rax,-8(%rbp)
	movq %r14,%rbx
	addq $-8,%rbp
	testb $7,%bl
	jne .Lc1Tv
.Lc1Tw:
	jmp *(%rbx)
.align 8
	.quad	0
	.long	30
	.long	0
.Lc1Tv_info:
.Lc1Tv:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1TM
.Lc1TL:
	movsd 7(%rbx),%xmm0
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd %xmm0,%xmm1
	mulsd %xmm0,%xmm1
	subsd .Ln1TR(%rip),%xmm1
	movsd %xmm1,(%r12)
	leaq -7(%r12),%rbx
	addq $8,%rbp
	jmp *(%rbp)
.Lc1TM:
	movq $16,904(%r13)
	jmp stg_gc_unpt_r1
.Lc1TI:
	leaq Main_f_closure(%rip),%rbx
	jmp *-8(%r13)
.section .rdata
.align 8
.align 8
.Ln1TR:
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
.Lc1Uy:
	leaq -48(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1Uz
.Lc1UA:
	leaq .Lc1U1_info(%rip),%rax
	movq %rax,-32(%rbp)
	movq %r8,%rbx
	movq %r14,-24(%rbp)
	movq %rsi,-16(%rbp)
	movq %rdi,-8(%rbp)
	addq $-32,%rbp
	testb $7,%bl
	jne .Lc1U1
.Lc1U2:
	jmp *(%rbx)
.align 8
	.quad	3
	.long	30
	.long	0
.Lc1U1_info:
.Lc1U1:
	leaq .Lc1UB_info(%rip),%rax
	movq %rax,(%rbp)
	movq 7(%rbx),%rax
	movq 24(%rbp),%rbx
	movq %rax,24(%rbp)
	testb $7,%bl
	jne .Lc1UB
.Lc1UL:
	jmp *(%rbx)
.align 8
	.quad	259
	.long	30
	.long	0
.Lc1UB_info:
.Lc1UB:
	movq 8(%rbp),%rax
	movq 24(%rbp),%rcx
.Ln1V5:
	movq %rbx,64(%rsp)
	movq %rcx,%rbx
	movq 64(%rsp),%rcx
	jmp .Lc1U8
.align 8
	.quad	1221
	.long	30
	.long	0
.Lc1Uk_info:
.Lc1Uk:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1UJ
.Lc1UI:
	leaq 7(%rbx),%rax
	movsd 16(%rbp),%xmm0
	divsd (%rax),%xmm0
	movsd 8(%rbp),%xmm1
	subsd %xmm0,%xmm1
	leaq ghczmprim_GHCziTypes_Dzh_con_info(%rip),%rax
	movq %rax,-8(%r12)
	movsd %xmm1,(%r12)
	movq 24(%rbp),%rax
	movq 40(%rbp),%rbx
	decq %rbx
	addq $16,%rbp
	leaq -7(%r12),%rcx
.Lc1U8:
	testq %rbx,%rbx
	je .Lc1UK
.Lc1UF:
	leaq .Lc1Ug_info(%rip),%rdx
	movq %rdx,-16(%rbp)
	movq %rcx,%r14
	movq %rbx,%rdx
	movq %rax,%rbx
	movsd 7(%rcx),%xmm0
	movsd %xmm0,-8(%rbp)
	movq %rcx,(%rbp)
	movq %rdx,24(%rbp)
	addq $-16,%rbp
	jmp stg_ap_p_fast
.Lc1UK:
	movq %rcx,%rbx
	addq $32,%rbp
	jmp *(%rbp)
.Lc1UJ:
	movq $16,904(%r13)
	jmp stg_gc_unpt_r1
.Lc1Uz:
	leaq Main_newtonRecursive_closure(%rip),%rbx
	jmp *-8(%r13)
.align 8
	.quad	1093
	.long	30
	.long	0
.Lc1Ug_info:
.Lc1Ug:
	leaq .Lc1Uk_info(%rip),%rax
	movq %rax,(%rbp)
	movq 16(%rbp),%r14
	movsd 7(%rbx),%xmm0
	movq 32(%rbp),%rbx
	movsd %xmm0,16(%rbp)
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
.Lc1V8:
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
.Lc1Vg:
	jmp .Lc1V9
.Lc1Ve:
	decq %r14
	movsd %xmm1,%xmm0
	addsd %xmm1,%xmm0
	movsd %xmm1,%xmm2
	mulsd %xmm1,%xmm2
	subsd .Ln1VF(%rip),%xmm2
	divsd %xmm0,%xmm2
	subsd %xmm2,%xmm1
.Lc1V9:
	testq %r14,%r14
	jne .Lc1Ve
.Lc1Vf:
	jmp *(%rbp)
.section .rdata
.align 8
.align 8
.Ln1VF:
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
.Lc1VV:
	leaq -32(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1VZ
.Lc1W0:
	subq $8,%rsp
	movq %r13,%rcx
	movq %rbx,%rdx
	subq $32,%rsp
	xorl %eax,%eax
	call newCAF
	addq $40,%rsp
	testq %rax,%rax
	je .Lc1VS
.Lc1VR:
	leaq stg_bh_upd_frame_info(%rip),%rbx
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	leaq .Lc1VT_info(%rip),%rax
	movq %rax,-24(%rbp)
	movl $10,%r14d
	movsd .Ln1W8(%rip),%xmm1
	addq $-24,%rbp
	jmp Main_zdwiterateNewton_info
.Lc1VS:
	jmp *(%rbx)
.Lc1VZ:
	jmp *-16(%r13)
.align 8
	.quad	0
	.long	30
	.long	base_GHCziFloat_zdfShowDouble2_closure-(.Lc1VT_info)+0
.Lc1VT_info:
.Lc1VT:
	addq $16,%r12
	cmpq 856(%r13),%r12
	ja .Lc1W3
.Lc1W2:
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
.Lc1W3:
	movq $16,904(%r13)
	jmp stg_gc_d1
.section .rdata
.align 8
.align 8
.Ln1W8:
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
.Lc1Wk:
	leaq -16(%rbp),%rax
	cmpq %r15,%rax
	jb .Lc1Wl
.Lc1Wm:
	subq $8,%rsp
	movq %r13,%rcx
	movq %rbx,%rdx
	subq $32,%rsp
	xorl %eax,%eax
	call newCAF
	addq $40,%rsp
	testq %rax,%rax
	je .Lc1Wj
.Lc1Wi:
	leaq stg_bh_upd_frame_info(%rip),%rbx
	movq %rbx,-16(%rbp)
	movq %rax,-8(%rbp)
	leaq Main_main3_closure(%rip),%rsi
	leaq Main_main4_bytes(%rip),%r14
	addq $-16,%rbp
	jmp ghczmprim_GHCziCString_unpackAppendCStringUtf8zh_info
.Lc1Wj:
	jmp *(%rbx)
.Lc1Wl:
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
.Lc1Ww:
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
	.quad	base_GHCziIOziStdHandles_stdout_closure
	.quad	base_GHCziIOziHandleziText_hPutStr2_closure
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
.Lc1WG:
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
.Lc1WQ:
	leaq Main_main1_closure+1(%rip),%r14
	jmp base_GHCziTopHandler_runMainIO1_info
.section .data
.align 8
.align 1
.globl Main_main5_closure
Main_main5_closure:
	.quad	Main_main5_info
	.quad	base_GHCziTopHandler_runMainIO1_closure
	.quad	Main_main1_closure
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
.Lc1X0:
	jmp Main_main5_info
.section .data
.align 8
.align 1
.globl ZCMain_main_closure
ZCMain_main_closure:
	.quad	ZCMain_main_info
	.quad	0
