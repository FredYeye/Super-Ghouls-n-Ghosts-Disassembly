namespace pot

{
create:
    brk #$00

;----- F2F4

    lda $39 ;attached_to_parent
    beq create

    lda #$02 : sta $08
    ldy #$36 : ldx #$20 : jsl set_sprite ;pot sprite
.F304:
    brk #$00

;----- F306

    lda $3A ;pot_dropped
    beq .F304

    lda.w stage
    cmp #$04 ;stage 4, raft section
    beq .F339

    cmp #$01 ;stage 2
    bne .F31A

    lda.w checkpoint ;raft section
    bne .F339

.F31A:
    lda.b #pot_data_CEBC    : sta $13
    lda.b #pot_data_CEBC>>8 : sta $14
    stz $15
    ldy #$11 : jsl set_speed_xyg
.F32A:
    brk #$00

;----- F32C

    jsr _028074
    jsl update_pos_xyg_add
    jsl _01A559
    beq .F32A

.F339: ;open pot
    lda #$0F : sta $2D
    ldy #$5C : ldx #$20 : jsl set_sprite
.F345:
    brk #$00

;----- F347

    jsl update_animation_normal
    dec $2D
    bne .F345

    lda #$04 : sta $1D
    lda #!id_weapon
    ldx $07
    bmi .F35D ;branch if weapon

    lda #!id_point_statue
    bra .F35F

.F35D:
    dec $07
.F35F:
    ldx $07
    phx
    jsr _0280E9
    sta.b obj.type
    plx
    stx $07
    lda #$0C : sta.b obj.active
    jmp _02821B_827A
}

namespace off
