;Initialize registers AX,BX,CX and SP with their respective values

MOV AX,1234h
MOV BX, 5678h
MOV CX, 9ABCh

MOV SP, 100h; Push the contents of AX and BX onto the stack

PUSH AX

PUSH BX

XCHG AX,CX;Exchange the contents of AX and CX

POP CX; Pop the top of the stack into CX

PUSH AX; Push the contents of AX onto the stack

POP BX ; Pop the top of the stack into BX
