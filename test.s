# Demo
#
# Filename : LoadImmediate

	

    .data

openingStr: .asciiz "Two values to be multiplied...\n"
timesStr: .asciiz "   times   "
multiplier:   .half   5    #int multiplier
multiplicand: .half   4    #int multiplicand



##########################################################################
#                               MAIN PROGRAM                             #
##########################################################################
    .text

main:  
   
    li $v0, 4
    la $a0, openingStr            #prints first string
    syscall
    
    lh $t0, multiplier
    li $v0, 1
    move $a0, $t0                 #prints multiplier
    syscall 
    
    li $v0, 4
    la $a0, timesStr              #prints middle string
    syscall
    
    lh $t1, multiplicand
    li $v0, 1
    move $a0, $t1
    syscall                       #prints multiplicand
    
    andi $t2, $t0, 1



    







    # Exit the Program
    li  $v0, 10
    syscall