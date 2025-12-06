namespace cockatrice_head

{
create:
    brk #$00

;----- DDA6

    ldy #$EC : ldx #$21 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    lda $08 : ora #$01 : sta $08
    jsr _02EBA8
    !A16
    lda.w _00ED00+$40 : sta $27
    lda #$0180 : sta $29
    stz.b obj.speed_x+0
    stz.b obj.speed_y+0
    !A8
    stz.b obj.speed_x+2
    stz.b obj.speed_y+2
    lda #$FF : sta $26
    stz $3B
    stz $3C
    lda #$01 : sta.b obj.direction
    jsl set_hp
    lda #$01 : sta $0F
.DDE7:
    brk #$00

;----- DDE9

    jsr _02EB7E
    lda $0F : asl : tax
    jmp (+,X) : +: dw .DDFF, .DE0F, .DE23, .DE33, .DE3B, .DE4B

;-----

.DDFF:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .DDE7

;-----

.DE0F:
    lda $3B
    beq .DDE7

    lda $3B
    cmp #$03
    beq .DE1F

    lda #$04 : sta $0F
    bra .DDE7

.DE1F:
    inc $0F
    bra .DDE7

;-----

.DE23:
    ldy #$FA : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .DDE7

;-----

.DE33:
    lda $3B
    bne .DDE7

    stz $0F
    bra .DDE7

;-----

.DE3B:
    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .DDE7

;-----

.DE4B:
    lda $3B
    bne .DDE7

    stz $0F
    bra .DDE7

;-----

thing:
    jsl update_animation_normal
    ldx #$26 : jsl _018E32
    lda $3C
    bne .DE6A

    jsr _02FB62_FB69
    jsr _02FA37_FA6D
    jsr _02FD62_FD7C
.DE6A:
    rts

;-----

destroy:
    lda $0E
    beq .DE7E

    ldx #$02 : jsr _028048_local
    jsl _02F9DA_F9E0
    jsr _02EB7E
    jmp create_DDE7

.DE7E:
    inc $3C
    lda $08 : ora #$10 : sta $08
    !X16
    ldx $2D
    lda #$8C : sta.w obj.active,X
    !X8
    inc $1EC8
    lda #$77 : cop #$00

;----- DE98

    lda #!id_boss_explosion : jsl prepare_object
    jmp _0281A8_81B5
}

namespace off
