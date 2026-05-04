.p816
.a8
.i16

.include "../inc/snes.inc"

.export Reset
.export NMI
.export IRQ

.segment "CODE"

Reset:
    sei

    clc
    xce

    rep #$10        ; 16-bit X/Y
    sep #$20        ; 8-bit A

    lda #$8F        ; force blank with full brightness
    sta INIDISP

    stz NMITIMEN    ; disable NMI/IRQ for now

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

Forever:
    wai
    bra Forever

NMI:
    rti

IRQ:
    rti
