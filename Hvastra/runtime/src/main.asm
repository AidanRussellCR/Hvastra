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
.import Input_Update
.import Player_Init
.import Player_Update
.import Player_Draw

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

    jsr Player_Init
    jsr Player_Draw

    jsr Interrupts_EnableNMI

    lda #$0F
    sta INIDISP

MainLoop:
    jsr WaitForVBlank
    jsr Input_Update
    jsr Player_Update
    bra MainLoop
