org $038000

{
    incsrc "various/stage_layouts.asm"        ;8000 - 846F 
    incsrc "various/palette_cycling_data.asm" ;8470 - 9C08
    incsrc "objects/princess_dialogue.asm"    ;9C09 - 9DD9
    incsrc "task_fns/_039DDA.asm"             ;9DDA - 9E78
    incsrc "objects/tower_edge.asm"           ;9E79 - 9F3F
    incsrc "objects/silk_gate.asm"            ;9F40 - 9F9B
    incsrc "objects/gargoyle_statue.asm"      ;9F9C - A2FB
    incsrc "objects/_03A2FC.asm"              ;A2FC - A337
    incsrc "objects/geyser.asm"               ;A338 - A3E6
}

{ ;A3E7 - A42B
_03A3E7: ;unused?

.create:
    lda $07
    bne .A3F5

    ldy #$A8 : ldx #$21 : jsl set_sprite
    bra .A3FD

.A3F5:
    ldy #$AA : ldx #$21 : jsl set_sprite
.A3FD:
    lda $09 : ora #$F4 : sta $09
    lda #$29 : sta $31
.A407:
    brk #$00

;----- A409

    lda $07
    bne .A415

    !A16
    dec $3B
    !A8
    bra .A41B

.A415:
    !A16
    inc $3B
    !A8
.A41B:
    dec $31
    bne .A407

    jml _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _02F9B2
    rtl
}

{
    incsrc "objects/_03A42C.asm"                     ;A42C - A5D6
    incsrc "objects/arremer.asm"                     ;A5D7 - AB46
    incsrc "objects/moving_platform.asm"             ;AB47 - AD4F
    incsrc "objects/skull_flower_multi_inactive.asm" ;AD50 - AD89
    incsrc "objects/skull_flower_multi.asm"          ;AD8A - B113
}

{ ;B114 - B12A
_03B114: ;a8 x-
    lda $09 : ora #$04 : sta $09
    stz.b obj.pos_x
    stz.b obj.pos_y
    !A16
    lda.b obj.pos_x+1 : sta $39
    lda.b obj.pos_y+1 : sta $3B
    !A8
    rtl
}

{
    incsrc "objects/grilian_projectile.asm"       ;B12B - B19D
    incsrc "objects/death_crawler_handler.asm"    ;B19E - B59B
    incsrc "objects/death_crawler_part.asm"       ;B59C - B5F8
    incsrc "objects/death_crawler.asm"            ;B5F9 - B63B
    incsrc "objects/death_crawler_projectile.asm" ;B63C - B710
}

{ ;B711 - B749
_03B711:
    stz $2D
    lda #$04 : sta $1D
.B717:
    ldx $2D
    lda.w _00D16A,X : sta $07
    txa
    asl #2
    tax
    !A16
    lda.w _00D16A_D177+0,X : sta.b obj.pos_x+1
    lda.w _00D16A_D177+2,X : sta.b obj.pos_y+1
    !A8
    inc $2D
    lda $2D
    cmp #$0D
    bne .B73C

    jml _0281A8_81B5

.B73C:
    brk #$00

;----- B73E

    bit $09
    bvc .B73C

    lda #!id_rosebud : jsl prepare_object
    bra .B717
}

{
    incsrc "objects/lava_pillar.asm"  ;B74A - B8B1
    incsrc "objects/menu_control.asm" ;B8B2 - BC14
}

{ ;BC15 - BC84
_03BC15:
    lda #$04 : sta $1D
.BC19:
    !A8
    lda #$20 : cop #$00

;----- BC1F

    !A16
    lda.w camera_x+1
    cmp #$1200
    bcc .BC19

    cmp #$1540
    bcs .BC33

    cmp #$12F0
    bcs .BC19

.BC33:
    sec
    sbc #$1200
    cmp #$0500
    !A8
    bcs .BC81

    jsl call_rng : and #$07 : asl : tax
    !A16
    lda.w camera_x+1
    adc.w tiny_goblin_data_D205,X
    sta.b obj.pos_x+1
    sec
    lda $1737
    sbc.w camera_y+1
    clc
    adc #$0208
    sta.b obj.pos_y+1
    !A8
    lda.w obj_type_count+!id_tiny_goblin
    cmp #$02
    bcs .BC19

    inc.w obj_type_count+!id_tiny_goblin
    lda #!id_tiny_goblin : jsl prepare_object
    jsl get_rng_16
    lda.w tiny_goblin_data_D1F1,X
    ldx.w difficulty
    clc
    adc.w tiny_goblin_data_D201,X
    cop #$00

;----- BC7F

    bra .BC19

.BC81:
    jml _0281A8_81B5
}

{ ;BC85 - BE25
    incsrc "objects/tiny_goblin.asm"
}

{ ;BE26 - BF64
_03BE26:

.arremer_projectile_create:
    jsr .BF5C
    ldy #$B4 : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta.b obj.direction
    ldx.w stage
    cpx #$07
    bcc .BE4B

    lda.w arremer_projectile_data_D220-7,X : sta $29
.BE4B:
    brk #$00

;----- BE4D

    bit $09
    bvc .BE7D
    jsl update_animation_normal
    ldx #$44 : jsl update_pos_xy_2
    bra .BE4B

;-----

.arremer_projectile_thing:
    ldx $2F
    !A16
    lda.w camera_x+1
    cmp.w arremer_data_CF08,X
    !A8
    bcs .BE79

    jsl _02F9BE
    ldy #$0A : jsl _02F9CE
    jml _02F9B2

.BE79:
    jml _0281DD

.BE7D:
    jml _0281A8_81B5

;-----

.killers_create:
    jsr .BF5C
    ldy #$E0 : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    lda.b obj.direction : sta $2D
    ldx $07
    lda.w arremer_projectile_data_D222,X : sta $2E
    ldx.w stage
    cpx #$07
    bcc .BEA7

    lda.w arremer_projectile_data_D220-7,X : sta $29
.BEA7:
    !A16
    lda.b obj.pos_x+1 : sta.b obj.speed_x+1
    lda.b obj.pos_y+1 : sta.b obj.speed_y+1
    !A8
    lda #$60 : sta $3B
.BEB7:
    brk #$00

;----- BEB9

    inc $0F : inc $0F
    jsr .BEF3
    lda $0F : cmp #$10
    bne .BEB7

.BEC6:
    brk #$00

;----- BEC8

    lda $2E : inc #2 : and #$3F : sta $2E
    jsr .BEF5
    lda $2D : sta.b obj.direction
    dec $3B
    bne .BEC6

    lda #$06 : cop #$00

;----- BEDF

    jsl set_direction32
    inc
    and #$1F
    lsr
    sta.b obj.direction
.BEE9:
    brk #$00

;----- BEEB

    ldx #$14 : jsl update_pos_xy_2
    bra .BEE9

;-----

.BEF3:
    lda $2E
.BEF5:
    sta.b obj.direction
    lda $0F
    ldx #$06 : jsl _018B25
    rts

;-----

.killers_destroy:
    lda $0F
    bmi .arremer_projectile_destroy

    ldy #$E6 : ldx #$21 : jsl set_sprite
    ldy #$07 : jsl update_score
    lda #!sfx_death : jsl _018049_8053
.BF18:
    brk #$00

;----- BF1A

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .BF18

    jml _0281A8_81B5

;-----

.arremer_projectile_destroy:
    stz $29
    stz $2A
    jml _028BB9

;-----

.killers_thing:
    bit $09
    bvc .BF58

    ldx $2F
    !A16
    lda.w camera_x+1
    cmp.w arremer_data_CF08,X
    !A8
    bcs .BF58

    jsl update_animation_normal
    jsl _02F9BA
    jsl _02F9B6
    ldy #$0A : jsl _02F9CE
    jml _02F9B2

.BF58:
    jml _0281DD

;-----

.BF5C:
    ldx.w stage
    lda.w arremer_projectile_data_D219-2,X : sta $2F
    rts
}

{
    incsrc "objects/killer.asm"                      ;BF65 - C1B5
    incsrc "objects/hannibal_projectile.asm"         ;C1B6 - C1E9
    incsrc "objects/explosion_spawner.asm"           ;C1EA - C2C4
    incsrc "objects/game_over_text_flames.asm"       ;C2C5 - C30D
    incsrc "objects/_03C30E.asm"                     ;C30E - C329
    incsrc "objects/coral.asm"                       ;C32A - C34E
    incsrc "objects/waterfall_end.asm"               ;C34F - C366
    incsrc "objects/silk_platform.asm"               ;C367 - C391
    incsrc "objects/crumbling_wall.asm"              ;C392 - C472
    incsrc "objects/lava_dropper.asm"                ;C473 - C55B
    incsrc "objects/lava.asm"                        ;C55C - C5B8
    incsrc "objects/cockatrice_head2_spawner.asm"    ;C5B9 - C69F
    incsrc "objects/cockatrice_head2.asm"            ;C6A0 - CB93
    incsrc "objects/cockatrice_head2_projectile.asm" ;CB94 - CBCC
    incsrc "objects/ice_bridge_segment.asm"          ;CBCD - CC60
    incsrc "objects/ice_bridge_spawner.asm"          ;CC61 - CCC9
    incsrc "objects/intro_cutscene_obj.asm"          ;CCCA - D0D6
    incsrc "objects/astaroth.asm"                    ;D0D7 - D36E
    incsrc "objects/nebiroth.asm"                    ;D36F - D5C8
    incsrc "objects/astaroth_nebiroth_body.asm"      ;D5C9 - D5F1
    incsrc "objects/astaroth_projectiles.asm"        ;D5F2 - D7BB
    incsrc "objects/nebiroth_flame.asm"              ;D7BC - D831
    incsrc "objects/nebiroth_laser.asm"              ;D832 - D8C4
    incsrc "objects/conveyor_belt.asm"               ;D8C5 - DA9F
    incsrc "objects/gate2.asm"                       ;DAA0 - DB5E
    incsrc "objects/mad_dog.asm"                     ;DB5F - DD3B
    incsrc "objects/grilian.asm"                     ;DD3C - DF1E
    incsrc "objects/avalanche.asm"                   ;DF1F - E15F
    incsrc "objects/veil_allocen_spawner.asm"        ;E160 - E1F2
    incsrc "objects/veil_allocen.asm"                ;E1F3 - E4EF
    incsrc "objects/veil_allocen_part.asm"           ;E4F0 - E54D
}

{ ;E54E - E743
_03E54E:

.create:
    lda #$80 : sta $09
    !A16
    lda.w _00ED00+$6C : sta $27
    lda #$0120 : sta $29
    !A8
    lda #$FF : sta $26
.E564:
    stz $1EBF
.E567:
    brk #$00

;----- E569

    lda $1EC1
    beq .E567

    jsl set_direction32 : sta.b obj.direction
    inc $1EBF
    ldy #$3A : ldx #$22
    lda.b obj.facing
    bne .E583

    ldy #$3E : ldx #$22
.E583:
    jsl set_sprite
    jsr .E5C1
.E58A:
    brk #$00

;----- E58C

    ldx #$54 : jsl update_pos_xy_2
    jsr .E5B3
    dec $2D
    bne .E58A

    lda.b obj.direction : eor #$10 : sta.b obj.direction
.E59F:
    brk #$00

;----- E5A1

    ldx #$54 : jsl update_pos_xy_2
    jsr .E5B3
    dec $2E
    bne .E59F

    stz $1EC1
    bra .E564

;-----

.E5B3:
    lda.w frame_counter
    and #$0F
    bne .E5C0

    lda #$67 : jsl _018049_8053
.E5C0:
    rts

;-----

.E5C1:
    !A16
    sec
    lda.b obj.pos_y+1
    sbc.w !obj_arthur.pos_y+1
    bpl .E5D2

    eor #$FFFF
    inc
    sta $0000
.E5D2:
    sec
    lda.b obj.pos_x+1
    sbc.w !obj_arthur.pos_x+1
    bpl .E5DE

    eor #$FFFF
    inc
.E5DE:
    cmp $0000
    bcs .E5E6

    lda $0000
.E5E6:
    clc
    adc #$0000
    lsr
    !A8
    sta $2D
    sta $2E
    rts

;-----

.thing:
    lda $1EBF
    bne .E601

    ldy #$00 : jsr .E65E
    jsr .E62E
    bra .E609

.E601:
    jsl _02F9B2
    jsl _02F9C2
.E609:
    lda $08
    and #$F8
    ldx.b obj.facing
    bne .E613

    ora #$01
.E613:
    sta $08
    jsr .E734
    jsl update_animation_normal
    jsl _018E32_8E73
    rtl

;-----

.E621:
    !X16
    ldx $1EB7
    lda.w obj.facing,X : sta.b obj.facing
    !X8
    rts

;-----

.E62E:
    jsr .E621
    ldy #$3C : ldx #$22
    lda.b obj.facing
    beq .E63D

    ldy #$38 : ldx #$22
.E63D:
    jsl set_sprite
    rts

;-----

.claw2_destroy:
    jsr .E720
    bra .E64A

;-----

.destroy:
    jsr .E62E
.E64A:
    ldy #$40 : jsl set_speed_xyg
.E650:
    brk #$00

;----- E652

    jsl update_pos_xyg_add
    bit $09
    bvs .E650

    jml _0281A8_81B5

;-----

.E65E:
    !AX16
    ldx $1EB7
    lda.w obj.facing,X
    and #$00FF
    beq .E671

    clc
    tya
    adc #$0008
    tay
.E671:
    clc : lda.w obj.pos_x+1,X : adc.w veil_allocen_data_D628+0,Y : sta.b obj.pos_x+1
    clc : lda.w obj.pos_y+1,X : adc.w veil_allocen_data_D628+2,Y : sta.b obj.pos_y+1
    !AX8
    rts

;-----

.claw2_create:
    lda #$80 : sta $09
    !A16
    lda.w _00ED00+$6C : sta $27
    lda #$0100 : sta $29
    !A8
    lda #$FF : sta $26
.E69C:
    stz $1EC0
.E69F:
    brk #$00

;----- E6A1

    lda $1EC2
    beq .E69F

    lda #$67 : jsl _018049_8053
    jsl set_direction32 : sta.b obj.direction
    inc $1EC0
    ldy #$3A : ldx #$22
    lda.b obj.facing
    beq .E6C1

    ldy #$3E : ldx #$22
.E6C1:
    jsl set_sprite
    jsr .E5C1
.E6C8:
    brk #$00

;----- E6CA

    ldx #$54 : jsl update_pos_xy_2
    jsr .E5B3
    dec $2D
    bne .E6C8

    lda.b obj.direction : eor #$10 : sta.b obj.direction
.E6DD:
    brk #$00

;----- E6DF

    ldx #$54 : jsl update_pos_xy_2
    jsr .E5B3
    dec $2E
    bne .E6DD

    stz $1EC2
    bra .E69C

;-----

.claw2_thing:
    lda $1EC0
    bne .E700

    ldy #$04 : jsr .E65E
    jsr .E720
    bra .E708

.E700:
    jsl _02F9B2
    jsl _02F9C2
.E708:
    lda $08
    and #$F8
    ldx.b obj.facing
    beq .E712

    ora #$01
.E712:
    sta $08
    jsl update_animation_normal
    jsl _018E32_8E73
    jsr .E734
    rtl

;-----

.E720:
    jsr .E621
    ldy #$38 : ldx #$22
    lda.b obj.facing
    beq .E72F

    ldy #$3C : ldx #$22
.E72F:
    jsl set_sprite
    rts

;-----

.E734:
    lda $1ED7
    beq .E743

    lda $09 : and #$7F : sta $09
    lda #$8C : sta.b obj.active
.E743:
    rts
}

{
    incsrc "objects/veil_allocen_projectile.asm" ;E744 - E7BA
    incsrc "objects/freeze_splinter.asm"         ;E7BB - E7FD
}

{ ;E7FE - E824
_03E7FE: ;a8 x8
    ;set option settings on boot
    ldx #$0A
.E800:
    lda $1FDE,X
    cmp.w _00D638_D63D,X
    bne .E819

    dex : bpl .E800

    ldx #$04
.E80D:
    lda.w options,X
    cmp.w _00D638_D648,X
    bcs .E819

    dex : bpl .E80D

    rtl

.E819:
    ldx #$0F
-:
    lda.w _00D638,X : sta.w options,X
    dex : bpl -

    rtl
}

{
    incsrc "objects/samael.asm"          ;E825 - EC75
    incsrc "objects/samael_platform.asm" ;EC76 - ED7A
    incsrc "objects/samael_laser.asm"    ;ED7B - EDE1
    incsrc "objects/princess.asm"        ;EDE2 - EE1C
}

if !version == 0 || !version == 1
{ ;EE1D - EF85
_03EE1D: ;a8 ;x8
    ;printing text on screen
if !version == 1
    phb
    lda #$04 : pha : plb
endif
    stz $1EC3
    stz $1EC4
    lda $0055,Y : asl : tay
    !AX16
    lda.w text,Y
    tay
.EE2E:
    ldx.w text_base,Y
    iny #2
.EE33:
    !A8
    lda.b #8 : jsl current_task_suspend
.EE3B:
    lda.w text_base,Y
    cmp #$FF
    bne .EE46

if !version == 1
    plb
endif
    jml current_task_remove ;FF: exit

.EE46:
    cmp #$FD
    beq .new_line

    cmp #$FE
    beq .move_cursor

    cmp #$FB
    beq .clear_text

    cmp #$FA
    beq .new_page

    cmp #$FC
    beq .pause

    cmp #$F8
    beq .EE71

if !version == 0
    jsr .EF10
elseif !version == 1
    jsr .EF18
endif
    bra .EE33

;-----

.new_page:
    iny
    bra .EE2E

;-----

.pause:
    iny
    lda.w text_base,Y : jsl current_task_suspend ;frame count
    iny
    bra .EE3B

;-----

.EE71:
    ;choose text palette? unused?
    iny
    lda.w text_base,Y
    !A16
    asl #10
    and #$1C00
    sta $1EC3
    !A8
    iny
    bra .EE3B

;-----

.move_cursor:
    iny
    lda.w text_base,Y ;tile count
    asl
    !A16
    stx $1EBD
    clc
    adc $1EBD
    tax ;x(the "cursor") += tile_count * 2
    !A8
    iny
    bra .EE3B

;-----

.new_line:
    !A16
    txa
    clc
    adc #$0080
    and #$FF80
    tax
    iny
    !A8
    jmp .EE33

;-----

.clear_text:
    phx
    !A16
    ldx #$0000
    lda #$0400 : sta $1EBF
if !version == 0
    lda #$21BF
elseif !version == 1
    lda #$21C5
endif
    ora $1EC3
.EEC3:
    sta $7F9000,X
    inx #2
    dec $1EBF
    bne .EEC3

    !A8
    inc.w layer3_needs_update
    plx
    iny
    jmp .EE3B

;-----

if !version == 0
.handakuten:
    pha
    phx
    !A16
    txa
    sec
    sbc #$0040
    tax
    lda #$21B9
    bra .EEF4

;-----

.dakuten:
    pha
    phx
    !A16
    txa
    sec
    sbc #$0040 ;adjust position
    tax
    lda #$21B3
.EEF4:
    ora $1EC3
    sta $7F9000,X
    !A8
    plx
    pla
    phy
    phx
    !X8
    and #$7F
    tax
    lda.l .EF31,X ;load base char to place
    !X16
    plx
    ply
    bra .EF18

;-----

.EF10:
    cmp #$C0
    bcs .handakuten

    cmp #$80
    bcs .dakuten
endif

.EF18:
    !A16
    and #$00FF
    clc
    adc #$2180
    ora $1EC3
    sta $7F9000,X
    !A8
    inc.w layer3_needs_update
    iny
    inx #2
    rts

;-----

if !version == 0
.EF31:
    db $05, $06, $07, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $10, $11, $12, $13, $19
    db $1A, $1B, $1C, $1D, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F
    db $45, $46, $47, $48, $49, $4A, $4B, $4C, $4D, $4E, $4F, $50, $51, $52, $53, $59
    db $5A, $5B, $5C, $5D, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F

    db $19, $1A, $1B, $1C, $1D, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F, $3F
    db $59, $5A, $5B, $5C, $5D
endif
}
endif

{ ;EF86 - F1A5
    incsrc "various/tower_tiles.asm" ;EF86 - F1A5
    incsrc "various/hp_list.asm"     ;F1A6 - F525
}

{ ;F526 - F773
_03F526:
    rtl

.F527: ;a8 x8
    lda $02B2
    bne _03F526

    inc $02B2
    jsl _01834C
    jsl _018049_804D
    lda #$15 : jsl _018049_8053 ;start game sound
    jsl _0180B9
    jsr .F606
    jsl enable_nmi ;game start cutscene starts somewhere here
    ldx #$14 : jsr .F620
    lda.b #_01FF00_08 : ldy #$90 : ldx #$02 : jsl _01A6FE
.F557: ;fade in arthur & princess scene
    lda #$01 : jsr .F745
    lda $00DE
    bne .F557

    lda #$50 : jsr .F745
    lda.b #_01FF00_0C : ldy #$90 : ldx #$02 : jsl _01A6FE
.F570: ;fade out arthur & princess scene
    lda #$01 : jsr .F745
    lda $00DE
    bne .F570

    ldx #$00 : jsr .F63D
    ldx #$15 : jsr .F620
    jsr .F606
    jsl _018360
    jsl enable_nmi
    lda #$50 : jsr .F745
    ldx #$02 : jsr .F63D
    jsr .F606
    jsl _018360
    jsl enable_nmi
    lda #$50 : jsr .F745
    ldx #$04 : jsr .F63D
    jsl _01834C
    lda #$10 : jsr .F745
    lda #!sfx_shatter : jsl _018049_8053
    lda #$10 : jsr .F745
    ldx #$16 : jsr .F620
    jsr .F606
    ldy #$26 : jsl _01A21D
    ldx #$28 : jsl _0180C7
    jsl _018360
    jsl enable_nmi
    stz $1EC7
.F5E1:
    lda #$01 : jsr .F745
    lda $1EC7
    beq .F5E1

    lda.b #96 : jsl current_task_suspend
    lda.b #_01FF00_0C : ldy #$90 : ldx #$04 : jsl _01A6FE
.F5FB:
    lda #$01 : jsr .F745
    lda $00DE
    bne .F5FB

    rtl

;-----

.F606:
    lda.w stage
    pha
    jsl _048DF9
    lda #$10 : sta.w stage
    jsl _019136
    pla
    sta.w stage
    rts

;-----

.F61C:
    jsr .F620
    rtl

.F620:
    lda.w stage : pha
    stx.w stage
    jsl _018CE2
    jsl _048A6B
    lda #$0C : sta.w stage
    jsl _058000
    pla : sta.w stage
    rts

.F63D:
    stx $005D
    jsl disable_nmi
    jsl _01834C
    jsl _01951E
    jsl _019539
    lda #$C0 : sta !M7SEL
    jsl _018366
    lda #$07 : sta $02D9
    lda #$11 : jsl _0190B9_palette_to_ram
    ldy #$25 : jsl _01A21D
    stz !VMAIN
    !X16
    ldx #$4000
    stz !VMADDL
    stz !VMADDH
.F678:
    stz !VMDATAL
    dex
    bne .F678

    ldx #$0000
    stz $0000
    stz $0001
    lda #$20 : sta $0002
.F68C:
    lda $0000 : sta !VMADDL
    lda $0001 : sta !VMADDH
    ldy #$0020
.F69B:
    lda $7F0000,X : sta !VMDATAL
    inx
    dey
    bne .F69B

    !A16
    clc
    lda $0000 : adc #$0080 : sta $0000
    !A8
    dec $0002
    bne .F68C

    ldx #$0000
    ldy #$1300
    lda #$80 : sta !VMAIN
    stz !VMADDL
    stz !VMADDH
.F6CA:
    lda $7F0400,X : sta !VMDATAH
    inx
    dey
    bne .F6CA

    !AX8
    inc $1FB0
    lda #$7F : sta $1FA0
    stz $1FA1
    stz $1FA2
    lda #$68 : sta $1FA3
    !A16
    ldx $005D
    lda.w _00EC3F,X : sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    lda #$0068 : sta $02D1
    lda #$0080 : sta $02D3
    !A8
    lda #$01 : sta $02D5 : sta $02D6
    jsl _018360
    jsl enable_nmi
    ldx $005D
    ldy #$60
.F721:
    lda #$01 : jsr .F749
    !A16
    sec
    lda $02C9
    sbc.w _00EC3F+6,X
    sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    !A8
    dey
    bne .F721

    jsl _01834C
    rts

;-----

.F745:
    jsr .F749
    rts

.F749:
    sta $0059
.F74C:
    lda.w p1_button_press+1
    bit #!start
    bne .F767

    phx
    phy
    jsl _018021
    ply
    plx
    lda.b #1 : jsl current_task_suspend
    dec $0059
    bne .F74C

    rts

.F767:
    pla : pla : pla : pla
    jsl _0180A6
    jsl _01834C
    rtl
}

{
    incsrc "objects/cutscene_arthur.asm"   ;F774 - F7DF
    incsrc "objects/cutscene_princess.asm" ;F7E0 - F7F8
    incsrc "objects/satan.asm"             ;F7F9 - F88D
    incsrc "objects/satan_wings.asm"       ;F88E - F8A2
}

{ ;F8A3 -
_03F8A3:
    jsl disable_nmi
    jsl _01834C
    jsl _0180B9
    jsl _018074
    ldy #$28 : jsl _01A21D
    ldy #$29 : jsl _01A21D
    ldx #$29 : jsl _0180C7
    ldx #$2A : jsl _0180C7
    ldx #$2B : jsl _0180C7
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldx #$62 : jsl _0180C7_ram_to_vram
    ldy #$A8 : jsl _01A21D_decompress_graphics
    ldx #$2F : jsl _0180C7
    ldy #$2A : jsl _01A21D
    ldx #$2D : jsl _0180C7
    !AX8
    jsl _01951E
    jsl _019539
    lda $02DC : and #$FC :            sta $02DC
    lda $02DD : and #$FC :            sta $02DD
    lda $02DE : and #$FC : ora #$02 : sta $02DE
    lda #$13 : jsl _0190B9_palette_to_ram
    lda #$12 : sta.w stage
    jsl _019136
    !AX16
    ldx #$0026 : lda #$0080 : ldy #$0100 : jsl _019136_9187
    ldx #$0028 : lda #$0020 : ldy #$0000 : jsl _019136_9187
    !AX8
    jsl enable_nmi
    jsl _018366
    !A16
    lda #$1800 : sta $0318
    lda #$1000 : sta $031A : sta !VMADDL
    stz $1889
    stz $188D
    !X16
    ldx #$0000
    lda #$0800 : sta $0000
    lda #$0045
    ora #$2000
.F976:
    sta $7F9000,X
    inx #2
    dec $0000
    bne .F976

    !AX8
    lda #$05 : sta $02E1
    lda $02D9 : ora #$08 : sta $02D9
    lda $02D7 : ora #$04 : sta $02D7
    lda #$02 : sta !DMAP1
    lda #$0D : sta !BBAD1
    lda #$57 : sta !A1T1L
    lda #$1F : sta !A1T1H
    lda #$00 : sta !A1B1
    stz !DAS1B
    inc $1FAE
    lda #$02 : sta $02F0
    lda #$50 : sta $1F57
    stz $1F58
    stz $1F59
    lda #$50 : sta $1F5A
    stz $1F5B
    stz $1F5C
    lda #$60 : sta $1F5D
    stz $1F5E
    stz $1F5F
    stz $1F60
    lda #$00 : sta $02EB
    lda #$17 : sta $02EC
    lda #$E0 : sta $02EE
    !A16
    stz $1EB7
    stz $1EB9
    stz $1EC1
    stz $1EC3
    stz $1EC5
    !A8
if !version == 0 || !version == 1
    lda #$03 : sta $1EBB
elseif !version == 2
    lda #$02 : sta $1EBB
endif
    lda #$04 : sta $1EBD
    inc.w layer3_needs_update
    lda #$17 : sta $02D5 : sta $02D6
    ldx #$17
    jsl _03F526_F61C
    jsl _018360
    ldx #$18 : ldy #$78 : lda.b #_01FF00_08 : jsl _01A6FE
.FA2B:
    lda.b #1 : jsl current_task_suspend
    jsl _018021
    !A16
    lda $1EC3
if !version == 0 || !version == 1
    and #$01FF
elseif !version == 2
    and #$00FF
endif
    bne .FA42

    jsr .FBA7
.FA42:
    inc $1EC3
    lda $1EB9
    and #$0001
if !version == 0 || !version == 1
    bne .FA7D

    lda $1EB9 ;unused lda
elseif !version == 2
    bne .FA6E
endif
    lda $1F5B : sec : sbc #$0001 : sta $1F5B
    lda $1F58 : clc : adc #$0001 : sta $1F58
    lda $19C5 : sec : sbc #$0001 : sta $19C5
.FA6E:
    lda $1EC5
    bne .FA7D

    lda $19D1 : clc : adc #$0001 : sta $19D1
.FA7D:
    lda $1F5E : sec : sbc #$0001 : sta $1F5E
    !AX8
    inc $1EB9
    lda $1EB9
if !version == 0 || !version == 1
    and #$7F
    bne .FA2B
elseif !version == 2
    cmp #$60
    bne .FA2B

    stz $1EB9
endif
    jsr .FB60
    inc $1EC1
    lda $1EC1
if !version == 0
    cmp #$2B
    beq .FAA7

    cmp #$2C
elseif !version == 1
    cmp #$26
    beq .FAA7

    cmp #$27
elseif !version == 2
    cmp #$1D
    beq .FAA7

    cmp #$1E
endif
    beq .FAB4

    jmp .FA2B

.FAA7:
    ldx #$12 : ldy #$78 : lda.b #_01FF00_0C : jsl _01A6FE
    jmp .FA2B

.FAB4:
    lda.b #1 : jsl current_task_suspend
    lda $00C6
    bne .FAB4

    !A8
    jsl disable_nmi
    jsl _01834C
    jsl _0180B9
    ldy #$28 : jsl _01A21D
    ldx #$29 : jsl _0180C7
    ldy #$29 : jsl _01A21D
    ldx #$2C : jsl _0180C7
    jsl _01951E
    jsl _019539
    lda $02DC : and #$FC : sta $02DC
    lda #$13 : jsl _0190B9_palette_to_ram
    jsl _018360
    jsl enable_nmi
    jsl _018366
    !A8
    lda #$01 : sta $02D5 : sta $02D6 : sta $02D7 : sta $02D8
    ldx #$12 : ldy #$78 : lda.b #_01FF00_08 : jsl _01A6FE
.FB21:
    lda.b #1 : jsl current_task_suspend
    lda $00C6
    bne .FB21

    lda #$01 : sta $1EB7
.FB31:
    lda.b #63 : jsl current_task_suspend
    dec $1EB7
    bne .FB31

if !version == 2
    lda #$F6 : jsl _018049_8053
    lda #$60 : jsl _018049_8053
endif
    ldx #$00 : lda #$3D : jsl _01F6C9
    lda #$48 : sta $1EB7
.FB49:
    jsl _01B5AB
    lda.b #2 : jsl current_task_suspend
    dec $1EB7
    bne .FB49

.FB58:
    lda.b #1 : jsl current_task_suspend
    bra .FB58

;-----

.FB60:
    lda $1EBB
    beq .FB69

    dec $1EBB
    rts

.FB69:
    lda $1EB7
    sec
    cmp #$09
    bcs .FB87

    lda #$00 : sta $02EB
    lda #$13 : sta $02EC
    lda $1EB7 : ora #$80 : sta $02EE
    inc $1EB7
    rts

.FB87:
    lda #$00 : sta $02EB
    lda #$13 : sta $02EC
    lda $1EB7 : sec : sbc #$08 : ora #$60 : sta $02EE
    lda $1EB7
    cmp #$0F
    beq .FBA6

    inc $1EB7
.FBA6:
    rts

;-----

.FBA7:
    !AX8
    lda $1EBD
    and #$01
    jsr .FBD5
    lda $1EBD
    sec
    cmp #$04
    beq .FBC9

    lda $1EBD
    sec
    cmp #$0C
    beq .FBCF

    lda $1EBD : asl : jsl _0183D4_83DB
.FBC9:
    inc $1EBD
    !AX16
    rts

.FBCF:
    !AX16
    inc $1EC5
    rts

;-----

.FBD5:
    bne .FBDE

    !AX16
    ldx #$0800
    bra .FBE3

.FBDE:
    !AX16
    ldx #$0000
.FBE3:
    lda #$0400 : sta $0000
    lda #$2045
.FBEC:
    sta $7F9000,X
    inx #2
    dec $0000
    bne .FBEC

    !AX8
    rts
}

{
    incsrc "objects/sun.asm"           ;FBFA - FC3F
    incsrc "objects/ending_object.asm" ;FC40 - FC87
}

if !version == 0
{ ;FC88 - FFFF
    incbin "fill_bytes/jp/bank03a.bin" ;unused duplicate code
    fillbyte $FF : fill 793
}
elseif !version == 1
    incbin "fill_bytes/eng/bank03a.bin":206..0
elseif !version == 2
    incbin "fill_bytes/eng/bank03a.bin"
endif
