{
_01A87C: ;a8 x8
    jsl disable_nmi
    jsl _01834C
    jsl _018366
    lda #$0F : sta $02F2
    jsl _018074
if !version == 0 || !version == 1
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldx #$A8 : jsl _0180C7_ram_to_vram
    ldy #$A8 : jsl _01A21D_decompress_graphics
    ldx #$9A : jsl _0180C7_ram_to_vram
    lda #$04 : jsl _048E68
elseif !version == 2
    ldx #$30 : jsl _0180C7
    ldx #$9A : jsl _0180C7_ram_to_vram
    lda #$01 : jsl _048E68
endif
    stz $02E1
    !A16
    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    !A8
if !version == 0 || !version == 1
    lda #$08 : jsl _0183D4_83DB
    lda #$0B : jsl _0190B9_palette_to_ram
    ldx #$04 : ldy #$18 : lda.b #_01FF00_1C : jsl _01A6FE
    jsl enable_nmi
elseif !version == 2
    lda #$00 : jsl _01A8CD
    lda #$8F : sta $02F2
    jsl enable_nmi
    lda #$62 : jsl _018049_8053
    lda.b #25 : jsl current_task_suspend
    ldx #$02 : ldy #$18 : lda.b #_01FF00_1C : jsl _01A6FE
endif
.A8DC:
    lda.b #1 : jsl current_task_suspend
    lda $0066
    bne .A8DC

if !version == 0 || !version == 1
    lda #$62 : jsl _018049_8053
    lda #$3F : sta $0055
elseif !version == 2
    lda.b #18 : jsl current_task_suspend
    ldy #$30 : lda.b #_01FF00_74 : jsl _01A6FE
.A964:
    lda.b #1 : jsl current_task_suspend
    lda $007E
    bne .A964

    lda #$2E : sta $0055
endif
.A8F2:
    lda.b #1 : jsl current_task_suspend
    lda.w p1_button_hold+1
    bit #!start
    bne .A904

    dec $0055 : bne .A8F2

.A904:
    ldx #$04 : ldy #$18 : lda.b #_01FF00_20 : jsl _01A6FE
.A90E:
    lda.b #1 : jsl current_task_suspend
    lda $0066
    bne .A90E

if !version == 0 || !version == 1
    lda #$00 : sta $0278
elseif !version == 2
    stz $0278
endif
.A91E:
    lda $0278 : asl : tax
    jsr (.A928,X)
    bra .A91E

.A928:
    dw .AAC1, .ABB3, .AB59, .AC08, _01B19D, .AB61
    dw .ABA0, .AC16, .AAB4, .AAB0, .A940, .A945

.A940:
    jsl _03F8A3
    rts

.A945:
    lda $0279
    asl
    tax
    jmp (+,X) : +: dw .A955, .A96A, .A9CE, .AA8E

.A955:
    lda #$80 : sta $0276
    lda #$01 : sta.w difficulty_base : sta.w difficulty
    stz.w loop
    lda #$00 : sta $1FC7
.A96A:
    ldx #$01
    lda $1FC7
    cmp #$0A
    bne +

    ldx #$FF
+:
    stx $0292
    lda $1FC7
    pha
    clc
    adc #$03
    sta $1FC4
    stz $1FC3
    lda #$02 : sta $1FB9
    lda #$01 : sta $1FC6
    pla
    asl #2
    tax
    lda.w _00B4FE+0,X : sta.w stage
    lda.w _00B4FE+1,X : sta.w checkpoint
    !A16
    lda.w _00B4FE+2,X : sta $1FD4
    stz $1FD6
    !A8
    jsr .ABB3
if !version == 2
    ldx #$02 : jsr .AC7D_eu
endif
    lda $1FC7
    cmp #$0B
    bne +

    lda #!arthur_state_gold : sta.w arthur_state_stored
    lda #!id_arthur_plume : sta.w upgrade_state_stored
    lda #!id_shield       : sta.w shield_state_stored
+:
    lda #$03 : sta $0278
    stz $0279
    rts

;-----

.A9CE:
    jsl _018049_8051
    lda.b #63 : jsl current_task_suspend
    ldy $1FC7
    ldx.w _00B52E_B52E,Y : ldy #$90 : lda.b #_01FF00_68 : jsl _01A6FE
.A9E6:
    lda.b #1 : jsl current_task_suspend
    lda $00DE
    bne .A9E6

    ldy #$AF : jsl _01A21D_decompress_graphics
    ldy $1FC7 : lda.w _00B52E_B546,Y : sta $02D5
    lda #$18 : sta $031E
    lda.b #1 : jsl current_task_suspend
    !AX16

    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    stz $19CD
    stz $19D1
    !AX8
    stz $02F0
    stz $02E1
    lda.b #3 : jsl current_task_suspend
    lda #$00
    xba
    lda #$45 : jsl _018061_8064
    ldx $1FC7
    lda.w _00B52E_B53A,X : jsl _0183D4_83DB
    lda.b #1 : jsl current_task_suspend
    lda #$84 : sta $02EC
    ldx #$08 : ldy #$90 : lda.b #_01FF00_6C : jsl _01A6FE
    !A16
    ldx #$1C : lda #$0010 : ldy #$00 : jsl _019136_9187
    !A8
.AA64:
    lda.b #1 : jsl current_task_suspend
    lda $00DE
    bne .AA64

    lda.b #126 : jsl current_task_suspend
    lda.b #_01FF00_0C : ldy #$90 : ldx #$08 : jsl _01A6FE
.AA7F:
    lda.b #1 : jsl current_task_suspend
    lda $00DE
    bne .AA7F

    inc $0279
    rts

;-----

.AA8E:
    inc $1FC7
    lda $1FC7
    cmp #$0C
    bne .AAAA

    jsl _01834C
    jsl _018074
    lda.b #1 : jsl current_task_suspend
    jml _03F8A3

.AAAA:
    lda #$01
    sta $0279
    rts

.AAB0:
    stz $0278
    rts

.AAB4:
    lda #$02 : sta $0022
    jsl _049085
    stz $0278
    rts

.AAC1:
    lda $0279 : asl : tax
    jsr (.AACA,X)
    rts

.AACA: dw .AAD6, .AADE, .AB0E, .AADE, .AB40, .AB44

;-----

.AAD6:
    jsl _048C43
    inc $0279
    rts

;-----

.AADE:
    stz.w stage
    stz.w checkpoint
    stz $1FB9
    stz $0276
    stz.w loop
    stz $0292
    stz.w money_bag_count
    jsl _048EAD
    stz $1FEF
    lda.w options.sound : lsr : tax
    lda.w _00B55A,X : jsl _018049_8053 ;sound related, stop sounds maybe?
    lda.w options.difficulty : lsr : sta.w difficulty_base
    rts

;-----

.AB0E: ;gets here when demo is loading
    lda #$02 : sta $1FB9
    lda #$01 : sta $1FC6
    lda $1FC7
    stz $1FC3
    sta $1FC4
    lda $1FC7 : sta.w stage
    lda #$00  : sta.w checkpoint
    jsr .ABB3
if !version == 2
    ldx #$02 : jsr .AC7D_eu
endif
    lda $1FC7 : eor #$01 : sta $1FC7
    lda #$03  : sta $0278
    stz $0279
    rts

;-----

.AB40:
    stz $0279
    rts

;-----

.AB44: ;on pressing game start
    jsl _03F526_F527 ;play cutscene
    lda #$05 : sta.w continues
    inc $0278
    stz $0279
    stz $1FB9
    rts

    rts : rts ;dead code

;-----

.AB59:
    jsl _049310
    inc $0278
    rts

;-----

.AB61:
    dec.w extra_lives
    bmi .AB70

    lda #$02 : sta $0278
    jsl _049252
    rts

.AB70: ;game over
    jsl _049085 ;show game over text & play music?
    lda.w continues
    beq .AB9C

    stz $1FB3
    stz $1FB4
    inc $1FB5
    jsl _049121
    lda $1FB3
    beq .AB9C

    jsl _049252
    lda.w current_weapon_stored : pha
    jsr .ABB3
    pla : sta.w current_weapon_stored
    lda #$02
.AB9C:
    sta $0278
    rts

;-----

.ABA0: ;time over
    jsl _048FDD
    dec.w extra_lives
    bmi .AB70

    lda #$02 : sta $0278
    jsl _049252
    rts

;-----

.ABB3: ;after start cutscene is over
    ldx #$21
.ABB5:
    stz $0293,X
    dex : bpl .ABB5

    lda #!arthur_state_steel : sta.w arthur_state_stored
    !A16
    lda #$5F00 : sta $0318
    lda #$0200 : sta $031A
    !A8
    ldx.w options.controls
if !version == 0 || !version == 1
    lda.w _00B55C_shot_buttons+0,X : sta.w shot_buttons
    lda.w _00B55C_shot_buttons+1,X : sta.w shot_buttons+1
    lda.w _00B55C_jump_buttons+0,X : sta.w jump_buttons
    lda.w _00B55C_jump_buttons+1,X : sta.w jump_buttons+1
elseif !version == 2
    jsr .AC7D_eu
endif
    lda.w options.extra_lives : lsr : sta.w extra_lives
    lda #$C3 : sta.w rng_state
    lda #$01 : sta.w rng_state+1
    lda #$02 : sta $029E
    stz.w frame_counter
    inc $0278
    rts

;-----

if !version == 2
.AC7D_eu:
    lda.w _00B55C_shot_buttons+0,X : sta.w shot_buttons
    lda.w _00B55C_shot_buttons+1,X : sta.w shot_buttons+1
    lda.w _00B55C_jump_buttons+0,X : sta.w jump_buttons
    lda.w _00B55C_jump_buttons+1,X : sta.w jump_buttons+1
    rts
endif

;-----

.AC08: ;load stage (1)?
    jsr .AC99
    stz $0277
    jsl _018360
    inc $0278
    rts

;-----

.AC16: ;mosaic transition
    jsl _0180A6
    lda.b #63 : jsl current_task_suspend
    ldx #$0F
.AC22:
    stx !MOSAIC
    lda.b #1 : jsl current_task_suspend
    clc
    txa
    adc #$10
    tax
    and #$F0
    bne .AC22

    stz !MOSAIC
    lda $1F9D : sta.w stage
    jsl _01DCCF
    jsr .AC99
    inc $0277
    lda #$01
    ldx.w stage
    bne .AC50

    lda #$00 ;runs during 2-1 fade in
.AC50:
    sta.w checkpoint
    jsl _01DE0B
    lda $02D5 : and #$0F : sta $02D5 : sta $02D5 ;double stores here for some reason
    lda $02D7 : and #$0F : sta $02D7 : sta $02D7 ;^
    inc $0379
    jsr _01B26D_B271
    jsr _01B90E_B912
    jsl _018360
    lda #$08
    ldx #$FF
.AC7E:
    stx !MOSAIC
    lda.b #4 : jsl current_task_suspend
    sec
    txa
    sbc #$10
    tax
    cpx #$FF
    bne .AC7E

    stz !MOSAIC
    lda #$04 : sta $0278
    rts

;-----

.AC99:
    jsl disable_nmi
    jsl _01834C
    !A16
    lda #$5F00 : sta $0318
    lda #$0200 : sta $031A
    !A8
    lda.w difficulty_base : asl : tax
    lda.w loop
    beq .ACBC

    inx
.ACBC:
    lda.w _00B552,X
    ldy $1FB9
    beq .ACC4

if !version == 2
    lda #$01
endif
.ACC4:
    sta.w difficulty
    asl
    tax
    lda.w random_values_difficulty_offset+0,X : sta $003D
    lda.w random_values_difficulty_offset+1,X : sta $003E
    jsl _058000
    jsl _0180B9
    jsl _018CE2
    jsl _0180A6
    jsr _01B4DE
    lda.w current_weapon_stored : sta.w weapon_current
    and #$1E  : sta.w existing_weapon_type
    lda.w arthur_state_stored
    cmp #!arthur_state_transformed
    bcc +

    lda #!arthur_state_steel
+:
    sta.w armor_state
    sta.w transform_armor_state_stored

    cmp #!arthur_state_gold
    bne +

    lda #$01 : sta.w can_charge_magic
    stz $14B3
+:
    lda.w shield_state_stored
    beq .AD21

    sta.w !obj_shield.type
    lda.w shield_type_stored : sta.w !obj_shield.init_param
    lda #$0C                 : sta.w !obj_shield.active
.AD21:
    lda.w upgrade_state_stored
    beq +

    sta.w !obj_upgrade.type
    lda #$0C : sta.w !obj_upgrade.active
+:
    lda #$30 : ora $02F1 : sta $02F1
    !X16
    ldx #$1000 : jsl _018091
    jsl _018074
    !AX8
    jsl _0190B9_90CB
    jsl _019539
    lda.w stage
    cmp #$02
    bne +

    lda #$19 : sta $02DE
+:
    jsl _018DC0
    lda.w stage
    bne +

    lda.w checkpoint
    beq +

    ldx #$16 : jsl _018DC0_8E0E
+:
    ldx.w stage
    lda.w _00B56C,X : sta $02D9
    and #$07 : dec  : sta $02DA
    stz $1F8F
    stz $1F90
    cpx #$00
    beq .AD8C

    dec $1F8F
    dec $1F90
.AD8C:
    lda #$0C : sta.w !obj_arthur.active
    jsl _019024
    lda $0292 : and #$01 : eor #$01 : sta $032E
    jsl _019136
    jsr _01BE1C
    jsr _01B526 ;set arthur spawn point and other things
    jsr _01B4EF_B50E
    jsr _01BF31
    jsr _01BEBC
    jsl _048A6B
    stz $02D5
    stz $02D6
    jsl disable_nmi
    jsr _01AF04_AF08
    jsr .AE55
    jsr _01F66A
    stz.w pot.enemy_counter
    stz.w pot.counter
    lda #$03 : sta.w pot.weapon_req
    lda #$0A : sta.w pot.armor_statue_req
    lda #$20 : sta.w pot.extend_req
    lda #$00 : jsl _0183D4_83DB
    lda #$43 : sta $02EC
    lda #$05 : sta.w timer_minutes
    lda #$00 : sta.w timer_tens
    lda #$00 : sta.w timer_seconds
    stz.w timer_ticks
    lda #$01 : sta $1F1C
    lda #$02 : sta $0284
    inc.w hud_update_score
    inc.w hud_update_timer
    inc $036E
    inc.w hud_update_lives
    jsr _01B4C5
    jsl _04F000
    jsr _01F6D7
    lda.w stage
    bne .AE2C

    ldx #$00 : jsl water_crash_to_ram
    ldx #$02 : jsl water_crash_to_ram
.AE2C:
    lda #$31 : sta $02F1
    jsl enable_nmi
    lda $02DA
    bne .ret

    ldx #$1F
.AE3C:
    phx
    jsl _04F003
    jsr _01F6E9
    jsr _01B2D6
    inc $0379
    lda.b #1 : jsl current_task_suspend
    plx
    dex : bne .AE3C

.ret:
    rts

;-----

.AE55:
    lda #$01 : sta $1F57 : sta $1F5C
    stz $1F61
    lda #$03 : sta !DMAP1
    lda #$11 : sta !BBAD1
    lda #$57 : sta !A1T1L
    lda #$1F : sta !A1T1H
    lda #$00 : sta !A1B1
    stz !DAS1B
    lda #$01 : sta $1F62 : sta $1F67
    stz $1F6C
    lda #$04 : sta !DMAP3
    lda #$09 : sta !BBAD3
    lda #$62 : sta !A1T3L
    lda #$1F : sta !A1T3H
    lda #$00 : sta !A1B3
    stz !DAS3B
    lda #$01 : sta $1F6D : sta $1F6F
    stz $1F71
    lda #$00 : sta !DMAP4
    lda #$05 : sta !BBAD4
    lda #$6D : sta !A1T4L
    lda #$1F : sta !A1T4H
    lda #$00 : sta !A1B4
    stz !DAS4B
    lda #$01 : sta $1F78 : sta $1F7B
    stz $1F7E
    lda #$01 : sta !DMAP5
    lda #$2C : sta !BBAD5
    lda #$78 : sta !A1T5L
    lda #$1F : sta !A1T5H
    lda #$00 : sta !A1B5
    stz !DAS5B
    lda #$00
    ldx $0292
    bne +

    lda #$3A
    ora $02F0
+:
    sta $02F0
    jsr _01B26D_B271
    rts
}
