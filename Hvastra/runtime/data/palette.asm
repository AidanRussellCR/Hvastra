.segment "RODATA"

.export TestPalette

; SNES color format: 0bbbbbgggggrrrrr

TestPalette:
    .word $4000   ; 0: dark blue
    .word $001F   ; 1: red
    .word $03E0   ; 2: green
    .word $7FFF   ; 3: white

    .word $4210   ; 4: blue-gray
    .word $5294   ; 5: light gray
    .word $2108   ; 6: dark gray
    .word $7C00   ; 7: bright blue

    .word $0000   ; 8: black
    .word $0010   ; 9: dark red
    .word $0200   ; 10: dark green
    .word $3C00   ; 11: medium blue

    .word $7FE0   ; 12: cyan
    .word $7C1F   ; 13: magenta
    .word $03FF   ; 14: yellow
    .word $7FFF   ; 15: white
