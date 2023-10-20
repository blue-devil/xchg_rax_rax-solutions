# How to solve 0x09

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x09][challenge]                                |
| Date                      | 07/09/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Zeroing registers                                |
| Tools                     | gdb, vim                                         |
| Music                     | Sentenced - My Slowing Heart                     |

## Prologue

[Previous][prev] | [Next][next]

Riddle 0x09 is:

```nasm
shr      rax,3
adc      rax,0
```

## Tutorial

`SHR` means `Shift Right`. So `shr rax, 3` means shift all bits to right 3 times
-implicitly add 0 bits to most significant bit-. That is division by 8. Then
`ADC - Add with carry` instruction adds `Carry bit` if any. But where is CF
coming from: 3rd bit from rax!

```txt
4 = 0b0100
5 = 0b0101
8 = 0b1000
13= 0b1101
```

So some number's 3rd bit is set. And when shifting to right that bit sets CF,
then with ADC Carry bit is added to end result.

Think you are diving 13 to 8: `13 / 8 = 1.625`. End result is floating point!
So the small sniplet rounds the result to the nearest integer.

## Final Thoughts

Those number's 3rd bit is set: `12,13,14,15` and if you divide them with 8
the floating point end result is higher then 1,5! So in this case if you need a
integer you round them upward! And this is what this sniplet does ;)

## Resources

* [SAL/SAR/SHL/SHR — Shift][web-intel-shift]
* [ADC — Add With Carry][web-intel-adc]

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
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_00.html
[prev]: ../0x0x/README.md
[next]: ../0x0y/README.md
[web-intel-shift]: https://www.felixcloutier.com/x86/sal:sar:shl:shr
[web-intel-adc]: https://www.felixcloutier.com/x86/adc
