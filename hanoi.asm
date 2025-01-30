section .data
    pergunta db "Digite o número de discos (1 a 99): ", 0
    tam_pergunta equ $-pergunta

    concluido db "Concluído!", 10
    tam_concluido equ $-concluido

    movimento_1 db 'Mova o disco ', 0
    tam_mov_1 equ $-movimento_1

    movimento_2 db ' da torre ', 0
    tam_mov_2 equ $-movimento_2
    
    movimento_3 db ' para a torre ', 0
    tam_mov_3 equ $-movimento_3


    torre_origem db 'A', 0
    torre_auxiliar db 'B', 0
    torre_destino db 'C', 0
    tam_torre equ 1

    tam_num db 3
    newline db 10


section .bss
    num_discos resb 3

section .text
    global _start

_start:
    call write_pergunta
    call read_discos

    call hanoi
    
    jmp encerrarPrograma


hanoi:
    mov eax, [num_discos]
    cmp eax, '1'
    je um_disco
    jmp mais_de_um_disco

    um_disco: ; caso só tenha 1 disco na torre atual

        call mover_disco
        ret

    mais_de_um_disco: ; caso tenha mais de 1 disco na torre atual

        call diminuir_num_discos
        call trocar_destino_auxiliar
        call hanoi
        call trocar_destino_auxiliar
        call aumentar_num_discos

        call mover_disco

        call diminuir_num_discos
        call trocar_auxiliar_origem
        call hanoi
        call trocar_auxiliar_origem
        call aumentar_num_discos

        ret

mover_disco:  ; printa o movimento do disco da origem atual para o destino atual
    
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


write_pergunta: ; escreve na tela informando para digitar o número de discos entre 1 e 99
    
    mov eax, 4 ; identificador da chamada sys_write
    mov ebx, 1 ; saída padrão
    mov ecx, pergunta
    mov edx, tam_pergunta
    int 0x80

    ret

read_discos: ; lê a entrada do usuário e tira o caracte "newline" e o transforma em nulo

    mov eax, 3 ; identificador da chamada sys_read
    mov ebx, 0 ; entrada padrão
    mov ecx, num_discos
    mov edx, 3
    int 0x80

    cmp byte [num_discos + 1], 10
    je num_de_um_digito

    mov byte [num_discos + 2], 0
    jmp return

    num_de_um_digito: 

        mov byte [num_discos + 1], 0
    
    return:
        ret

write_movimento: ; escreve na tela cada parte do movimento dos discos entre torre
    mov eax, 4
    mov ebx, 1
    int 0x80

    ret

cast_string_int: ; transforma o valor do número de discos no seu real valor inteiro
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

cast_int_string: ; transforma o valor inteiro em seu caracter na tabela ascii
   
    mov eax, [num_discos]
    mov ebx, 10
    mov edx, 0
    
    div ebx ; eax = quociente, edx = resto

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

diminuir_num_discos: ; diminui o número de discos em 1 antes de chamada recursiva
    

    call cast_string_int
    mov eax, [num_discos]
    dec eax
    mov [num_discos], eax
    call cast_int_string

    ret

aumentar_num_discos: ; aumenta o número de discos em 1 após a chamada recursiva
    
    call cast_string_int
    mov eax, [num_discos]
    inc eax
    mov [num_discos], eax
    call cast_int_string

    ret

trocar_destino_auxiliar: ; inverte a torre auxiliar com a destino (faz parte da recursão do programa)
    mov al, [torre_destino]
    mov bl, [torre_auxiliar]
    mov [torre_auxiliar], al
    mov [torre_destino], bl

    ret

trocar_auxiliar_origem: ; inverte a torre auxiliar com a origem (faz parte da recursão do programa)
    mov al, [torre_origem]
    mov bl, [torre_auxiliar]
    mov [torre_auxiliar], al
    mov [torre_origem], bl
    
    ret

encerrarPrograma: ; escrever na tela "Concluído!" e terminar o programa 
    mov eax, 4
    mov ebx, 1
    mov ecx, concluido
    mov edx, tam_concluido
    int 0x80

    mov eax, 1 ; identificador da chamada sys_exit
    mov ebx, 0  ; sem erros 
    int 0x80
