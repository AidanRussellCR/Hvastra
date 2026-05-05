.p816
.a8
.i16

.include "../../inc/snes.inc"

.import TestPalette
.import TestTiles
.import TestTilemap

.export PPU_Init
.export PPU_LoadPalette
.export PPU_LoadTiles
.export PPU_LoadTilemap

.segment "CODE"

PPU_Init:
    lda #$8F        ; force blank with full brightness
    sta INIDISP

    ; VRAM increment after writing high byte
    lda #$80
    sta VMAIN

    ; BG Mode 1 (4 backgrounds)
    lda #$01
    sta BGMODE

    ; BG1 tilemap at VRAM $0400
    lda #$04
    sta BG1SC

    ; BG1 tiles at VRAM $0000
    lda #$00
    sta BG12NBA

    ; Enable BG1 on main screen
    lda #$01
    sta TM

    rts

PPU_LoadPalette:
    stz CGADD

    ldx #$0000
@loop:
    lda TestPalette, x
    sta CGDATA
    inx
    inx
    cpx #8
    bne @loop

    rts

PPU_LoadTiles:
    stz VMADDL
    stz VMADDH

    ldx #$0000
@loop:
    lda TestTiles, x
    sta VMDATAL
    inx
    lda TestTiles, x
    sta VMDATAH
    inx

    cpx #(32*4)
    bne @loop

    rts

PPU_LoadTilemap:
    lda #$00
    sta VMADDL
    lda #$04
    sta VMADDH

    ldx #$0000
@loop:
    lda TestTilemap, x
    sta VMDATAL
    inx
    lda TestTilemap, x
    sta VMDATAH
    inx

    cpx #(32*32*2)
    bne @loop

    rts
