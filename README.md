# xchg rax, rax Solutions

If there are riddles I am in! [xorpd][web-xorpd] had a great job and make a
collection of small assembly sniplets of which he encountered while reverse
engineering. I had own a hard copy! The book only contains x86_64 assembly
sniplets and no additional informations. On the amazon page of the boox xorpd
states this:

```txt
 ; 0x40 assembly riddles

"xchg rax,rax" is a collection of assembly gems and riddles I found over many
years of reversing and writing assembly code. The book contains 0x40 short
assembly snippets, each built to teach you one concept about assembly, math or
life in general.

Be warned - This book is not for beginners. It doesn't contain anything besides
assembly code, and therefore some x86_64 assembly knowledge is required.

How to use this book? Get an assembler (Yasm or Nasm is recommended), and
obtain the x86_64 instruction set. Then for every snippet, try to understand
what it does. Try to run it with different inputs if you don't understand it in
the beginning. Look up for instructions you don't fully know in the Instruction
sets PDF. Start from the beginning. The order has meaning.

As a final note, the full contents of the book could be viewed for free on my
website (Just google "xchg rax,rax").
```

From the Author

```txt
90
66 90
0F 1F 00
0F 1F 40 00
0F 1F 44 00 00
66 0F 1F 44 00 00
0F 1F 80 00 00 00 00
0F 1F 84 00 00 00 00 00
66 0F 1F 84 00 00 00 00 00
```

## Resources

* [xorpd Website][web-xorpd]
* [xorpd Github][web-gh-xorpd]
* [xchg rax, rax][web-book-online]

[web-xorpd]: https://www.xorpd.net/
[web-gh-xorpd]: https://github.com/xorpd
[web-book-online]: https://www.xorpd.net/pages/xchg_rax/snip_00.html
