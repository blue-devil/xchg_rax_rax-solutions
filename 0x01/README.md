# How to solve 0x01

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x01][challenge]                                |
| Date                      | 11/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Calculation of fibonacci sequence                |
| Tools                     | gdb, vim                                         |
| Music                     | Pentagram - Maymunlar Gezegeni                   |

## Prologue

Riddle 0x01 is a small one:

```nasm
.loop:
    xadd     rax,rdx
    loop     .loop
```

## Tutorial

`xadd` means `exchange and add`. It takes 2 operands. First, it exchanges
operands then then it executes the addition.

Interestingly we can use this instruction with a loop to calculate
[Fibonacci][web-wiki-fibo-seq] numbers. In maths fibonacci numbers are the ones
which each of them are the sum of the two preceding ones. If the initial
numbers are `0` and `1`,  this is the base Fibonacci Sequence:

```txt
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144
```

If we set `rax = 0` and `rdx = 1` then if we set `rcx = 4` at the end of the
loop we will find 4th fibonacci number : `3`

## Final Thoughts

I have written assembly codes to calculate fibonacci numbers but never used
this one!

## Resources

* [XADD - eXchange and Add][web-intel-xadd]
* [Fibonacci sequence][web-wiki-fibo-seq]

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_01.html
[web-intel-xadd]: https://www.felixcloutier.com/x86/xadd
[web-wiki-fibo-seq]: https://en.wikipedia.org/wiki/Fibonacci_sequence
