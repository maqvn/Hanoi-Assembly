; compilar: Transformar o programa em liguagem de máquina
; nasm -f elf32 hanoi.asm

; linkeditar: Transformar o programa em linguagem de máquina para um executável
; ld -m elf_i386 -o hanoi hanoi.o

section	.data
    pergunta db "Digite o número de discos (1 a 99): ", 0
    tam_pergunta equ $-pergunta

    movimento_1 db 'Mova o disco ', 0
    movimento_2 db ' da torre ', 0
    movimento_3 db ' para a torre ', 0

    tam_mov_1 equ 13
    tam_mov_2 equ 10
    tam_mov_3 equ 14

    torre_origem db 'A', 0
    torre_auxiliar db 'B', 0
    torre_destino db 'C', 0
    tam_torre equ 1

    tam_num db 3
    newline db 10


section .bss
    num_discos resb 3

section	.text
	global _start

_start:
    call write_pergunta
    call read_discos

    call hanoi_ABC
    
    jmp encerrarPrograma


hanoi_ABC:
    mov eax, [num_discos]
    cmp eax, 49
    je um_disco_ABC
    jmp mais_de_um_disco_ABC

    um_disco_ABC:

        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        ret


    mais_de_um_disco_ABC:

        call diminuir_num_discos

        call hanoi_ACB

        call aumentar_num_discos

        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        call diminuir_num_discos

        call hanoi_BAC

        call aumentar_num_discos

        ret



hanoi_ACB:

    mov eax, [num_discos]
    cmp eax, 49
    je um_disco_ACB
    jmp mais_de_um_disco_ACB

    um_disco_ACB:
        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        ret


    mais_de_um_disco_ACB:
        call diminuir_num_discos

        call hanoi_ABC

        call aumentar_num_discos

        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        call diminuir_num_discos

        call hanoi_CAB

        call aumentar_num_discos

        ret

hanoi_BAC:

    mov eax, [num_discos]
    cmp eax, 49
    je um_disco_BAC
    jmp mais_de_um_disco_BAC

    um_disco_BAC:
        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        ret


    mais_de_um_disco_BAC:
        call diminuir_num_discos

        call hanoi_BCA

        call aumentar_num_discos

        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        call diminuir_num_discos

        call hanoi_ABC

        call aumentar_num_discos

        ret

hanoi_BCA:

    mov eax, [num_discos]
    cmp eax, 49
    je um_disco_BCA
    jmp mais_de_um_disco_BCA

    um_disco_BCA:
        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        ret


    mais_de_um_disco_BCA:
        call diminuir_num_discos

        call hanoi_BAC

        call aumentar_num_discos

        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        mov eax, [num_discos]
        dec eax
        mov [num_discos], eax

        call hanoi_CBA

        mov eax, [num_discos]
        inc eax
        mov [num_discos], eax

        ret
    

hanoi_CAB:

    mov eax, [num_discos]
    cmp eax, 49
    je um_disco_CAB
    jmp mais_de_um_disco_CAB

    um_disco_CAB:
        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        ret


    mais_de_um_disco_CAB:
        call diminuir_num_discos

        call hanoi_CBA

        call aumentar_num_discos

        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_auxiliar
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        call diminuir_num_discos

        call hanoi_ACB

        call aumentar_num_discos

        ret

hanoi_CBA:

    mov eax, [num_discos]
    cmp eax, 49
    je um_disco_CBA
    jmp mais_de_um_disco_CBA

    um_disco_CBA:
        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        ret


    mais_de_um_disco_CBA:
        call diminuir_num_discos

        call hanoi_CAB

        call aumentar_num_discos

        mov ecx, movimento_1
        mov edx, tam_mov_1
        call write_movimento

        mov ecx, num_discos
        mov edx, tam_num
        call write_movimento

        mov ecx, movimento_2
        mov edx, tam_mov_2
        call write_movimento
        
        mov ecx, torre_destino
        mov edx, 1
        call write_movimento

        mov ecx, movimento_3
        mov edx, tam_mov_3
        call write_movimento

        mov ecx, torre_origem
        mov edx, 1
        call write_movimento

        mov ecx, newline
        mov edx, 1
        call write_movimento

        call diminuir_num_discos
        
        call hanoi_BCA

        call aumentar_num_discos

        ret



write_movimento:
    mov eax, 4
    mov ebx, 1
    int 0x80

    ret

write_pergunta:
    
    mov eax, 4 ; identificador da chamada sys_write
    mov ebx, 1 ; saída padrão
    mov ecx, pergunta
    mov edx, tam_pergunta
    int 0x80

    ret

read_discos:

    mov eax, 3 ; identificador da chamada sys_read
    mov ebx, 0 ; entrada padrão
    mov ecx, num_discos
    mov edx, 3
    int 0x80

    cmp word [num_discos + 1], 10
    je num_de_um_digito

    mov byte [num_discos + 2], 0
    jmp return

    num_de_um_digito: 

        mov byte [num_discos + 1], 0
    
    return:
        ret

cast_string_int:
    mov eax, 0
    mov ebx, 0

    mov bl, [num_discos + 0]
    sub bl, '0'

    mov al, [num_discos + 1]

    cmp al, 0
    je num_um_digito
    
    sub al, '0'
    imul ebx, 10
    add ebx, eax
    
    mov [num_discos], ebx
    mov byte [num_discos + 2], 0
    
    ret

    num_um_digito:
        mov [num_discos], bl
        mov byte [num_discos + 1], 0
        ret

cast_int_string:
   
    mov eax, [num_discos]
    mov ebx, 10
    mov edx, 0
    
    div ebx ; rax = dezena, rdx = unidade

    add dl, '0'

    cmp al, 0
    je um_digito

    add al, '0'

    mov [num_discos], al
    mov [num_discos + 1], dl
    mov byte [num_discos + 2], 0
    
    ret

    um_digito:
        mov [num_discos], dl
        mov byte [num_discos + 1], 0

        ret

diminuir_num_discos:
    
    call cast_string_int
    mov eax, [num_discos]
    dec eax
    mov [num_discos], eax
    call cast_int_string

    ret

aumentar_num_discos:
    
    call cast_string_int
    mov eax, [num_discos]
    inc eax
    mov [num_discos], eax
    call cast_int_string

    ret

encerrarPrograma:

	mov eax, 1 ; identificador da chamada sys_exit
    mov ebx, 0  ; sem erros 
    int 0x80
