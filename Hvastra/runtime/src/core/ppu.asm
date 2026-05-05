.p816
.a8
.i16

.include "../../inc/snes.inc"

.export PPU_InitBlueScreen

.segment "CODE"

PPU_InitBlueScreen:
    lda #$8F        ; force blank with full brightness
    sta INIDISP

    ; Set backdrop color in CGRAM color 0
    ; Note: SNES color format is 0bbbbbgggggrrrrr
    stz CGADD       ; CGRAM address 0

    ; Right now just setting backdrop color to a nice blue
    lda #$00        ; low byte
    sta CGDATA
    lda #$40        ; high byte
    sta CGDATA

    lda #$0F        ; screen on with full brightness
    sta INIDISP

    rts
