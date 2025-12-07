namespace menu_control

{ ;B8B2 -
create: ;a8 x8
    ldy.w options.stage_checkpoint : sty $31
    ldx.w _00D1C1,Y
    lda.w _00D1C1+$10,X : sta.w stage
    lda.w _00D1C1+$11,X : sta.w checkpoint
    lda #$04
.B8C8:
    sta $2D
    tay
    !AX16
if !version == 0
    lda.w _00C919+0,Y : ldx #$0412 : jsr .BB85
    lda.w _00C919+2,Y : ldx #$0492 : jsr .BB85
elseif !version == 1 || !version == 2
    lda.w _00C919+0,Y : ldx #$0450 : jsr .BB85
    lda.w _00C919+2,Y : ldx #$04D0 : jsr .BB85
endif
    !AX8
    inc $0323
.B8E4:
    brk #$00

;----- B8E6

    lda.w p1_button_press+1
    bit #!start
    bne .B900

    bit #!select|!up|!down
    beq .B8E4

    lda #$37 : jsl _018049_8053 ;menu movement sfx
    lda $2D
    clc
    adc #$04
    and #$07
    bra .B8C8

.B900:
    inc $1FB4
    lda $2D : sta $1FB3
    beq .B914

    lda #$63 : jsl _018049_8053 ;menu select sfx
    jml _0281A8_81B5

.B914:
    brk #$00

;----- B916

    ;options menu?
    ldx #$00 : jsl _049262
    stz $0F ;menu choice
    jsr .BA04
.B921:
    brk #$00

;----- B923

    lda.w p1_button_press
    ora.w p1_button_press+1
    beq .B921

    lda.w p1_button_press+1
    bit #!select|!up|!down
    beq .B950

    bit #!select|!down
    bne .B93F

    ;pressed up
    lda $0F
    dec
    bpl .B948

    lda #$04
    bra .B948

.B93F: ;go down in options menu
    lda $0F
    inc
    cmp #$05
    bne .B948

    lda #$00

.B948:
    sta $0F
    lda #$37 : jsl _018049_8053 ;menu movement sfx
.B950:
    lda $0F
    asl
    tax
    jsr (.B962,X)
    jsr .BA04
    lda $1FB4
    beq .B921

    jmp .BA4E ;to secret menu

.B962: dw .B96C, .B995, .B995, .B9C1, .B9E3

;-----

.B96C: ;game level
    lda.w p1_button_press+1
    bit #!left|!right
    beq .B994

    bit #!right
    beq .B985

    lda.w options.difficulty
    cmp #$06
    beq .B994

    clc
    adc #$02
    sta.w options.difficulty
    rts

.B985:
    bit #!left
    beq .B994

    lda.w options.difficulty
    beq .B994

    sec
    sbc #$02
    sta.w options.difficulty
.B994:
    rts

;-----

.B995: ;control pad, player
    lda.w p1_button_press+1
    bit #!left|!right
    beq .B9B2

    ldx $0F
    bit #$01
    beq .B9B3

    clc
    lda.w options,X
    adc #$02
    cmp.w _00D1BB-1,X
    bcc .B9AF

    lda #$00
.B9AF:
    sta.w options,X
.B9B2:
    rts

.B9B3:
    sec
    lda.w options,X
    sbc #$02
    bcs .B9AF

    lda.w _00D1BB-1,X
    dec
    bra .B9AF

;-----

.B9C1: ;toggle sound mode to stereo or mono
    lda.w p1_button_press+1
    bit #!left|!right
    beq .B9E2

    ldx $0F
    bit #!right
    beq .B9D2

    lda #$02
    bra .B9D8

.B9D2:
    bit #!left
    beq .B9E2

    lda #$FE
.B9D8:
    clc
    adc.w options,X
    and.w _00D1BD,X
    sta.w options,X ;only used to set sound mode
.B9E2:
    rts

;-----

.B9E3: ;exit
    lda.w p1_button_press
    and #!x|!a
    ora.w p1_button_press+1
    bit #!y|!b|!start
    beq .BA03

    lda.w p2_button_hold
    bit #!l
    beq .BA00

    lda.w p2_button_hold+1
    bit #!start
    beq .BA00

    inc $1FB4 ;go to secret menu
.BA00:
    inc $1FB3
.BA03:
    rts

;-----

.BA04:
    lda #$00 : ldx.w options.difficulty : jsl .BB96
    clc : lda.w options.controls : adc #$08 : tax
    lda #$01 : jsl .BB96
    clc : lda.w options.controls : adc #$10 : tax
    lda #$01 : jsl .BB96
    lda.w options.extra_lives
    lsr
    inc
    ldy #$02
    !X16
    ldx #$041E
    jsr .BBE6
    !X8
    clc : lda.w options.sound : adc #$18 : tax
    lda #$03 : jsl .BB96
    ldx #$1C : lda #$04 : jsl .BB96
    rts

;-----

.BA4E: ;secret menu
    brk #$00

;----- BA50

    ldx #$02 : jsl _049262
    stz $0F
    lda.w options.stage_checkpoint
    tax
    lsr
    sta $2D
    txa
    and #$01
    sta $2E
    stz $2F
    lda #$20
    sta $30
    stz $31
    jsr .BB4A
.BA6F:
    brk #$00

;----- BA71

    lda.w p1_button_press
    ora.w p1_button_press+1
    beq .BA6F

    lda.w p1_button_press+1
    bit #!select|!up|!down
    beq .BAA2

    bit #!select|!down
    bne .BA8D

    lda $0F
    dec
    bpl .BA96

    lda #$04
    bra .BA96

.BA8D:
    lda $0F
    inc
    cmp #$05
    bne .BA96

    lda #$00
.BA96:
    sta $0F
    jsl _018049_804D
    lda #$37 : jsl _018049_8053 ;menu movement sfx
.BAA2:
    lda $0F
    asl
    tax
    jsr (.BAB4,X)
    jsr .BB4A
    lda $1FB4
    beq .BA6F

    jmp .B914

.BAB4: dw .BABE, .BAC9, .BADB, .BAE7, .BB3A

;-----

.BABE:
    jsr .BAFB
    lda $2D : and #$07 : sta $2D
    bra .BAD2

;-----

.BAC9:
    jsr .BAFB
    lda $2E : and #$01 : sta $2E
.BAD2:
    lda $2D : asl : ora $2E : sta.w options.stage_checkpoint
    rts

;-----

.BADB:
    jsr .BAFB
    lda $2F : and #$1F : sta $2F
    jmp .BB18

;-----

.BAE7:
    jsr .BAFB
    ldx #$20
    lda $30
    beq .BAF6

    ldx #$FF
    cmp #$1F
    bne .BAF8

.BAF6:
    stx $30
.BAF8:
    jmp .BB18

;-----

.BAFB:
    ldx $0F
    lda.w p1_button_press+1
    bit #!left|!right
    beq .BB17

    bit #!right
    beq .BB0C

    lda #$01
    bra .BB12

.BB0C:
    bit #!left
    beq .BB17

    lda #$FF
.BB12:
    clc
    adc $2D,X
    sta $2D,X
.BB17:
    rts

;-----

.BB18:
    lda.w p1_button_press
    bit #!r
    bne .BB26

    lda.w p1_button_press+1
    bit #!start
    beq .BB34

.BB26:
    ldx $0F
    lda $2D,X
    beq .BB35

    cmp #$F0
    bcs .BB35

    jsl _018049_8053 ;play music or sound effect
.BB34:
    rts

.BB35:
    jsl _018049_804D
    rts

;-----

.BB3A: ;exit
    lda.w p1_button_press
    and #!a|!x
    ora.w p1_button_press+1
    bit #!a|!x|!b|!y|!start
    beq .BB49

    inc $1FB4
.BB49:
    rts

;-----

.BB4A:
    !X16
    lda $2D
    inc
    ldx #$01DE : ldy #$0000 : jsr .BBE6
    lda $2E
    inc
    ldx #$02DE : ldy #$0001 : jsr .BBE6
    lda $2F
    ldx #$03DE : ldy #$0002 : jsr .BBE6
    lda $30
    ldx #$04DE : ldy #$0003 : jsr .BBE6
    !X8
    ldx #$1C : lda #$04 : jsl .BB96
    rts

;-----

.BB85:
    sta $7F9000,X
    cmp #$2045
    beq +
    inc
+:
    inx #2
    sta $7F9000,X
    rts

;-----

.BB96:
    cmp $0F
    bne .BBAB

    lda #$04
    stz $0002
    sta $0003
    !X16
    ldy.w _00DE0E,X
    !A16
    bra .BBBB

.BBAB:
    !X16
    ldy.w _00DE0E,X
    !A16
    lda $0003,Y
    and #$1C00
    sta $0002
.BBBB:
    lda $0000,Y
    iny
    and #$00FF
    sta $0000
    ldx $0000,Y
    iny #2
.BBCA:
    lda $0000,Y
    and #$E3FF
    ora $0002
    sta $7F9000,X
    iny #2
    inx #2
    dec $0000
    bne .BBCA

    !AX8
    inc $0323
    rtl

;-----

.BBE6:
    pha
    lda #$00
    stz $0002
    sta $0003
    cpy $0F
    bne .BBF8

    lda #$04 : sta $0003
.BBF8:
    pla
    pha
    lsr #4
    jsr .BC04
    pla
    and #$0F
.BC04:
    !A16
    and #$00FF
    ora $0002
    sta $7F9000,X
    !A8
    inx #2
    rts
}

namespace off
