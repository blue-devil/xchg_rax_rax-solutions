# How to solve 0x05

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x00][challenge]                                |
| Date                      | 17/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  |                                 |
| Tools                     | gdb, vim                                         |
| Music                     | Pentagram - Beyond Insanity                      |

## Prologue

Look at these 2 lines.

```nasm
sub      rax,5
cmp      rax,4
```

First line subtracts 5 from `rax`. Bu we do not know the initial value of `rax`.
That means we will make up the initial `rax` value.

## Tutorial

Before subtraction we should remember this: `cmp` instruction subtracts the
source operand from destination, implicitly. According to the result
(e.g. negative, 0 or positive) some [RFLAGS][web-intel-flags] will set or unset.

Moreover, a conditional `jmp` (jcc) follows a `cmp` instruction. According to
the sign flag the jump condition changes

## Final Thoughts

After tutorial maybe the author wants to add some final thoughts.

## Resources

* [Wiki - Intel FLAGS register][web-intel-flags]

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_05.html
[web-intel-flags]: https://en.wikipedia.org/wiki/FLAGS_register
