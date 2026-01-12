namespace intro_cutscene_obj

{
create: ;a8 x8
    lda #$10 : sta $09
    ldx $07
    jmp (+,X) : +: dw .CCED, .CD6F, .CD6F, .CD8B, .CD8B, .CDD4, .CE1A, .CF07, .CF11, .CF1D, .CF59, .CF85, .D09D

.CCED:
    jsr _D0C1 : ldx #$00 : ldy #$14 : jsl _D0BB
    jsr _D0C1 : ldx #$00 : ldy #$04 : jsl _D0BB
    jsr _D0C1 : ldx #$01 : ldy #$04 : jsl _D0BB
    jsr _D0C1 : ldx #$00 : ldy #$04 : jsl _D0BB
    jsr _D0C1 : ldx #$00 : ldy #$12 : jsl _D0BB
    jsr _D0C1 : ldx #$01 : ldy #$12 : jsl _D0BB
    jsr _D0C1 : ldx #$02 : ldy #$12 : jsl _D0BB
    jsr _D0C1 : ldx #$03 : ldy #$12 : jsl _D0BB
    lda #$00 : sta $37
.CD49:
    brk #$00

;----- CD4B

    clc
    lda.w camera_x+1 : adc #$01 : sta.w camera_x+1
    lda.w camera_x+2 : adc #$00 : sta.w camera_x+2
    jsl _01B90E
    dec $37
    bne .CD49

    lda #$4C
    cop #$00

;----- CD68

    inc $1FB3
    jml _0281A8_81B5

;-----

.CD6F:
    ldy #$AA : ldx #$21
    lda.b obj.direction : sta $12
    jsl set_sprite
    lda #$40 : sta.b obj.speed_x
.CD7F:
    brk #$00

;----- CD81

    jsl update_animation_normal
    jsl update_pos_x
    bra .CD7F

;-----

.CD8B: ;arthur in intro's 2nd scene
    ldy #$00 : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+$02  : sta $27
    lda #$FFF0 : sta.b obj.pos_x+1
    lda #$00B7 : sta.b obj.pos_y+1
    !A8
    inc.b obj.speed_x+1
    lda #$80 : sta $37
    dec $26
    jsl _018E32_8E79
.CDB2:
    brk #$00

;----- CDB4

    jsl update_pos_x
    jsl update_animation_normal
    jsl _018E32_8E79
    dec $37
    bne .CDB2

    ldy #$06 : ldx #$20 : jsl set_sprite
    jsl _018E32_8E79
.CDD0:
    brk #$00

;----- CDD2

    bra .CDD0

;-----

.CDD4: ;princess in 2nd scene
    inc.b obj.direction
    inc $12
    ldy #$A0 : ldx #$21 : jsl set_sprite
    !A16
    lda #$00C0 : sta.b obj.pos_x+1
    lda #$00B7 : sta.b obj.pos_y+1
    !A8
    inc.b obj.speed_x+1
    lda #$50
    cop #$00

;----- CDF4

    ldy #$A2 : ldx #$21 : jsl set_sprite
    lda #$30 : sta $37
.CE00:
    brk #$00

;----- CE02

    jsl update_pos_x
    jsl update_animation_normal
    dec $37
    bne .CE00

    ldy #$A0 : ldx #$21 : jsl set_sprite
.CE16:
    brk #$00

;----- CE18

    bra .CE16

;-----

.CE1A: ;3rd scene
    lda #$08 : sta $0F
    lda #$04 : sta $1D
    lda #$00 : sta $37
.CE26:
    brk #$00

;----- CE28

    !A16
    clc
    lda.w camera_x+1 : adc #$0001 : sta.w camera_x+1
    sta $1733
    lsr
    sta $1889
    !A8
    jsl _01B90E
    dec $37
    bne .CE26

    lda #$3C : cop #$00

;----- CE49

    inc $1FB3
.CE4C:
    brk #$00

;----- CE4E

    lda $1FB3
    bne .CE4C

    stz $02EB
    stz $02EC
    stz $02EE
    stz $02D5
    lda #$12 : jsl _0190B9_palette_to_ram
    jsr _D0C1
    ldx #$01 : ldy #$0E : jsl _D0BB
    jsr .CEF1
    jsr _D0C1
    ldy #$D8 : ldx #$21 : jsl set_sprite
.CE7E:
    brk #$00

;----- CE80

    jsl update_animation_normal
    lda $24
    cmp #$58
    bne .CE7E

    jsr .CEFD
    lda #$78 : cop #$00

;----- CE91

    jsr .CEF1
    jsr _D0C1
    ldx #$00 : ldy #$10 : jsl _D0BB
    jsr _D0C1
    ldy #$D8 : ldx #$21 : jsl set_sprite
    inc $12
.CEAC:
    brk #$00

;----- CEAE

    jsl update_animation_normal
    lda $24
    cmp #$58
    bne .CEAC

    jsr .CEFD
    lda #$78 : cop #$00

;----- CEBF

    jsr .CEF1
    jsr _D0C1
    ldx #$00 : ldy #$0E : jsl _D0BB
    jsr _D0C1
    ldy #$D8 : ldx #$21 : jsl set_sprite
    stz $12
.CEDA:
    brk #$00

;----- CEDC

    jsl update_animation_normal
    lda $24
    cmp #$58
    bne .CEDA

    lda #$3C : cop #$00

;----- CEEA

    inc $1FB3
    jml _0281A8_81B5

;-----

.CEF1:
    lda #$5D : jsl _018049_8053 ;lightning sfx
    lda #$17 : sta $02D5
    rts

.CEFD:
    lda $08 : and #$F7 : sta $08
    stz $02D5
    rts

.CF07: ;1st & 3rd demon in 3rd scene
    ldy #$B8 : ldx #$21
    lda.b obj.direction : sta $12
    bra .CF15

.CF11: ;2st demon in 3rd scene
    ldy #$B6 : ldx #$21
.CF15:
    jsl set_sprite
.CF19:
    brk #$00

;----- CF1B

    bra .CF19

;-----

.CF1D:
    ldx $11
    lda.w _00D43D,X : cop #$00 ;fireworks timer

;----- CF24

.CF24:
    ldy #$A4 : ldx #$21 : jsl set_sprite
    lda #$4B : jsl _018049_8053 ;fireworks sound
.CF32:
    brk #$00

;----- CF34

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .CF32

    stz $08
    stz $09
    lda #$5A : cop #$00

;----- CF46

    sec
    lda.b obj.pos_y+1 : sbc #$08 : sta.b obj.pos_y+1
    inc $0F
    lda $0F
    cmp #$02
    bne .CF24

    jml _0281A8_81B5

;-----

.CF59:
    ldy #$00 : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+$02 : sta $27
    lda #$0160 : sta.b obj.speed_x
    !A8
    dec $26
    jsl _018E32_8E79
.CF75:
    brk #$00

;----- CF77

    jsl update_pos_x
    jsl update_animation_normal
    jsl _018E32_8E79
    bra .CF75

;-----

.CF85: ;princess after defeating samael
    lda $09 : ora #$80 : sta $09
    lda #$01 : sta.b obj.direction : sta.b obj.facing
    ldy #$EA : ldx #$21 : jsl set_sprite
    !A16
    lda #$00F0 : sta.b obj.pos_y+1
    !A8
    stz.b obj.pos_x
    ldy #$42 : jsl set_speed_y
.CFAA:
    brk #$00

;----- CFAC

    jsl update_pos_y
    !A16
    lda #$01A0
    cmp.b obj.pos_y+1
    !A8
    bcs .CFAA

    sta.b obj.pos_y+1
if !version == 0
    lda #$BF : cop #$00
elseif !version == 1 || !version == 2
    lda #$3F : cop #$00
endif

;----- CFC1

    ldy #$E0 : ldx #$21 : jsl set_sprite
if !version == 0
    lda #$7F : cop #$00
elseif !version == 1 || !version == 2
    lda #$28 : cop #$00
endif

;----- CFCD

    inc $1EB7
    ldy #$E2 : ldx #$21 : jsl set_sprite
    ldy #$00 : jsl set_speed_x
.CFDE:
    brk #$00

;----- CFE0

    jsl update_pos_x
    lda $2D
    beq .CFDE

    ldy #$E6 : ldx #$21 : jsl set_sprite
.CFF0:
    brk #$00

;----- CFF2

    lda $2D
    cmp #$01
    beq .CFF0

    stz.b obj.facing
    !A16
    sec : lda.b obj.pos_x+1 : sbc #$0003 : sta.b obj.pos_x+1
    !A8
    ldy #$E8 : ldx #$21 : jsl set_sprite
if !version == 0
    lda #$7F : cop #$00

;----- D012
endif

    !A8
    stz $032E
    stz $02F0
if !version == 0
    ldy #$27 : jsl _01A21D
elseif !version == 1 || !version == 2
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldy #$2C : jsl _01A21D
    lda #$1A : sta $031E
endif
    !A16
    stz $1889
    stz $188D
    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    !X16
    ldx #$001C : lda #$0010 : ldy #$0000 : jsl _019136_9187
if !version == 0
    lda #$21BF
elseif !version == 1 || !version == 2
    lda #$21C5
endif
    !AX8
    jsl _018061_8064
    inc.w layer3_needs_update
    brk #$00

;----- D051

if !version == 0
    lda #$15 : sta $031E
endif
    lda #$05 : sta $02E1
    lda #$16 : sta $02D5 : sta $02D7
    lda $02D9 : ora #$08 : sta $02D9
    ldx #$02 : ldy #$90 : lda.b #_01FF00_18 : jsl _01A6FE
.D075:
    brk #$00

;----- D077

    lda $00DE
    bne .D075

    lda #$3F : cop #$00

;----- D080

    lda.b #_01FF00_0C : ldy #$90 : ldx #$08 : jsl _01A6FE
.D08A:
    brk #$00

;----- D08C

    lda $00DE
    bne .D08A

    lda #$0B : sta $0278
    stz $0279
.D099:
    brk #$00

;----- D09B

      bra .D099 ;never reached

;-----

.D09D: ;unused?
    ldy #$48 : ldx #$20 : jsl set_sprite
    !A16
    lda #$0014 : sta.b obj.pos_x+1
    lda #$00CC : sta.b obj.pos_y+1
    !A8
.D0B3:
    brk #$00

;----- D0B5

    bra .D0B3

;-----

thing:
    jml update_animation_normal

;-----

_D0BB:
    lda #$B3
    jml _018C55

_D0C1:
    lda $0F
    inc $0F
    asl #2
    tax
    !A16
    lda.w _00D405+0,X : sta.b obj.pos_x+1
    lda.w _00D405+2,X : sta.b obj.pos_y+1
    !A8
    rts
}

namespace off
