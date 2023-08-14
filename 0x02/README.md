# How to solve 0x00

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x02][challenge]                                |
| Date                      | 14/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Check if reg has any value in it                 |
| Tools                     | gdb, vim                                         |
| Music                     | Pentagram - Sur                                  |

## Prologue

Riddle 0x02 also a tricky one:

```nasm
neg      rax
sbb      rax,rax
neg      rax
```

## Tutorial

Intel instruction [neg][web-intel-neg] means **Two's Complement Negation**.
It is simple, invert all bits then one! Let's remember it:

```txt
    a  = 00001111b
inv(a) = 11110000b
a + 1  = 11110001b
```

Important note for this specific sniplet, neg instruction affects
`CF - Carry Flag`. CF is set to 0 if source operand is 0 otherwise 1.

[sbb][web-intel-sbb] means Integer Subtraction With Borrow. So it adds the carry
flag value to source operand then subtracts the result from destination operand.
The end result will be written in destination operand.

So if we do the math when `rax = 0` end result will be `rax = 0`. On the other
hand if `rax = (any number except 0)` the end result will be `rax = 1`.

```txt
rax = 0
neg rax         ; rax = 0 ; CF = 0
sbb rax, rax    ; rax = rax - (rax + CF); rax = 0
neg rax         ; rax = 0

rax = 9
neg rax         ; rax = 0xfffffffffffffff7 ; CF = 1
sbb rax, rax    ; rax = 0xffffffffffffffff
neg rax         ; rax = 1
```

This sniplet checks if rax is 0 or not. If rax=0 then it sets rax=0. If rax
has any value it sets rax=1.

Note: It doesn't matter if the register is negative!

## Final Thoughts

This is a beautiful way to check if a register contains any bits. And it is way
better than looping and shifting & checking bits!

## Resources

* [NEG — Two's Complement Negation][web-intel-neg]
* [SBB — Integer Subtraction With Borrow][web-intel-sbb]

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_02.html
[web-intel-neg]: https://www.felixcloutier.com/x86/neg
[web-intel-sbb]: https://www.felixcloutier.com/x86/sbb
