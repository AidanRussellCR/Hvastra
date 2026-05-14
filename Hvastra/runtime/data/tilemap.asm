.segment "RODATA"

.export TestTilemap

TestTilemap:
; top wall
.repeat 32
    .word $0002
.endrepeat

; middle rows
.repeat 30
    .word $0002
    .repeat 30
        .word $0000
    .endrepeat
    .word $0002
.endrepeat

; bottom wall
.repeat 32
    .word $0002
.endrepeat
