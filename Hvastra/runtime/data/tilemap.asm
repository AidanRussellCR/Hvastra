.segment "RODATA"

.export TestTilemap

TestTilemap:
.repeat 32*32, I
    .word (I & 3)
.endrepeat
