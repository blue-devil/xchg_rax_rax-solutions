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
; | @date     : 14/08/2023                                                |
; | @license  : AGPLv3                                                    |
; |_______________________________________________________________________|
; |                                                                       |
; |                   xorpd - "xchg rax, rax" Solutions                   |
; |                                 0x02                                  |
; \_______________________________________________________________________/
; |                                                                       |
; | Riddle 0x02 is an effective way to check if the related register      |
; | contains any bits. If no then sets reg ro 0 other wise to 1. Generally|
; | we do this shifting bits to right and and-ing them with 1 in a loop.  |
; | That is way better solution.                                          |
; |                                                                       |
; | Assemble, link and debug:                                             |
; | ========================                                              |
; | $ nasm -felf64 0x02.s                                                 |
; | $ ld 0x02.o -o 0x02.out                                               |
; | $ gdb -q 0x02.out                                                     |
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
    mov rax, -9

    ; =====================================================================
    ; riddle start
    neg      rax
    sbb      rax,rax
    neg      rax
    ; riddle end
    ; =====================================================================

exit:
    ; void exit(int status);
    mov rdi, 0
    mov rax, SYS_EXIT
    syscall