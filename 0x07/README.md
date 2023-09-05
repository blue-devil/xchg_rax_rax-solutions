# How to solve 0x07

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x00][challenge]                                |
| Date                      | 05/09/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Check if the register is signed                  |
| Tools                     | gdb, vim                                         |
| Music                     | Hermetica - Memoria De Siglos                    |

## Prologue

[Previous][prev] | [Next][next]

Riddle 0x07 is:

```nasm
inc      rax
neg      rax
inc      rax
neg      rax
```

## Tutorial

So if our initial rax value is 5, at the end of these 4 intructions ve will
get rax = 5 again. `inc rax, neg rax` g'ves the result like `not rax`. So what
is the point:

I want to set `SF - Sign Flag` if `rax` is negative. We have learnt from 6th
riddle that NEG instruction not only negates the number but also sets the
RFLAGS. Remember NOT instruction does not set RFLAGS like the NEG does.

## Final Thoughts

So basically this 4 instructions sets `SF - Sign Flag` if rax is negative.
So you can use your conditional jumps.

## Resources

* [NOT — One's Complement Negation][web-intel-not]
* [NEG — Two's Complement Negation][web-intel-neg]

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_07.html
[prev]: ../0x06/README.md
[next]: ../0x07/README.md
[web-intel-not]: https://www.felixcloutier.com/x86/not
[web-intel-neg]: https://www.felixcloutier.com/x86/neg
