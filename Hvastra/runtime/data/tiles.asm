.segment "RODATA"

.export TestTiles

TestTiles:
; Tile 0: blank
.repeat 32
    .byte $00
.endrepeat

; Tile 1
.repeat 8
    .byte $FF, $00
.endrepeat
.repeat 16
    .byte $00
.endrepeat

; Tile 2
.repeat 8
    .byte $00, $FF
.endrepeat
.repeat 16
    .byte $00
.endrepeat

; Tile 3
.repeat 8
    .byte $AA, $55
.endrepeat
.repeat 16
    .byte $00
.endrepeat
