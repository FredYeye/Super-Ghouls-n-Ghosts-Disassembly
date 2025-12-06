namespace miniwing

{
create:
    ldx #$03 : jsl _018D5B
    lda #!sfx_cockatrice_spew : jsl _018049_8053
    ldy #$EE : ldx #$21 : jsl set_sprite
    !A16
    lda.w #cockatrice_body_data_CA21 : sta $13
    lda.w _00ED00+$3C : sta $27
    lda #$0010 : sta.b obj.speed_x+1
    lda #$0010 : sta.b obj.speed_y+1
    stz $0C
    !A8
    lda #$FF : sta $26
    stz $25
    stz $15
    lda $09 : ora #$C0 : sta $09
    lda #$01 : sta.b obj.direction
    jsl update_pos_x
    jsl update_pos_y
    ldy #$10 : jsl set_speed_xyg
.DEEF:
    brk #$00

;----- DEF1

    jsl update_pos_xyg_add
    jsl _01A559
    beq .DEEF

    lda.w difficulty : asl #2 : sta.b obj.hp
    lda #$90 : sta.b obj.speed_x+0
    stz.b obj.speed_x+1
    stz.b obj.speed_x+2
    ldy #$12 : jsl set_speed_xyg
.DF10:
    brk #$00

;----- DF12

    lda $1EC8
    beq .DF20

    lda #$3B : jsl _018049_8053
    jmp _028BEC

.DF20:
    lda $0F : asl : tax
    jmp (+,X)

+:
    dw .DF47, .DF8D, .DFC2, .DFCD, .DFE2, .E015, .E081, .E086
    dw .E08B, .E0D7, .E0D7, .E107, .E116, .E11B, .E121, .E121

;-----

.DF47: ;egg land
    stz $35
    ldx #$4E : jsl _0196EF
    cmp #$00
    beq .DF76

    ldy #$F0 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    stz $17
    ldx #$52 : jsl _0196EF : sta $31
    jsl get_arthur_relative_side
    beq .DF76

    sta.b obj.direction
    inc $0F
    jmp .DF10

.DF76:
    ldy #$F2 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$02 : sta $0F
    lda #$64 : sta $31
    jmp .DF10

;-----

.DF8D:
    jsl update_pos_x
    !A16
    lda.b obj.pos_x+1
    cmp #$1250
    bcc .DFA7

    lda.b obj.pos_x+1
    cmp #$13D0
    bcs .DFA7

    !A8
    dec $31
    bne .DFBB

.DFA7:
    !A8
    ldy #$F2 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    lda #$64 : sta $31
.DFBB:
    jsl _01A593
    jmp .DF10

;-----

.DFC2:
    dec $31
    bne .DFCA

    lda #$03 : sta $0F
.DFCA:
    jmp .DF10

;-----

.DFCD:
    ldy #$F4 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$0E : sta $31
    inc $0F
    jmp .DF10

;-----

.DFE2:
    dec $31
    bne .E012

    lda #$05 : cop #$00

;----- DFEA

    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$00 : sta.b obj.speed_x+0
    lda #$01 : sta.b obj.speed_x+1
    jsl get_arthur_relative_side : sta.b obj.direction
    eor #$01 : sta.b obj.facing
    lda #$40 : sta $31
    inc $0F
    lda #$10 : cop #$00

;----- E012

.E012:
    jmp .DF10

;-----

.E015:
    jsl update_pos_x
    !A16
    lda.b obj.pos_x+1
    cmp #$1250
    bcs .E029

    lda #$1250 : sta.b obj.pos_x+1
    bra .E035

.E029:
    lda.b obj.pos_x+1
    cmp #$13D0
    bcc .E042

    lda #$13D0 : sta.b obj.pos_x+1
.E035:
    !A8
    lda #$05 : sta $07
    lda #$0A : sta $0F
    jmp .DF10

.E042:
    !A8
    dec $31
    bne .E07A

    lda #$28 : sta $31
    ldx #$4E : jsl _0196EF
    cmp #$00
    bne .E07A

    ldy #$0C : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    lda #$FF : sta.b obj.speed_y+0
    lda #$FE : sta.b obj.speed_y+1
    lda #$FF : sta.b obj.speed_y+2
    ldy #$12 : jsl set_speed_xyg
    lda #$15 : sta $31
.E07A:
    jsl _01A593
    jmp .DF10

;-----

.E081:
    inc $0F
    jmp .DF10

;-----

.E086:
    inc $0F
    jmp .DF10

;-----

.E08B:
    jsl update_pos_xyg_add
    !A16
    lda.b obj.pos_x+1
    cmp #$1250
    bcs .E09F

    lda #$1250 : sta.b obj.pos_x+1
    bra .E0AB

.E09F:
    lda.b obj.pos_x+1
    cmp #$13D0
    bcc .E0B8

    lda #$13D0 : sta.b obj.pos_x+1
.E0AB:
    !A8
    lda #$08 : sta $07
    lda #$0A : sta $0F
    jmp .DF10

.E0B8:
    !A8
    jsl _01A559
    beq .E0D4

    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$05 : sta $0F
    lda #$28 : sta $31
.E0D4:
    jmp .DF10

;-----

.E0D7:
    lda $35
    bne .E0F0

    lda.b obj.direction : eor #$01 : sta.b obj.direction
    lda.b obj.facing : eor #$01 : sta.b obj.facing
    lda $07 : sta $0F
    inc $35
    jmp .DF10

.E0F0:
    ldy #$0C : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    ldy #$20 : jsl set_speed_xyg
    inc $0F
    jmp .DF10

;-----

.E107:
    jsl update_pos_xyg_add
    lda $09
    and #$40
    cmp #$40
    bne .E11B

    jmp .DF10

;-----

.E116: ;unused getting hit state?
    dec $1EC7
    bra destroy

;-----

.E11B:
    dec $1EC7
    jmp _0281A8_81B5

;-----

.E121: ;unused getting hit state?
    dec $1EC7
    bra destroy

;-----

thing:
    jsl update_animation_normal
    jsl _018E32_8E73
    jsr _02FD62_FD7C
    lda $0F
    cmp #$05
    bcc .E13E

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    rts

.E13E:
    jsr _02FB9C_FBC0
    rts

;-----

destroy:
    lda.b obj.hp
    beq .E186

    ldy #$F8 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    jsl _018E32_8E73
    lda #$08 : cop #$00

;----- E15E

    jsl _02F9DA_F9E0
    lda $0F
    cmp #$05
    bne .E177

    ldy #$F6 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    jmp create_DF10

.E177: ;hitting miniwing in the air?
    ldy #$0C : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    jmp create_DF10

.E186:
    lda #$3B : jsl _018049_8053
    dec $1EC7
    jmp _028BEC

;-----

    jmp _0281A8_81B5 ;unused, probably belongs to miniwing
}

namespace off
