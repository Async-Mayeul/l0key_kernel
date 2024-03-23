;;kernel.asm
bits 32 ;nasm directive - 32 bit 
section .text
  ;multiboot spec
  align 4
  dd 0x1BADB002 ;magic number
  dd 0x00 ;flags
  dd - (0x1BADB002 + 0x00) ;checksum

global start
extern kmain ; function declared in kernel.c 

start:
  cli ;block interrupts
  mov esp, stack_space ;set stack pointer
  call kmain
  hlt ;halt the CPU

section .bss
resb 8192 ;8KB for stack 
stack_space:
