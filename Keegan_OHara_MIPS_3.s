##########################################################################
#  Keegan O'Hara



.data

text: .asciiz "Enter a string to be reversed: "




.text

    li      $v0, 4          # prints text string
    la      $a0, text
    syscall
    
    addiu $sp, $sp, -140

    li      $v0, 8          # text is assigned to the inputted string
    la      $a0, text
    li      $a1, 256        # size of input buffer
    syscall

    la      $t0, text       # addr = text
    move    $t2, $t0        # orig = addr (backup of original address)
find:   lb      $t1, 0($t0)     # tmp = *addr
    beq     $t1, 0, print   # while(tmp != NUL)
    addi    $t0, $t0, 1     # addr++
    j       find            # (end loop)

print:  addi    $t0, $t0, -1     # --addr
    blt     $t0, $t2, end   # while (addr >= orig)
    li      $v0, 11         # printChar(
    lb      $a0, 0($t0)     #   *addr
    syscall                 # )
    j       print           # (end loop)

end:    li      $v0, 10         # exit cleanly
    syscall