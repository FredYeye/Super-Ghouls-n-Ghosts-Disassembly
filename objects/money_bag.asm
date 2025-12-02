namespace money_bag

{
create:
    lda $07
    cmp #$06
    bcs .CB71

    ldy #$48 : ldx #$20
    bra .CB75

.CB71:
    ldy #$52 : ldx #$21
.CB75:
    jsl set_sprite
    jsl _03B114
    !A16
    lda.b obj.pos_x+1 : sta.b obj.speed_x+1
    lda.b obj.pos_y+1 : sta.b obj.speed_y+1
    !A8
    ldx $07
    jmp (+,X) : +: dw .CBA4, .CB9E, .CC0D, .CBA4, .CB9E, .CC0D, .CC32, .CC68

;-----

.CB9E:
    lda $09 : ora #$10 : sta $09
.CBA4:
    brk #$00

;----- CBA6

    jsr skulls__CB0F_CB13
    jsr _0281A8 ;remove money bag if too far left
    lda.w current_cage
    bne .CBA4

    lda.w !obj_arthur.hp
    bmi .CBA4

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CBA4

.CBBB:
    lda #$20 : sta $08
    stz $09
    lda $07
    cmp #$06
    bcs .CBD3

    ldy #$27 : jsl update_score
    ldy #$34 : ldx #$20
    bra .CBDD

.CBD3:
    ldy #$4F : jsl update_score
    ldy #$72 : ldx #$20
.CBDD:
    jsl set_sprite
    lda #$30 : jsl _018049_8053 ;pickup sfx
    sed
    lda.w money_bag_count
    clc
    adc #$01
    cld
    ldx.w difficulty
    cmp.w money_bag_req_for_continue,X
    bcc .CC03

    lda.w continues
    cmp #$09
    bcs +

    inc.w continues
+:
    lda #$00
.CC03:
    sta.w money_bag_count
    lda #$60 : cop #$00

;----- CC0A

    jmp _0281A8_81B5

;-----

.CC0D: ;money bag in second layer
    lda $08 : ora #$05 : sta $08
    lda $09 : ora #$20 : sta $09
.CC19:
    brk #$00

;----- CC1B

    jsr skulls__CB0F_CB13
    jsr _0281A8
    lda.w current_cage
    beq .CC19

    lda.w !obj_arthur.hp
    bmi .CC19

    jsr arthur_overlap_check_FED8_8bit_local
    bcs .CC19

    bra .CBBB

;-----

.CC32: ;special "money bag" that triggers the vortex sfx in 2-2
    stz $08
    stz $09
.CC36:
    brk #$00

;----- CC38

    lda.w camera_y+2
    cmp #$02
    bne .CC36

    !A16
    lda.w camera_x+1
    cmp #$0900
    !A8
    bcc .CC36

    lda #!sfx_vortex : jsl _018049_8053
.CC51:
    brk #$00

;----- CC53

    !A16
    lda.w camera_x+1
    cmp #$0B00
    !A8
    bcc .CC51

    lda #$3C : jsl _018049_8053
    jmp _0281A8_81B5

;-----

.CC68: ;special "money bag" that triggers the lightning in 2-2
    lda #$03 : sta $08
    lda #$30 : sta $09
    stz $18
.CC72:
    ldy #$D8 : ldx #$21 : jsl set_sprite
    lda #$18 : jsl _019662 : sta.b obj.speed_x+1
    lda #$19 : jsl _019662 : sta.b obj.speed_y+1
.CC8A:
    brk #$00

;----- CC8C

    !A16
    lda.w camera_x+1 : clc : adc.b obj.speed_x+1 : sta.b obj.pos_x+1
    !A8
    lda.w camera_y+1 : clc : adc.b obj.speed_y+1 : sta.b obj.pos_y+1
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .CC8A

    stz $08
    stz $09
    lda #!sfx_lightning : jsl _018049_8053
    lda #$03 : sta $0332 ;white screen
    inc $0331
    lda #$04 : cop #$00

;----- CCC0

    lda #$00 : sta $0332
    inc $0331
    lda #$1A : jsl _019662 : sta $3B
.CCD0:
    lda #$02 : cop #$00

;----- CCD4

    dec $3B
    bne .CCD0

    !A16
    lda.w camera_x+1
    cmp #$1380
    !A8
    bcc .CC72

    jmp _0281A8_81B5
}

namespace off
