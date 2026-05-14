.p816
.a8
.i16

.import TestCollision

.export Collision_IsWalkable
.export collision_x
.export collision_y

.segment "BSS"

collision_x:
    .res 1

collision_y:
    .res 1

collision_index:
    .res 2

collision_temp:
    .res 2

.segment "CODE"

Collision_IsWalkable:
    ; collision_index = collision_y
    sep #$20
    .a8
    lda collision_y
    sta collision_index
    stz collision_index + 1

    ; collision_temp = collision_x
    lda collision_x
    sta collision_temp
    stz collision_temp + 1

    ; collision_index = y * 32 + x
    rep #$20
    .a16
    lda collision_index
    asl
    asl
    asl
    asl
    asl
    clc
    adc collision_temp
    tax

    ; Load collision byte
    sep #$20
    .a8
    lda TestCollision, x

    beq @walkable

@blocked:
    lda #$00
    rts

@walkable:
    lda #$01
    rts
