org $038000 : bank03:

{
    incsrc "stage_layouts/stage_layouts.asm"         ;8000 - 846F
    incsrc "data/palette_cycling_data.asm"           ;8470 - 9C08
    incsrc "objects/princess_dialogue.asm"           ;9C09 - 9DD9
    incsrc "task_fns/_039DDA.asm"                    ;9DDA - 9E78
    incsrc "objects/tower_edge.asm"                  ;9E79 - 9F3F
    incsrc "objects/silk_gate.asm"                   ;9F40 - 9F9B
    incsrc "objects/gargoyle_statue.asm"             ;9F9C - A2FB
    incsrc "objects/_03A2FC.asm"                     ;A2FC - A337
    incsrc "objects/geyser.asm"                      ;A338 - A3E6
    incsrc "objects/_03A3E7.asm"                     ;A3E7 - A42B
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

{
    incsrc "objects/tiny_goblin.asm"                 ;BC85 - BE25
    incsrc "objects/arremer_objects.asm"             ;BE26 - BF64
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
    incsrc "objects/veil_allocen_claws.asm"          ;E54E - E743
    incsrc "objects/veil_allocen_projectile.asm"     ;E744 - E7BA
    incsrc "objects/freeze_splinter.asm"             ;E7BB - E7FD
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
    lda.b #bank04>>16 : pha : plb
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
    incsrc "data/tower_tiles.asm" ;EF86 - F1A5
    incsrc "data/hp_list.asm"     ;F1A6 - F525
}

{ ;F526 - F773
_03F526:
    rtl

.F527: ;a8 x8
    lda $02B2
    bne _03F526

    inc $02B2
    jsl enable_forced_blanking
    jsl _018049_804D
    lda.b #!mus_intro : jsl _018049_8053
    jsl _0180B9
    jsr .F606
    jsl enable_nmi ;game start cutscene starts somewhere here
    ldx #$14 : jsr .F620
    lda.b #task_list_08 : ldy #$90 : ldx #$02 : jsl add_task
.F557: ;fade in arthur & princess scene
    lda #$01 : jsr .F745
    lda $00DE
    bne .F557

    lda #$50 : jsr .F745
    lda.b #task_list_0C : ldy #$90 : ldx #$02 : jsl add_task
.F570: ;fade out arthur & princess scene
    lda #$01 : jsr .F745
    lda $00DE
    bne .F570

    ldx #$00 : jsr .F63D
    ldx #$15 : jsr .F620
    jsr .F606
    jsl set_max_brightness
    jsl enable_nmi
    lda #$50 : jsr .F745
    ldx #$02 : jsr .F63D
    jsr .F606
    jsl set_max_brightness
    jsl enable_nmi
    lda #$50 : jsr .F745
    ldx #$04 : jsr .F63D
    jsl enable_forced_blanking
    lda #$10 : jsr .F745
    lda #!sfx_shatter : jsl _018049_8053
    lda #$10 : jsr .F745
    ldx #$16 : jsr .F620
    jsr .F606
    ldy #$26 : jsl decompress
    ldx #$28 : jsl copy_ram_to_vram
    jsl set_max_brightness
    jsl enable_nmi
    stz $1EC7
.F5E1:
    lda #$01 : jsr .F745
    lda $1EC7
    beq .F5E1

    lda.b #96 : jsl current_task_suspend
    lda.b #task_list_0C : ldy #$90 : ldx #$04 : jsl add_task
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
    pla : sta.w stage
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
    jsl enable_forced_blanking
    jsl _01951E
    jsl _019539
    lda #$C0 : sta.w M7SEL
    jsl _018366
    lda #$07 : sta.w snes_reg.bgmode
    lda #$11 : jsl _0190B9_palette_to_ram
    ldy #$25 : jsl decompress
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
    lda $7F0400,X : sta.w VMDATAH
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
    lda.w _00EC3F,X : sta.w snes_reg.m7a : sta.w snes_reg.m7b : sta.w snes_reg.m7c : sta.w snes_reg.m7d
    lda #$0068 : sta.w snes_reg.m7x
    lda #$0080 : sta.w snes_reg.m7y
    !A8
    lda #$01 : sta.w snes_reg.tm : sta.w snes_reg.ts
    jsl set_max_brightness
    jsl enable_nmi
    ldx $005D
    ldy #$60
.F721:
    lda #$01 : jsr .F749
    !A16
    sec : lda.w snes_reg.m7a : sbc.w _00EC3F+6,X : sta.w snes_reg.m7a : sta.w snes_reg.m7b : sta.w snes_reg.m7c : sta.w snes_reg.m7d
    !A8
    dey
    bne .F721

    jsl enable_forced_blanking
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
    jsl remove_tasks
    jsl enable_forced_blanking
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
    jsl enable_forced_blanking
    jsl _0180B9
    jsl clear_oam_sprite_data
    ldy #$28     : jsl decompress
    ldy #$29     : jsl decompress
    ldx #$29     : jsl copy_ram_to_vram
    ldx #$2A     : jsl copy_ram_to_vram
    ldx #$2B     : jsl copy_ram_to_vram
    ldy.b #$19*7 : jsl decompress_precalc
    ldx.b #$0E*7 : jsl copy_ram_to_vram_precalc
    ldy.b #$18*7 : jsl decompress_precalc
    ldx #$2F     : jsl copy_ram_to_vram
    ldy #$2A     : jsl decompress
    ldx #$2D     : jsl copy_ram_to_vram
    !AX8
    jsl _01951E
    jsl _019539
    lda.w snes_reg.bg1sc : and #$FC :            sta.w snes_reg.bg1sc
    lda.w snes_reg.bg2sc : and #$FC :            sta.w snes_reg.bg2sc
    lda.w snes_reg.bg3sc : and #$FC : ora #$02 : sta.w snes_reg.bg3sc
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
    lda #$05 : sta.w snes_reg.bg34nba
    lda.w snes_reg.bgmode : ora #$08 : sta.w snes_reg.bgmode
    lda $02D7 : ora #$04 : sta $02D7
    lda.b #!dmap_mode_2     : sta   !DMAP1
    lda.b #!BG1HOFS         : sta   !BBAD1
    lda.b #hdma_data+$00    : sta   !A1T1L
    lda.b #hdma_data+$00>>8 : sta.w A1T1H
    lda #$00                : sta.w A1B1
    stz.w DAS1B
    inc $1FAE
    lda #$02 : sta.w snes_reg.hdmaen
    lda #$50 : sta.w hdma_data+$00 ;line counters + hdma data (3 entries)
    stz.w hdma_data+$01 : stz.w hdma_data+$02
    lda #$50 : sta.w hdma_data+$03
    stz.w hdma_data+$04 : stz.w hdma_data+$05
    lda #$60 : sta.w hdma_data+$06
    stz.w hdma_data+$07 : stz.w hdma_data+$08
    stz.w hdma_data+$09            ;end byte
    lda #$00 : sta.w snes_reg.cgwsel
    lda #$17 : sta.w snes_reg.cgadsub
    lda #$E0 : sta.w snes_reg.coldata
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
    lda #$17 : sta.w snes_reg.tm : sta.w snes_reg.ts
    ldx #$17
    jsl _03F526_F61C
    jsl set_max_brightness
    ldx #$18 : ldy #$78 : lda.b #task_list_08 : jsl add_task
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

    lda $1EB9 ;unused lda (used in EU ver though?)
elseif !version == 2
    bne .FA6E
endif
    lda.w hdma_data+$04 : sec : sbc #$0001 : sta.w hdma_data+$04
    lda.w hdma_data+$01 : clc : adc #$0001 : sta.w hdma_data+$01
    lda $19C5 : sec : sbc #$0001 : sta $19C5
.FA6E:
    lda $1EC5
    bne .FA7D

    lda $19D1 : clc : adc #$0001 : sta $19D1
.FA7D:
    lda.w hdma_data+$07 : sec : sbc #$0001 : sta.w hdma_data+$07
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
    ldx #$12 : ldy #$78 : lda.b #task_list_0C : jsl add_task
    jmp .FA2B

.FAB4:
    lda.b #1 : jsl current_task_suspend
    lda $00C6
    bne .FAB4

    !A8
    jsl disable_nmi
    jsl enable_forced_blanking
    jsl _0180B9
    ldy #$28 : jsl decompress
    ldx #$29 : jsl copy_ram_to_vram
    ldy #$29 : jsl decompress
    ldx #$2C : jsl copy_ram_to_vram
    jsl _01951E
    jsl _019539
    lda.w snes_reg.bg1sc : and #$FC : sta.w snes_reg.bg1sc
    lda #$13 : jsl _0190B9_palette_to_ram
    jsl set_max_brightness
    jsl enable_nmi
    jsl _018366
    !A8
    lda #$01 : sta.w snes_reg.tm : sta.w snes_reg.ts : sta $02D7 : sta $02D8
    ldx #$12 : ldy.b #task[5].base : lda.b #task_list_08 : jsl add_task
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

    lda #$00 : sta.w snes_reg.cgwsel
    lda #$13 : sta.w snes_reg.cgadsub
    lda $1EB7 : ora #$80 : sta.w snes_reg.coldata
    inc $1EB7
    rts

.FB87:
    lda #$00 : sta.w snes_reg.cgwsel
    lda #$13 : sta.w snes_reg.cgadsub
    lda $1EB7 : sec : sbc #$08 : ora #$60 : sta.w snes_reg.coldata
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
