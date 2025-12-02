namespace skulls

{
create:
    lda $07
    cmp #$05
    bcc .CA5B

    jmp _CB35

.CA59:
    brk #$00

;----- CA5B

.CA5B:
    ldx $07
    lda $00A1 ;stage section/event counter?
    cmp.w skulls_data_C910,X
    bcc .CA59

    lda #$05 : sta $08 : sta $07
    lda #$10 : sta $09
    ldy #$AA : ldx #$21 : jsl set_sprite
    !A16
    lda $1F : sta $17
    lda $22 : sta $1A
    !A8
.CA83:
    brk #$00

;----- CA85

    jsr _0281A8
    ldy #$10 : jsl arthur_range_check
    bcs .CA83

    jsl get_rng_16
    lda.w skulls_data_cooldown1,X
    ldx.w difficulty
    clc
    adc.w skulls_data_cooldown1_difficulty,X
    sta $3B
.CAA0:
    brk #$00

;----- CAA2

    jsr _CB0F_CB18
    dec $3B
    bne .CAA0

    ldx #$68 : jsl _0196EF
    sta $2D
    jsr _CB29
    lda #$10 : sta $3B
.CAB8:
    brk #$00

;----- CABA

    jsr _CB0F_CB18
    dec $3B
    bne .CAB8

    jsl call_rng
    and #$01
    sta $2E
    clc
    adc $2D
    tax
    lda.w skulls_data_C913,X
    jsr _CB29
    lda #$10 : sta $3B
.CAD7:
    brk #$00

;----- CAD9

    jsr _CB0F_CB18
    dec $3B
    bne .CAD7

    lda $2E
    inc
    and #$01
    clc
    adc $2D
    tax
    lda.w skulls_data_C913,X
    jsr _CB29
    lda #$10 : sta $3B
.CAF3:
    brk #$00

;----- CAF5

    jsr _CB0F_CB18
    dec $3B
    bne .CAF3

    jsl get_rng_16
    lda.w skulls_data_cooldown2,X
    ldx.w difficulty
    clc
    adc.w skulls_data_cooldown2_difficulty,X
    cop #$00

;----- CB0C

    jmp .CA83

;-----

_CB0F: ;moving platform calls this for shaking
    jsr .CB18
    rtl

;-----

.CB13: ;a8 x8
    ;used by money bag
    lda.w stage1_earthquake_active
    beq .CB28

.CB18:
    jsl call_rng
    and #$07
    sta.b obj.direction
    lda #$01 : ldx #$30 : jsl _018B25
.CB28:
    rts

;-----

_CB29:
    asl
    adc #$12
    sta $1D
    lda #!id_skulls : jsl prepare_object
    rts

;-----

_CB35:
    ldy #$AC : ldx #$21 : jsl set_sprite
    ldy #$1E : jsl set_speed_xyg
    jsl _02F9DA
    lda #!sfx_skulls : jsl _018049_8053
.CB4D:
    brk #$00

;----- CB4F

    jsl update_pos_xyg_add
    bra .CB4D

;-----

thing:
    jsl update_animation_normal
    jsr _02FB9C_FBC0
    jsr _02FA37_FA65
    jsr _02FD62_FD7C
    jmp _028074_8087
}

namespace off
