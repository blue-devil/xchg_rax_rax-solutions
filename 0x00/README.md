# How to solve 0x00

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x00][challenge]                                |
| Date                      | 11/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Zeroing registers                                |
| Tools                     | gdb, vim                                         |
| Music                     | Pentagram - Beyond Insanity                      |

## Prologue

[Next][next]

xorpd's very first assembly snippet is below:

```nasm
    xor eax, eax
    lea rbx, [0]
    loop $
    mov rdx, 0
    and esi, 0
    sub edi, edi
    push 0
    pop rbp
```

## Tutorial

At first glance this riddle feels like zeroing the registers. Let's inspect
them.

### xor eax, eax

self xoring makes the register 0. Also xor instruction zero-extends the
register. `xor rax, rax` is a 3-byte long instruction, on the other hand
`xor eax, eax` is only 2-bytes long! So in general we will see `xor eax, eax`
for zeroing `rax` register.

### lea rbx, [0]

`lea` stands for `load effective address`. Destination operand is a register
and source operand is a memory address. In this expression `0` is the address
of memory. For assembler `[]` brackets means, dereferencing the  value of the
memory address which is in brackets.

Thus our expression is trying to read address `0`. And in general (linux)
address 0 hold value of 0. For more information anyone can check kernel
documentation about boot process and [memory layout][web-kernel-memory-layout].

### loop $

In x86 assembly `$` sign is the address of itself. `loop` instruction checks
if the rcx instruction is 0 implicitly and if not it jumps to the its first
operand. If rcx is zero then steps over to the nex instruction.

So in our example loop instruction checks and decrements rcx then jumps to
itself. So it decrements rcx to 0 then steps over.

One important point: if the rcx is already 0 then it decrements
`0xFFFFFFFFFFFFFFFF`.

### and esi, 0

`and` is a logical instruction like `xor` and `or`. If you and a register with
`0` final result is always zero. Also [and][web-intel-and] instruction zero
extends the register.

### sub edi, edi

This is very very obvious. If you subtract a value from itself you get `0`.
Also `sub` instruction zero extends destination register!

### push 0 - pop rbp

This is a quite used way of passing a value to a register. It takes only three
registers. `push` moves its operand to the top of the stack. And `pop` get the
value from top of the stack and writes it to its operand

## Final Thoughts

Question `0x00` shows how to zero a register!. As we can see there are multiple
ways. In shellcoding `xor eax,eax` the de-facto operation it is fewer in bytes
and null-free.

BONUS: By the way we know that multiplication with 0 gives 0 as a result:

```nasm
mov ebx, 0
imul ebx
```

The above code both zeroes rax and rdx! `imul ebx` also null free!

## Resources

* [LEA - Load Effective Address][web-intel-lea]
* [The Linux/x86 Boot Protocol:Memory layout][web-kernel-memory-layout]

## Thanks/Greetings

[ErrorInside][web-ei] // [SCT][web-sct]

## Epilogue

* Few people, more machines! Blue DeviL // SCT

## DON'T FORGET

All the information served here are for informational and educational purposes
only. We cannot be held responsible for any misuse of the given information.

## License

This project is licensed under the AGPLv3 license.

## Author

[Blue DeviL][web-bd] // [SCT][web-sct]

[web-bd]:  https://gitlab.com/bluedevil
[web-ei]:  https://gitlab.com/error.inside
[web-xorpd]: https://github.com/xorpd
[web-sct]: http://www.sctzine.com
[next]: ../0x01/README.md
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_00.html
[web-intel-lea]: https://www.felixcloutier.com/x86/lea.html
[web-kernel-memory-layout]: https://www.kernel.org/doc/html/v5.6/x86/boot.html#memory-layout
[web-intel-and]: https://www.felixcloutier.com/x86/and
