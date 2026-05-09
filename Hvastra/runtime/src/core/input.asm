.p816
.a8
.i16

.include "../../inc/snes.inc"

.export Input_Update
.export input_held
.export input_pressed

.segment "BSS"

input_held:
    .res 2

input_prev:
    .res 2

input_pressed:
    .res 2

.segment "CODE"

Input_Update:
    php

    sep #$20

@wait_auto_read:
    lda HVBJOY
    and #$01
    bne @wait_auto_read

    rep #$20

    lda input_held
    sta input_prev

    lda JOY1L
    sta input_held

    eor input_prev
    and input_held
    sta input_pressed

    plp
    rts
