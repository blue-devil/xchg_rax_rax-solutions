;  _______________________________________________________________________ 
; |  ______ __          ,.'   __.'.__  .   ______               ___       |
; | |      |  |         /b`  '-.   .-'  d\|      ;             |   |      |
; | |   __ |  |        .5h     /.'.\    =5|   _   \            |   |      |
; | |.  1 \|  |        (0=h    '   '    =C)   1\   \        .--:.  |      |
; | |   1_/|  |        ?3==,          .==7|   | \   \       |__|   |      |
; | |.     | .-- -.-----{=`==oo____oo==`=}|   |  |.----.-- -.--:.  |      |
; | |.  __ | |  V |  ^__|'"o58888888888,; |.  |  ||  ^_|  V |  |.  |      |
; | |:  1 \|_|____|_____| `?88P^\,?88^\P  |.  | / |____|\___|__|:  |___   |
; | |:  1_/   /            C8?\__d88\_/'  |:  1/   / .         |:  1   |  |
; | |::.. .  /             `8o8888/\88P   |::.. . /            |::.. . |  |
; | `-------'               '7oo88oo8P    `------'             `-------'  |
; |                     Cooo##~\/\/\/~====>        github.com/blue-devil  |
; |                                                 gitlab.com/bluedevil  |
; | Freedom does not come from second-hand thoughts.     www.sctzine.com  |
; |_______________________________________________________________________|
; | @author   : Blue DeviL <bluedevil.SCT@gmail.com>                      |
; | @tester   : ErrorInside <errorinside@sctzine.com>                     |
; | @IDE      : ViM <Vi iMproved>                                         |
; | @template : Blue DeviL                                                |
; | @date     : 11/08/2023                                                |
; | @license  : AGPLv3                                                    |
; |_______________________________________________________________________|
; |                                                                       |
; |                   xorpd - "xchg rax, rax" Solutions                   |
; |                                 0x00                                  |
; \_______________________________________________________________________/
; |                                                                       |
; | Riddle 0x00 shows us how to zero registers.                           |
; |                                                                       |
; | Assemble, link and debug:                                             |
; | ========================                                              |
; | $ nasm -felf64 0x00.s                                                 |
; | $ ld 0x00.o -o 0x00                                                   |
; | $ gdb -q 0x00                                                         |
; |                                                                       |
; | Final executable does not print something to terminal, inspect the    |
; | effects by using gdb debugger.                                        |
; |_______________________________________________________________________|

; constants
SYS_EXIT        equ 60

    section .text
    global _start
_start:

    ; fill registers for control:
    mov rax, 0x5C7050305C705030
    mov rbx, 0x33
    mov rcx, 0x2
    mov rdx, 0x5C7050305C705030
    mov rsi, 0x5C7050305C705030
    mov rdi, 0x5C7050305C705030
    mov rbp, 0x5C7050305C705030

    ; =====================================================================
    ; question start
    xor eax, eax
    lea rbx, [0]
    loop $
    mov rdx, 0
    and esi, 0
    sub edi, edi
    push 0
    pop rbp
    ; question end
    ; =====================================================================

exit:
    ; void exit(int status);
    mov rdi, 0
    mov rax, SYS_EXIT
    syscall
