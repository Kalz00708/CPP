/* This file is about the process of compiler
 */

/* compile
 * This will translate a file after preprocessor into an ASCII assembly-language file
 * one .i will generate one .s
 *
 * --------------------NOTE--------------------
 * To understand assembly can help us to understand what is variable, what is function ect
 * We will see assembly code in each part
 */

/* question in this file: (answer at the end of the file)
 * 1. what is lable?
 * 2. what is the entrance of the program?
 * 3. explain why the initilzation of the variable defined in section .data (like static local variable) will only be ran once.
 */



// The order of code will NOT change in assembly code

int i = 10;
void test(){}
int j = 20;

/* -------------------------
 * This part is initialize i
 * -------------------------
 *		.globl _i
 *		.data
 *		.align 2
 *	_i:				***This is a lable, the assembler will assign an address to lable***
 *		.long	10
 * --------------------------
 * This part is function test
 * --------------------------
 *		.text
 *		.globl __Z4testv
 *	__Z4testv:
 *	LFB0:
 *		pushq	%rbp
 *	LCFI0:
 *		movq	%rsp, %rbp
 *	LCFI1:
 *		popq	%rbp
 *	LCFI2:
 *		ret
 *	LFE0:
 * -------------------------
 * This part is initialize j
 * -------------------------
 *		.globl _j
 *		.data
 *		.align 2
 *	_j:
 *		.long	20
 * -----------------------
 *  I don't what is doing here, but I guess it doesn't matter
 * -----------------------
 *		.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
 *	EH_frame1:
 *		.set L$set$0,LECIE1-LSCIE1
 *		.long L$set$0
 *	LSCIE1:
 *		.long	0
 *		.byte	0x1
 *		.ascii "zR\0"
 *		.byte	0x1
 *		.byte	0x78
 *		.byte	0x10
 *		.byte	0x1
 *		.byte	0x10
 *		.byte	0xc
 *		.byte	0x7
 *		.byte	0x8
 *		.byte	0x90
 *		.byte	0x1
 *		.align 3
 *	LECIE1:
 *	LSFDE1:
 *		.set L$set$1,LEFDE1-LASFDE1
 *		.long L$set$1
 *	LASFDE1:
 *		.long	LASFDE1-EH_frame1
 *		.quad	LFB0-.
 *		.set L$set$2,LFE0-LFB0
 *		.quad L$set$2
 *		.byte	0
 *		.byte	0x4
 *		.set L$set$3,LCFI0-LFB0
 *		.long L$set$3
 *		.byte	0xe
 *		.byte	0x10
 *		.byte	0x86
 *		.byte	0x2
 *		.byte	0x4
 *		.set L$set$4,LCFI1-LCFI0
 *		.long L$set$4
 *		.byte	0xd
 *		.byte	0x6
 *		.byte	0x4
 *		.set L$set$5,LCFI2-LCFI1
 *		.long L$set$5
 *		.byte	0xc
 *		.byte	0x7
 *		.byte	0x8
 *		.align 3
 *	LEFDE1:
 *		.constructor
 *		.destructor
 *		.align 1
 *		.subsections_via_symbols
 */

 /* 1. see above
  * 2. the lable 'main'
  * 3. the data in Code or Data (global variables, can be read-only or read-write) i.e. not in heap and stack, are initialized after assembler/linking, rather than runtime, thus they can be initialize once
  */
