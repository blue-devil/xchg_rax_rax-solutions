# How to solve 0x03

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x03][challenge]                                |
| Date                      | 15/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Find the minimum                                 |
| Tools                     | gdb, vim                                         |
| Music                     | Pentagram - Sur                                  |

## Prologue

Let's see riddle number 0x03

```nasm
sub      rdx,rax
sbb      rcx,rcx
and      rcx,rdx
add      rax,rcx
```

## Tutorial

This sniplet finds the minimum from the given two registers: rax and rdx.

Let's say `rax = 2` and `rdx = 5`

```nasm
sub      rdx,rax    ; rdx = 3, CF = 0
sbb      rcx,rcx    ; rcx = 0, because CF = 0
and      rcx,rdx    ; rcx = 0, cuz any number and-ing 0 results 0
add      rax,rcx    ; rax = 2; rax has the min number
```

Now let's do the reverse, `rax = 5` and `rdx = 2`

```nasm
sub      rdx,rax    ; rdx = 0xfffffffffffffffd = -3, CF = 1
sbb      rcx,rcx    ; rcx = 0xffffffffffffffff, CF = 1
and      rcx,rdx    ; rcx = 0xfffffffffffffffd = -3
add      rax,rcx    ; rax = 2; rax has the min number
```

## Final Thoughts

OK, best thing in this trick is that there is no comparison and no jumps
while figuring out which register is the minimum one

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_03.html
