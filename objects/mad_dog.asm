namespace mad_dog

{
create:
    ldx #$00 : jsl _018D5B
    jsl set_hp
    stz $15
    stz $2D
    inc $08
    lda #$10 : sta $09
    lda #$20 : sta $10
    !A16
    lda.w _00ED00+$06 : sta $27
    lda #mad_dog_data_D5C3 : sta $13
    !A8
    lda #$FF : sta $26
.DB89:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl _02F9DA_F9E0
.DB95:
    brk #$00

;----- DB97

    bit $09
    bvc .DB95

    lda $07 : asl : tax
    jmp (+,X) : +: dw .DBA8, .DC85, .DC7C

.DBA8:
    jsl get_arthur_relative_side : sta.b obj.direction : sta.b obj.facing
.DBB0:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl get_rng_16
    lda.w mad_dog_data_D57B,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w mad_dog_data_D58B,X
    !A16
    and #$00FF
    asl
    sta $37
    !A8
.DBD0:
    brk #$00

;----- DBD2

    jsl get_arthur_relative_side
    cmp.b obj.facing
    beq .DBF6

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$2C : sta $37
.DBE6:
    brk #$00

;----- DBE8

    dec $37
    bne .DBE6

    lda.b obj.facing : eor #$01 : sta.b obj.direction : sta.b obj.facing
    bra .DBB0

.DBF6:
    ldy #$14 : jsl _0192AD
    bcc .DC1A

    !A16
    dec $37
    !A8
    bne .DBD0

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$77 : sta $37
.DC12:
    brk #$00

;----- DC14

    dec $37
    bne .DC12

    bra .DBB0

.DC1A:
    jsl get_rng_16
    lda.w mad_dog_data_D58F,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w mad_dog_data_D59F,X
    cop #$00

;----- DC2A

.DC2A:
    ldy #$20 : ldx #$22 : jsl set_sprite
    ldy #$0E : sty $2D
    jsl call_rng : and #$0F : cmp #$08
    bcc .DC41

    iny
.DC41:
    jsl set_speed_xyg
.DC45:
    brk #$00

;----- DC47

    jsl update_pos_xyg_add
    lda.b obj.speed_y+2
    bmi .DC45

.DC4F:
    brk #$00

;----- DC51

    jsl update_pos_xyg_add
    bit $09
    bvc .DC4F

    jsl _01A559
    beq .DC4F

    stz $2D
    ldy #$24 : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- DC6D

    ldy #$1C : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- DC79

    jmp .DBB0

.DC7C:
    jsl get_rng_16
    lda.w mad_dog_data_D5B3,X : sta $2E
.DC85:
    jsl get_arthur_relative_side : sta.b obj.direction : sta.b obj.facing
.DC8D:
    brk #$00

;----- DC8F

    ldy #$30 : jsl _0192AD
    bcs .DC8D

    jsl get_rng_16
    lda.w mad_dog_data_D5A3,X : cop #$00

;----- DCA0

.DCA0:
    ldy #$26 : ldx #$22 : jsl set_sprite
    ldy #$63 : sty $2D
    jsl set_speed_x
.DCB0:
    brk #$00

;----- DCB2

    jsl _028074_807D
    jsl update_pos_x
    lda $07
    cmp #$02
    bne .DCCB

    ldy $2E : jsl arthur_range_check
    bcc .DCCB

    jmp .DC2A

.DCCB:
    jsl _01A593
    bne .DCB0

    ldy #$20 : ldx #$22 : jsl set_sprite
    ldy #$0F : jsl set_speed_xyg
.DCDF:
    brk #$00

;----- DCE1

    jsl update_pos_xyg_add
    lda.b obj.speed_y+2
    bmi .DCDF

.DCE9:
    brk #$00

;----- DCEB

    jsl update_pos_xyg_add
    jsl _01A559
    beq .DCE9

    stz $2D
    bra .DCA0

;-----

thing:
    jsl update_animation_normal
    ldx #$02 : jsl _018E32
    lda $2D
    bne .DD15

    jsl _02F9B6
    jsl _02F9BA
    jsl _02F9B2
    bra .DD19

.DD15:
    jsl _0296FE
.DD19:
    jml _028074_80A3

;-----

destroy:
    lda.b obj.hp
    bne .DD25

    jml _028BEC

.DD25:
    jsl _02F9DA_F9E0
    ldy #$22 : ldx #$22 : jsl set_sprite
.DD31:
    brk #$00

;----- DD33

    lda $24
    cmp #$70
    bne .DD31

    jmp create_DB89
}

namespace off
