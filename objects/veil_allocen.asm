namespace veil_allocen

{
create:
    lda #$01 : sta $08
    lda #$30 : sta $10
    lda #$C4
    sta $1D
    stz $1EC5
    stz $1EC7
    stz $1EC6
    stz $1EC8
    stz $1EC9
    sta $1ECA
    stz $2E
    !A16
.E215:
    brk #$00

;----- E217

    lda.w camera_x+1
    cmp #$0F40
    bcc .E215

    !A8
    jsl set_hp
    lda.b obj.hp : sta $3C
    lda #$80 : ora $09 : sta $09
    ldy #$28 : ldx #$22 : jsl set_sprite
.E237:
    brk #$00

;----- E239

    lda $1EC7
    beq .E237

    lda #$03 : sta $31
.E242:
    lda #$20 : sta $32
    lda #$00 : sta $7EF59A : sta $7EF59C
.E250:
    brk #$00

;----- E252

    lda $7EF59A : inc : sta $7EF59A : sta $7EF59C
    inc $0331
    dec $32
    bne .E250

    dec $31
    bne .E242

    lda #$04 : cop #$00

;----- E26E

    lda #$1A : sta $7EF59A
    lda #$12 : sta $7EF59C
    inc $0331
    ldx #$18 : jsl _028000
    brk #$00

;----- E285

    inc $0F
    ldy #$40 : jsl set_speed_xyg
    lda #$10 : sta $2D
.E291:
    brk #$00

;----- E293

    jsl update_pos_xyg_add
    dec $2D
    bne .E291

    lda #$01 : sta $2E
    stz $2F
    lda #$08 : sta $30
    lda #$20 : cop #$00

;----- E2A9

    ldy #$72 : jsl set_speed_x
    lda #$01 : sta $1EC3
    stz $1EC4
    bra .E2BF

.E2B9:
    ldx #$A6 : jsl _0196EF
.E2BF:
    ldx $1EC4
    cmp $1EC3
    bne .E2CE

    inx
    cpx #$03
    bcc .E2D0

    eor #$01
.E2CE:
    ldx #$00
.E2D0:
    sta.b obj.direction
    sta $1EC3
    stx $1EC4
    ldx #$A8 : jsl _0196EF : sta $2D
.E2E0:
    brk #$00

;----- E2E2

    jsl update_pos_x
    jsr .E3F9
    dec $2D
    bne .E2E0

    lda #$20 : cop #$00

;----- E2F1

    brk #$00

;----- E2F3

    jsr .E3E4
    bcc .E316

    jsl get_arthur_relative_side
    bne .E30B

.E2FE:
    !A16
    inc.b obj.pos_x+1
    brk #$00

;----- E304

    jsr .E3E4
    bcs .E2FE

    bra .E316

.E30B:
    !A16
    dec.b obj.pos_x+1
    brk #$00

;----- E311

    jsr .E3E4
    bcs .E30B

.E316:
    lda #$02 : sta $2E
    jsl call_rng : and #$01 : sta $1EC9
.E323:
    brk #$00

;----- E325

    lda $1EC9 : asl #2 : tax
    clc
    lda.w veil_allocen_data_D618+0,X : adc.b obj.pos_y+0 : sta.b obj.pos_y+0
    lda.w veil_allocen_data_D618+1,X : adc.b obj.pos_y+1 : sta.b obj.pos_y+1
    lda.w veil_allocen_data_D618+2,X : adc.b obj.pos_y+2 : sta.b obj.pos_y+2
    !A8
    lda $1EC9
    bne .E353

    !A16
    lda #$0298
    cmp.b obj.pos_y+1
    bcc .E362

    bra .E35C

.E353:
    !A16
    lda #$02E0
    cmp.b obj.pos_y+1
    bcs .E362

.E35C:
    sta.b obj.pos_y+1
    !A8
    bra .E368

.E362:
    !A8
    dec $2D
    bne .E323

.E368:
    lda #$01 : sta $2E
    ldx #$AE : jsl _0196EF
    bne .E381

    inc $1EC5
    lda $1EC5
    cmp #$02
    bcs .E381

    jmp .E2B9

.E381:
    stz $1EC5
    ldx #$AC : jsl _0196EF
    cmp $1EC6
    beq .E394

    stz $1EC8
    bra .E3A3

.E394:
    inc $1EC8
    ldy $1EC8
    cpy #$03
    bcc .E3A3

    eor #$01
    stz $1EC8
.E3A3:
    sta $1EC6
    tax
    bne .E3C3

    inc $1EC2
    ldx #$AA : jsl _0196EF : cop #$00

;----- E3B4

    inc $1EC1
.E3B7:
    brk #$00

;----- E3B9

    lda $1EC1
    ora $1EC2
    bne .E3B7

    bra .E3DD

.E3C3:
    ldy #$2E : ldx #$22 : jsl set_sprite
    lda #!id_veil_allocen_projectile : jsl prepare_object
    lda #$14 : cop #$00

;----- E3D5

    ldy #$28 : ldx #$22 : jsl set_sprite
.E3DD:
    lda #$1F : cop #$00

;----- E3DF

    jmp .E2B9

;-----

.E3E4:
    !A16
    sec
    lda.w camera_x+1
    adc #$0080
    sec
    sbc.b obj.pos_x+1
    adc #$0060
    cmp #$00C0
    !A8
    rts

;-----

.E3F9:
    !A16
    sec
    lda.b obj.pos_x+1
    sta $0000
    sbc #$1020
    clc
    adc #$0090
    cmp #$0120
    bcc .E41B

    lda $0000 : sta.b obj.pos_x+1
    !A8
    lda.b obj.direction : eor #$01 : sta.b obj.direction
    rts

.E41B:
    !A8
    rts

;-----

thing:
    lda $0F
    bne .E42A

    lda #$0A : jsl _02F9C6
    bra .E467

.E42A:
    jsr .E488
    !A16
    lda.b obj.pos_x+1 : sta $35
    lda.b obj.pos_y+1
    sta $37
    sec
    sbc #$0010
    sta.b obj.pos_y+1
    !A8
    jsl _02F9FA
    lda #$0B : jsl _02FBE4_FBE7
    !A16
    clc : lda.b obj.pos_y+1 : adc #$0020 : sta.b obj.pos_y+1
    !A8
    lda #$09 : jsl _02F9C6
    !A16
    lda $35 : sta.b obj.pos_x+1
    lda $37 : sta.b obj.pos_y+1
    !A8
.E467:
    jsl _02F9B2
    jsl get_arthur_relative_side : eor #$01 : sta.b obj.facing
    lda.b obj.hp
    cmp $3C
    beq .E487

    sta $3C
    ldx #$06 : jsl _028048
    lda #$38 : jsl _018049_8053
.E487:
    rtl

;-----

.E488:
    lda $2E
    beq .E4BE

    pha
    lda $2F
    asl #2
    tay
    ldx #$03
    pla
    dec
    beq .E49A

    ldx #$00
.E49A:
    clc
    lda.b obj.pos_x+0,X : adc.w veil_allocen_data_D620+0,Y : sta.b obj.pos_x+0,X
    lda.b obj.pos_x+1,X : adc.w veil_allocen_data_D620+1,Y : sta.b obj.pos_x+1,X
    lda.b obj.pos_x+2,X : adc.w veil_allocen_data_D620+2,Y : sta.b obj.pos_x+2,X
    dec $30
    bne .E4BE

    lda #$10 : sta $30
    lda $2F : eor #$01 : sta $2F
.E4BE:
    rts

;-----

destroy:
    inc $1ED7
    ldy #$30 : ldx #$22 : jsl set_sprite
    jsl _018049_8051
    lda #$04 : sta $1D
    lda #$10 : jsl _018049_8053
    lda #!id_boss_explosion_spawner : jsl prepare_object
    lda $08 : ora #$10 : sta $08
    lda #$7E : cop #$00

;----- E4E8

    jsl _02EBC1
    jml _0281A8_81B5
}

namespace off
