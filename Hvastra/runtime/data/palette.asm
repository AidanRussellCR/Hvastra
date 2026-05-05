.segment "RODATA"

.export TestPalette

; SNES color format: 0bbbbbgggggrrrrr

TestPalette:
    .word $001F   ; red
    .word $03E0   ; green
    .word $7C00   ; blue
    .word $7FFF   ; white
