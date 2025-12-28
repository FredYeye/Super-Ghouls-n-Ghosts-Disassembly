namespace scythe

{
upgraded_create:
    ldy #$98
    ldx #$20
    bra create_E661

create:
    ldy #$94 : ldx #$20
.E661:
    jsl set_sprite
    lda #$23 : jsl _018049_8053
    stz $3C
    lda $09 : ora #$C1 : sta $09
    ldy #$0B : jsl set_speed_xyg
    !A16
    lda.w #_00BBF6-2 : sta $13
    !A8
    lda.w !obj_arthur.flags2
    lsr
    bcs .E6A6

.E688:
    brk #$00

;----- E68A

    jsl update_pos_xy
    jsl _01A559
    beq .E688

.E694:
    ldy #$0B : jsl set_speed_xyg
.E69A:
    brk #$00

;----- E69C

    jsl update_pos_xy
    jsl _01A593
    bne .E69A

.E6A6:
    ldy #$0B : jsl set_speed_xyg
.E6AC:
    brk #$00

;----- E6AE

    jsl update_pos_xyg_add
    jsl _01A559
    beq .E6AC

    bra .E694

;-----

thing:
    jsr _01E285
    jml update_animation_normal

;-----

destroy:
    lda #$01
    bra upgraded_destroy_E6C7

upgraded_destroy:
    lda #$03
.E6C7:
    sta $38
    lda $0F
    cmp #$02
    bne .E6D2

    jmp _01E224_E240
.E6D2:
    lda #$38 : jsl _018049_8053
.E6D8:
    lda #$08 : sta $37
    ldy #$96 : ldx #$20 : jsl set_sprite
.E6E4:
    jsl update_animation_normal
    brk #$00

;----- E6EA

    dec $37
    bne .E6E4

    lda.b obj.facing : eor #$01 : sta.b obj.facing
    dec $38
    bne .E6D8

    inc $3C
    jmp _01E224_E229
}

namespace off
