namespace flower_head

{
create:
    jsr _02F13E_F15F
    jsl set_hp
    ldx.w stage
    cpx #$06
    bne .EFE7

    clc
if !version == 0 || !version == 1
    lda #$0C : adc.b obj.hp : sta.b obj.hp
elseif !version == 2
    lda #$04 : adc.b obj.hp : sta.b obj.hp
endif
.EFE7:
    stz $31
    stz $32
    stz $34
    stz $35
    stz $36
    stz $0F
    ldy #$8C : ldx #$22 : jsl set_sprite
    lda #$01 : sta.b obj.direction
    stz.b obj.facing
.F001:
    brk #$00

;----- F003

    lda $32
    beq .F001

    ldy #$8E : ldx #$22 : jsl set_sprite
.F00F:
    brk #$00

;----- F011

    jsl update_animation_normal
    lda $31
    beq .F00F

    lda #$08 : sta $33
    ldy #$0C : jsl set_speed_y
    ldy #$21 : jsl set_speed_x
    inc $34
.F02B:
    jsl update_pos_y
    brk #$00

;----- F031

    lda $31 ;keep rising until $31 is 0
    bne .F02B

    inc $0F
.F037:
    jsl get_object_slot
    bmi .F0A6

    stz.b obj.direction
    lda #$01 : sta $3C
    stx $35
    !A16
    ldy $2D
    lda.w obj.pos_x+1,Y : sta $13
    sec
    lda.w obj.pos_y+1,Y : sbc #$0008 : sta $27
    !A8
    lda $08 : and #$07 : dec : sta $0008,X
    lda $09 : and #$30 : sta $0009,X
    lda #!id_flower_projectile : jsl prepare_object_8C37
    stz $34
    lda #$01 : sta $3D ;speed up rotation
.F074:
    brk #$00

;----- F076

    jsr _F0B1
    !AX16
    ldx $35
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !A8
    lda $3C
    cmp #$68
    bcc .F074

    inc $0031,X
    !X8
    lda #$FF : sta $3D ;slow down rotation
.F098:
    brk #$00

;----- F09A

    jsr _F0B1
    lda $3C
    dec
    bne .F098

    inc $34
    stz.b obj.direction
.F0A6:
    ldx #$B2 : jsl _0196EF : cop #$00

;----- F0AE

    jmp .F037

;-----

_F0B1:
    !AX8
    jsl update_animation_normal
    !A16
    lda $13 : sta.b obj.pos_x+1
    lda $27 : sta.b obj.pos_y+1
    !A8
    stz.b obj.pos_x
    stz.b obj.pos_y
    clc
    lda $3C : adc $3D : sta $3C
    inc.b obj.direction
    lda.b obj.direction : and #$1F : sta.b obj.direction
    ldx #$16
    lda $3C : jsl _0189D9 ;3C = multiplicand
    rts

;-----

thing:
    lda $34
    beq .F0EA

    jsr _02F13E
    jsl update_animation_normal
.F0EA:
    lda.b obj.gravity
    cmp.w current_cage
    bne .F0FB

    lda $0F : asl : tax
    jsr (.F133,X)
    jsr _02FD62_FD7C
.F0FB:
    lda.w frame_counter
    and #$07
    bne .F130

    jsl get_arthur_relative_side : sta.b obj.facing
    !A16
    lda.w stage
    beq .F11A

    clc
    lda.w camera_y+1
    adc #$0120
    cmp.b obj.pos_y+1
    bcc .F126

.F11A:
    sec
    lda.w camera_x+1
    sbc #$0040
    sec
    sbc.b obj.pos_x+1
    bmi .F130

.F126:
    !A8
    jsr _02F13E_F151
    lda $07 : jmp _028B36_local

.F130:
    !A8
    rts

;-----

.F133: dw _02FB9C_FBC0, .F137

;-----

.F137:
    jsr _02FC0E
    jsr _02F9FA_F9FE
    rts
}

namespace off
