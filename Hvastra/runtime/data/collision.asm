.segment "RODATA"

.export TestCollision

; 32x32 collision map
; 0 = walkable
; 1 = blocked

TestCollision:
; top wall
.repeat 32
    .byte $01
.endrepeat

; middle rows
.repeat 30
    .byte $01
    .repeat 30
        .byte $00
    .endrepeat
    .byte $01
.endrepeat

; bottom wall
.repeat 32
    .byte $01
.endrepeat
