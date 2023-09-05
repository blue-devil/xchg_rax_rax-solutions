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
; | @date     : 05/09/2023                                                |
; | @license  : AGPLv3                                                    |
; |_______________________________________________________________________|
; |                                                                       |
; |                   xorpd - "xchg rax, rax" Solutions                   |
; |                                 0x07                                  |
; \_______________________________________________________________________/
; |                                                                       |
; | Riddle 0x07                                                           |
; |                                                                       |
; | Assemble, link and debug:                                             |
; | ========================                                              |
; | $ nasm -felf64 0x07.s                                                 |
; | $ ld 0x07.o -o 0x07.out                                               |
; | $ gdb -q 0x07.out                                                     |
; |                                                                       |
; | Final executable does not print something to terminal, inspect the    |
; | effects by using gdb debugger.                                        |
; |_______________________________________________________________________|

; constants
NULL            equ 0
EXIT_SUCCESS    equ 0
SYS_EXIT        equ 60

    section .text
    global _start
_start:
    ; prepare registers
    mov rax, -1

    ; =====================================================================
    ; riddle start
    inc      rax
    neg      rax
    inc      rax
    neg      rax
    ; riddle end
    ; =====================================================================

exit:
    ; void exit(int status);
    mov rdi, 0
    mov rax, SYS_EXIT
    syscall
