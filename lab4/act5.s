@ act5
@ compute the following equation 6x2 + 9x + 2
@       
@ ---------------------------------------
@   Data Section
@ ---------------------------------------

.data
.balign 4
prompt: .asciz "Value of x: "
format: .asciz  "%d"
x:    .int    0
output: .asciz  "6x2 + 9x + 2 = %d\n"

@ ---------------------------------------
@     Code Section
@ ---------------------------------------

.text
.global main
.extern printf
.extern scanf

main:   push    {ip, lr}         @ push return address + dummy register for alignment
        ldr     r0, =prompt      @ print the prompt
        bl      printf

	ldr     r0, =format      @ call scanf, and pass address of format
        ldr     r1, =x           @ string and address of x in r0, and r1,
        bl      scanf            @ respectively.
	ldr	r0, =x		@ store x into r0
	ldr	r0, [r0]

	@ perform calculation
	mov	r1, #6
	mul	r1, r0, r1
	mov	r2, #2
	mul	r1, r2, r1
	mov	r2, #9
	mul	r0, r2, r0
	add	r0, r1, r0
	add	r1, r0, #2 

	@ result is stored in r1; print r0 and r1
        ldr     r0, =output
        bl      printf

        pop     {ip, pc}         @ pop return address into pc


