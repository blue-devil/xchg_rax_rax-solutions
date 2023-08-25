# How to solve 0x05

| Title                     | Decription                                       |
|---------------------------|--------------------------------------------------|
| Challenge Name            | [0x05][challenge]                                |
| Date                      | 17/08/2023                                       |
| Challenge Author          | [xorpd][web-xorpd]                               |
| Abstract                  | Similarities between sub and cmp                 |
| Tools                     | gdb, vim                                         |
| Music                     | Pentagram - Beyond Insanity                      |

## Prologue

[Previous][prev] | [Next][next]

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
the sign flag the jump condition changes.

So what is special about those 2 lines, let's assume initial rax value to be `2`
and `11`. When rax equals to 2, result of this line `sub      rax,5` is
negative. So in [RFLAGS][web-intel-flags] ZF flag is 0 and SF flag is 1.
Then cmp instruction implicitly subtracts 4 from rax(without changing the rax
value). And according to the result it again sets RFLAG's. Subtraction from a
negative value again sets SF.

Generally after a `cmp` instruction a conditonal jump comes. Conditional jump
mnemonics change according to the signed-ness:

| Opcode - Short| Opcode - Near | Instruction | meaning                   | flag | signed-ness |
|---------------|---------------|-------------|---------------------------|------|-------------|
| 0x74          | 0x0F84        | jz          | jump if zero flag is set  | ZF=1 |             |
| 0x74          | 0x0F84        | je          | jump if equal             | ZF=1 |             |
| 0x75          | 0x0F85        | jnz         | jump if zero flag not set | ZF=0 |             |
| 0x75          | 0x0F85        | jne         | jump if not equal         | ZF=0 |             |
| 0x72          | 0x0F82        | jb          | jump if below             | CF=1 | unsigned    |
| 0x72          | 0x0F82        | jnae        | jump if not above or equal| CF=1 | unsigned    |
| 0x72          | 0x0F82        | jc          | jump if carry flag is set | CF=1 | unsigned    |
| 0x73          | 0x0F83        | jnb         | jump if not below         | CF=0 | unsigned    |
| 0x73          | 0x0F83        | jae         | jump if above or equal    | CF=0 | unsigned    |
| 0x73          | 0x0F83        | jnc         | jump if not carry         | CF=0 | unsigned    |
| 0x76          | 0x0F86        | jbe         | jump if below or equal    | CF=1 or ZF=1 | unsigned    |
| 0x76          | 0x0F86        | jna         | jump if not above         | CF=1 or ZF=1 | unsigned    |
| 0x77          | 0x0F87        | jnbe        | jump if not below or equal| CF=0 and ZF=0| unsigned    |
| 0x77          | 0x0F87        | ja          | jump if above             | CF=0 and ZF=0| unsigned    |
| 0x7C          | 0x0F8C        | jl          | jump if less              | SF <> OF | signed  |
| 0x7C          | 0x0F8C        | jnge        | jump if not greater or equ| SF <> OF | signed  |
| 0x7D          | 0x0F8D        | jnl         | jump if not less          | SF = OF  | signed  |
| 0x7D          | 0x0F8D        | jge         | jump if greater or equal  | SF = OF  | signed  |
| 0x7E          | 0x0F8E        | jle         | jump if less or equal     | ZF=1 or SF<>OF | signed  |
| 0x7E          | 0x0F8E        | jng         | jump if not greater       | ZF=1 or SF<>OF | signed  |
| 0x7F          | 0x0F8F        | jg          | jump if greater           | ZF=0 and SF=OF | signed  |
| 0x7F          | 0x0F8F        | jnle        | jump if not less or equal | ZF=0 and SF=OF | signed  |

Note: I did not add overflow and parity checker conditional jumps!

So, if we suppose `jbe` or `jna` comes after comparison, the meaning of those
two lines is check the rax if it ise between 5 and 9.

That is a very nice way to select a range of numbers.

## Final Thoughts

I really never thought of this kind a range declaration. If we use `ja`
instruction for this specific sample, then that means exclude that range! That
is really neat.

## Resources

* [Wiki - Intel FLAGS register][web-intel-flags]
* [Intel - Sub, subtract][web-intel-sub]
* [Intel - Cmp,  compara two operands][web-intel-cmp]
* [Intel x86 JUMP quick reference][web-intel-jcc-comparison]

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
[prev]: ../0x04/README.md
[next]: ../0x06/README.md
[challenge]: https://www.xorpd.net/pages/xchg_rax/snip_05.html
[web-intel-flags]: https://en.wikipedia.org/wiki/FLAGS_register
[web-intel-sub]: https://www.felixcloutier.com/x86/sub
[web-intel-cmp]: https://www.felixcloutier.com/x86/cmp
[web-intel-jcc-comparison]: http://unixwiz.net/techtips/x86-jumps.html
