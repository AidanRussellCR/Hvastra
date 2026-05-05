.p816
.a8
.i16

.include "../../inc/snes.inc"

.export NMI
.export IRQ
.export Interrupts_EnableNMI
.export WaitForVBlank

.segment "BSS"

vblank_ready:
    .res 1

blue_phase:
    .res 1

.segment "CODE"

Interrupts_EnableNMI:
    stz vblank_ready

    ; Enable NMI only
    lda #$80
    sta NMITIMEN

    cli
    rts

WaitForVBlank:
    lda #$00
    sta vblank_ready

@wait:
    lda vblank_ready
    beq @wait

    rts

NMI:
    pha

    ; Acknowledge NMI
    lda RDNMI

    inc blue_phase

    stz CGADD

    ; Low byte
    lda #$00
    sta CGDATA

    ; High byte
    lda blue_phase
    lsr
    lsr
    and #$0C
    clc
    adc #$40        ; dark/medium blue base
    sta CGDATA

    lda #$01
    sta vblank_ready

    pla
    rti

IRQ:
    rti
