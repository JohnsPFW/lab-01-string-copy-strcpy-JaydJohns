//----------------------------------------------------------------------------
//The information contained in this file may only be used by a person
//authorised under and to the extent permitted by a subsisting licensing 
//agreement from Arm Limited or its affiliates 
//
//(C) COPYRIGHT 2020 Arm Limited or its affiliates
//ALL RIGHTS RESERVED.
//Licensed under the ARM EDUCATION INTRODUCTION TO COMPUTER ARCHITECTURE 
//EDUCATION KIT END USER LICENSE AGREEMENT.
//See https://www.arm.com/-/media/Files/pdf/education/computer-architecture-education-kit-eula
//
//This entire notice must be reproduced on all copies of this file
//and copies of this file may only be made by a person if such person is
//permitted to do so under the terms of a subsisting license agreement
//from Arm Limited or its affiliates.
//----------------------------------------------------------------------------
.global _start
.text
_start:
//place move instructions here
	MOVZ	X0, #0x0050
	MOVZ	X1, #0x013C
	MOVZ	X5, #0x65
	MOVZ	X6, #0x66

// store values in memory
	STURB 	W5, [X0]
	STURB 	W6, [X0, #1]
	STURB	WZR, [X0, #2]
	
//strcpy operation
_strcpyloop: 
    LDRB	W2, [X0], #1  // Load byte into W2 from memory pointed to by X0 (*src)
    STRB 	W2, [X1], #1  // Store byte in W2 into memory pointed to by W2 (*dst)
    CMP   	X2, #0         // Was the byte 0? 
    BNE   	_strcpyloop    // If not, repeat the _strcpyloop

YIELD