{
_0198A4: ;a- x8
    ;rising wave
    !A8
    ldy.b #task[2].base : lda.b #_01FF00_34 : jsl _01A6FE
    lda #$11 : sta $02D5 : sta $02D7
    lda #$01 : jsr _019A88
    jsr .9987
    lda #$61 : sta $02D9
    !A16
    lda #$0272 : sta $19DE
    lda #$0272 : sta $19E2
    lda #$0124 : sta $19E0
    lda #$0124 : sta $19E4
    stz $19A5
    stz $19A9
    stz $19AD
    stz $19B1
    !A8
    jsl _01B90E
    lda #$08 : sta $02DD
    stz $74
    lda #$0C : sta $02DE
    lda #$04 : sta $031E
if !version == 2
    lda.b #1 : jsl current_task_suspend
endif
    lda #$4F : sta.w hud_flicker_timer
    !A16
    lda #$F200 : sta $6D
    lda #$FFFF : sta $6F
    lda #$0050 : sta $79
    stz $71
    stz $73
    stz $75
    !A8
    lda #$15 : sta $02D5 : sta $02D7
    ldx #$00 : lda #$02 : jsl _01F6C9
    lda #!sfx_wave_rise : jsl _018049_8053
.9934:
    lda #$01 : jsr _019A88
    jsr .9992
    jsr .9A05
    lda $73
    cmp #$FE
    bne .9934

if !version == 2
    lda #$11 : sta $02D7
.9981:
    lda #$01 : jsr _019A88
    lda $007E
    bne .9981
endif
    !A16
    stz $19DE
    stz $19E2
    stz $19E0
    stz $19E4
    !A8
    jsl _01B90E
if !version == 0 || !version == 1
    lda #$17 : sta $02D5 : sta $02D7
endif
    lda #$01 : sta $02D9
    lda #$11 : sta $02DD
    lda #$19 : sta $02DE
    ldx #$00 : lda #$04 : jsl _01F6C9
    stz $1554
    !AX8
if !version == 2
    lda #$03 : jsr _019A88
    lda #$17 : sta $02D5 : sta $02D7
endif
    lda #$01 : jsr _019A88
    pld
    jml current_task_remove

;-----

.9987:
    lda #$01 : jsr _019A88
    lda $031E
    bne .9987

    rts

;-----

.9992:
    !A16
    clc
    lda $6D : adc $79 : sta $6D
    lda $6F : adc #$0000 : sta $6F
    sec
    lda $71 : sbc $6D : sta $71
    lda $73 : sbc $6F : sta $73
    lda $72
    cmp #$0200
    bcc .99B9

    lda #$0000
.99B9:
    sta $19B1
    !A8
    lda $75
    beq .99DA

    !A16
    clc
    lda $72 : adc #$0080 : sta $77
    cmp #$0200
    bcc .99D4

    lda #$0000
.99D4:
    sta $19A9
    !A8
    rts

.99DA:
    lda $6F
    bmi .9A04

    inc $75
    lda #$03 : sta $031E
if !version == 2
    lda.b #1 : jsl current_task_suspend
endif
    lda #$17 : sta $02D5 : sta $02D7
    ldx #$54 : lda #$01 : jsl _01F6C9
    lda #$10 : jsr _019A88
    lda #$28 : sta $79
    lda #!sfx_wave_crash : jsl _018049_8053
.9A04:
    rts

;-----

.9A05:
    lda.w hit_by_water_crash
    bne .9A51

    lda $6F
    bmi .9A51

    lda.w is_on_stone_pillar
    bne .9A51

    !A16
    clc
    lda $72
    adc.w !obj_arthur.pos_y+1
    sec
    sbc #$00E8
    clc
    adc #$0040
    cmp #$0080
    !A8
    bcs .9A51

    lda $14D1
    bne .9A51

    lda.b #_01DC56    : sta.w !obj_arthur.state+1
    lda.b #_01DC56>>8 : sta.w !obj_arthur.state+2
    lda.w !obj_arthur.flags1 : ora #$80 : sta.w !obj_arthur.flags1
    lda $0276 : ora #$02 : sta $0276
    lda #$FF : sta.w !obj_arthur.hp
    inc $14D1
.9A51:
    rts
}
