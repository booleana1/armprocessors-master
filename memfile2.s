 @ Exercita MOV, EOR, TST, CMP e ao final
        @ grava 7 em Mem[100], 
        @ o que faz o testbench exibir "Simulation succeeded"

        AREA reset, CODE
        ENTRY

start:
        MOV   r2, #0xF0      @ r2 = 0xF0
        EOR   r3, r2, #0x0F  @ r3 = 0xF0 ^ 0x0F = 0xFF
        TST   r3, #0xF0      @ flags <- r3 AND 0xF0 (Z=0 se !=0)
        CMP   r3, #0xF0      @ flags <- r3 - 0xF0 (Z=0 se !=0)

        MOV   r0, #7         @ r0 = 7
        MOV   r1, #100       @ r1 = 100 (0x64)
        STR   r0, [r1, #0]   @ Mem[100] = 7

        B     done
done:
        NOP

        END