namespace rosebud

{
create:
    ldx.w stage
    bne .C150

    lda #$01 : sta $08
.C150:
    lda #$10 : sta $09
    stz $3C
    !A16
    lda $1F : sta $33
    lda $22 : sta $35
    lda #rosebud_data_C765 : sta $13
    !A8
    lda #$04 : sta $38
    lda #$40 : sta $37
    lda #$01 : sta.b obj.facing
    jsl set_hp
    stz $39
    ldy #$CA : ldx #$21 : jsl set_sprite
    jsr _02C3FB
    ldy #$12 : jsl set_speed_x
.C18A:
    brk #$00

;----- C18C

    bit $09
    bvs .C197

    jsr _028053_local
    bcs .C1A5

    bra .C18A

.C197:
    brk #$00

;----- C199

    jsl update_animation_normal
    jsr _028074
    lda $1EB7
    beq .C1A8

.C1A5:
    jmp _0281A8_81B5

.C1A8:
    ldy #$12 : jsl arthur_range_check_x
    bcs .C197

    lda $1AF8 ;todo: rosebuds active. obj type array? or standalone
    ldx.w difficulty
    cmp.w rosebud_data_max_active,X
    bcs .C197

    inc $1AF8
    ldy #$CC : ldx #$21 : jsl set_sprite
.C1C6:
    lda #!sfx_rosebud_grow : jsl _018049_8053
    jsl _02F9DA_F9E0
    lda $07 : sta $31
    cmp #$02
    bcs .C21D

.C1D8:
    brk #$00

;----- C1DA

    jsr .C298
    jsl update_animation_normal
    lda $3C
    cmp #$02
    bne .C1D8

    ldy #$CE : ldx #$21 : jsl set_sprite
    inc $39
    stz $3A
.C1F3:
    brk #$00

;----- C1F5

    jsl update_animation_normal
    bit $09
    bvc .C21A

    dec $3A
    bne .C1F3

    inc $39
    lda #$3C : sta $3A
.C207:
    brk #$00

;----- C209

    lda #$FC : jsl update_animation_custom_timer
    bit $09
    bvc .C21A

    dec $3A
    bne .C207

    jsr .C275
.C21A:
    jmp destroy_C30B

.C21D:
    !A16
    lda #rosebud_data_C785 : sta $13
    !A8
.C226:
    brk #$00

;----- C228

    jsr .C298
    jsl update_animation_normal
    lda $3C
    cmp #$03
    bne .C226

    lda #$03 : sta $39
    stz $3A
.C23B:
    brk #$00

;----- C23D

    jsl update_animation_normal
    dec $3A
    bne .C23B

    inc $39
    ldy #$D4 : ldx #$21 : jsl set_sprite
    lda #$3C : sta $3A
.C253:
    brk #$00

;----- C255

    jsl update_animation_normal
    dec $3A
    bne .C253

    jsr .C275
    inc $07
    stz.b obj.facing
.C264:
    lda #!id_rosebud_chunk : jsl prepare_object
    inc.b obj.facing
    lda.b obj.facing
    cmp #$08
    bne .C264

    jmp destroy_C30B

;-----

.C275:
    stz $08
    lda #$10 : sta $09
    stz $07
    lda #$04 : sta $1D
    stz.b obj.facing
    lda #!sfx_rosebud_explode : jsl _018049_8053
.C289:
    lda #!id_rosebud_chunk : jsl prepare_object
    inc.b obj.facing
    lda.b obj.facing
    cmp #$05
    bne .C289

    rts

;-----

.C298:
    lda $24
    cmp #$71
    bne .C2A4

    inc $3C
    lda #$01 : sta $24
.C2A4:
    rts

;-----

destroy:
    lda.b obj.hp
    beq .C2E3

    lda $39
    bne .C2B4

    lda #$1E : cop #$00 ;gets here if shot while still expanding

;----- C2B1

    jmp create_C1C6

.C2B4:
    jsl _02F9DA_F9E0
    lda #$02 : sta $32
.C2BC:
    lda #$03 : sta $3B
.C2C0:
    brk #$00

;----- C2C2

    jsl update_pos_x
    dec $3B
    bne .C2C0

    lda.b obj.direction : eor #$01 : sta.b obj.direction
    dec $32
    bne .C2BC

    lda $39
    asl
    tax
    jmp (.C2DB-2,X) : .C2DB: dw create_C1F3, create_C207, create_C23B, create_C253

.C2E3:
    ldy #$17 : jsl update_score
    lda #!sfx_death : jsl _018049_8053
    lda.b obj.direction : sta.b obj.facing
    stz $29
    stz $2A
    ldy #$78 : ldx #$20 : jsl set_sprite
.C2FF:
    brk #$00

;----- C301

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .C2FF

.C30B:
    dec $1AF8
    lda.w stage
    beq .C316

    jmp _0281A8_81B5

.C316:
    jsr _02C3FB
    lda #$10 : sta $09
    stz $08
    lda.w difficulty : asl : tax
    !A16
    lda.w rosebud_data_regrowth_timer,X : sta $3B
    !A8
.C32D:
    brk #$00

;----- C32F

    jsr _028074
    !A16
    dec $3B
    !A8
    bne .C32D

    !A16
    lda $33 : sta $1F
    lda $35 : sta $22
    !A8
    ldy #$CC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$10 : sta $08
    lda #$3C : sta $3B
.C358:
    brk #$00

;----- C35A

    jsr _028074
    dec $3B
    bne .C358

    lda $08 : and #$EF : sta $08
    lda $31 : sta $07
    jmp create

;-----

thing:
    lda $1EB7
    bne .C383

    bit $09
    bvc .C383

    jsr .C389
    jsr _02FB62
    jsr _02FAA1
    jmp _02FD62_FD6A

.C383:
    dec $1AF8
    jmp _0281BB

;-----

.C389:
    lda $07
    and #$01
    bne .C3A6

    lda $39
    beq .C3A6

    ldx $0F
    jmp (+,X) : +: dw .C39E, .C3A7, .C3C7

;-----

.C39E:
    dec $37
    bne .C3A6

    lda #$02 : sta $0F
.C3A6:
    rts

;-----

.C3A7:
    lda #$04 : sta $0F
    lda $38 : jsl _019662 : sta.b obj.direction
    tax
    ldy #$3C
    and #$01
    beq .C3BC

    ldy #$54
.C3BC:
    sty $37
    lda.w rosebud_data_C7A5,X
    clc
    adc $38
    sta $38
    rts

;-----

.C3C7:
    !A16
    lda.b obj.pos_x+1 : sta $2D
    lda.b obj.pos_y+1 : sta $2F
    !A8
    ldx #$2E : jsl update_pos_xy_2
    lda.b obj.direction : asl #2 : tay
    jsl _01A4E2
    bcc .C3F0

    !A16
    lda $2D : sta.b obj.pos_x+1
    lda $2F : sta.b obj.pos_y+1
    !A8
.C3F0:
    dec $37
    bne .C3FA

    stz $0F
    lda #$20 : sta $37
.C3FA:
    rts
}

namespace off
