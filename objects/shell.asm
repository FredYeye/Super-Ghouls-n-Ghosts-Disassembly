namespace shell

{
create:
    lda #$01 : sta $08
    lda #$90 : sta $09
    stz $2D
    stz $2E
    stz $2F
    stz $30
    stz $31
    stz $32
    stz $33
    !A16
    lda.w #_00C971 : sta $13
    !A8
    stz $15
    jsl set_hp
.D223:
    ldy #$46 : ldx #$22 : jsl set_sprite ;idle
    ldx #$26 : jsl _0196EF : sta $34
.D233:
    brk #$00

;----- D235

    jsl _01A593
    bne .D25D

    jmp destroy_D305 ;remove shell if it didn't land on solid ground

    ;unused code start
    dec $34
    bne .D233

    ldy #$48 : ldx #$22 : jsl set_sprite
    lda #$A0 : sta $32
.D24E:
    brk #$00

;----- D250

    jsl _01A593
    bne .D259
    ;unused code end

.D256:
    jmp destroy_D305

.D259:
    ;unused code start
    dec $32
    bne .D24E
    ;unused code end

.D25D:
    lda $2D
    beq .D267

    stz $2D
    ldy #$1A
    bra .D26B

.D267:
    inc $2D
    ldy #$1B
.D26B:
    jsl set_speed_xyg
    lda #$68 : sta $32
.D273:
    brk #$00

;----- D275

    jsl _01A593
    beq .D256

    dec $32
    bne .D273

    ldy #$4A : ldx #$22 : jsl set_sprite ;jump, before shooting pearl
    inc $2E
.D289:
    brk #$00

;----- D28B

    jsl update_pos_xyg_add
    jsl _01A559
    bne .D2F1

    lda $30
    bne .D2D9

    ldy #$00 : jsl arthur_range_check_y
    bcs .D2D9

.D2A1:
    inc $33
    ldy #$4C : ldx #$22 : jsl set_sprite ;shooting pearl
    lda #$10 : sta $31
.D2AF:
    brk #$00

;----- D2B1

    jsl update_pos_xyg_add
    jsl _01A559
    bne .D2F1

    lda $25
    cmp #$01
    bne .D2D1

    cmp $3C
    beq .D2D1

    lda #$72 : sta $1D
    lda #!id_shell_pearl : jsl prepare_object
    inc $30
.D2D1:
    lda $25 : sta $3C
    dec $31
    bne .D2AF

.D2D9:
    lda $2F
    bne .D2E9

    lda.b obj.speed_y+2
    bmi .D2E9

    lda $33
    bne .D2E9

    inc $2F
    bra .D2A1

.D2E9:
    lda $09
    and #$40
    beq destroy_D305

    bra .D289

.D2F1:
    stz $2E
    stz $2F
    stz $30
    stz $33
    jmp .D223

;-----

destroy:
    lda #!sfx_death : jsl _018049_8053
    jmp _028BEC

;-----

.D305:
    jmp _0281A8_81B5

;-----

thing:
    jsl get_arthur_relative_side : sta.b obj.facing
    jsl update_animation_normal
    lda $2E
    beq .D31E

    jsr _02FA37_FA6D
    jsr _02FB62_FB69
    bra .D321

.D31E:
    jsr _02FB9C_FBC0
.D321:
    jmp _02FD62_FD7C
}

namespace off
