// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
// i = 0
@i
M = 0

@KBD
D = M
// if (M[KBD] > 0) goto KEYDOWN
@KEYDOWN
D;JGT

// if (M[KBD] == 0) goto KEYUP
@KEYUP
D;JEQ

(KEYDOWN)
// D = SCREEN + i
@SCREEN
D = A
@i
D = D + M
M = M + 1
A = D
M = -1
// if (M[KBD] > 0) goto KEYDOWN
@KBD
D = M
@KEYDOWN
D;JGT

// goto START
@START
0;JMP

(KEYUP)
// D = SCREEN + i
@SCREEN
D = A
@i
D = D + M
M = M + 1
A = D
M = 0
// if (M[KBD] == 0) goto KEYUP
@KBD
D = M
@KEYUP
D;JEQ

// goto START
@START
0;JMP
