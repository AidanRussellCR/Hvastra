.p816
.a8
.i16

.include "../../inc/snes.inc"

.import input_held
.import Collision_IsWalkable
.import collision_x
.import collision_y

.export Player_Init
.export Player_Update
.export Player_Draw

.segment "BSS"

player_x:
    .res 1

player_y:
    .res 1

old_player_x:
    .res 1

old_player_y:
    .res 1

draw_x:
    .res 1

draw_y:
    .res 1

draw_tile:
    .res 1

vram_addr:
    .res 2

temp_word:
    .res 2

.segment "CODE"

Player_Init:
    lda #$10
    sta player_x
    sta old_player_x

    lda #$0E
    sta player_y
    sta old_player_y

    rts

Player_Update:
    lda player_x
    sta old_player_x

    lda player_y
    sta old_player_y

    ; Direction bits are in high byte:
    ; bit 3 = Up
    ; bit 2 = Down
    ; bit 1 = Left
    ; bit 0 = Right

    lda input_held + 1
    and #%00001000
    beq @check_down

    lda player_y
    beq @check_down

    lda player_x
    sta collision_x

    lda player_y
    dec
    sta collision_y

    jsr Collision_IsWalkable
    beq @check_down

    dec player_y

@check_down:
    lda input_held + 1
    and #%00000100
    beq @check_left

    lda player_y
    cmp #$1F
    beq @check_left

    lda player_x
    sta collision_x

    lda player_y
    inc
    sta collision_y

    jsr Collision_IsWalkable
    beq @check_left

    inc player_y

@check_left:
    lda input_held + 1
    and #%00000010
    beq @check_right

    lda player_x
    beq @check_right

    lda player_x
    dec
    sta collision_x

    lda player_y
    sta collision_y

    jsr Collision_IsWalkable
    beq @check_right

    dec player_x

@check_right:
    lda input_held + 1
    and #%00000001
    beq @done_movement

    lda player_x
    cmp #$1F
    beq @done_movement

    lda player_x
    inc
    sta collision_x

    lda player_y
    sta collision_y

    jsr Collision_IsWalkable
    beq @done_movement

    inc player_x

@done_movement:
    lda player_x
    cmp old_player_x
    bne @redraw

    lda player_y
    cmp old_player_y
    bne @redraw

    rts

@redraw:
    jsr Player_Draw
    rts

Player_Draw:
    ; clear old position
    lda old_player_x
    sta draw_x

    lda old_player_y
    sta draw_y

    lda #$00
    sta draw_tile

    jsr Player_PlotTile

    ; draw new position
    lda player_x
    sta draw_x

    lda player_y
    sta draw_y

    lda #$04
    sta draw_tile

    jsr Player_PlotTile

    rts

Player_PlotTile:
    php

    ; temp_word = draw_y
    sep #$20
    .a8
    lda draw_y
    sta temp_word
    stz temp_word + 1

    ; vram_addr = $0400 + y * 32
    rep #$20
    .a16
    lda temp_word
    asl
    asl
    asl
    asl
    asl
    clc
    adc #$0400
    sta vram_addr

    ; temp_word = draw_x
    sep #$20
    .a8
    lda draw_x
    sta temp_word
    stz temp_word + 1

    ; vram_addr += x
    rep #$20
    .a16
    lda vram_addr
    clc
    adc temp_word
    sta vram_addr

    ; Write tile to VRAM
    sep #$20
    .a8

    lda vram_addr
    sta VMADDL

    lda vram_addr + 1
    sta VMADDH

    lda draw_tile
    sta VMDATAL

    lda #$00
    sta VMDATAH

    plp
    rts
