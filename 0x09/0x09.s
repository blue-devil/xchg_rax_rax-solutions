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
; | @date     : 07/09/2023                                                |
; | @license  : AGPLv3                                                    |
; |_______________________________________________________________________|
; |                                                                       |
; |                   xorpd - "xchg rax, rax" Solutions                   |
; |                                 0x09                                  |
; \_______________________________________________________________________/
; |                                                                       |
; | Riddle 0x09                                                           |
; |                                                                       |
; | Assemble, link and debug:                                             |
; | ========================                                              |
; | $ nasm -felf64 0x09.s                                                 |
; | $ ld 0x09.o -o 0x09.out                                               |
; | $ gdb -q 0x09.out                                                     |
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
    mov rax, 13

    ; =====================================================================
    ; riddle start
    shr      rax,3
    adc      rax,0
    ; riddle end
    ; =====================================================================

exit:
    ; void exit(int status);
    mov rdi, 0
    mov rax, SYS_EXIT
    syscall
