.p816
.a8
.i16

.include "../inc/snes.inc"

.import PPU_InitBlueScreen
.import Interrupts_EnableNMI
.import WaitForVBlank

.export Reset

.segment "CODE"

Reset:
    sei

    clc
    xce

    rep #$10        ; 16-bit X/Y
    sep #$20        ; 8-bit A

    jsr PPU_InitBlueScreen
    jsr Interrupts_EnableNMI

MainLoop:
    jsr WaitForVBlank
    bra MainLoop
