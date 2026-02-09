namespace skull_flower_multi

{
create:
    lda $07
    cmp #$04
    bcs .ADC7

    lda #$40 : sta $10
    jsr .ADD2
    ldy #$CA : ldx #$21
    lda $33
    beq .ADA3

    ldy #$B6 : ldx #$21
.ADA3:
    jsl set_sprite
    jsl get_arthur_relative_side : sta.b obj.facing
    jsl set_hp
    lda #$08 : sta $38
    stz $31
.ADB7:
    jsl _03B114
    brk #$00

;----- ADBD

    stz.b obj.facing
    jsr .ADD2
    asl
    tax
    jmp (.ADCA,X)

.ADC7:
    jmp .AF41

.ADCA: dw .ADE4, .ADE4, .ADE4, .ADE2

;-----

.ADD2:
    lda $1F2B
    lsr #5
    clc
    adc $07
    and #$03
    sta $33
    rts

;-----

.ADE2:
    inc.b obj.facing
.ADE4:
    stz $35
    stz $36
    ldy #$03
    !X16
    ldx $2D
.ADEE:
    lda $33 : sta $0033,X
    !A16
    lda.w #.AF45 : sta $0003,X
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    lda $002D,X
    tax
    !A8
    dey
    bne .ADEE

    !X8
    lda #$01 : sta $08
    ldy #$CA : ldx #$21
    lda $33
    beq .AE20

    ldy #$B6 : ldx #$21
.AE20:
    jsl set_sprite
    jsl _02F9DA
    stz $34
.AE2A:
    brk #$00

;----- AE2C

    bit $09
    bvc .AE2A

    lda $1F97
    beq .AE38

    jmp .AF09

.AE38:
    lda #!sfx_grow : jsl _018049_8053
    inc $34
    lda #$48 : sta $37
    lda $09 : and #$FB : sta $09
    ldy #$CC : ldx #$21
    lda $33
    beq .AE56

    ldy #$B8 : ldx #$21
.AE56:
    jsl set_sprite
    jsr _B09D
.AE5D:
    brk #$00

;----- AE5F

    jsr _B08E
    jsl _AFFF
    dec $37
    bne .AE5D

    !A16
    lda.b obj.pos_x+1 : sta $13
    lda.b obj.pos_y+1 : sta $27
    !A8
    lda.b obj.direction
    sta $26
    inc $0F
.AE7C:
    bit $09
    bvc .AED2

    stz $15
    jsl get_object_slot
    bmi .AED2

    stx $35
    stz.b obj.direction
    lda #!id_flower_projectile : jsl prepare_object_8C37
.AE92:
    brk #$00

;----- AE94

    lda #$01 : jsr _B0EB
    !AX16
    ldx $35
    lda.b obj.pos_x+1 : sta.w obj.pos_x+1,X
    lda.b obj.pos_y+1 : sta.w obj.pos_y+1,X
    !AX8
    lda $1F97
    bne .AED8

    lda $15
    cmp #$68
    bcc .AE92

    !X16
    ldx $35
    inc $0031,X
    stz $35
    stz $36
    !X8
.AEC1:
    brk #$00

;----- AEC3

    lda #$FF : jsr _B0EB
    lda $1F97
    bne .AED8

    lda $15
    dec
    bne .AEC1

.AED2:
    lda #$08 : cop #$00

;----- AED6

    bra .AE7C

.AED8:
    dec $0F
    jsr _B01B
    stz $35
    stz $36
    lda $26 : sta.b obj.direction
    !A16
    lda $13 : sta.b obj.pos_x+1
    lda $27 : sta.b obj.pos_y+1
    !A8
    lda #$48 : sta $37
    jsr _B0B9
    stz $34
.AEFA:
    brk #$00

;----- AEFC

    jsr _B08E
    jsl _AFFF
    dec $37
    bne .AEFA

    inc $31
.AF09:
    stz.b obj.direction
    stz.b obj.facing
    ldy #$BE : ldx #$21 : jsl set_sprite
    jsl _02F9ED
    jsl _03B114
.AF1D:
    brk #$00

;----- AF1F

    lda $1F2B
    lsr #4
    inc
    lsr
    inc #2
    clc
    adc $07
    and #$03
    tax
    lda.w skull_flower_multi_data_D125,X : sta $0C
    lda $1F97
    bne .AF1D

    stz $31
    stz $09
    jmp .ADB7

.AF41:
    brk #$00

;----- AF43

    bra .AF41

;-----

.AF45:
    stz $31
    stz.b obj.pos_x
    stz.b obj.pos_y
    lda #$01 : sta $08
    stz $34
.AF51:
    brk #$00

;----- AF53

    !X16
    ldx $2F
    lda $0034,X
    !X8
    beq .AF51

    ldy #$D0 : ldx #$21
    lda $33
    beq .AF6A

    ldy #$BC : ldx #$21
.AF6A:
    jsl set_sprite
    jsl _02F9DA_F9E0
    inc $34
    ldx $07
    lda.w skull_flower_multi_data_D0DF-4,X : sta $32
    lda $07
    asl #2
    tax
    lda.w skull_flower_multi_data_D112-$10,X : sta $38
    lda.w skull_flower_multi_data_D112-$0F,X : sta.b obj.direction
    lda $33
    and #$01
    !A16
    clc
    bne .AF9C

    lda.w skull_flower_multi_data_D112-$0E,X : adc.b obj.pos_x+1 : sta.b obj.pos_x+1
    bra .AFA3

.AF9C:
    lda.w skull_flower_multi_data_D112-$0E,X : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
.AFA3:
    jsr _B0D5
    lda $32 : sta $37
.AFAA:
    brk #$00

;----- AFAC

    jsr _B08E
    jsl _AFFF
    dec $37
    bne .AFAA

.AFB7:
    brk #$00

;----- AFB9

    jsr _B08E
    jsl _B00D
    !X16
    ldx $2F
    lda $0034,X
    !X8
    bne .AFB7

    lda $32 : sta $37
    stz $34
    jsr _B0D5
.AFD4:
    brk #$00

;----- AFD6

    jsr _B08E
    jsl _AFFF
    dec $37
    bne .AFD4

.AFE1:
    brk #$00

;----- AFE3

    jsr _B08E
    jsl _B00D
    !X16
    ldx $2F
    lda $0031,X
    !X8
    beq .AFE1

    stz $08
    stz $09
    inc $31
.AFFB:
    brk #$00

;----- AFFD

    bra .AFFB

;-----

_AFFF:
    lda $33
    and #$01
    bne .B009

    jml update_pos_xy

.B009:
    jml _01884B_8873

;-----

_B00D:
    lda $33
    and #$01
    bne .B017

    jml update_pos_x

.B017:
    jml _01884B_8876

;-----

_B01B:
    !X16
    ldx $35
    beq .B024

    dec $0031,X
.B024:
    !X8
    rts

;-----

destroy:
    lda $07
    cmp #$04
    bcs .B03C

    jsr _B01B
    lda #$03 : jsl _028B52
    ldy #$17 : jsl update_score
.B03C:
    ldx $07
    lda.w skull_flower_multi_data_D11E,X : sta $31
    jml flower_part_destroy

;-----

thing:
    jsl update_animation_normal
    lda $07
    cmp #$04
    bcs .B07A

    bit $09
    bvc .B071

    lda $33
    and #$01
    bne .B061

    jsl get_arthur_relative_side : sta.b obj.facing
.B061:
    lda $0F
    beq .B07A

    jsl _02F9FA
    jsl _02F9CA
    jml _02F9B2

.B071:
    jsr _B01B
    lda #$03 : jml _028B36

.B07A:
    lda.w frame_counter
    clc
    adc $02C6
    and #$03
    bne .B08D

    jsl _02F9C2
    jml _02F9B2

.B08D:
    rtl

;-----

_B08E:
    dec $38
    bne .B09C

    lda.b obj.direction : eor #$01 : sta.b obj.direction
    lda #$10 : sta $38
.B09C:
    rts

;-----

_B09D:
    lda $33
    clc
    asl
    adc $33
    asl
    tax
    !A16
    lda.w skull_flower_multi_data_D0E2+0,X : sta.b obj.speed_x+0
    lda.w skull_flower_multi_data_D0E2+2,X : sta.b obj.speed_x+2
    lda.w skull_flower_multi_data_D0E2+4,X : sta.b obj.speed_y+1
    !A8
    rts

;-----

_B0B9:
    lda $33
    clc
    asl
    adc $33
    asl
    tax
    !A16
    lda.w skull_flower_multi_data_D0FA+0,X : sta.b obj.speed_x+0
    lda.w skull_flower_multi_data_D0FA+2,X : sta.b obj.speed_x+2
    lda.w skull_flower_multi_data_D0FA+4,X : sta.b obj.speed_y+1
    !A8
    rts

;-----

_B0D5:
    !AX16
    ldx $2F
    lda.w obj.speed_x+0,X : sta.b obj.speed_x+0
    lda.w obj.speed_x+2,X : sta.b obj.speed_x+2
    lda.w obj.speed_y+1,X : sta.b obj.speed_y+1
    !AX8
    rts

;-----

_B0EB:
    clc : adc $15 : sta $15
    !A16
    lda $13 : sta.b obj.pos_x+1
    lda $27 : sta.b obj.pos_y+1
    !A8
    stz $1E
    stz $21
    lda.b obj.direction : inc : and #$1F : sta.b obj.direction
    lda $15 : ldx #$16 : jsl _0189D9
    jsl update_animation_normal
    rts
}

namespace off
