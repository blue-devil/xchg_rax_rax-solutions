# How to solve 0x08

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x08][challenge]                                |
| Date                      | 07/09/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Zeroing registers                                |
| Tools                     | gdb, vim                                         |
| Music                     | Slipknot - Psychosocial                          |

## Prologue

[Previous][prev] | [Next][next]

Riddle 0x08 is:

```nasm
add      rax,rdx
rcr      rax,1
```

## Tutorial

[Rotate instructions][web-felix-rotate-intel] rotates bits inside of a register,
at number times given in second operand. So `rax` is a 64bit register, if you
rotate bits (right or left) 64 times, you will get the same number.

But also rotate instructions have some small but important details. If rotate
instruction has a 'c' in it, that means 'carry'. So ROR means `Rotate Right`
but `RCR` means `Rotate with Carry to Right`

Let's say our first phase is like below.

```txt
 63                                 0
| 1 | 0 | 1 | 0 | ... | 0 | 1 | 0 | 1 |

Carry bit : 0
```

Now rotate it with carry to right

```txt
 63                                 0
| 0 | 1 | 0 |   | ... |   | 0 | 1 | 0 |

Carry bit : 1
```

The RCR instruction shifts CF flag to most significant bit. And shifts least
significant bit to carry flag!

In bitwise maths if you shift one bit to right it is an integer division by 2,
and if you shift one bit left it is a multiplication with 2.

```txt
rax = 4 = 0b100
rax = rax >> 1
rax = 2 = 0b10
```

So our riddle works for both positive and negative numbers:

```txt
rax = -4 = 0xfffffffffffffffc
rdx = -2 = 0xfffffffffffffffe
rax = rax + rdx
rax = -6 = 0xfffffffffffffffa and CF flag set after addition
rax = rax RCR 1
rax = -3 = 0xfffffffffffffffd
```

So our riddle calculates the average of sum of rax+rdx. But why use RCR. If the
aim is only getting an average SHR instruction will also do the job. In this
riddle RCR holds the

There is one exception:

```txt
rax = -6 = 0xfffffffffffffffa
rdx =  2 = 0x0000000000000002
rax = rax + rdx
rax = -4 = 0xfffffffffffffffc and CF flag IS NOT set after addition
rax = rax RCR 1
rax = 0x7ffffffffffffffe
```

So if one num is negative and the other is positive, and the result is negative
RCR does not set CF. On the other hand if the result is positive CF is set.
And the end result will not the average of sum of rax and rdx.

## Final Thoughts

Wow, this riddle is nice but not perfect, it has some conditions that does not
apply. Even so it is a nice way to integer division to 2.

BTW, `div`, `idiv` and `rcr` instructions occupies 3 bytes:

```txt
48 d1 d8                rcr    rax,1
48 f7 f2                div    rdx
48 f7 fa                idiv   rdx
```

## Resources

* [Intel - RCL/RCR/ROL/ROR — Rotate][web-felix-rotate-intel]

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_08.html
[prev]: ../0x07/README.md
[next]: ../0x09/README.md
[web-felix-rotate-intel]: https://www.felixcloutier.com/x86/rcl:rcr:rol:ror
