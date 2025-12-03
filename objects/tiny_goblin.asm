namespace tiny_goblin

{
create:
    ldx #$03 : jsl _018D5B
    lda #$DC : sta $31
    jsl pot_creation
    jsl set_hp
    jsl get_arthur_relative_side : sta.b obj.facing
    !A16
    stz $2D
    lda.w _00ED00+$5C : sta $27
    lda.w #tiny_goblin_data_D215 : sta $13
    !A8
    lda #$FF : sta $26
    lda #$20 : jsl _0187E5
    jsl _02F9DA
    ldy #$FC : ldx #$21 : jsl set_sprite
    jsl _018E32_8E73
    lda #$10 : cop #$00

;----- BCCB

    ldy #$F2 : ldx #$21 : jsl set_sprite
    stz $2F
    lda #$20 : sta $30
.BCD9:
    brk #$00

;----- BCDB

    jsl update_pos_xyg_add
    dec $30
    bne .BCD9

    lda #$02 : sta $2D : sta $2E
.BCE9:
    brk #$00

;----- BCEB

    jsl update_pos_xyg_add
    jsr .BD94
    bcs .BCE9

    jsl _01A559
    beq .BCE9

    lda #$04 : sta $2D
    ldy #$05 : jsl set_speed_xyg
.BD04:
    brk #$00

;----- BD06

    jsl update_pos_xyg_add
    lda $1B
    bmi .BD04

    lda #$06 : sta $2D
.BD12:
    brk #$00

;----- BD14

    jsl update_pos_xyg_add
    jsr .BD94
    bcs .BD12

    jsl _01A559
    beq .BD12

    lda #$08 : sta $2D
    jsl get_arthur_relative_side : sta.b obj.direction : sta.b obj.facing
    ldy #$F6 : ldx #$21 : jsl set_sprite
    stz $2F
    ldy #$57 : jsl set_speed_x
    lda #$DE : sta $31
.BD43:
    brk #$00

;----- BD45

    jsl update_pos_x
    !A16
    lda.b obj.pos_x+1
    sec
    sbc #$0010
    sbc.w camera_x+1
    cmp #$00E0
    !A8
    bcs .BD6B

    jsl _01A593
    bne .BD43

    lda.b obj.direction : eor #$01 : sta.b obj.direction
    jsl update_pos_x
.BD6B:
    lda #$0A : sta $2D
    lda #$DC : sta $31
    ldy #$05 : jsl set_speed_xyg
    ldy #$F2 : ldx #$21 : jsl set_sprite
    stz $2F
    lda #$40 : sta $30
.BD87:
    brk #$00

;----- BD89

    jsl update_pos_xyg_add
    dec $30
    bne .BD87

    jmp .BCE9

.BD94:
    !A16
    lda.b obj.pos_x+1
    sec
    sbc #$0020
    sbc.w camera_x+1
    cmp #$00C0
    !A8
    rts

;-----

destroy:
    lda.b obj.hp
    bne .BDB1

    jsl drop_pot
    jml _028BEC

.BDB1:
    inc $2F
    jsl _02F9DA_F9E0
    ldy #$F4 : ldx #$21 : jsl set_sprite
    lda $2D
    cmp #$08
    bne .BDD7

    stz $2F
.BDC7:
    brk #$00

;----- BDC9

    lda $24
    cmp #$70
    bne .BDC7

    ldy #$F6 : ldx #$21 : jsl set_sprite
.BDD7:
    ldx $2D
    jmp (+,X) : +: dw create_BCD9, create_BCE9, create_BD04, create_BD12, create_BD43, create_BD87

;-----

thing:
    lda $2E
    beq .BDF0

    bit $09
    bvc .BE1E

.BDF0:
    ldy $31
    jsl pot_spawn_offset
    jsl update_animation_normal
    lda $2F
    beq .BE0E

    lda $24
    cmp #$70
    bne .BE0E

    stz $2F
    ldy #$F2 : ldx #$21 : jsl set_sprite
.BE0E:
    jsl _018E32_8E73
    jsl _02F9BA
    jsl _02F9B6
    jml _02F9B2

.BE1E:
    jsl _028D09
    jml _0281DD
}

namespace off
