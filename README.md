**TORRE DE HANOI**


![hanoi](https://github.com/user-attachments/assets/42bcde2d-eba5-42b2-ba22-18a82108101b)


O jogo "Torre de Hanoi" é um desafio mundialmente conhecido, saiba mais no link a seguir: [hanoi](https://pt.wikipedia.org/wiki/Torre_de_Han%C3%B3i)

_Esse código escrito em assembly NASM x86 resolve a torre com 1 até 99 discos._


**Como rodar o código**

1. Instale o NASM x86 na sua máquina.

2. Com o arquivo aberto, abra o terminal e execute os seguintes comandos:

    nasm -f elf32 hanoi.asm
  
    ld -m elf_i386 -o hanoi hanoi.o

3. Se tudo correu conforme o esperado, devem ter sido criados 2 arquivos, hanoi.o e hanoi, agora basta digitar: " ./hanoi ", no terminal.


![terminal_hanoi](https://github.com/user-attachments/assets/4c619828-296a-42da-bc8a-5e3aafc0029f)
