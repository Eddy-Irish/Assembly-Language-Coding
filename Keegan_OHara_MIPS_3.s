##########################################################################
#  Keegan O'Hara



.data

text: .asciiz "Enter a string to be reversed: "




.text

    # Prints out input string
    li      $v0, 4          
    la      $a0, text
    syscall
    
    
    # Allocates space on the stack
    addiu $sp, $sp, -140

    li      $v0, 8          # text is assigned to the inputted string
    move    $a0, $sp
    li      $a1, 140        # size of input buffer
    syscall

    move    $t0, $sp       # addr = text
    move    $t2, $t0        # orig = addr (backup of original address)

findEnd:   lb      $t1, 0($t0)     # tmp = *addr
    beq     $t1, 0, print   # while(tmp != NUL)
    addi    $t0, $t0, 1     # addr++
    j       findEnd            # (end loop)

print:  addi    $t0, $t0, -1     # --addr
    blt     $t0, $t2, end   # while (addr >= orig)
    li      $v0, 11         # printChar(
    lb      $a0, 0($t0)     #   *addr
    syscall                 # )
    j       print           # (end loop)

end:    li      $v0, 10         # exit cleanly
    syscall