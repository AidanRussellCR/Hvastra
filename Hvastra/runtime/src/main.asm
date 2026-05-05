.p816
.a8
.i16

.include "../inc/snes.inc"

.import PPU_Init
.import PPU_LoadPalette
.import PPU_LoadTiles
.import PPU_LoadTilemap
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

    jsr PPU_Init
    jsr PPU_LoadPalette
    jsr PPU_LoadTiles
    jsr PPU_LoadTilemap

    jsr Interrupts_EnableNMI

    lda #$0F
    sta INIDISP

MainLoop:
    jsr WaitForVBlank
    bra MainLoop
