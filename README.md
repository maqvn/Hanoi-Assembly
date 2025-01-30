**TORRE DE HANOI**

_O jogo "Torre de Hanoi" é um desafio mundialmente conhecido, saiba mais no link a seguir: [hanoi](https://pt.wikipedia.org/wiki/Torre_de_Han%C3%B3i) _

_Esse código escrito em assembly NASM x86 resolve a torre com 1 até 99 discos._


**Como rodar o código**

1. Instale o NASM x86 na sua máquina.

2. Com o arquivo aberto, abra o terminal e execute os seguintes comandos:

nasm -f elf32 hanoi.asm

ld -m elf_i386 -o hanoi hanoi.o

Se tudo ocorreu corretamente devem ter sido criados 2 arquivos, hanoi.o e hanoi, agora basta digitar: " ./hanoi ".
