{
stage_layouts:

    dw .stage_1, .stage_2, .8022, .8029, .8022, .8029, .8030, .8037, .803C, .8041

;-----

.stage_1: db $03 : dw .8046, .805C, .8072
.stage_2: db $03 : dw .8080, .80C4, .8134
.8022:    db $03 : dw .815A, .824F, .824F ;stage 3, 4b
.8029:    db $03 : dw .82DD, .82E1, .82DD ;stage 4, 4c
.8030:    db $03 : dw .82E5, .8380, .8380 ;stage 5
.8037:    db $02 : dw .83E4, .83FA ;stage 6
.803C:    db $02 : dw .8410, .843A ;stage 7
.8041:    db $02 : dw .8464, .846A ;stage 8

;-----

.8046: ;layer 1 screens
    db $13, $00
    db screen(screen_layouts_s1_8000), screen(screen_layouts_s1_8080), screen(screen_layouts_s1_8100), screen(screen_layouts_s1_8180)
    db screen(screen_layouts_s1_8200), screen(screen_layouts_s1_8280), screen(screen_layouts_s1_8300), screen(screen_layouts_s1_8380)
    db screen(screen_layouts_s1_8400), screen(screen_layouts_s1_8600), screen(screen_layouts_s1_8680), screen(screen_layouts_s1_8700)
    db screen(screen_layouts_s1_8C00), screen(screen_layouts_s1_8C80), screen(screen_layouts_s1_8D00), screen(screen_layouts_s1_8D80)
    db screen(screen_layouts_s1_8E00), screen(screen_layouts_s1_8E80), screen(screen_layouts_s1_8F00), screen(screen_layouts_s1_8F80)
.805C: ;layer 2 screens
    db $13, $00
    db screen(screen_layouts_s1_9000), screen(screen_layouts_s1_9080), screen(screen_layouts_s1_9100), screen(screen_layouts_s1_9180)
    db screen(screen_layouts_s1_9200), screen(screen_layouts_s1_9280), screen(screen_layouts_s1_9300), screen(screen_layouts_s1_9380)
    db screen(screen_layouts_s1_8480), screen(screen_layouts_s1_9600), screen(screen_layouts_s1_9600), screen(screen_layouts_s1_9600)
    db screen(screen_layouts_s1_9800), screen(screen_layouts_s1_9880), screen(screen_layouts_s1_9900), screen(screen_layouts_s1_9980)
    db screen(screen_layouts_s1_9A00), screen(screen_layouts_s1_9A80), screen(screen_layouts_s1_9B00), screen(screen_layouts_s1_9B80)
.8072: ;parallax screens
    db $0B, $00
    db screen(screen_layouts_s1_9C00), screen(screen_layouts_s1_9C80), screen(screen_layouts_s1_9D00), screen(screen_layouts_s1_9D80)
    db screen(screen_layouts_s1_9E00), screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_A180), screen(screen_layouts_s1_A000)
    db screen(screen_layouts_s1_A080), screen(screen_layouts_s1_A100), screen(screen_layouts_s1_A100), screen(screen_layouts_s1_A100)

;-----

.8080:
    db $15, $02
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B500)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_AD00), screen(screen_layouts_s2_AA80), screen(screen_layouts_s2_AB00)
    db screen(screen_layouts_s2_AB80), screen(screen_layouts_s2_AC00), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)

    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_A200), screen(screen_layouts_s2_A280)
    db screen(screen_layouts_s2_A300), screen(screen_layouts_s2_A380), screen(screen_layouts_s2_A400), screen(screen_layouts_s2_A480)
    db screen(screen_layouts_s2_A500), screen(screen_layouts_s2_A580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)

    db screen(screen_layouts_s2_A600), screen(screen_layouts_s2_A680), screen(screen_layouts_s2_A700), screen(screen_layouts_s2_A780)
    db screen(screen_layouts_s2_A800), screen(screen_layouts_s2_A880), screen(screen_layouts_s2_A900), screen(screen_layouts_s2_A980)
    db screen(screen_layouts_s2_AA00), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B880), screen(screen_layouts_s2_B900)
    db screen(screen_layouts_s2_C000), screen(screen_layouts_s2_C080), screen(screen_layouts_s2_C100), screen(screen_layouts_s2_C180)
    db screen(screen_layouts_s2_C200), screen(screen_layouts_s2_C280), screen(screen_layouts_s2_C300), screen(screen_layouts_s2_C380)
    db screen(screen_layouts_s2_B980), screen(screen_layouts_s2_BB00)

.80C4: ;layer 2 (water)
    db $15, $04
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)

    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)
    db screen(screen_layouts_s2_B580), screen(screen_layouts_s2_B580)

    db screen(screen_layouts_s2_AC80), screen(screen_layouts_s2_AD80), screen(screen_layouts_s2_B400), screen(screen_layouts_s2_B400)
    db screen(screen_layouts_s2_B480), screen(screen_layouts_s2_AC80), screen(screen_layouts_s2_AC80), screen(screen_layouts_s2_AC80)
    db screen(screen_layouts_s2_B680), screen(screen_layouts_s2_BB80), screen(screen_layouts_s2_BC00), screen(screen_layouts_s2_BC80)
    db screen(screen_layouts_s2_BC80), screen(screen_layouts_s2_BC80), screen(screen_layouts_s2_BC80), screen(screen_layouts_s2_BC80)
    db screen(screen_layouts_s2_BC80), screen(screen_layouts_s2_BC80), screen(screen_layouts_s2_BC80), screen(screen_layouts_s2_BC80)
    db screen(screen_layouts_s2_BC80), screen(screen_layouts_s2_BD00)

    db screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600)
    db screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600)
    db screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)
    db screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)
    db screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)
    db screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)

    db screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600)
    db screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600)
    db screen(screen_layouts_s2_B600), screen(screen_layouts_s2_B600), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)
    db screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)
    db screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)
    db screen(screen_layouts_s2_BD80), screen(screen_layouts_s2_BD80)

.8134: ;parallax
    db $0B, $02
    db screen(screen_layouts_s2_AE00), screen(screen_layouts_s2_AE80), screen(screen_layouts_s2_AF00), screen(screen_layouts_s2_AF80)
    db screen(screen_layouts_s2_B000), screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00)
    db screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00)

    db screen(screen_layouts_s2_B080), screen(screen_layouts_s2_B100), screen(screen_layouts_s2_B180), screen(screen_layouts_s2_B200)
    db screen(screen_layouts_s2_B280), screen(screen_layouts_s2_B300), screen(screen_layouts_s2_B300), screen(screen_layouts_s2_B300)
    db screen(screen_layouts_s2_B300), screen(screen_layouts_s2_B300), screen(screen_layouts_s2_B300), screen(screen_layouts_s2_B300)

    db screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00), screen(screen_layouts_s1_9F00)
    db screen(screen_layouts_s1_9F00), screen(screen_layouts_s2_B380), screen(screen_layouts_s2_B380), screen(screen_layouts_s2_B380)
    db screen(screen_layouts_s2_B380), screen(screen_layouts_s2_B380), screen(screen_layouts_s2_B380), screen(screen_layouts_s2_B380)

;-----

.815A:
    db $1A, $08
    db screen(screen_layouts2_s3_A200), screen(screen_layouts2_s3_A280)
if !version == 0 || !version == 1
    db screen(screen_layouts2_s3_AD00)
elseif !version == 2
    db screen(screen_layouts2_s3_A000)
endif
    db screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_A300), screen(screen_layouts2_s3_A380)
if !version == 0 || !version == 1
    db screen(screen_layouts2_s3_AD00)
elseif !version == 2
    db screen(screen_layouts2_s3_A000)
endif
    db screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_9900), screen(screen_layouts2_s3_9980), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_A400), screen(screen_layouts2_s3_A480), screen(screen_layouts2_s3_EE00), screen(screen_layouts2_s3_EE80)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_9800), screen(screen_layouts2_s3_9880), screen(screen_layouts2_s3_9300)
    db screen(screen_layouts2_s3_9380), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_9400), screen(screen_layouts2_s3_9480)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_9500), screen(screen_layouts2_s3_9580), screen(screen_layouts2_s3_9600)
    db screen(screen_layouts2_s3_9680), screen(screen_layouts2_s3_9700), screen(screen_layouts2_s3_9780)

    db screen(screen_layouts2_s3_A500), screen(screen_layouts2_s3_A580), screen(screen_layouts2_s3_AC00), screen(screen_layouts2_s3_AC80)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_9800), screen(screen_layouts2_s3_9880)
    db screen(screen_layouts2_s3_9180), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_9200), screen(screen_layouts2_s3_9280)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_9000), screen(screen_layouts2_s3_9080), screen(screen_layouts2_s3_9100)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_AD00), screen(screen_layouts2_s3_AD00), screen(screen_layouts2_s3_AD80), screen(screen_layouts2_s3_AE00)
    db screen(screen_layouts2_s3_AE80), screen(screen_layouts2_s3_B080), screen(screen_layouts2_s3_9000), screen(screen_layouts2_s3_9080)
    db screen(screen_layouts2_s3_9100), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_AD00), screen(screen_layouts2_s3_AD00), screen(screen_layouts2_s3_AF00), screen(screen_layouts2_s3_AF80)
    db screen(screen_layouts2_s3_B000), screen(screen_layouts2_s3_B180), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_AC80), screen(screen_layouts2_s3_AC80), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_B100), screen(screen_layouts2_s3_EF00), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_AC80), screen(screen_layouts2_s3_AC80), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_B100), screen(screen_layouts2_s3_EF00), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_AC80), screen(screen_layouts2_s3_AC80), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_B100), screen(screen_layouts2_s3_EF00), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)

.824F:
    db $13, $06
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_9A00), screen(screen_layouts2_s3_9A00), screen(screen_layouts2_s3_9A80), screen(screen_layouts2_s3_9B00)
    db screen(screen_layouts2_s3_9A80), screen(screen_layouts2_s3_9B00), screen(screen_layouts2_s3_9A80), screen(screen_layouts2_s3_9B00)
    db screen(screen_layouts2_s3_9A80), screen(screen_layouts2_s3_9B00), screen(screen_layouts2_s3_9A80), screen(screen_layouts2_s3_9B00)
    db screen(screen_layouts2_s3_9A80), screen(screen_layouts2_s3_9B00), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_D600), screen(screen_layouts2_s3_D680), screen(screen_layouts2_s3_E600)
    db screen(screen_layouts2_s3_E680), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_9F00), screen(screen_layouts2_s3_9C00)
    db screen(screen_layouts2_s3_9B80), screen(screen_layouts2_s3_9C00), screen(screen_layouts2_s3_9B80), screen(screen_layouts2_s3_9C00)
    db screen(screen_layouts2_s3_9B80), screen(screen_layouts2_s3_9C00), screen(screen_layouts2_s3_9B80), screen(screen_layouts2_s3_9C00)
    db screen(screen_layouts2_s3_9B80), screen(screen_layouts2_s3_9C00), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_D700), screen(screen_layouts2_s3_D780), screen(screen_layouts2_s3_E700)
    db screen(screen_layouts2_s3_E780), screen(screen_layouts2_s3_9F80), screen(screen_layouts2_s3_9C80), screen(screen_layouts2_s3_9D00)
    db screen(screen_layouts2_s3_9D80), screen(screen_layouts2_s3_9D00), screen(screen_layouts2_s3_9D80), screen(screen_layouts2_s3_9D00)
    db screen(screen_layouts2_s3_9D80), screen(screen_layouts2_s3_9D00), screen(screen_layouts2_s3_9D80), screen(screen_layouts2_s3_9D00)
    db screen(screen_layouts2_s3_9D80), screen(screen_layouts2_s3_9D00), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_9E80), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_9E80), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_9E80), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00)
    db screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_9E00), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

;-----

.82DD:
    db $01, $00
    db screen(screen_layouts_s2_BE00), screen(screen_layouts_s2_BE80)
.82E1:
    db $01, $00
    db screen(screen_layouts_s2_BF00), screen(screen_layouts_s2_BF80)

;-----

.82E5:
    db $10, $08
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_B580), screen(screen_layouts2_s3_BA00), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_B600), screen(screen_layouts2_s3_B680), screen(screen_layouts2_s3_B700)
    db screen(screen_layouts2_s3_B780)

    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_AB00), screen(screen_layouts2_s3_AB80), screen(screen_layouts2_s3_B200), screen(screen_layouts2_s3_B280)
    db screen(screen_layouts2_s3_B300), screen(screen_layouts2_s3_B380), screen(screen_layouts2_s3_B400), screen(screen_layouts2_s3_B480)
    db screen(screen_layouts2_s3_B500)

    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A880)
    db screen(screen_layouts2_s3_A900), screen(screen_layouts2_s3_A980), screen(screen_layouts2_s3_AA00), screen(screen_layouts2_s3_AA80)
    db screen(screen_layouts2_s3_BB80), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s5_8000), screen(screen_layouts2_s5_8080), screen(screen_layouts2_s5_8100), screen(screen_layouts2_s5_8180)
    db screen(screen_layouts2_s5_8200), screen(screen_layouts2_s5_8280), screen(screen_layouts2_s5_8300), screen(screen_layouts2_s3_A680)
    db screen(screen_layouts2_s3_A700), screen(screen_layouts2_s3_A780), screen(screen_layouts2_s3_A800), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s5_8380), screen(screen_layouts2_s5_8400), screen(screen_layouts2_s5_8480), screen(screen_layouts2_s3_A600)
    db screen(screen_layouts2_s3_A800), screen(screen_layouts2_s3_A880), screen(screen_layouts2_s3_BA80), screen(screen_layouts2_s3_BB00)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s5_8500), screen(screen_layouts2_s5_8580), screen(screen_layouts2_s5_8600), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s5_8680), screen(screen_layouts2_s5_8700), screen(screen_layouts2_s5_8780), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

.8380:
    db $0D, $06
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_B880), screen(screen_layouts2_s3_B800), screen(screen_layouts2_s3_B880), screen(screen_layouts2_s3_B800)
    db screen(screen_layouts2_s3_B880), screen(screen_layouts2_s3_B800)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_B880), screen(screen_layouts2_s3_B800), screen(screen_layouts2_s3_B880), screen(screen_layouts2_s3_B800)
    db screen(screen_layouts2_s3_B880), screen(screen_layouts2_s3_B800)

    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_B900)
    db screen(screen_layouts2_s3_B980), screen(screen_layouts2_s3_EA00), screen(screen_layouts2_s3_EA80), screen(screen_layouts2_s3_EB00)
    db screen(screen_layouts2_s3_EB80), screen(screen_layouts2_s3_EB00)

    db screen(screen_layouts2_s5_8800), screen(screen_layouts2_s5_8880), screen(screen_layouts2_s5_8900), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_B800), screen(screen_layouts2_s3_B880), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s5_8B00), screen(screen_layouts2_s5_8B80), screen(screen_layouts2_s5_8C00), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s5_8C80), screen(screen_layouts2_s5_8D00), screen(screen_layouts2_s5_8D80), screen(screen_layouts2_s5_8980)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

    db screen(screen_layouts2_s5_8E00), screen(screen_layouts2_s5_8E80), screen(screen_layouts2_s5_8F00), screen(screen_layouts2_s5_8A00)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)
    db screen(screen_layouts2_s3_8F80), screen(screen_layouts2_s3_8F80)

;-----

.83E4:
    db $04, $03
    db screen(screen_layouts2_s3_C280), screen(screen_layouts2_s3_C300), screen(screen_layouts2_s3_C380), screen(screen_layouts2_s3_D000)
    db screen(screen_layouts2_s3_D080)

    db screen(screen_layouts2_s3_C000), screen(screen_layouts2_s3_C080), screen(screen_layouts2_s3_C100), screen(screen_layouts2_s3_C180)
    db screen(screen_layouts2_s3_C200)

    db screen(screen_layouts2_s3_BE00), screen(screen_layouts2_s3_BE80), screen(screen_layouts2_s3_BF00), screen(screen_layouts2_s3_BF80)
    db screen(screen_layouts2_s3_BD80)

    db screen(screen_layouts2_s3_BC00), screen(screen_layouts2_s3_BC80), screen(screen_layouts2_s3_BD00), screen(screen_layouts2_s3_BD80)
    db screen(screen_layouts2_s3_BD80)

.83FA:
    db $04, $03
    db screen(screen_layouts2_s3_D800), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_D880), screen(screen_layouts2_s3_D400), screen(screen_layouts2_s3_D480), screen(screen_layouts2_s3_D500)
    db screen(screen_layouts2_s3_D580)

    db screen(screen_layouts2_s3_D200), screen(screen_layouts2_s3_D280), screen(screen_layouts2_s3_D300), screen(screen_layouts2_s3_D380)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_D100), screen(screen_layouts2_s3_D180), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

;-----

.8410:
    db $04, $07
    db screen(screen_layouts2_s3_CB80), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_CB80), screen(screen_layouts2_s3_CC00), screen(screen_layouts2_s3_CC80), screen(screen_layouts2_s3_CD00)
    db screen(screen_layouts2_s3_CD80)

    db screen(screen_layouts2_s3_CA00), screen(screen_layouts2_s3_CA80), screen(screen_layouts2_s3_CB00), screen(screen_layouts2_s3_E480)
    db screen(screen_layouts2_s3_E500)

    db screen(screen_layouts2_s3_C880), screen(screen_layouts2_s3_C900), screen(screen_layouts2_s3_C980), screen(screen_layouts2_s3_E480)
    db screen(screen_layouts2_s3_E500)

    db screen(screen_layouts2_s3_C700), screen(screen_layouts2_s3_C780), screen(screen_layouts2_s3_C800), screen(screen_layouts2_s3_E480)
    db screen(screen_layouts2_s3_E500)

    db screen(screen_layouts2_s3_C600), screen(screen_layouts2_s3_C680), screen(screen_layouts2_s3_D900), screen(screen_layouts2_s3_E480)
    db screen(screen_layouts2_s3_E500)

    db screen(screen_layouts2_s3_C500), screen(screen_layouts2_s3_C580), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_E480)
    db screen(screen_layouts2_s3_E500)

    db screen(screen_layouts2_s3_C400), screen(screen_layouts2_s3_C480), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_E480)
    db screen(screen_layouts2_s3_E500)

.843A:
db $04, $07
    db screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_CE00), screen(screen_layouts2_s3_CE80), screen(screen_layouts2_s3_CF00)
    db screen(screen_layouts2_s3_CF80)

    db screen(screen_layouts2_s3_E180), screen(screen_layouts2_s3_E200), screen(screen_layouts2_s3_E280), screen(screen_layouts2_s3_E300)
    db screen(screen_layouts2_s3_E380)

    db screen(screen_layouts2_s3_E000), screen(screen_layouts2_s3_E080), screen(screen_layouts2_s3_E100), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_DE80), screen(screen_layouts2_s3_DF00), screen(screen_layouts2_s3_DF80), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_DD00), screen(screen_layouts2_s3_DD80), screen(screen_layouts2_s3_DE00), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_DC00), screen(screen_layouts2_s3_DC80), screen(screen_layouts2_s3_E400), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_DB00), screen(screen_layouts2_s3_DB80), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

    db screen(screen_layouts2_s3_DA00), screen(screen_layouts2_s3_DA80), screen(screen_layouts2_s3_A000), screen(screen_layouts2_s3_A000)
    db screen(screen_layouts2_s3_A000)

;-----

.8464:
    db $01, $01
    db screen(screen_layouts2_s3_EC00), screen(screen_layouts2_s3_EC80)

    db screen(screen_layouts2_s3_ED00), screen(screen_layouts2_s3_ED80)

.846A:
    db $01, $01
    db screen(screen_layouts2_s3_E800), screen(screen_layouts2_s3_E880)

    db screen(screen_layouts2_s3_E900), screen(screen_layouts2_s3_E980)
}
