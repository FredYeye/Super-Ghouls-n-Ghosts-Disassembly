namespace death_crawler_handler

{
create:
    lda #$80 : sta $08
    lda #$C2 : sta $1D
    stz $1EC7
    stz $1EC8
    stz $1EC9
    !A16
.B1B1:
    brk #$00

;----- B1B3

    lda.w camera_x+1
    cmp #$1800
    bcc .B1B1

    !A8
    lda #$10 : sta $02D7
    !A16
.B1C4:
    brk #$00

;----- B1C6

    lda.w !obj_arthur.pos_x+1
if !version == 0 || !version == 1
    cmp #$1A30
elseif !version == 2
    cmp #$1AA0 ;death crawler triggers farther to the right
endif
    bcc .B1C4

    lda #$1900 : sta.w screen_boundary_left
    !A8
    lda #!mus_stage_3_boss : jsl _018049_8053
    stz $1500
    stz $150E
    stz $151C
    stz $152A
    stz $1538
    stz $1546
    stz $1554
    lda #$04 : sta $02D5 : sta $02D6
    lda #$10 : sta $02D7 : sta $02D8
    lda #$30 : ora.w !obj_arthur.flags2 : sta.w !obj_arthur.flags2
    stz $15F1
    stz $1747
    stz $189D
    brk #$00

;----- B214

    lda #$80 : sta $09
    ldx #$3F
.B21A:
    lda.l _09E800_F580,X : sta $7EF480,X
    dex
    bpl .B21A

    inc $0331
    ldx #$0C : jsl _028000
    brk #$00

;----- B230

    lda #$04 : sta $1F31
    brk #$00

;----- B237

    lda #$06 : sta $1F31
    brk #$00

;----- B23E

    lda #$08 : sta $1F31
    brk #$00

;----- B245

    lda #$0C : sta $1F31
    brk #$00

;----- B24C

    ldy #$90 : lda.b #_01FF00_5C : ldx #$15 : jsl _01A6FE
.B256:
    brk #$00

;----- B258

    lda $00DE
    bne .B256

    lda #$01 : sta $1F30
    brk #$00

;----- B264

    ldy #$90 : lda.b #_01FF00_5C : ldx #$0E : jsl _01A6FE
.B26E:
    brk #$00

;----- B270

    lda $00DE
    bne .B26E

    lda #$8E : sta $031E
    brk #$00

;----- B27C

    lda #$8F : sta $031E
    brk #$00

;----- B283

    lda #$90 : sta $031E
    brk #$00

;----- B28A

    lda #$07 : sta $02D9
    lda #$04 : sta $02D5 : sta $02D6
    lda #$12 : sta $02D7 : sta $02D8
    lda #$40 : sta !SETINI ;EXTBG
    stz $2D
    stz $2E
    stz $39
    lda #$FF : sta $3B
    !A16
    lda #$0080 : sta $02D1
    lda #$0280 : sta $02D3
    lda #$0060 : sta $02C9 : sta $02CF : sta $02CB : sta $02CD
    !A8
.B2CD:
    lda #$80 : sta $1F2B ;rotation related
    jsr _B4B7
    !A16
.B2D7:
    brk #$00

;----- B2D9

    lda.w !obj_arthur.pos_x+1 : sta.b obj.pos_x+1
    lda.w !obj_arthur.pos_y+1 : sta.b obj.pos_y+1
    clc
    lda $02C9
    adc #$000C
    cmp #$01D0
    bcc .B2F2

    lda #$01D0
.B2F2:
    sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    bcc .B2D7

    !A8
    lda $1EC8
    bne .B30D

    inc $1EC8
    jsr .B429
.B30D:
    inc $1EC7
    !A8
    stz $35
    stz $36
    inc $39
    lda #$20 : cop #$00

;----- B31C

    stz $37
    lda #$01 : sta $38
    stz $2F
    stz $30
    lda #$02 : sta $31
    stz $32
    stz $33
    lda #$40 : sta $34
    lda #!sfx_death_crawler_spin : jsl _018049_8053
.B338:
    brk #$00

;----- B33A

    jsr .B473
    !A16
    dec $37
    !A8
    bne .B338

    lda #$01 : sta $31
    stz $32
.B34B:
    brk #$00

;----- B34D

    jsr .B497
    lda $30
    bpl .B34B
.B354:
    brk #$00

;----- B356

    ldx #$8C : jsl _0196EF
    cmp $3B
    beq .B354

    sta $3B
    sta.b obj.direction
    ldx #$8E : jsl _0196EF : sta $3C
    brk #$00

;----- B36E

    !A16
    lda.b obj.pos_x+1 : sta.b obj.speed_x+1
    lda.b obj.pos_y+1 : sta.b obj.speed_y+1
    !A8
    ldx #$40 : jsl update_pos_xy_2
    !A16
    sec
    lda.b obj.pos_x+1
    sbc #$1C00
    adc #$00E0
    cmp #$01C0
    bcs .B39E

    sec
    lda.b obj.pos_y+1
    sbc #$0280
    adc #$0060
    cmp #$00C0
    bcc .B3B4

.B39E:
    lda.b obj.speed_x+1 : sta.b obj.pos_x+1
    lda.b obj.speed_y+1 : sta.b obj.pos_y+1
    !A8
.B3A8:
    brk #$00

;----- B3AA

    lda $36
    cmp #$20
    bne .B3A8

    lda $35
    beq .B3A8

.B3B4:
    lda #$20 : cop #$00

;----- B3B8

    inc $1EC9
    stz $39
    ldx #$B6 : jsl _0196EF
    sta $07
    ldx #$08
    tay
    beq .B3CC

    ldx #$05
.B3CC:
    stx $3C
.B3CE:
    lda #!id_death_crawler_projectile : jsl prepare_object
    inc $07
    lda #$08 : cop #$00

;----- B3DA

    dec $3C
    bne .B3CE

    lda #$91 : sta $031E
    stz $1EC9
    inc $39
    lda #$7F : cop #$00

;----- B3EC

    stz $1EC7
    stz $39
.B3F1:
    brk #$00

;----- B3F3

    !A8
    sec : lda $1F2B : sbc #$04 : sta $1F2B
    jsr _B4B7
    !A16
    sec
    lda $02C9
    sbc #$000C
    cmp #$0020
    bcs .B412

    lda #$0020
.B412:
    sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    bcs .B3F1

    !A8
    lda #$C0 : cop #$00

;----- B426

    jmp .B2CD

;-----

.B429:
    stz $07
    lda #$0B : sta $0000
.B430:
    jsl get_object_slot
    bmi .B44E

    lda #$0C : sta.w obj.active,X
    lda #!id_death_crawler_part : sta.w obj.type,X
    lda $07 : sta $0007,X
    inc $07
    !X8
    dec $0000
    bne .B430

.B44E:
    jsl get_object_slot
    bmi .B460

    lda #$0C : sta.w obj.active,X
    lda #!id_death_crawler : sta.w obj.type,X
    !X8
.B460:
    jsl get_object_slot
    bmi .B472

    lda #$0C : sta.w obj.active,X
    lda #$AF : sta.w obj.type,X ;todo
    !X8
.B472:
    rts

;-----

.B473:
    !A16
    lda $2F
    cmp #$0200
    bcs .B483

    clc : lda $2F : adc $31 : sta $2F
.B483:
    sec
    lda $33
    sbc $2F
    sta $33
    !A8
    xba
    and #$7F
    asl
    sta $1F2B
    jsr _B4B7
    rts

;-----

.B497:
    !A16
    sec : lda $2F : sbc $31 : sta $2F
    bra .B483

;-----

_B4A2:
    lda $1EC9
    beq .B4B6

    lda.w frame_counter : and #$04 : lsr #2 : clc : adc #$11 : ora #$80 : sta $031E
.B4B6:
    rts

;-----

_B4B7:
    ldx $1F2B
    lda.l _09FD00+0,X : sta $1FA1
    eor #$FF : inc    : sta $1FA2
    lda.l _09FD00+1,X : sta $1FA0 : sta $1FA3
    rts

;-----

_B4D2:
    lda $39
    beq .B514

    dec $36
    bpl .B4E4

    lda #$20 : sta $36
    lda $35 : eor #$01 : sta $35
.B4E4:
    lda $35
    !A16
    beq .B4FF

    clc : lda $02C9 : adc #$0004 : sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    bra .B512

.B4FF:
    sec : lda $02C9 : sbc #$0004 : sta $02C9 : sta $02CB : sta $02CD : sta $02CF
.B512:
    !A8
.B514:
    rts

;-----

thing:
    jsr _B4A2
    jsr _B4D2
    lda $1ED7
    beq .B528

    lda #$8C : sta.b obj.active
    asl $09 : lsr $09
.B528:
    !A16
    lda.b obj.pos_x+1
    sta $1EB7
    sec
    sbc #$0080
    sec
    sbc.w camera_x+1
    eor #$FFFF
    inc
    sta $19BD
    lda.b obj.pos_y+1
    sta $1EB9
    sec
    sbc #$0080
    sec
    sbc.w camera_y+1
    eor #$FFFF
    inc
    clc
    adc #$0200
    sta $19C1
    !A8
    rtl

;-----

destroy:
    jsl _018049_8051
    lda #!mus_defeat_boss : jsl _018049_8053
    lda #$04 : sta $1D
    lda #!id_boss_explosion_spawner : jsl prepare_object
    lda #$7E : sta $2D
    lda #$10 : sta $2E
    lda #$02 : sta $1F31
.B57A:
    jsl thing_B528
    lda $2D
    beq .B598

    lda $2E  : sta $02D7
    eor #$02 : sta $2E
    dec $2D
    bne .B598

    lda #$10 : sta $02D7
    jsl _02EBC1
.B598:
    brk #$00

;----- B59A

    bra .B57A
}

namespace off
