# How to solve 0x04

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x04][challenge]                                |
| Date                      | 15/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Uppercase or lowercase a letter                  |
| Tools                     | gdb, vim                                         |
| Music                     | Kramp - Istanbul Sokaklari                       |

## Prologue

[Previous][prev] | [Next][next]

This one is pretty obvious for me! First look at the sniplet below:

```nasm
xor      al,0x20
```

If our al register has a value of an ASCII character, then this sniplet
makes it lowercase or uppercase.

## Tutorial

Look at some of the ASCII characters hex codes:

```txt
| 0x41 = `A` | 0x61 = `a` |
| 0x42 = `B` | 0x62 = `b` |
| 0x43 = `C` | 0x63 = `c` |
| 0x44 = `D` | 0x64 = `d` |
```

ASCII table was arrenged in a way that upper and lower case letters has one
difference: **6th bit**. Rest of the bits are the same.

```txt
s = 01110011 = 0x73
S = 01010011 = 0x53
```

Now let's look athe binary representation of `0x20`

```txt
0x20 = 00100000
```

So when we xor `al` with `0x20` we flip the 6th bit! Thus we can uppercase
or lowercase out letter with only a sigle instruction.

## Final Thoughts

This is also a beautiful way to uppercase or lowercase a single letter. You do
not need to check the case-ness state of letter. Very simple!

## Resources

* [ASCII Table][web-ascii-table]

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
[prev]: ../0x03/README.md
[next]: ../0x05/README.md
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_04.html
[web-ascii-table]: https://www.ascii-code.com/
