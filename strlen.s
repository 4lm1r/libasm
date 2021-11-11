/*******************************************************/
/*  ARM assembly AARCH64 Raspberry PI 4B 1.4           */
/*******************************************************/
/*                                                     */
/*******************************************************/
/*          FUNCTION  strlen.s                         */
/* The function receives the address of the string     */
/* at x1 register uses x2 as a counter, and go byte    */
/* through byte incrementing x2 which is returned by   */
/* register x0 the length of the string that must      */
/* end with the \n byte (0xa)                          */
/*******************************************************/ 

/*******************************************************/
/*    DATA SECTION                                     */
/*******************************************************/
.data
.align 4

j: .word 0

/********************************************************/
/*   CODE SECTION                                       */
/********************************************************/

.text

.global strlen

strlen:
    stp     x29, x30, [sp, -16]!
    adr     x2, j               //@ -- load var j address    
    ldrsw   x2, [x2]            //@ -- into x2 register
L1:
    ldrb    w0, [x1, x2]        //@ -- x1 carries string address
    cmp     w0, 0xa             //@ -- comapres w0 to cr (0xa = '\n')
    beq     retval              //@ -- jump if equal to retval
    add     x2, x2, #1          //@ -- increment counter 
    b L1                        //@ -- jump loop
retval:
    mov     x0, x2              //@ -- stores the counter to x0
    ldp     x29, x30, [sp], 16
    ret
