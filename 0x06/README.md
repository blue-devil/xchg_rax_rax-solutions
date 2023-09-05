# How to solve 0x06

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x06][challenge]                                |
| Date                      | 25/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Checking if the register is zero or signed       |
| Tools                     | gdb, vim                                         |
| Music                     | Pentagram - Maymunlar Cehennemi                  |

## Prologue

[Previous][prev] | [Next][next]

```nasm
not      rax
inc      rax
neg      rax
```

I am pretty sure I have seen this or the C version of this riddle.

## Tutorial

Ok, [NOT][web-intel-not] 's easy:

```txt
    a  = 10101010b
not(a) = 01010101b
```

NOT means one's complement. When you take a number's one complement then you
reverse the bits.

[NEG][web-intel-neg] seems tricky but it is not. It is short hand of `negate`
and means two's complement:

```txt
    a  =  00000000b
not(a) =  11111111b
    a  = a + 1
    a  = 100000000b
```

When you negate a number you first reverse the bits then add 1. This way you
make a number nagative. In the context of computing.

So what does do the code sniplet above. The first two lines actually does the
same thing with `neg` instruction. Last instruction negates the register again.
If you negate a number twice you will get the very first number.

The trick is **NEG** instruction set RFLAGS. If register is a signed value or
zero value, neg will set the related bits!

## Final Thoughts

This is a very nice way to understand if a number is signed or not; or zero!

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_06.html
[prev]: ../0x05/README.md
[next]: ../0x07/README.md
[web-intel-not]: https://www.felixcloutier.com/x86/not
[web-intel-neg]: https://www.felixcloutier.com/x86/neg
