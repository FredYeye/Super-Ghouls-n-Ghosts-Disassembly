org $038000

{ ;8000 -
_038000: ;stage screen layouts

    dw .8014, .801B, .8022, .8029, .8022, .8029, .8030, .8037, .803C, .8041

;-----

.8014: db $03 : dw .8046, .805C, .8072 ;stage 1
.801B: db $03 : dw .8080, .80C4, .8134 ;stage 2
.8022: db $03 : dw .815A, .824F, .824F ;stage 3, 4b
.8029: db $03 : dw .82DD, .82E1, .82DD ;stage 4, 4c
.8030: db $03 : dw .82E5, .8380, .8380 ;stage 5
.8037: db $02 : dw .83E4, .83FA ;stage 6
.803C: db $02 : dw .8410, .843A ;stage 7
.8041: db $02 : dw .8464, .846A ;stage 8

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

{ ;8470 - 9C08
_038470: ;palette swapping to animate color
    dw offset(_038470, .8528), offset(_038470, .85C7), offset(_038470, .8685), offset(_038470, .869E)
    dw offset(_038470, .86C0), offset(_038470, .877E), offset(_038470, .8824), offset(_038470, .8883)
    dw offset(_038470, .88B1), offset(_038470, .88DF), offset(_038470, .88F2), offset(_038470, .8974)
    dw offset(_038470, .89F6), offset(_038470, .8A24), offset(_038470, .8A46), offset(_038470, .8A80)
    dw offset(_038470, .8B26), offset(_038470, .8B78), offset(_038470, .8BD0), offset(_038470, .8C36)
    dw offset(_038470, .8C9C), offset(_038470, .8D02), offset(_038470, .8D68), offset(_038470, .8DB2)
    dw offset(_038470, .8E2A), offset(_038470, .8E85), offset(_038470, .8EFD), offset(_038470, .8F58)
    dw offset(_038470, .8F92), offset(_038470, .8FC3), offset(_038470, .8FF4), offset(_038470, .9025)
    dw offset(_038470, .906F), offset(_038470, .90B9), offset(_038470, .9103), offset(_038470, .91B5)
    dw offset(_038470, .91E6), offset(_038470, .9235), offset(_038470, .9263), offset(_038470, .92B5)
    dw offset(_038470, .9325), offset(_038470, .93D7), offset(_038470, .9489), offset(_038470, .950B)
    dw offset(_038470, .9539), offset(_038470, .955E), offset(_038470, .95A8), offset(_038470, .95C1)
    dw offset(_038470, .95DA), offset(_038470, .9652), offset(_038470, .969C), offset(_038470, .96B2)
    dw offset(_038470, .9747), offset(_038470, .97BF), offset(_038470, .983F), offset(_038470, .98BF)
    dw offset(_038470, .98E4), offset(_038470, .9942), offset(_038470, .99C2), offset(_038470, .9A42)
    dw offset(_038470, .9AC2), offset(_038470, .9B42)

;-----

.84EC: ;stage 4 transform begin palette
    dw $0000, $000E, $0008, $4A40, $3180, $18C0, $0C60, $01DB, $0116, $0052, $0010, $000C, $000A, $0006, $0003
    dw $5B54, $001A, $0012, $000C, $0008, $131C, $0238, $4B4C, $3284, $19C0, $1140, $00E0, $00A0, $0060, $0000

.8528:
    db $05, $0F : dw $00A2
    db $07 : dw $1400, $0C00, $0400, $1C00, $1400, $0C00, $2400, $1C00, $1400, $2C00, $1C00, $1C00, $3C00, $2C00, $1C00
    db $07 : dw $0800, $0000, $0000, $1000, $0800, $0000, $1800, $1000, $0800, $2400, $1000, $1000, $3000, $2000, $1000
    db $07 : dw $0000, $0000, $0000, $0400, $0000, $0000, $0C00, $0400, $0000, $1800, $0400, $0400, $2400, $1400, $0400
    db $07 : dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0C00, $0000, $0000, $1800, $0800, $0000
    db $00 : dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0700

.85C7:
    db $06, $0F : dw $0082
    db $03 : dw $7B54, $7BDE, $7A00, $7A88, $7A88, $7A88, $7A88, $7BDE, $0000, $40C0, $50C0, $6900, $7940, $79C0, $7A40
    db $03 : dw $7A88, $7B54, $7BDE, $7A00, $7A88, $7A88, $7A88, $7B54, $7BDE, $6900, $50C0, $50C0, $7A40, $7940, $79C0
    db $03 : dw $7A88, $7A88, $7B54, $7BDE, $7A00, $7A88, $7BDE, $7BDE, $7BDE, $50C0, $6900, $50C0, $79C0, $7A40, $7940
    db $03 : dw $7A88, $7A88, $7A88, $7B54, $7BDE, $7A00, $7A00, $7BDE, $0000, $40C0, $50C0, $6900, $7940, $79C0, $7A40
    db $03 : dw $7A00, $7A88, $7A88, $7A88, $7B54, $7BDE, $7B54, $7A00, $0000, $6900, $50C0, $50C0, $7A40, $7940, $79C0
    db $03 : dw $7BDE, $7A00, $7A88, $7A88, $7A88, $7B54, $7B54, $0000, $0000, $50C0, $6900, $6900, $79C0, $7A40, $7940

.8685:
    db $03, $03 : dw $0022
    db $07 : dw $4800, $2C00, $1C00
    db $07 : dw $2C00, $1C00, $4800
    db $07 : dw $1C00, $4800, $2C00

.869E:
    db $06, $02 : dw $009A
    db $0A : dw $00F3, $006C
    db $0A : dw $000B, $0008
    db $0A : dw $00F5, $000E
    db $0A : dw $00F3, $006C
    db $0A : dw $000B, $0008
    db $0A : dw $0009, $0005

.86C0:
    db $06, $0F : dw $00A2
    db $08 : dw $2000, $1800, $0000, $2800, $2000, $0000, $3000, $2800, $0000, $3800, $2800, $2000, $4C00, $3C00, $2C00
    db $08 : dw $1000, $2000, $1800, $1800, $2800, $2000, $2000, $3000, $2800, $2800, $3800, $2800, $2C00, $4C00, $3C00
    db $08 : dw $1800, $0000, $2000, $2000, $0000, $2800, $2800, $0000, $3000, $2800, $2000, $3800, $3C00, $2C00, $4C00
    db $08 : dw $2000, $1800, $1000, $2800, $2000, $1800, $3000, $2800, $2000, $3800, $2800, $2800, $4C00, $3C00, $2C00
    db $08 : dw $0000, $2000, $1800, $0000, $2800, $2000, $0000, $3000, $2800, $2000, $3800, $2800, $2C00, $4C00, $3C00
    db $08 : dw $1800, $1000, $2000, $2000, $1800, $2800, $2800, $2000, $3000, $2800, $2000, $3800, $3C00, $2C00, $4C00

.877E:
    db $06, $0D : dw $0062
    db $09 : dw $5460, $6580, $6A00, $76C0, $7F54, $5860, $5860, $3400, $5860, $5860, $3C00, $5860, $3C00
    db $09 : dw $5860, $5860, $6580, $6A00, $76C0, $7F54, $5860, $3400, $3000, $737B, $3C00, $5860, $3C00
    db $09 : dw $7F54, $5860, $5860, $6580, $6A00, $76C0, $5860, $737B, $3400, $7F2E, $3C00, $5860, $5860
    db $09 : dw $76C0, $7F54, $5860, $5860, $6580, $6A00, $5860, $7F2E, $737B, $5860, $3C00, $5860, $5860
    db $09 : dw $6A00, $76C0, $7F54, $5860, $5860, $6580, $5860, $5860, $7F2E, $5860, $3C00, $3C00, $5860
    db $09 : dw $6580, $6A00, $76C0, $7F54, $5860, $5860, $5860, $3000, $6A00, $3000, $3C00, $3C00, $5860

.8824: ;unused?
    db $0C, $03 : dw $0022
    db $32 : dw $1000, $0C00, $0000
    db $32 : dw $1800, $1400, $0000
    db $32 : dw $2000, $1800, $0800
    db $32 : dw $2400, $1C00, $0C00
    db $32 : dw $2800, $2000, $1000
    db $32 : dw $2C00, $2400, $1400
    db $64 : dw $3000, $2800, $1800
    db $32 : dw $2C00, $2400, $1400
    db $32 : dw $2800, $2000, $1000
    db $32 : dw $2400, $1C00, $0C00
    db $32 : dw $2000, $1800, $0800
    db $32 : dw $1800, $1400, $0400

    ;unused
    db $32 : dw $1000, $0C00, $0000

.8883:
    db $06, $03 : dw $0032
    db $07 : dw $2800, $2000, $1800
    db $07 : dw $0C00, $2800, $2000
    db $07 : dw $2000, $1800, $2800
    db $07 : dw $2800, $2000, $0C00
    db $07 : dw $1800, $2800, $2000
    db $07 : dw $2000, $0C00, $2800

.88B1:
    db $06, $03 : dw $003A
    db $05 : dw $2000, $1800, $1000
    db $05 : dw $0000, $2000, $1800
    db $05 : dw $1800, $1000, $2000
    db $05 : dw $2000, $1800, $0000
    db $05 : dw $0000, $2000, $1800
    db $05 : dw $1800, $1000, $2000

.88DF:
    db $03, $01 : dw $0058
    db $09 : dw $0275
    db $09 : dw $0533
    db $09 : dw $04F0

    ;unused
    db $09 : dw $0410
    db $09 : dw $0533

.88F2: ;stage 5 ice tunnel
    db $0E, $04 : dw $0076
    db $15 : dw $3C0A, $3408, $2C06, $2404
    db $15 : dw $3809, $3007, $2805, $2003
    db $15 : dw $3408, $2C06, $2404, $1C02
    db $15 : dw $3007, $2805, $2003, $1801
    db $15 : dw $2C06, $2404, $1C02, $1400
    db $15 : dw $2805, $2003, $1801, $1000
    db $15 : dw $2404, $1C02, $1400, $0C00
    db $15 : dw $2003, $1801, $1000, $0800
    db $15 : dw $2404, $1C02, $1400, $0C00
    db $15 : dw $2805, $2003, $1801, $1000
    db $15 : dw $2C06, $2404, $1C02, $1400
    db $15 : dw $3007, $2805, $2003, $1801
    db $15 : dw $3408, $2C06, $2404, $1C02
    db $15 : dw $3809, $3007, $2805, $2003

.8974: ;stage 5 ice tunnel
    db $0E, $04 : dw $00B6
    db $15 : dw $1806, $1004, $0802, $0000
    db $15 : dw $1C07, $1405, $0C03, $0401
    db $15 : dw $2008, $1806, $1004, $0802
    db $15 : dw $2409, $1C07, $1405, $0C03
    db $15 : dw $280A, $2008, $1806, $1004
    db $15 : dw $2C0B, $2409, $1C07, $1405
    db $15 : dw $300C, $280A, $2008, $1806
    db $15 : dw $340D, $2C0B, $2409, $1C07
    db $15 : dw $300C, $280A, $2008, $1806
    db $15 : dw $2C0B, $2409, $1C07, $1405
    db $15 : dw $280A, $2008, $1806, $1004
    db $15 : dw $2409, $1C07, $1405, $0C03
    db $15 : dw $2008, $1806, $1004, $0802
    db $15 : dw $1C07, $1405, $0C03, $0401

.89F6: ;unused?
    db $0E, $01 : dw $002A
    db $0A : dw $0004
    db $0A : dw $0005
    db $0A : dw $0006
    db $0A : dw $0007
    db $0A : dw $0008
    db $0A : dw $0009
    db $0A : dw $000A
    db $0A : dw $000B
    db $0A : dw $000A
    db $0A : dw $0009
    db $0A : dw $0008
    db $0A : dw $0007
    db $0A : dw $0006
    db $0A : dw $0005

.8A24: ;unused?
    db $0A, $01 : dw $0032
    db $0A : dw $0002
    db $0A : dw $0003
    db $0A : dw $0004
    db $0A : dw $0005
    db $0A : dw $0006
    db $0A : dw $0007
    db $0A : dw $0006
    db $0A : dw $0005
    db $0A : dw $0004
    db $0A : dw $0003

.8A46: ;stage 5
    db $06, $04 : dw $0056
    db $10 : dw $49D6, $3D10, $2CCB, $1847
    db $10 : dw $4194, $34CE, $2489, $1005
    db $10 : dw $3952, $2C8C, $1C47, $0803
    db $10 : dw $3110, $244A, $1405, $0001
    db $10 : dw $3952, $2C8C, $1C47, $0803
    db $10 : dw $4194, $34CE, $2489, $1005

.8A80: ;2-2 water
    db $06, $0D : dw $00E2
    db $06 : dw $6180, $5900, $4880, $6B5A, $72CA, $6A04, $0000, $4D40, $4100, $38C0, $7A87, $65E0, $5D60
    db $06 : dw $5900, $4880, $6B5A, $72CA, $6A04, $6180, $0000, $4100, $38C0, $7A87, $65E0, $5D60, $4D40
    db $06 : dw $4880, $6B5A, $72CA, $6A04, $6180, $5900, $0000, $38C0, $7A87, $65E0, $5D60, $4D40, $4100
    db $06 : dw $6B5A, $72CA, $6A04, $6180, $5900, $4880, $0000, $7A87, $65E0, $5D60, $4D40, $4100, $38C0
    db $06 : dw $72CA, $6A04, $6180, $5900, $4880, $6B5A, $0000, $65E0, $5D60, $4D40, $4100, $38C0, $7A87
    db $06 : dw $6A04, $6180, $5900, $4880, $6B5A, $72CA, $0000, $5D60, $4D40, $4100, $38C0, $7A87, $65E0

.8B26: ;2-2 waterfall
    db $06, $06 : dw $00A2
    db $03 : dw $59C0, $5180, $4940, $7310, $728C, $6204
    db $03 : dw $6204, $59C0, $5180, $4940, $7310, $728C
    db $03 : dw $728C, $6204, $59C0, $5180, $4940, $7310
    db $03 : dw $7310, $728C, $6204, $59C0, $5180, $4940
    db $03 : dw $4940, $7310, $728C, $6204, $59C0, $5180
    db $03 : dw $5180, $4940, $7310, $728C, $6204, $59C0

.8B78: ;stage 3 tower
    db $0C, 03 : dw $005A
    db $35 : dw $0423, $0422, $0425
    db $10 : dw $0424, $0423, $0426
    db $10 : dw $0425, $0424, $0427
    db $10 : dw $0426, $0425, $0428
    db $10 : dw $0447, $0426, $0429
    db $10 : dw $0448, $0427, $082A
    db $20 : dw $0449, $0428, $082B
    db $10 : dw $0448, $0427, $082A
    db $10 : dw $0447, $0426, $0829
    db $10 : dw $0426, $0425, $0428
    db $10 : dw $0425, $0424, $0427
    db $10 : dw $0424, $0423, $0426

.8BD0: ;stage 5
    db $0E, $03 : dw $0022
    db $15 : dw $5D90, $3CEA, $3487
    db $15 : dw $554E, $38C9, $3066
    db $15 : dw $4D0C, $34A8, $2C45
    db $15 : dw $48EB, $3087, $2824
    db $15 : dw $44CA, $2C66, $2403
    db $15 : dw $40A9, $2845, $2002
    db $15 : dw $3C88, $2424, $1C01
    db $15 : dw $3867, $2003, $1800
    db $15 : dw $3C88, $2424, $1C01
    db $15 : dw $40A9, $2845, $2002
    db $15 : dw $44CA, $2C66, $2403
    db $15 : dw $48EB, $3087, $2824
    db $15 : dw $4D0C, $34A8, $2C45
    db $15 : dw $554E, $38C9, $3066

.8C36: ;stage 5
    db $0E, $03 : dw $002A
    db $15 : dw $2044, $3CEA, $3487
    db $15 : dw $1C23, $38C9, $3066
    db $15 : dw $1802, $34A8, $2C45
    db $15 : dw $1401, $3087, $2824
    db $15 : dw $1000, $2C66, $2403
    db $15 : dw $0C00, $2845, $2002
    db $15 : dw $0800, $2424, $1C01
    db $15 : dw $0400, $2003, $1800
    db $15 : dw $0800, $2424, $1C01
    db $15 : dw $0C00, $2845, $2002
    db $15 : dw $1000, $2C66, $2403
    db $15 : dw $1401, $3087, $2824
    db $15 : dw $1802, $34A8, $2C45
    db $15 : dw $1C23, $38C9, $3066

.8C9C: ;stage 5
    db $0E, $03 : dw $0032
    db $15 : dw $2D68, $2504, $18C2
    db $15 : dw $2947, $20E3, $14A1
    db $15 : dw $2526, $1CC2, $1080
    db $15 : dw $2105, $18A1, $0C60
    db $15 : dw $1CE4, $1480, $0840
    db $15 : dw $18C3, $1060, $0420
    db $15 : dw $14A2, $0C40, $0000
    db $15 : dw $1081, $0820, $0000
    db $15 : dw $14A2, $0C40, $0000
    db $15 : dw $18C3, $1060, $0420
    db $15 : dw $1CE4, $1480, $0840
    db $15 : dw $2105, $18A1, $0C60
    db $15 : dw $2526, $1CC2, $1080
    db $15 : dw $2947, $20E3, $14A1

.8D02: ;stage 5
    db $0E, $03 : dw $003A
    db $15 : dw $1080, $2504, $18C2
    db $15 : dw $0C60, $20E3, $14A1
    db $15 : dw $0840, $1CC2, $1080
    db $15 : dw $0420, $18A1, $0C60
    db $15 : dw $0000, $1480, $0840
    db $15 : dw $0000, $1060, $0420
    db $15 : dw $0000, $0C40, $0C00
    db $15 : dw $0000, $0820, $0800
    db $15 : dw $0000, $0C40, $0C00
    db $15 : dw $0000, $1060, $0420
    db $15 : dw $0000, $1480, $0840
    db $15 : dw $0420, $18A1, $0C60
    db $15 : dw $0840, $1CC2, $1080
    db $15 : dw $0C60, $20E3, $14A1

.8D68: ;stage 3 tower
    db $0A, 03 : dw $0022
    db $15 : dw $2860, $2040, $1420
    db $15 : dw $2861, $2041, $1421
    db $15 : dw $2862, $2042, $1422
    db $15 : dw $2863, $2043, $1423
    db $15 : dw $2864, $2044, $1424
    db $15 : dw $2865, $2045, $1425
    db $15 : dw $2864, $2044, $1424
    db $15 : dw $2863, $2043, $1423
    db $15 : dw $2862, $2042, $1422
    db $15 : dw $2861, $2041, $1421

.8DB2: ;unused?
    db $04, $0E : dw $0064
    db $08 : dw $00CA, $0046, $4A40, $3180, $18C0, $0C60, $5B1B, $4698, $3614, $29B1, $1D4E, $0CCA, $0488, $0004
    db $08 : dw $0008, $0004, $0252, $3180, $18C0, $0C60, $52DB, $3E58, $35D4, $1951, $008C, $0008, $0006, $0004
    db $08 : dw $000A, $0006, $4A40, $3180, $18C0, $0C60, $3A5B, $2196, $1112, $000E, $000A, $0008, $0004, $0002
    db $3F : dw $000E, $0008, $4A40, $3180, $18C0, $0C60, $01DB, $0116, $0052, $0010, $000C, $000A, $0006, $0003

.8E2A: ;unused?
    db $03, $0E : dw $0064
    db $08 : dw $000A, $0006, $4A40, $3180, $18C0, $0C60, $3A5B, $2196, $1112, $000E, $000A, $0008, $0004, $0002
    db $08 : dw $0008, $0004, $0252, $3180, $18C0, $0C60, $52DB, $3E58, $35D4, $1951, $008C, $0008, $0006, $0004
    db $3F : dw $00CA, $0046, $4A40, $3180, $18C0, $0C60, $5B1B, $4698, $3614, $29B1, $1D4E, $0CCA, $0488, $0004

.8E85: ;unused?
    db $04, $0E : dw $00E2
    db $08 : dw $46B7, $001A, $0012, $000C, $0008, $00A0, $0060, $3633, $25AF, $152D, $0CE9, $04A7, $0065, $0023
    db $08 : dw $4313, $001A, $0012, $000C, $0008, $11CB, $0148, $3A92, $2A0E, $198A, $1148, $0906, $00C4, $0082
    db $08 : dw $4313, $001A, $0012, $000C, $0008, $0216, $0152, $3AD0, $2A4C, $19C8, $1186, $0944, $0102, $00C0
    db $3F : dw $5B54, $001A, $0012, $000C, $0008, $131C, $0238, $4B4C, $3284, $19C0, $1140, $00E0, $00A0, $0060

.8EFD: ;unused?
    db $03, $0E : dw $00E2
    db $08 : dw $4313, $001A, $0012, $000C, $0008, $0216, $0152, $3AD0, $2A4C, $19C8, $1186, $0944, $0102, $00C0
    db $08 : dw $4313, $001A, $0012, $000C, $0008, $11CB, $0148, $3A92, $2A0E, $198A, $1148, $0906, $00C4, $0082
    db $3F : dw $46B7, $001A, $0012, $000C, $0008, $00A0, $0060, $3633, $25AF, $152D, $0CE9, $04A7, $0065, $0023

.8F58: ;unused?
    db $06, $04 : dw $0062
    db $15 : dw $40AD, $30A8, $1C65, $1043
    db $15 : dw $386B, $2866, $1423, $0801
    db $15 : dw $3029, $2024, $0C01, $0000
    db $15 : dw $2807, $1802, $0400, $0000
    db $15 : dw $3029, $2024, $0C01, $0000
    db $15 : dw $386B, $2866, $1423, $0801

.8F92: ;stage 5
    db $05, $04 : dw $00C2
    db $04 : dw $7FFF, $7FDA, $7F55, $7ECF
    db $04 : dw $7F55, $7FFF, $7F55, $7F55
    db $04 : dw $7F55, $7F55, $7FFF, $7F55
    db $04 : dw $7F55, $7F55, $7F55, $7FFF
    db $20 : dw $7FDA, $7F55, $7F55, $7F55

.8FC3: ;stage 5 ice tunnel
    db $05, $04 : dw $00F2
    db $04 : dw $7FD8, $6A2C, $660B, $61EA
    db $04 : dw $61EA, $7FD8, $6A2C, $660B
    db $04 : dw $660B, $61EA, $7B53, $6A2C
    db $04 : dw $6A2C, $660B, $61EA, $6B12
    db $20 : dw $6AAF, $6A2C, $660B, $61EA

.8FF4: ;stage 5-2
    db $05, $04 : dw $0072
    db $04 : dw $7EFC, $6635, $6635, $6635
    db $04 : dw $6635, $7EFC, $6635, $6635
    db $04 : dw $6635, $6635, $7EFC, $6635
    db $04 : dw $6635, $6635, $6635, $7EFC
    db $20 : dw $6635, $6635, $6635, $6635

.9025: ;stage 3 tower
    db $0A, 03 : dw $002A
    db $15 : dw $0004, $3060, $2460
    db $15 : dw $0005, $3061, $2461
    db $15 : dw $0006, $3062, $2462
    db $15 : dw $0007, $3063, $2463
    db $15 : dw $0008, $3064, $2464
    db $15 : dw $0009, $3065, $2465
    db $15 : dw $0008, $3064, $2464
    db $15 : dw $0007, $3063, $2463
    db $15 : dw $0006, $3062, $2462
    db $15 : dw $0005, $3061, $2461

.906F: ;stage 3 tower
    db $0A, $03 : dw $0032
    db $15 : dw $0004, $2840, $1420
    db $15 : dw $0005, $2841, $1421
    db $15 : dw $0006, $2842, $1422
    db $15 : dw $0007, $2843, $1423
    db $15 : dw $0008, $2844, $1424
    db $15 : dw $0009, $2845, $1425
    db $15 : dw $0008, $2844, $1424
    db $15 : dw $0007, $2843, $1423
    db $15 : dw $0006, $2842, $1422
    db $15 : dw $0005, $2841, $1421

.90B9: ;stage 3 tower
    db $0A, 03 : dw $003A
    db $15 : dw $0000, $2840, $1420
    db $15 : dw $0001, $2841, $1421
    db $15 : dw $0002, $2842, $1422
    db $15 : dw $0003, $2843, $1423
    db $15 : dw $0004, $2844, $1424
    db $15 : dw $0005, $2845, $1425
    db $15 : dw $0004, $2844, $1424
    db $15 : dw $0003, $2843, $1423
    db $15 : dw $0002, $2842, $1422
    db $15 : dw $0001, $2841, $1421

.9103: ;stage 3
    db $06, $0E : dw $0082
    db $08 : dw $0009, $0008, $0027, $0005, $0003, $0002, $0007, $025E, $01FE, $019B, $0138, $0012, $000E, $000C
    db $08 : dw $000A, $0009, $0027, $0005, $0003, $0003, $0048, $000E, $025E, $01FE, $019B, $0138, $0012, $000F
    db $08 : dw $004B, $004A, $0027, $0005, $0003, $0003, $0069, $0012, $000E, $025E, $01FE, $019B, $0138, $0012
    db $08 : dw $006C, $000B, $0027, $0005, $0003, $0002, $008A, $0138, $0012, $000E, $01FE, $019B, $0138, $0012
    db $08 : dw $008F, $004C, $0027, $0005, $0003, $0001, $0069, $019B, $0138, $0012, $000E, $025E, $01FE, $000C
    db $08 : dw $004C, $002B, $0027, $0005, $0003, $0001, $0048, $01FE, $019B, $0138, $0012, $000E, $025E, $000A

.91B5: ;stage 5-2
    db $05, $04 : dw $0082
    db $04 : dw $7FFF, $7FDA, $7F55, $7ECF
    db $04 : dw $7F55, $7FFF, $7F55, $7F55
    db $04 : dw $7F55, $7F55, $7FFF, $7F55
    db $04 : dw $7F55, $7F55, $7F55, $7FFF
    db $20 : dw $7FDA, $7F55, $7F55, $7F55

.91E6: ;stage 5-2
    db $05, $07 : dw $00B0
    db $05 : dw $7FDD, $7FDD, $7FDD, $7FDD, $7FBB, $7AD1, $0000
    db $05 : dw $7FBB, $7FDD, $7FDD, $7FDD, $7FDD, $6A6E, $5586
    db $05 : dw $7FDD, $7FBB, $7FDD, $7FDD, $7FDD, $5DC9, $5DE9
    db $05 : dw $7FDD, $7FDD, $7FBB, $7FDD, $7FDD, $5586, $6A6E
    db $05 : dw $7FDD, $7FDD, $7FDD, $7FBB, $7FDD, $0000, $7AD1

.9235 ;stage 3, close to the start
    db $06, $03 : dw $0022
    db $09 : dw $0006, $0004, $0002
    db $09 : dw $0002, $0006, $0004
    db $09 : dw $0004, $0002, $0006
    db $09 : dw $0006, $0004, $0002
    db $09 : dw $0002, $0006, $0004
    db $09 : dw $0002, $0004, $0006

.9263: ;stage 3
    db $06, $06 : dw $0070
    db $08 : dw $025E, $01FE, $019B, $0138, $0012, $000E
    db $08 : dw $000E, $025E, $01FE, $019B, $0138, $0012
    db $08 : dw $0012, $000E, $025E, $01FE, $019B, $0138
    db $08 : dw $0138, $0012, $000E, $01FE, $019B, $0138
    db $08 : dw $019B, $0138, $0012, $000E, $025E, $01FE
    db $08 : dw $01FE, $019B, $0138, $0012, $000E, $025E

.92B5: ;stage 5-2
    db $0C, $04 : dw $00D6
    db $0C : dw $380E, $280A, $1C07, $1004
    db $0C : dw $384F, $284B, $1C28, $1025
    db $0C : dw $3870, $286C, $1C49, $1046
    db $0C : dw $3891, $288D, $1C6A, $1067
    db $0F : dw $3870, $286C, $1C49, $1046
    db $0C : dw $384F, $284B, $1C28, $1025
    db $0C : dw $380E, $280A, $1C07, $1004
    db $0C : dw $400E, $300A, $2407, $1804
    db $0C : dw $480E, $380A, $2C07, $2004
    db $0C : dw $500E, $400A, $3407, $2804
    db $0C : dw $480E, $380A, $2C07, $2004
    db $0C : dw $400E, $300A, $2407, $1804

.9325: ;stage 4c
    db $06, $0E : dw $00E2
    db $40 : dw $000D, $000A, $0008, $0006, $0004, $0002, $0000, $0465, $0023, $0002, $0001, $0000, $0000, $0000
    db $15 : dw $0014, $000E, $000A, $0006, $0004, $0002, $0000, $0046, $0025, $0004, $0003, $0001, $0000, $0000
    db $10 : dw $2096, $1010, $000C, $0006, $0004, $0002, $0000, $0468, $0047, $0026, $0005, $0004, $0003, $0002
    db $10 : dw $3118, $1856, $080F, $0008, $0006, $0004, $0000, $0009, $0008, $0006, $0005, $0004, $0003, $0002
    db $10 : dw $2096, $1010, $000C, $0006, $0004, $0002, $0000, $0468, $0047, $0026, $0005, $0004, $0003, $0002
    db $15 : dw $0014, $000E, $000A, $0006, $0004, $0002, $0000, $0046, $0025, $0004, $0003, $0001, $0000, $0000

.93D7: ;stage 4c
    db $06, $0E : dw $0082
    db $40 : dw $0092, $0050, $000C, $0009, $0008, $0006, $0002, $0000, $0D10, $08CE, $04AC, $048A, $0068, $0004
    db $15 : dw $0051, $000E, $000A, $0007, $0006, $0004, $0002, $0000, $08D0, $04AE, $008C, $006A, $0026, $0004
    db $10 : dw $0010, $000C, $0008, $0006, $0004, $0003, $0002, $0000, $0090, $006E, $004C, $002A, $0006, $0004
    db $10 : dw $0010, $000C, $0008, $0006, $0004, $0002, $0000, $0000, $0010, $000E, $000C, $0008, $0006, $0004
    db $10 : dw $0010, $000C, $0008, $0006, $0004, $0003, $0002, $0000, $0090, $006E, $004C, $002A, $0006, $0004
    db $15 : dw $0051, $000E, $000A, $0007, $0006, $0004, $0002, $0000, $08D0, $04AE, $008C, $006A, $0026, $0004

.9489: ;stage 5-2
    db $12, $03 : dw $002A
    db $20 : dw $3CCA, $30A8, $2466
    db $10 : dw $3CA9, $3087, $2445
    db $10 : dw $3C88, $3066, $2444
    db $10 : dw $3C67, $3045, $2423
    db $10 : dw $3C46, $3025, $2403
    db $10 : dw $3C25, $3004, $2402
    db $10 : dw $3C46, $3025, $2403
    db $10 : dw $3C67, $3045, $2423
    db $10 : dw $3C88, $3066, $2444
    db $10 : dw $3CA9, $3087, $2445
    db $20 : dw $3CCA, $30A8, $2466
    db $10 : dw $38CA, $2CA8, $2066
    db $10 : dw $34CA, $28A8, $1C66
    db $10 : dw $30CA, $24A8, $1866
    db $10 : dw $2CCA, $20A8, $1466
    db $10 : dw $30CA, $24A8, $1866
    db $10 : dw $34CA, $28A8, $1C66
    db $10 : dw $38CA, $2CA8, $2086

.950B: ;stage 3
    db $06, $03 : dw $0032
    db $15 : dw $0006, $0005, $0004
    db $15 : dw $0005, $0004, $0003
    db $15 : dw $0004, $0003, $0002
    db $15 : dw $0003, $0002, $0001
    db $15 : dw $0004, $0003, $0002
    db $15 : dw $0005, $0004, $0003

.9539: ;stage 7
    db $03, $05 : dw $0096
    db $08 : dw $0008, $0012, $000E, $0007, $000F
    db $08 : dw $0007, $000E, $0007, $0012, $0000
    db $08 : dw $0009, $0007, $000E, $0012, $0008

.955E: ;stage 7
    db $0A, $03 : dw $0078
    db $13 : dw $000F, $000A, $0005
    db $08 : dw $000E, $0009, $0004
    db $08 : dw $000D, $0008, $0003
    db $08 : dw $000C, $0007, $0002
    db $08 : dw $000B, $0006, $0001
    db $08 : dw $000A, $0005, $0001
    db $08 : dw $000B, $0006, $0001
    db $08 : dw $000C, $0007, $0002
    db $08 : dw $000D, $0008, $0003
    db $08 : dw $000E, $0009, $0004

.95A8: ;stage 5-2
    db $03, $03 : dw $0032
    db $09 : dw $55CE, $51AD, $4D8C
    db $09 : dw $51AD, $4D8C, $55CE
    db $09 : dw $4D8C, $55CE, $51AD

.95C1: ;stage 5-2
    db $03, $03 : dw $003A
    db $09 : dw $30C6, $51AD, $0000
    db $09 : dw $2484, $4D8C, $28A5
    db $09 : dw $0000, $55CE, $1C42

.95DA: ;stage 4b
    db $04, $0E : dw $00A2
    db $13 : dw $1800, $1000, $0800, $0400, $1864, $1443, $0C22, $3903, $2460, $1C40, $1820, $1400, $1000, $0C04
    db $10 : dw $2040, $1400, $0C00, $0800, $1864, $1443, $0C22, $30C1, $2040, $1820, $1400, $1000, $0C00, $0800
    db $10 : dw $2880, $1800, $1000, $0C00, $1443, $1022, $0801, $2460, $1820, $1400, $1000, $0C00, $0800, $0400
    db $10 : dw $30C1, $2040, $1840, $1400, $1022, $0C01, $0400, $1800, $1000, $0C00, $0800, $0400, $0400, $0000

.9652: ;stage 6
    db $09, $03 : dw $0098
    db $13 : dw $0016, $000F, $000A
    db $13 : dw $0015, $000E, $0009
    db $13 : dw $0014, $000D, $0008
    db $13 : dw $0013, $000C, $0007
    db $13 : dw $0012, $000B, $0006
    db $13 : dw $0011, $000A, $0006
    db $13 : dw $0012, $000B, $0006
    db $13 : dw $0013, $000C, $0007
    db $13 : dw $0014, $000D, $0008

    ;unused
    db $13 : dw $0015, $000E, $0009

.969C: ;stage 6
    db $06, $01 : dw $00DC
    db $13 : dw $0C01
    db $13 : dw $1002
    db $13 : dw $1403
    db $13 : dw $1804
    db $13 : dw $1403
    db $13 : dw $1002

.96B2: ;unused?
    db $05, $0E : dw $00E2
    db $05 : dw $6F72, $6F72, $6F72, $0009, $0840, $1080, $18C0, $2100, $2940, $39C4, $4A48, $5ACC, $6B50, $7BDE
    db $05 : dw $6F72, $6F72, $7BDE, $0009, $0840, $1080, $18C0, $2100, $2940, $39C4, $4A48, $5ACC, $6B50, $6F72
    db $05 : dw $6F72, $7BDE, $6F72, $0009, $0840, $1080, $18C0, $2100, $2940, $39C4, $4A48, $5ACC, $6B50, $6F72
    db $05 : dw $7BDE, $6F72, $6F72, $0009, $0840, $1080, $18C0, $2100, $2940, $39C4, $4A48, $5ACC, $6B50, $6F72
    db $50 : dw $6F72, $6F72, $6F72, $0009, $0840, $1080, $18C0, $2100, $2940, $39C4, $4A48, $5ACC, $6B50, $6F72

.9747: ;unused?
    db $04, $0E : dw $0062
    db $10 : dw $7BDE, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $031E, $0200
    db $10 : dw $7BDE, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $7BDE, $0200
    db $10 : dw $031E, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $7BDE, $0200
    db $50 : dw $031E, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $031E, $0200

.97BF: ;unused?
    db $04, $0F : dw $0042
    db $10 : dw $7BDE, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $031E, $0200, $0009
    db $10 : dw $7BDE, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $7BDE, $0200, $0009
    db $10 : dw $031E, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $7BDE, $0200, $0009
    db $50 : dw $031E, $029C, $0218, $0152, $00CE, $004A, $0006, $0004, $0002, $02C0, $0140, $0080, $031E, $0200, $0009

.983F: ;stage 8
    db $04, $0F : dw $00E2
    db $90 : dw $3C40, $3420, $2800, $2000, $1C00, $1800, $1400, $1000, $0C00, $0800, $0400, $0400, $0800, $0000, $0000
    db $04 : dw $5940, $4D00, $48C0, $4040, $3800, $2800, $2000, $1C00, $1800, $1400, $1000, $2000, $1C00, $2800, $6A08
    db $04 : dw $3C40, $3420, $2800, $2000, $1C00, $1800, $1400, $1000, $0C00, $0800, $0400, $0400, $0800, $0000, $0000
    db $20 : dw $72CE, $6A08, $6180, $5100, $4080, $3840, $3000, $2800, $2000, $1800, $1000, $3000, $2800, $3840, $739C

.98BF: ;stage 6
    db $03, $05 : dw $00D6
    db $08 : dw $0048, $0032, $002E, $0027, $002F
    db $08 : dw $0027, $002E, $0027, $0032, $0021
    db $08 : dw $0029, $0027, $002E, $0032, $0028

.98E4: ;stage 3
    db $06, $07 : dw $0050
    db $08 : dw $025E, $01FE, $019B, $0138, $0012, $000E, $0009
    db $08 : dw $000E, $025E, $01FE, $019B, $0138, $0012, $0007
    db $08 : dw $0012, $000E, $025E, $01FE, $019B, $0138, $0005
    db $08 : dw $0138, $0012, $000E, $01FE, $019B, $0138, $0003
    db $08 : dw $019B, $0138, $0012, $000E, $025E, $01FE, $0004
    db $08 : dw $01FE, $019B, $0138, $0012, $000E, $025E, $0007

.9942: ;stage 8
    db $04, $0F : dw $0042
    db $90 : dw $71C0, $6140, $54A0, $4460, $3C40, $3400, $2C00, $2400, $1C00, $1400, $1000, $1000, $1400, $0000, $0000
    db $04 : dw $7B50, $7ACA, $7240, $6980, $58C0, $5080, $4000, $3400, $2800, $2400, $1C00, $4000, $3400, $5080, $6A08
    db $04 : dw $71C0, $6140, $54A0, $4460, $3C40, $3400, $2C00, $2400, $1C00, $1400, $1000, $1000, $1400, $0000, $0000
    db $20 : dw $7BBA, $7BBA, $7B32, $7A8A, $6A06, $5140, $4040, $3000, $2000, $1800, $1000, $4900, $3040, $5982, $739C

.99C2: ;stage 8
    db $04, $0F : dw $0062
    db $90 : dw $5CE0, $4C60, $3C00, $3000, $2800, $2000, $1800, $1000, $0C00, $0800, $0400, $0400, $0800, $0000, $0000
    db $04 : dw $7A44, $7180, $6900, $4CA0, $3840, $3400, $2C00, $2400, $1C00, $1400, $1000, $2C00, $2400, $3400, $6A08
    db $04 : dw $5CE0, $4C60, $3C00, $3000, $2800, $2000, $1800, $1000, $0C00, $0800, $0400, $0400, $0800, $0000, $0000
    db $20 : dw $7B10, $7248, $5982, $40C0, $3840, $3400, $2C00, $2400, $1C00, $1400, $1000, $2C00, $2400, $3400, $739C

.9A42: ;stage 8
    db $04, $0F : dw $00A2
    db $90 : dw $7640, $69C0, $5DA0, $5520, $48C0, $3C60, $3000, $2000, $1000, $69C0, $5DA0, $5520, $48C0, $3C60, $3000
    db $04 : dw $7B0C, $72A8, $6A24, $61A0, $5520, $4CE0, $44A0, $3460, $2800, $6A24, $61A0, $5520, $4CE0, $44A0, $3460
    db $04 : dw $7640, $69C0, $5DA0, $5520, $48C0, $3C60, $3000, $2000, $1000, $69C0, $5DA0, $5520, $48C0, $3C60, $3000
    db $20 : dw $7BBA, $7BBA, $7B52, $72CD, $6208, $5980, $4D00, $3CA0, $3000, $72CD, $6208, $5980, $4D00, $3CA0, $3000

.9AC2: ;stage 8
    db $04, $0F : dw $0082
    db $90 : dw $7640, $69C0, $6180, $5940, $50C0, $48A0, $4040, $3800, $3000, $2800, $2000, $4040, $3800, $48A0, $0000
    db $04 : dw $7B0C, $72A8, $6A24, $61A0, $5520, $4CE0, $44A0, $3C00, $3400, $2C08, $2400, $44A0, $3C00, $4CE0, $6A08
    db $04 : dw $7640, $69C0, $6180, $5940, $50C0, $48A0, $4040, $3800, $3000, $2800, $2000, $4040, $3800, $48A0, $0000
    db $20 : dw $7BBA, $7B52, $72CD, $6A48, $61C0, $5540, $4CE0, $4400, $3C00, $3400, $2C00, $4CE0, $4400, $5540, $739C

.9B42: ;the end
    db $0F, $06 : dw $0094
    db $04 : dw $2483, $2483, $2483, $2483, $2483, $2483
    db $04 : dw $2883, $2483, $2483, $2483, $2483, $2483
    db $04 : dw $2C83, $2484, $2483, $2483, $2483, $2483
    db $04 : dw $3084, $2485, $2483, $2483, $2483, $2483
    db $04 : dw $3484, $2486, $2483, $2483, $2483, $2483
    db $04 : dw $3C84, $2487, $2484, $2483, $2483, $2483
    db $04 : dw $3C85, $2488, $2485, $2483, $2483, $2483
    db $04 : dw $4086, $2489, $2486, $2483, $2483, $2483
    db $04 : dw $4487, $248A, $2887, $2483, $2483, $2483
    db $04 : dw $48A8, $248B, $2C88, $2484, $2483, $2483
    db $04 : dw $4CC9, $3C8C, $3089, $2485, $2464, $2483
    db $04 : dw $50EF, $40AD, $348A, $2886, $2465, $2483
    db $04 : dw $5510, $44CE, $388B, $2C88, $2466, $2483
    db $04 : dw $5931, $48EF, $3CAC, $308A, $2867, $2483
    db $04 : dw $5D52, $4D10, $40CD, $388B, $2C68, $2483
}

{ ;9C09 - 9DD9
_039C09:
    lda #$0F : cop #$00

;----- 9C0D

    lda #$F1 : jsl _018049_8053
    lda #$14 : jsl _018049_8053
    lda $02D5 : and #$FB : sta $02D5
    !AX16
    lda.w stage : pha
    lda #$0011 : sta.w stage
    jsl _019136_9150
    !A16
    pla : sta.w stage
    !A8
    brk #$00

;----- 9C3B

    stz $032E
    stz $02F0
    !A16
    lda #$1800 : sta $0318
    lda #$0800 : sta $031A
    stz $1889
    stz $188D
    !X16
if !version == 0
    lda #$21BF
elseif !version == 1 || !version == 2
    lda #$21C5
endif
    !AX8
    jsl _018061_8064
    inc $0323
    brk #$00

;----- 9C65

if !version == 0
    ldy #$27 : jsl _01A21D
    lda #$15 : sta $031E
elseif !version == 1 || !version == 2
    ldy #$AF : jsl _01A21D_decompress_graphics
    ldy #$2C : jsl _01A21D
    lda #$1A : sta $031E
endif
    lda #$05 : sta $02E1
    lda $02D9 : ora #$08 : sta $02D9
    lda #$04 : cop #$00

;----- 9C81

    !AX16
    lda #$0007 : sta $31
.9C88:
    lda #$0060 : sta $0004
    ldx #$0000
.9C91:
    lda $7EF440,X : and #$001F           : jsr .9CF2                                   : sta $0000
    lda $7EF440,X : and #$03E0 : lsr #5  : jsr .9CF2 : asl #5                          : sta $0002
    lda $7EF440,X : and #$7C00 : lsr #10 : jsr .9CF2 : asl #10 : ora $0000 : ora $0002 : sta $7EF440,X
    inx #2
    dec $0004
    bne .9C91

    dec $31
    beq .9CF6

    !AX8
    lda #$0A : cop #$00

;----- 9CEE

    !AX16
    bra .9C88

;-----

.9CF2:
    beq .9CF5

    dec
.9CF5:
    rts

;-----

.9CF6:
    !AX8
    lda $02D5 : ora #$04 : sta $02D5
    ldx #$2A : ldy #$90 : lda.b #_01FF00_5C : jsl _01A6FE
.9D0A:
    brk #$00

;----- 9D0C

    lda $00DE
    bne .9D0A

    !X8
    !A16
    lda #$04B8 : sta !obj_pos_x+1
    lda #$0148 : sta !obj_pos_y+1
    !A8
    ldy #$A8 : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    !A16
    lda #$0100 : sta $29
    lda.w _00ED00+$5E : sta $27
    !A8
    lda #$1D : sta $31
.9D3F:
    lda #$00 : sta $02EB
    lda #$90 : sta $02EC
    lda $31 : ora #$E0 : sta $02EE
    dec $31
    beq .9D62

    lda #$07 : cop #$00

;----- 9D58

    jsl update_animation_normal
    jsl _018E32_8E73
    bra .9D3F

.9D62:
    lda $02D7 : ora #$04 : sta $02D7
    lda #$0F : cop #$00

;----- 9D6E

    ldx #$00
    lda.w loop
    beq .9D77

    ldx #$01
.9D77:
    ldy #$90
    lda.b #_01FF00_18
    jsl _01A6FE
.9D7F:
    brk #$00

;----- 9D81

    lda $00DE
    bne .9D7F

    lda #$F6 : jsl _018049_8053
    lda #$A0 : jsl _018049_8053
    lda #$FF : cop #$00

;----- 9D96

    ldx #$04 : ldy #$78 : lda.b #_01FF00_0C : jsl _01A6FE
.9DA0:
    brk #$00

;----- 9DA2

    lda $00C6
    bne .9DA0

    bra .9DB3

;-----

    ;unused, probably supposed to open the gate
    lda #!id_gate2 : jsl prepare_object
    jml _0281A8_81B5

;-----

.9DB3:
    ldx #$00
    lda.w loop
    beq .9DBC

    ldx #$07
.9DBC:
    lda #$07 : sta $0278
    stx $1F9D
    stz.w checkpoint
    inc.w loop
    lda !armor_state
    bne .9DD2

    inc !armor_state
.9DD2:
    jsl _01DCCF
    jml _0281A8_81B5
}

{ ;9DDA - 9E78
_039DDA:
    lda #$00
    xba
    clc
    tya
    adc #$4E
    tcd
    !AX16
    lda #$0020 : sta $0B
.9DE9:
    stz $09
    ldx #$0000
.9DEE:
    lda $07
    and #$00FF
    asl
    tay
    lda.w _01CDD7_CDD7,Y : sta $0D
    lda $09
    lsr #4
    asl
    clc
    adc $0D
    tay
    lda.w _01CDD7_CDE1,Y
    beq .9E56

    lda $7EF400,X : and #$001F :           jsr _039C09_9CF2 :                                   sta $0000
    lda $7EF400,X : and #$03E0 : lsr #5  : jsr _039C09_9CF2 : asl #5  :                         sta $0002
    lda $7EF400,X : and #$7C00 : lsr #10 : jsr _039C09_9CF2 : asl #10 : ora $0000 : ora $0002 : sta $7EF400,X
.9E56:
    inx #2
    inc $09
    lda $09
    cmp #$0100
    bne .9DEE

    dec $0B
    beq .9E75

    !AX8
    inc $0331
    lda #$03 : jsl _01A717_A728
    !AX16
    jmp .9DE9

.9E75:
    jml _01A717
}

{ ;9E79 - 9F3F
_039E79:

.create:
    !X16
    ldx #$01E0
    lda $07
    pha
    and #$10
    beq .9E88

    ldx #$01E8
.9E88:
    stx $29
    !X8
    pla
    and #$EF
    sta $07
    lda $08 : ora #$07 : sta $08
    lda #$FF : sta $26
    lda #$80 : sta $09
    !A16
    lda.w _00ED00+$2E : sta $27
    lda.w #tower_edge_data_CEF0 : sta $13
    !A8
    lda $07
    pha
    lsr
    tax
    lda.w tower_edge_data_CEED,X : sta $15
    lda.w tower_edge_data_CEEA,X : ldy #$E8 : ldx #$21 : jsl set_sprite_8480
    pla
    and #$01
    sta !obj_facing
.9EC7:
    brk #$00

;----- 9EC9

    !A16
    lda !obj_pos_x+1 : sta $2D
    lda !obj_pos_y+1 : sta $2F
    !A8
    lda $031C
    beq .9EDE

    jsl update_animation_normal
.9EDE:
    jsl _018E32_8E73
    lda $1F9B
    beq .9F2E

    lda $07
    and #$01
    beq .9EFC

    !A16
    clc
    lda.w camera_x+1
    adc #$001E
    sta !obj_pos_x+1
    !A8
    bra .9F09

.9EFC:
    !A16
    clc
    lda.w camera_x+1
    adc #$00E2
    sta !obj_pos_x+1
    !A8
.9F09:
    !A16
    lda !obj_pos_x+1
    sta $31
    and #$FFFF
    sta !obj_pos_x+1
    !A8
    jsl _01A593
    bne .9F28

    !A16
    lda $2D
    sta !obj_pos_x+1
    lda $2F
    sta !obj_pos_y+1
    bra .9F2E

.9F28:
    !A16
    lda $31 : sta !obj_pos_x+1
.9F2E:
    !A16
    lda.w camera_x+1
    cmp !obj_pos_x+1
    !A8
    bcc .9F39

.9F39:
    bra .9EC7

;-----

.thing:
    jsl _028156
    rtl
}

{ ;9F40 - 9F9B
_039F40:

.create:
    lda $07
    bne .9F54

    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda $08 : ora #$06 : sta $08
    bra .9F62

.9F54:
    ldy #$BA : ldx #$21 : jsl set_sprite
    lda $08 : ora #$05 : sta $08
.9F62:
    lda $09 : ora #$30 : sta $09
.9F68:
    brk #$00

;----- 9F6A

    jsl update_animation_normal
    lda $07
    bne .9F68

    lda $1F9E
    beq .9F68

    lda #$32 : sta $2D
    lda #!sfx_gate_open : jsl _018049_8053
.9F81:
    brk #$00

;----- 9F83

    jsl update_animation_normal
    !A16
    inc !obj_pos_x+1
    !A8
    dec $2D
    bne .9F81

    inc $1F9F
.9F94:
    brk #$00

;----- 9F96

    jsl update_animation_normal
    bra .9F94
}

{ ;9F9C - A2FB
_039F9C:

.create:
    ldy #$BC : ldx #$21 : jsl set_sprite
    lda $08 : and #$F7 : ora #$05 : sta $08
    lda $09 : ora #$80 : sta $09
    jsl set_hp
    lda #$58 : sta $37
    stz $38
    stz $33
    stz $35
    stz $34
.9FC2:
    brk #$00

;----- 9FC4

    lda $19ED
    beq .9FC2

    lda $0F
    asl
    tax
    jmp (+,X) : +: dw .9FE8, .A00B, .A04E, .A090, .A0D4, .A118, .A16B, .A1AF, .A1F3, .A235, .A270, .A29C

;-----

.9FE8:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$005E
    sec
    sbc !obj_pos_x+1
    bcs .9FFA

    !A8
    bra .9FC2

.9FFA:
    lda !obj_pos_y+1
    sta $2F
    !A8
    lda $08 : ora #$08 : sta $08
    inc $0F
    jmp .9FC2

;-----

.A00B:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$005A
    sec
    sbc !obj_pos_x+1
    bcc .A02B

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A02B:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$005E
    sec
    sbc !obj_pos_x+1
    bcs .A046

    !A8
    lda $08 : and #$F7 : sta $08
    dec $0F
    jmp .9FC2

.A046:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A04E:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$0056
    sec
    sbc !obj_pos_x+1
    bcc .A06E

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A06E:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$005A
    sec
    sbc !obj_pos_x+1
    bcs .A088

    !A8
    ldy #$BC : ldx #$21 : jsl set_sprite
    dec $0F
.A088:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A090:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$0045
    sec
    sbc !obj_pos_x+1
    bcc .A0B2

    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    inc $34
    inc $0F
    jsr .A29F
    jmp .9FC2

.A0B2:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$0056
    sec
    sbc !obj_pos_x+1
    bcs .A0CC

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    dec $0F
.A0CC:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A0D4:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$0030
    sec
    sbc !obj_pos_x+1
    bcc .A0F4

    !A8
    ldy #$D6 : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A0F4:
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$0045
    sec
    sbc !obj_pos_x+1
    bcs .A110

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    stz $34
    dec $0F
.A110:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A118:
    jsl get_arthur_relative_side : eor #$01 : sta !obj_direction : sta !obj_facing
    !A16
    lda !arthur_pos_x+1
    clc
    adc #$0030
    sec
    sbc !obj_pos_x+1
    bcs .A145

    lda !obj_pos_y+1 : sta $2F
    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    stz $33
    dec $0F
    jmp .9FC2

.A145:
    lda !arthur_pos_x+1
    sec
    sbc #$0030
    sec
    sbc !obj_pos_x+1
    bcc .A166

    lda !obj_pos_y+1 : sta $2F
    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    inc $33
    inc $0F
    jmp .9FC2

.A166:
    !A8
    jmp .9FC2

;-----

.A16B:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$0045
    sec
    sbc !obj_pos_x+1
    bcc .A18D

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    stz $34
    inc $0F
    jsr .A29F
    jmp .9FC2

.A18D:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$0030
    sec
    sbc !obj_pos_x+1
    bcs .A1A7

    !A8
    ldy #$D6 : ldx #$21 : jsl set_sprite
    dec $0F
.A1A7:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A1AF:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$0058
    sec
    sbc !obj_pos_x+1
    bcc .A1CF

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A1CF:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$0045
    sec
    sbc !obj_pos_x+1
    bcs .A1EB

    !A8
    ldy #$C2 : ldx #$21 : jsl set_sprite
    inc $34
    dec $0F
.A1EB:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A1F3:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$005C
    sec
    sbc !obj_pos_x+1
    bcc .A213

    !A8
    ldy #$BC : ldx #$21 : jsl set_sprite
    inc $0F
    jsr .A29F
    jmp .9FC2

.A213:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$0058
    sec
    sbc !obj_pos_x+1
    bcs .A22D

    !A8
    ldy #$C0 : ldx #$21 : jsl set_sprite
    dec $0F
.A22D:
    !A8
    jsr .A29F
    jmp .9FC2

;-----

.A235:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$0060
    sec
    sbc !obj_pos_x+1
    bcc .A250

    !A8
    lda $08 : and #$F7 : sta $08
    inc $0F
    jmp .9FC2

.A250:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$005C
    sec
    sbc !obj_pos_x+1
    bcs .A26A

    !A8
    ldy #$BE : ldx #$21 : jsl set_sprite
    dec $0F
.A26A:
    jsr .A29F
    jmp .9FC2

;-----

.A270:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc #$0060
    sec
    sbc !obj_pos_x+1
    bcc .A283

    !A8
    jmp .9FC2

.A283:
    lda !obj_pos_y+1 : sta $2F
    !A8
    ldy #$BC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$08 : sta $08
    dec $0F
    jmp .9FC2

;-----

.A29C: ;unused?
    jmp .9FC2

;-----

.A29F:
    !A16
    lda $2F : sta !obj_pos_y+1
    !A8
    rts

;-----

.thing: ;A2A8
    jsl update_animation_normal
    lda $34
    beq .A2BC

    jsl _02F9B2
    jsl _02F9B6
    jsl _02F9BA
.A2BC:
    jsl _028156
    rtl

;-----

.destroy: ;A2C1
    lda !obj_hp
    beq .A2CC

    jsl _02F9DA_F9E0
    jmp .9FC2

.A2CC:
    lda #!sfx_shatter : jsl _018049_8053
    ldy #$AA : ldx #$21 : jsl set_sprite
    ldy #$0F : jsl update_score
    ldy #$1C : jsl set_speed_xyg
    lda #$18 : sta $2D
.A2EA:
    brk #$00

;----- A2EC

    jsl update_animation_normal
    jsl update_pos_xyg_add
    dec $2D
    bne .A2EA

    jml _0281A8_81B5
}

{ ;A2FC - A337
_03A2FC: ;unused?
    lda $07 : and #$03 : asl : ldy #$06 : ldx #$22 : jsl set_sprite_8480
    lda $07
    and #$04
    beq .A313

    inc !obj_facing
    bra .A315

.A313:
    stz !obj_facing
.A315:
    lda $07 : and #$03 : tax
    lda.w _00CF00,X : tay : jsl set_speed_xyg ;todo
    lda #$7F : sta $2D
.A326:
    brk #$00

;----- A328

    jsl update_animation_normal
    jsl update_pos_xyg_add
    dec $2D
    bne .A326

    jml _0281A8_81B5
}

{ ;A338 - A3E6
_03A338:

.create:
    !A16
    lda !obj_pos_x+1 : sta $39
    lda !obj_pos_y+1 : sta $3B
    !A8
    stz $31
.A346:
    brk #$00

;----- A348

    ldy #$28 : jsl _0192AD
    bcs .A346

    lda $09 : ora #$B4 : sta $09
    inc $31
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda #$54 : cop #$00

;----- A364

    ldy #$AA : ldx #$21 : jsl set_sprite
    bra .A38E

.A36E:
    brk #$00

;----- A370

    ldy #$28 : jsl _0192AD
    bcs .A36E

    inc $31
    ldy #$B8 : ldx #$21 : jsl set_sprite
    lda #$54 : cop #$00

;----- A386

    ldy #$AA : ldx #$21 : jsl set_sprite
.A38E:
    lda #$0E : cop #$00

;----- A392

    inc $32
    ldy #$A8 : ldx #$21 : jsl set_sprite
    ldx #$92 : jsl _0196EF : cop #$00

;----- A3A4

    stz $32
    ldy #$B2 : ldx #$21 : jsl set_sprite
    lda #$0E : cop #$00

;----- A3B2

    stz $31
    ldx #$94 : jsl _0196EF : cop #$00

;----- A3BC

    lda $09
    and #$40
    bne .A36E

    jml _0281A8_81B5

;-----

.thing:
    lda $31
    beq .A3D6

    lda $08 : ora #$08 : sta $08
    jsl update_animation_normal
    bra .A3DE

.A3D6:
    lda $08 : and #$F7 : sta $08
    bra .A3E6

.A3DE:
    lda $32
    beq .A3E6

    jsl _02F9B2
.A3E6:
    rtl
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

{ ;A42C - A5D6
_03A42C:

.create:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda $09 : ora #$B0 : sta $09
    !A16
    lda !obj_pos_x+1 : sta $39
    lda !obj_pos_y+1 : sta $3B
    !A8
    stz $32
.A448:
    brk #$00

;----- A44A

    lda !arthur_hp
    bmi .A448

    lda $32
    bne .A448

    lda $07 : asl : tax
    jsr (.A45E,X)
    !A8
    bra .A448

.A45E: dw .A464, .A4AE, .A501

;-----

.A464:
    !A16
    lda !arthur_pos_x+1
    sec
    cmp #$0280
    bcs .A47E

    cmp #$0240
    bcs .A486

    cmp #$0100
    bcs .A494

    cmp #$00C0
    bcs .A49C

.A47E:
    sta !obj_pos_x+1
    lda #$03C0 : sta !obj_pos_y+1
    rts

.A486:
    sta !obj_pos_x+1
    sec
    sbc #$0240
    lsr
    clc
    adc #$03A0
    sta !obj_pos_y+1
    rts

.A494:
    sta !obj_pos_x+1
    lda #$03A0 : sta !obj_pos_y+1
    rts

.A49C:
    sta !obj_pos_x+1
    sec
    sbc #$00C0
    lsr
    sta $2D
    lda #$03C0 : sec : sbc $2D : sta !obj_pos_y+1
    rts

;-----

.A4AE:
    !A16
    lda !arthur_pos_x+1
    sec
    cmp #$0130
    bcc .A4F6

    cmp #$0280
    bcs .A4E4

    sec
    cmp #$0200
    bcs .A4D6

    sta !obj_pos_x+1
    sec
    sbc #$0130
    lsr
    sta $2D
    lda #$02C0 : sec : sbc $2D : sta !obj_pos_y+1
    rts

.A4D6:
    sta !obj_pos_x+1
    sec
    sbc #$0200
    lsr
    clc
    adc #$0258
    sta !obj_pos_y+1
    rts

.A4E4:
    sta !obj_pos_x+1
    sec
    sbc #$0280
    lsr
    sta $2D
    lda #$0298 : sec : sbc $2D : sta !obj_pos_y+1
    rts

.A4F6:
    lda #$0130 : sta !obj_pos_x+1
    lda #$02C0 : sta !obj_pos_y+1
    rts

;-----

.A501:
    !A16
    lda !arthur_pos_x+1
    sec
    cmp #$0290
    bcs .A510

    sta !obj_pos_x+1
    bra .A515

.A510:
    lda #$0290 : sta !obj_pos_x+1
.A515:
    lda #$0120 : sta !obj_pos_y+1
    !A8
    rts

;-----

.thing:
    jsl update_animation_normal
    jsl arthur_overlap_check_FED8_8bit
    bcs .A52C

    ldx $0F
    jmp (.A52D,X)

.A52C:
    rtl

.A52D: dw .A535, .A573, .A5A0, .A5CC

;-----

.A535:
    lda !arthur_hp
    bmi .A544

    inc $32
    ldy #$B6 : ldx #$21 : jsl set_sprite
.A544:
    lda #$FF : sta !slot_arthur+$0F
    inc $14C3
    inc $19EB
    stz $007E
    lda $09 : and #$FB : sta $09
    !A16
    lda !obj_pos_x+1 : sta !arthur_pos_x+1
    lda !obj_pos_y+1 : sec : sbc #$0008 : sta !arthur_pos_y+1
    !A8
    lda #$50 : sta $31
    lda #$02 : sta $0F
    rtl

;-----

.A573:
    inc $19EB
    stz $007E
    lda $31
    cmp #$42
    bcc .A585

    !A16
    dec !obj_pos_y+1 : dec !obj_pos_y+1
.A585:
    !A16
    lda !obj_pos_x+1 : sta !arthur_pos_x+1
    lda !obj_pos_y+1 : sec : sbc #$0008 : sta !arthur_pos_y+1
    !A8
    dec $31
    bne .A59F

    lda #$04 : sta $0F
.A59F:
    rtl

;-----

.A5A0:
    inc $19EB
    stz $007E
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda !arthur_hp
    bmi .A5C7

    lda #$FF : sta !arthur_hp : sta !slot_arthur+$0F
    jsl _02FDCD
    lda !slot_arthur+$08 : and #$EF : sta !slot_arthur+$08
.A5C7:
    lda #$06 : sta $0F
    rtl

;-----

.A5CC:
    inc $19EB
    stz $007E
    rtl

;-----

.destroy:
    jml _0281A8_81B5
}

{ ;A5D7 -
_03A5D7:
    jml _0281A8_81B5

.create:
    lda $07 : sta $33
    ldx.w stage
    cpx #$07
    bne .A5EE

    ldx #$02 : jsl _018D5B
    bra .A604

.A5EE:
    !A16
    lda #$0120
    cpx #$08
    bne .A5FA

    lda #$0190
.A5FA:
    sta $29
    !A8
    lda.w obj_type_count+!id_arremer
    dec
    bne _03A5D7 ;remove new arremer if one already exists

.A604:
    ldx.w stage
    lda.w arremer_data_CF0E,X : sta $32
    jsl set_hp
    stz $39
    inc $08
    ldx $33
    lda.w arremer_data_CF04,X : sta $09
    lda #$FF : sta $26
    !A16
    lda.w _00ED00+$12 : sta $27
    stz $2D
    stz $2F
    lda.w #arremer_data_CFD5 : sta $13
    !A8
    ldy #$E4 : ldx #$21 : jsl set_sprite
    stz $31
    lda #$03 : sta $3A
    jsl _02F9DA
.A643:
    brk #$00

;----- A645

    bit $09
    bvc .A643

    jsr .AAD5
    ldy #$1A : jsl arthur_range_check
    bcs .A643

.A654:
    lda #$02
    sta $39
    ldy #$AC : ldx #$21 : jsl set_sprite
    stz $31
    stz $3A
    lda #$03 : sta !obj_direction
    lda #$0A : sta $3B
.A66C:
    brk #$00

;----- A66E

    ldx #$42 : jsl update_pos_xy_2
    dec $3B
    bne .A66C

.A678:
    lda #$04 : sta $39
    lda #$03 : sta !obj_direction
    lda #$0A : sta $3B
.A684:
    brk #$00

;----- A686

    ldx #$42 : jsl update_pos_xy_2
    jsr .AAD5
    dec $3B
    bne .A684

    bra .A6AB

.A695:
    lda #$06 : sta $39
    stz $3A
    lda #$09 : sta $3B
.A69F:
    brk #$00

;----- A6A1

    ldx #$42 : jsl update_pos_xy_2
    dec $3B
    bne .A69F

.A6AB:
    lda #$08 : sta $39
    jsl get_rng_16
    ldy.w arremer_data_CF17,X
    lda.w arremer_data_CF27,Y
    ldx.w difficulty
    clc
    adc.w arremer_data_CF2F,X
    sta $3B
.A6C2:
    brk #$00

;----- A6C4

    jsr .AAD5
    dec $3B
    bne .A6C2

    lda $2D : inc : and #$03 : sta $2D
    jsl _01963E
    ldx $2D
    and.w arremer_data_CF33,X
    beq .A6E0

    jmp .A7EF
.A6E0:
    lda $2E : inc : and #$01 : sta $2E
    jsl _01963E
    ldx $2E
    and.w arremer_data_CF37,X
    beq .A710

    lda #$0A : sta $39
    jsl _01909B : sta !obj_direction
    ldy #$30 : jsl set_speed_xyg
    lda #$42 : sta $3B
.A706:
    brk #$00

;----- A708

    jsl update_pos
    dec $3B
    bne .A706

.A710:
    lda #$0C : sta $39
    stz $3B
    stz $0000
    !A16
    clc
    lda !obj_pos_y+1 : adc #$0010 : sta $0001
    cmp !arthur_pos_y+1
    !A8
    bcc .A72E

    jmp .A678
.A72E:
    lda #$38 : jsl _0187E5
.A734:
    inc $3B
    clc
    lda !obj_speed_y : adc !obj_gravity : sta !obj_speed_y
    !A16
    lda !obj_speed_y+1 : adc #$0000 : sta !obj_speed_y+1
    clc
    lda $0000 : adc !obj_speed_y : sta $0000
    !A8
    lda $0002 : adc !obj_speed_y+2 : sta $0002
    !A16
    lda $0001
    cmp !arthur_pos_y+1
    !A8
    bcc .A734

    jsl _01909B : sta !obj_direction
    !A16
    bne .A785

    clc
    lda !obj_pos_x+1
    adc #$0100
    sta $0006
    clc
    lda !arthur_pos_x+1
    adc #$0100
    sec
    sbc $0006
    bne .A78B

.A785:
    lda !obj_pos_x+1
    sec
    sbc !arthur_pos_x+1
.A78B:
    stz $0000
    sta $0001
    beq .A7B5

    ldy $3B
    jsl _018A7E : sta !obj_speed_x+1 : sty $0001
    lda $0001
    ldy $3B
    jsl _018A7E
    clc
    adc !obj_speed_x
    sta !obj_speed_x
    lda #$0004
    cmp !obj_speed_x+1
    bcs .A7B5

    sta !obj_speed_x+1
.A7B5:
    !A8
.A7B7:
    brk #$00

;----- A7B9

    jsl update_pos
    lda !obj_speed_y+2
    bpl .A7B7

    lda #$0E : sta $39
    jsl get_rng_16
    ldy.w arremer_data_CF39,X
    !A16
    lda.w arremer_data_CF49,Y : sta !obj_speed_x
    !A8
    stz !obj_speed_x+2
    ldy #$1A
    jsl get_rng_bool
    beq .A7E1

    ldy #$18
.A7E1:
    sty $3B
.A7E3:
    brk #$00

;----- A7E5

    jsl update_pos
    dec $3B
    bne .A7E3

    bra .A817

.A7EF:
    lda #$10 : sta $39
    ldy #$B0 : ldx #$21
    stz $31
    jsl set_sprite
.A7FD:
    brk #$00

;----- A7FF

    lda $24
    cmp #$0A
    bne .A7FD

    lda #$12 : sta $39
    lda #$A8 : sta $1D
    jsr .AA87
.A810:
    brk #$00

;----- A812

    lda $24
    dec
    bne .A810

.A817:
    lda #$14 : sta $39
    ldy #$AC : ldx #$21 : jsl set_sprite
    stz $31
    lda #$80 : sta $3B
.A829:
    brk #$00

;----- A82B

    jsr .AAD5
    dec $3B
    bne .A829

    lda #$16 : sta $39
    lda #$2D : sta $3B
    ldy #$36 : jsl set_speed_y
.A840:
    brk #$00

;----- A842

    jsr .AAD5
    jsl update_pos_y
    dec $3B
    bne .A850

    jmp .A654

.A850:
    jsl _01A559
    beq .A840

.A856:
    lda #$18 : sta $39
    ldy #$A6 : ldx #$21 : jsl set_sprite
    stz $31
    lda #$03 : sta $3A
    jsl get_rng_bool : sta !obj_direction
    !A16
    lda !obj_pos_x+1
    sbc #$0014
    sta !obj_speed_y+1
    !A8
    ldy #$4E : jsl set_speed_x
.A87F:
    jsl get_rng_16
    lda.w arremer_data_CF51,X
    ldx.w difficulty
    clc
    adc.w arremer_data_CF71,X
    sta $3B
.A88F:
    brk #$00

;----- A891

    jsl update_pos_x
    jsr .AAD5
    jsl _01A593
    bne .A8A1

    jmp .A654

.A8A1:
    !A16
    lda !obj_pos_x+1
    sec
    sbc !obj_speed_y+1
    cmp #$0028
    !A8
    bcs .A8B5

    dec $3B
    bne .A88F

    bra .A8BD

.A8B5:
    lda !obj_direction : eor #$01 : sta !obj_direction
    bra .A88F

.A8BD:
    lda #$1A : sta $39
    lda !obj_direction : eor #$01 : sta !obj_direction
    jsl get_rng_16
    lda.w arremer_data_CF61,X
    ldx.w difficulty
    clc
    adc.w arremer_data_CF71,X
    sta $3B
.A8D7:
    brk #$00

;----- A8D9

    jsr .AAD5
    dec $3B
    bne .A8D7

    jsl get_rng_16
    clc
    adc $2F
    tax
    clc : lda $2F : adc #$10 : and #$30 : sta $2F
    lda.w arremer_data_CF75,X
    tax
    jmp (+,X) : +: dw .A87F, .A8FE, .A929

;-----

.A8FE: ;shoot projectile or killers
    lda #$1C : sta $39
    ldy #$B2 : ldx #$21 : jsl set_sprite
    stz $31
.A90C:
    brk #$00

;----- A90E

    lda !obj_anim_timer
    cmp #$0A
    bne .A90C

    lda #$1E : sta $39
    lda #$54 : sta $1D
    jsr .AA87
.A91F:
    brk #$00

;----- A921

    lda !obj_anim_timer
    dec
    bne .A91F

    jmp .A856

;-----

.A929: ;charge towards arthur
    lda #$20 : sta $39
    ldy #$54 : jsl set_speed_x
    lda !obj_facing : sta !obj_direction
    inc $30
.A939:
    !A8
    brk #$00

;----- A93D

    jsl update_pos_x
    jsl update_animation_normal
    jsl _01A593
    bne .A950

    stz $30
    jmp .A654

.A950:
    !A16
    lda !arthur_pos_x+1
    ldx !obj_direction
    bne .A962

    adc #$0050
    cmp !obj_pos_x+1
    bcs .A939

    bra .A969

.A962:
    adc #$FFB0
    cmp !obj_pos_x+1
    bcc .A939

.A969:
    !A8
    stz $30
    jmp .A856

.A970:
    lda #$22 : sta $39
    ldy #$AC : ldx #$21 : jsl set_sprite
    stz $31
    stz !obj_direction
    !A16
    lda !obj_pos_x+1
    cmp #$FF00
    !A8
    bcs .A996

    jsl _01918E_set_direction16
    inc
    and #$0F
    lsr #2
    sta !obj_direction
.A996:
    brk #$00

;----- A998

    ldx #$42 : jsl update_pos_xy_2
    lda $02C3
    and #$0F
    beq .A9AC

    bit $09
    bvc .A996

    jmp .A695

.A9AC:
    lda #$24 : sta $39
    jsl _01909B
    asl
    sta !obj_direction
.A9B7:
    brk #$00

;----- A9B9

    ldx #$42 : jsl update_pos_xy_2
    jsl _01A593
    beq .A970

    bit $09
    bvc .A9B7

    lda #$26 : sta $39
    lda !obj_facing : sta !obj_direction
    ldy #$4E : jsl set_speed_x
    lda #$20 : sta $3B
.A9DB:
    brk #$00

;----- A9DD

    dec $3B
    beq .A9F1

    jsl update_pos_x
    jsr .AAD5
    jsl _01A593
    bne .A9DB

    jmp .A654

.A9F1:
    jmp .A856

;-----

.A9F4:
    ldy #$51 : jsl set_speed_x
.A9FA:
    brk #$00

;----- A9FC

    jsl update_pos_x
    jsl _01A593
    lda $24
    dec
    bne .A9FA

    jmp .A929

;-----

.destroy:
    lda !obj_hp
    bne .AA14

    jml _028BEC

.AA14:
    ldy #$E2 : ldx #$21 : jsl set_sprite
    inc $31
    jsl _02F9DA_F9E0
    ldx $39
    jmp (+,X)

+:
    dw .A643, .A66C, .A684, .A69F, .A6C2, .A706, .A7B7, .A7E3, .A7FD, .A810
    dw .A829, .A840, .A88F, .A8D7, .A90C, .A91F, .A9F4, .A996, .A9B7, .A9DB

;-----

.thing:
    lda $31
    beq .AA67

    lda $24
    dec
    bne .AA67

    ldx $39
    ldy.w arremer_data_CFD9+0,X
    lda.w arremer_data_CFD9+1,X
    tax
    jsl set_sprite
    stz $31
.AA67:
    lda $30
    bne .AA71

    jsl _01909B : sta !obj_facing
.AA71:
    jsl update_animation_normal
    ldx $32
    jsl _018E32
    jsl _02F9BA
    jsl _02F9B6
    jml _02F9B2

;-----

.AA87:
    lda #$60 : jsl _018049_8053
    jsl get_rng_bool
    bne .AA9A

    lda #!id_arremer_projectile : jsl prepare_object
    rts

.AA9A:
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta !obj_facing
    lda #$02 : sta $07
.AAA8:
    lda #!id_arremer_killers : jsl prepare_object
    dec $07
    bpl .AAA8

    rts

;-----

.AAB3:
    pla
    pla
    lda #$03 : sta !obj_direction
    lda $3A
    beq .AAC5

    ldy #$AC : ldx #$21 : jsl set_sprite
.AAC5:
    brk #$00

;----- AAC7

    ldx #$42 : jsl update_pos_xy_2
    bit $09
    bvs .AAC5

    jml _0281A8_81B5

.AAD5:
    ldx $33
    !A16
    lda.w camera_x+1
    cmp.w arremer_data_CF08,X
    !A8
    bcs .AAB3

    ldy #$0A
    !AX16
    ldx #!slot_weapons
.AAEA:
    lda.w !obj_active,X
    and #$000D
    beq .AB15

    lda $0007,X
    bmi .AB15

    sec
    lda !obj_pos_x+1
    sbc.w !obj_pos_x+1,X
    clc
    adc #$0030
    cmp #$0060
    bcs .AB15

    sec
    lda !obj_pos_y+1
    sbc.w !obj_pos_y+1,X
    clc
    adc #$0020
    cmp #$0040
    bcc .AB25

.AB15:
    txa
    clc
    adc #!obj_size
    tax
    dey
    bne .AAEA

    !AX8
    bit $09
    bvc .AB3B

    rts

.AB25:
    jsl set_direction32_custom_obj
    tax
    lda.w arremer_data_CFB5,X : sta !obj_direction
    pla
    pla
    lda $3A
    beq .AB38

    jmp .A654
.AB38:
    jmp .A695

.AB3B: ;move back into screen after getting scrolled off
    pla
    pla
    lda $3A
    bne .AB44

    jmp .A970

.AB44:
    jmp .A9AC
}

{ ;AB47 -
_03AB47:

.create:
    inc $08
    lda $07 : lsr : tax
    lda.w moving_platform_data_D001,X : sta $09
    ldx $07
    !A16
    stz $27
    lda.w moving_platform_data_D0BB,X : sta $2D
    asl                               : sta $2F
    !A8
    ldy.w moving_platform_data_D0CF+0,X : lda.w moving_platform_data_D0CF+1,X : tax : jsl set_sprite
    ldx $07
    jmp (+,X) : +: dw .AB82, .AB82, .AB82, .ABD5, .ABD5, .ABD5, .ABC7, .ABC7

;-----

.AB82: ;stage 4b, appearing platforms?
    lda $08 : and #$F7 : sta $08
.AB88:
    brk #$00

;----- AB8A

    ldy #$24 : jsl _0192AD
    bcs .AB88

    lda #$20 : cop #$00

;----- AB96

    lda $08 : ora #$08 : sta $08
.AB9C:
    brk #$00

;----- AB9E

    jsl update_animation_normal
    lda $25
    beq .AB9C

    jsl _02F9DA_F9E0
.ABAA:
    brk #$00

;----- ABAC

    lda $27
    beq .ABAA

    ldx.w difficulty
    lda.w moving_platform_data_D009,X : cop #$00

;----- ABB8

.ABB8:
    brk #$00

;----- ABBA

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .ABB8

    jmp .destroy

;-----

.ABC7: ;tower platforms
    !A16
    lda !obj_pos_x+1 : sta $35
    lda !obj_pos_y+1 : sta $37
    !A8
    bra .ABD7

.ABD5:
    inc !obj_direction
.ABD7:
    lda $07
    sec
    sbc #$06
    tax
    !A16
    lda.w moving_platform_data_D00D,X : sta $13 ;not used for physics
    !A8
    jsr .AD20
.ABE9:
    brk #$00

;----- ABEB

    lda !arthur_speed_y+2
    bmi .ABE9

    jsl .thing
    lda $27
    beq .ABE9

    lda $07 : lsr : dec #2 : sta $0087
.AC00:
    brk #$00

;----- AC02

    lda.w stage
    cmp #$02
    bne .AC0D

    bit $09
    bvc .AC5E

.AC0D:
    jsl .thing
    jsl update_pos_xy
    !A16
    lda !obj_pos_x+1 : sta $02D1 : sta $1F33
    lda !obj_pos_y+1 : sta $02D3 : sta $1F35
    jsr .ACC1
    !A16
    dec $3B
    !A8
    bne .AC00

    jsr .AD20
    bpl .AC00

    lda $07
    cmp #$0C
    bcs .AC75

    ;stage 4b platforms melting
    inc $0088
.AC40:
    brk #$00

;----- AC42

    jsl update_animation_normal
    ldx $25
    lda.w moving_platform_data_D0CB,X : sta $2D
    asl         : sta $2F
    jsl .thing
    lda $24
    cmp #$70
    bne .AC40

;-----

.destroy:
    jml _0281A8_81B5

;-----

.AC5E:
    !A16
    lda $35 : sta !obj_pos_x+1
    lda $37 : sta !obj_pos_y+1
    !A8
    stz $08
.AC6C:
    brk #$00

;----- AC6E

    bit $09
    bvs .AC6C

    jmp _03AB47_create

;-----

.AC75:
    lda #$10 : sta $3B
.AC79:
    brk #$00

;----- AC7B

    jsl .thing
    dec $3B
    bne .AC79

    !A16
    lda !obj_pos_x+1 : sta !obj_speed_x+1
    lda !obj_pos_y+1 : sta !obj_speed_y+1
    !A8
    lda #$30 : sta $3B
.AC93:
    brk #$00

;----- AC95

    jsl .thing
    jsl skulls_CB0F ;shaking
    jsr .ACC1
    dec $3B
    bne .AC93

    lda #$28 : jsl _0187E5
.ACAA:
    brk #$00

;----- ACAC

    jsl .thing
    jsl update_pos_xyg_add
    jsl _018911
    jsr .ACC1
    bit $09
    bvs .ACAA

    bra .destroy

;-----

.ACC1:
    lda $27
    beq .ACD9

    !A16
    clc : lda $31 : adc !obj_pos_x+1 : sta !arthur_pos_x+1
    clc : lda $33 : adc !obj_pos_y+1 : sta !arthur_pos_y+1
    !A8
.ACD9:
    rts

;-----

.thing:
    stz $27
    !AX16
    lda !obj_pos_x+1
    clc
    adc $2D
    sec
    sbc !arthur_pos_x+1
    cmp $2F
    bcs .AD1D

    lda !arthur_pos_y+1
    clc
    adc #$0017
    sec
    sbc !obj_pos_y+1
    cmp #$0008
    bcs .AD1D

    eor #$FFFF
    inc
    adc !arthur_pos_y+1
    sta !arthur_pos_y+1
    lda !arthur_pos_x+1 : sec : sbc !obj_pos_x+1 : sta $31
    lda !arthur_pos_y+1 : sec : sbc !obj_pos_y+1 : sta $33
    !AX8
    lda #$80 : sta $14C3
    inc $27
.AD1D:
    !AX8
    rtl

;-----

.AD20:
    !AX16
    ldx $13
    lda $0001,X : sta $3B
    !A8
    lda $0000,X
    bmi .AD4D

    !A16
    and #$00FF
    tay
    lda.w moving_platform_data_D07F+0,Y : sta !obj_speed_x
    lda.w moving_platform_data_D07F+2,Y : sta !obj_speed_x+2
    lda.w moving_platform_data_D07F+4,Y : sta !obj_speed_y+1
    inx #3
    stx $13
    lda #$0000
.AD4D:
    !AX8
    rts
}

{ ;AD50 - AD89
_03AD50:

.create:
    jsl _03B114
.AD54:
    brk #$00

;----- AD56
    bit $09
    bvc .AD54

    lda #$06 : jsl _0195E4
    bcc .AD86

    !X16
    jsl _028B1E
    lda #!id_skull_flower_multi : jsl _029713_97F8
    lda #$04 : sta $07
.AD72:
    jsl _028B1E
    lda #!id_skull_flower_multi : jsl _029713_97F8
    inc $07
    lda $07
    cmp #$07
    bcc .AD72

    !X8
.AD86:
    jml _0281A8_81B5
}

{ ;AD8A - B113
_03AD8A:

.create:
    lda $07
    cmp #$04
    bcs .ADC7

    lda #$40 : sta $10
    jsr .ADD2
    ldy #$CA : ldx #$21
    lda $33
    beq .ADA3

    ldy #$B6 : ldx #$21
.ADA3:
    jsl set_sprite
    jsl get_arthur_relative_side : sta !obj_facing
    jsl set_hp
    lda #$08 : sta $38
    stz $31
.ADB7:
    jsl _03B114
    brk #$00

;----- ADBD

    stz !obj_facing
    jsr .ADD2
    asl
    tax
    jmp (.ADCA,X)

.ADC7:
    jmp .AF41

.ADCA: dw .ADE4, .ADE4, .ADE4, .ADE2

;-----

.ADD2:
    lda $1F2B
    lsr #5
    clc
    adc $07
    and #$03
    sta $33
    rts

;-----

.ADE2:
    inc !obj_facing
.ADE4:
    stz $35
    stz $36
    ldy #$03
    !X16
    ldx $2D
.ADEE:
    lda $33 : sta $0033,X
    !A16
    lda.w #.AF45 : sta $0003,X
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    lda $002D,X
    tax
    !A8
    dey
    bne .ADEE

    !X8
    lda #$01 : sta $08
    ldy #$CA : ldx #$21
    lda $33
    beq .AE20

    ldy #$B6 : ldx #$21
.AE20:
    jsl set_sprite
    jsl _02F9DA
    stz $34
.AE2A:
    brk #$00

;----- AE2C

    bit $09
    bvc .AE2A

    lda $1F97
    beq .AE38

    jmp .AF09

.AE38:
    lda #!sfx_grow : jsl _018049_8053
    inc $34
    lda #$48 : sta $37
    lda $09 : and #$FB : sta $09
    ldy #$CC : ldx #$21
    lda $33
    beq .AE56

    ldy #$B8 : ldx #$21
.AE56:
    jsl set_sprite
    jsr .B09D
.AE5D:
    brk #$00

;----- AE5F

    jsr .B08E
    jsl .AFFF
    dec $37
    bne .AE5D

    !A16
    lda !obj_pos_x+1 : sta $13
    lda !obj_pos_y+1 : sta $27
    !A8
    lda !obj_direction
    sta $26
    inc $0F
.AE7C:
    bit $09
    bvc .AED2

    stz $15
    jsl get_object_slot
    bmi .AED2

    stx $35
    stz !obj_direction
    lda #!id_flower_projectile : jsl prepare_object_8C37
.AE92:
    brk #$00

;----- AE94

    lda #$01 : jsr .B0EB
    !AX16
    ldx $35
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !AX8
    lda $1F97
    bne .AED8

    lda $15
    cmp #$68
    bcc .AE92

    !X16
    ldx $35
    inc $0031,X
    stz $35
    stz $36
    !X8
.AEC1:
    brk #$00

;----- AEC3

    lda #$FF : jsr .B0EB
    lda $1F97
    bne .AED8

    lda $15
    dec
    bne .AEC1

.AED2:
    lda #$08 : cop #$00

;----- AED6

    bra .AE7C

.AED8:
    dec $0F
    jsr .B01B
    stz $35
    stz $36
    lda $26 : sta !obj_direction
    !A16
    lda $13 : sta !obj_pos_x+1
    lda $27 : sta !obj_pos_y+1
    !A8
    lda #$48 : sta $37
    jsr .B0B9
    stz $34
.AEFA:
    brk #$00

;----- AEFC

    jsr .B08E
    jsl .AFFF
    dec $37
    bne .AEFA

    inc $31
.AF09:
    stz !obj_direction
    stz !obj_facing
    ldy #$BE : ldx #$21 : jsl set_sprite
    jsl _02F9ED
    jsl _03B114
.AF1D:
    brk #$00

;----- AF1F

    lda $1F2B
    lsr #4
    inc
    lsr
    inc #2
    clc
    adc $07
    and #$03
    tax
    lda.w skull_flower_multi_data_D125,X : sta $0C
    lda $1F97
    bne .AF1D

    stz $31
    stz $09
    jmp .ADB7

.AF41:
    brk #$00

;----- AF43

    bra .AF41

;-----

.AF45:
    stz $31
    stz !obj_pos_x
    stz !obj_pos_y
    lda #$01 : sta $08
    stz $34
.AF51:
    brk #$00

;----- AF53

    !X16
    ldx $2F
    lda $0034,X
    !X8
    beq .AF51

    ldy #$D0 : ldx #$21
    lda $33
    beq .AF6A

    ldy #$BC : ldx #$21
.AF6A:
    jsl set_sprite
    jsl _02F9DA_F9E0
    inc $34
    ldx $07
    lda.w skull_flower_multi_data_D0DF-4,X : sta $32
    lda $07
    asl #2
    tax
    lda.w skull_flower_multi_data_D112-$10,X : sta $38
    lda.w skull_flower_multi_data_D112-$0F,X : sta !obj_direction
    lda $33
    and #$01
    !A16
    clc
    bne .AF9C

    lda.w skull_flower_multi_data_D112-$0E,X : adc !obj_pos_x+1 : sta !obj_pos_x+1
    bra .AFA3

.AF9C:
    lda.w skull_flower_multi_data_D112-$0E,X : adc !obj_pos_y+1 : sta !obj_pos_y+1
.AFA3:
    jsr .B0D5
    lda $32 : sta $37
.AFAA:
    brk #$00

;----- AFAC

    jsr .B08E
    jsl .AFFF
    dec $37
    bne .AFAA

.AFB7:
    brk #$00

;----- AFB9

    jsr .B08E
    jsl .B00D
    !X16
    ldx $2F
    lda $0034,X
    !X8
    bne .AFB7

    lda $32 : sta $37
    stz $34
    jsr .B0D5
.AFD4:
    brk #$00

;----- AFD6

    jsr .B08E
    jsl .AFFF
    dec $37
    bne .AFD4

.AFE1:
    brk #$00

;----- AFE3

    jsr .B08E
    jsl .B00D
    !X16
    ldx $2F
    lda $0031,X
    !X8
    beq .AFE1

    stz $08
    stz $09
    inc $31
.AFFB:
    brk #$00

;----- AFFD

    bra .AFFB

;-----

.AFFF:
    lda $33
    and #$01
    bne .B009

    jml update_pos_xy

.B009:
    jml _01884B_8873

;-----

.B00D:
    lda $33
    and #$01
    bne .B017

    jml update_pos_x

.B017:
    jml _01884B_8876

;-----

.B01B:
    !X16
    ldx $35
    beq .B024

    dec $0031,X
.B024:
    !X8
    rts

;-----

.destroy:
    lda $07
    cmp #$04
    bcs .B03C

    jsr .B01B
    lda #$03 : jsl _028B52
    ldy #$17 : jsl update_score
.B03C:
    ldx $07
    lda.w skull_flower_multi_data_D11E,X : sta $31
    jml flower_part_destroy

;-----

.thing:
    jsl update_animation_normal
    lda $07
    cmp #$04
    bcs .B07A

    bit $09
    bvc .B071

    lda $33
    and #$01
    bne .B061

    jsl get_arthur_relative_side : sta !obj_facing
.B061:
    lda $0F
    beq .B07A

    jsl _02F9FA
    jsl _02F9CA
    jml _02F9B2

.B071:
    jsr .B01B
    lda #$03 : jml _028B36

.B07A:
    lda $02C3
    clc
    adc $02C6
    and #$03
    bne .B08D

    jsl _02F9C2
    jml _02F9B2

.B08D:
    rtl

;-----

.B08E:
    dec $38
    bne .B09C

    lda !obj_direction : eor #$01 : sta !obj_direction
    lda #$10 : sta $38
.B09C:
    rts

;-----

.B09D:
    lda $33
    clc
    asl
    adc $33
    asl
    tax
    !A16
    lda.w skull_flower_multi_data_D0E2+0,X : sta !obj_speed_x+0
    lda.w skull_flower_multi_data_D0E2+2,X : sta !obj_speed_x+2
    lda.w skull_flower_multi_data_D0E2+4,X : sta !obj_speed_y+1
    !A8
    rts

;-----

.B0B9:
    lda $33
    clc
    asl
    adc $33
    asl
    tax
    !A16
    lda.w skull_flower_multi_data_D0FA+0,X : sta !obj_speed_x+0
    lda.w skull_flower_multi_data_D0FA+2,X : sta !obj_speed_x+2
    lda.w skull_flower_multi_data_D0FA+4,X : sta !obj_speed_y+1
    !A8
    rts

;-----

.B0D5:
    !AX16
    ldx $2F
    lda.w !obj_speed_x+0,X : sta !obj_speed_x+0
    lda.w !obj_speed_x+2,X : sta !obj_speed_x+2
    lda.w !obj_speed_y+1,X : sta !obj_speed_y+1
    !AX8
    rts

;-----

.B0EB:
    clc : adc $15 : sta $15
    !A16
    lda $13 : sta !obj_pos_x+1
    lda $27 : sta !obj_pos_y+1
    !A8
    stz $1E
    stz $21
    lda !obj_direction : inc : and #$1F : sta !obj_direction
    lda $15 : ldx #$16 : jsl _0189D9
    jsl update_animation_normal
    rts
}

{ ;B114 - B12A
_03B114: ;a8 x-
    lda $09 : ora #$04 : sta $09
    stz !obj_pos_x
    stz !obj_pos_y
    !A16
    lda !obj_pos_x+1 : sta $39
    lda !obj_pos_y+1 : sta $3B
    !A8
    rtl
}

{ ;B12B - B19D
_03B12B:
    ldy #$F8 : ldx #$21 : jsl set_sprite
    lda $07
    bne .B14D

    ldy #$FA : ldx #$21 : jsl set_sprite
    lda #$10 : sta $3B
.B143:
    brk #$00

;----- B145

    jsl update_animation_normal
    dec $3B
    bne .B143

.B14D:
    jsl _02F9DA
    ldx.w difficulty
    lda.w grilian_projectile_data_D129,X : sta $3C
    lda #$12 : cop #$00

;----- B15D

    ldy #$FA : ldx #$21 : jsl set_sprite
    lda #$10 ;leftover lda
    lda $3C : cop #$00

;----- B16B

    ldy #$C6 : ldx #$21 : jsl set_sprite
    lda $3C : cop #$00

;----- B177

    jml _0281A8_81B5

;-----

.thing:
    ldx #$3C : jsl update_pos_xy_2
    bit $09
    bvc .B197

    jsl _02F9BE
    ldy #$08 : jsl _02F9CE
    jsl _02F9B2
    jml update_animation_normal

.B197:
    pla
    pla
    pla
    jml _0281BB
}

{ ;B19E - B59B
_03B19E:

.create: ;B19E
    lda #$80 : sta $08
    lda #$C2 : sta $1D
    stz $1EC7
    stz $1EC8
    stz $1EC9
    !A16
.B1B1:
    brk #$00

;----- B1B3

    lda.w camera_x+1
    cmp #$1800
    bcc .B1B1

    !A8
    lda #$10 : sta $02D7
    !A16
.B1C4:
    brk #$00

;----- B1C6

    lda !arthur_pos_x+1
if !version == 0 || !version == 1
    cmp #$1A30
elseif !version == 2
    cmp #$1AA0 ;death crawler triggers farther to the right
endif
    bcc .B1C4

    lda #$1900 : sta.w screen_boundary_left
    !A8
    lda #!mus_stage_3_boss : jsl _018049_8053
    stz $1500
    stz $150E
    stz $151C
    stz $152A
    stz $1538
    stz $1546
    stz $1554
    lda #$04 : sta $02D5 : sta $02D6
    lda #$10 : sta $02D7 : sta $02D8
    lda #$30 : ora !slot_arthur+$09 : sta !slot_arthur+$09
    stz $15F1
    stz $1747
    stz $189D
    brk #$00

;----- B214

    lda #$80 : sta $09
    ldx #$3F
.B21A:
    lda.l _09E800_F580,X : sta $7EF480,X
    dex
    bpl .B21A

    inc $0331
    ldx #$0C : jsl _028000
    brk #$00

;----- B230

    lda #$04 : sta $1F31
    brk #$00

;----- B237

    lda #$06 : sta $1F31
    brk #$00

;----- B23E

    lda #$08 : sta $1F31
    brk #$00

;----- B245

    lda #$0C : sta $1F31
    brk #$00

;----- B24C

    ldy #$90 : lda.b #_01FF00_5C : ldx #$15 : jsl _01A6FE
.B256:
    brk #$00

;----- B258

    lda $00DE
    bne .B256

    lda #$01 : sta $1F30
    brk #$00

;----- B264

    ldy #$90 : lda.b #_01FF00_5C : ldx #$0E : jsl _01A6FE
.B26E:
    brk #$00

;----- B270

    lda $00DE
    bne .B26E

    lda #$8E : sta $031E
    brk #$00

;----- B27C

    lda #$8F : sta $031E
    brk #$00

;----- B283

    lda #$90 : sta $031E
    brk #$00

;----- B28A

    lda #$07 : sta $02D9
    lda #$04 : sta $02D5 : sta $02D6
    lda #$12 : sta $02D7 : sta $02D8
    lda #$40 : sta !SETINI ;EXTBG
    stz $2D
    stz $2E
    stz $39
    lda #$FF : sta $3B
    !A16
    lda #$0080 : sta $02D1
    lda #$0280 : sta $02D3
    lda #$0060 : sta $02C9 : sta $02CF : sta $02CB : sta $02CD
    !A8
.B2CD:
    lda #$80 : sta $1F2B ;rotation related
    jsr .B4B7
    !A16
.B2D7:
    brk #$00

;----- B2D9

    lda !arthur_pos_x+1 : sta !obj_pos_x+1
    lda !arthur_pos_y+1 : sta !obj_pos_y+1
    clc
    lda $02C9
    adc #$000C
    cmp #$01D0
    bcc .B2F2

    lda #$01D0
.B2F2:
    sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    bcc .B2D7

    !A8
    lda $1EC8
    bne .B30D

    inc $1EC8
    jsr .B429
.B30D:
    inc $1EC7
    !A8
    stz $35
    stz $36
    inc $39
    lda #$20 : cop #$00

;----- B31C

    stz $37
    lda #$01 : sta $38
    stz $2F
    stz $30
    lda #$02 : sta $31
    stz $32
    stz $33
    lda #$40 : sta $34
    lda #!sfx_death_crawler_spin : jsl _018049_8053
.B338:
    brk #$00

;----- B33A

    jsr .B473
    !A16
    dec $37
    !A8
    bne .B338

    lda #$01 : sta $31
    stz $32
.B34B:
    brk #$00

;----- B34D

    jsr .B497
    lda $30
    bpl .B34B
.B354:
    brk #$00

;----- B356

    ldx #$8C : jsl _0196EF
    cmp $3B
    beq .B354

    sta $3B
    sta !obj_direction
    ldx #$8E : jsl _0196EF : sta $3C
    brk #$00

;----- B36E

    !A16
    lda !obj_pos_x+1 : sta !obj_speed_x+1
    lda !obj_pos_y+1 : sta !obj_speed_y+1
    !A8
    ldx #$40 : jsl update_pos_xy_2
    !A16
    sec
    lda !obj_pos_x+1
    sbc #$1C00
    adc #$00E0
    cmp #$01C0
    bcs .B39E

    sec
    lda !obj_pos_y+1
    sbc #$0280
    adc #$0060
    cmp #$00C0
    bcc .B3B4

.B39E:
    lda !obj_speed_x+1 : sta !obj_pos_x+1
    lda !obj_speed_y+1 : sta !obj_pos_y+1
    !A8
.B3A8:
    brk #$00

;----- B3AA

    lda $36
    cmp #$20
    bne .B3A8

    lda $35
    beq .B3A8

.B3B4:
    lda #$20 : cop #$00

;----- B3B8

    inc $1EC9
    stz $39
    ldx #$B6 : jsl _0196EF
    sta $07
    ldx #$08
    tay
    beq .B3CC

    ldx #$05
.B3CC:
    stx $3C
.B3CE:
    lda #!id_death_crawler_projectile : jsl prepare_object
    inc $07
    lda #$08 : cop #$00

;----- B3DA

    dec $3C
    bne .B3CE

    lda #$91 : sta $031E
    stz $1EC9
    inc $39
    lda #$7F : cop #$00

;----- B3EC

    stz $1EC7
    stz $39
.B3F1:
    brk #$00

;----- B3F3

    !A8
    sec : lda $1F2B : sbc #$04 : sta $1F2B
    jsr .B4B7
    !A16
    sec
    lda $02C9
    sbc #$000C
    cmp #$0020
    bcs .B412

    lda #$0020
.B412:
    sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    bcs .B3F1

    !A8
    lda #$C0 : cop #$00

;----- B426

    jmp .B2CD

;-----

.B429:
    stz $07
    lda #$0B : sta $0000
.B430:
    jsl get_object_slot
    bmi .B44E

    lda #$0C : sta.w !obj_active,X
    lda #!id_death_crawler_part : sta.w !obj_type,X
    lda $07 : sta $0007,X
    inc $07
    !X8
    dec $0000
    bne .B430

.B44E:
    jsl get_object_slot
    bmi .B460

    lda #$0C : sta.w !obj_active,X
    lda #!id_death_crawler : sta.w !obj_type,X
    !X8
.B460:
    jsl get_object_slot
    bmi .B472

    lda #$0C : sta.w !obj_active,X
    lda #$AF : sta.w !obj_type,X ;todo
    !X8
.B472:
    rts

;-----

.B473:
    !A16
    lda $2F
    cmp #$0200
    bcs .B483

    clc : lda $2F : adc $31 : sta $2F
.B483:
    sec
    lda $33
    sbc $2F
    sta $33
    !A8
    xba
    and #$7F
    asl
    sta $1F2B
    jsr .B4B7
    rts

;-----

.B497:
    !A16
    sec : lda $2F : sbc $31 : sta $2F
    bra .B483

;-----

.B4A2:
    lda $1EC9
    beq .B4B6

    lda $02C3 : and #$04 : lsr #2 : clc : adc #$11 : ora #$80 : sta $031E
.B4B6:
    rts

;-----

.B4B7:
    ldx $1F2B
    lda.l _09FD00+0,X : sta $1FA1
    eor #$FF : inc    : sta $1FA2
    lda.l _09FD00+1,X : sta $1FA0 : sta $1FA3
    rts

;-----

.B4D2:
    lda $39
    beq .B514

    dec $36
    bpl .B4E4

    lda #$20 : sta $36
    lda $35 : eor #$01 : sta $35
.B4E4:
    lda $35
    !A16
    beq .B4FF

    clc : lda $02C9 : adc #$0004 : sta $02C9 : sta $02CB : sta $02CD : sta $02CF
    bra .B512

.B4FF:
    sec : lda $02C9 : sbc #$0004 : sta $02C9 : sta $02CB : sta $02CD : sta $02CF
.B512:
    !A8
.B514:
    rts

;-----

.thing:
    jsr .B4A2
    jsr .B4D2
    lda $1ED7
    beq .B528

    lda #$8C : sta !obj_active
    asl $09 : lsr $09
.B528:
    !A16
    lda !obj_pos_x+1
    sta $1EB7
    sec
    sbc #$0080
    sec
    sbc.w camera_x+1
    eor #$FFFF
    inc
    sta $19BD
    lda !obj_pos_y+1
    sta $1EB9
    sec
    sbc #$0080
    sec
    sbc.w camera_y+1
    eor #$FFFF
    inc
    clc
    adc #$0200
    sta $19C1
    !A8
    rtl

;-----

.destroy:
    jsl _018049_8051
    lda #!mus_defeat_boss : jsl _018049_8053
    lda #$04 : sta $1D
    lda #!id_boss_explosion_spawner : jsl prepare_object
    lda #$7E : sta $2D
    lda #$10 : sta $2E
    lda #$02 : sta $1F31
.B57A:
    jsl .B528
    lda $2D
    beq .B598

    lda $2E  : sta $02D7
    eor #$02 : sta $2E
    dec $2D
    bne .B598

    lda #$10 : sta $02D7
    jsl _02EBC1
.B598:
    brk #$00

;----- B59A

    bra .B57A
}

{ ;B59C - B5F8
_03B59C:

.create:
    lda #$C0 : sta $09
    lda $07 : asl #4 : clc : adc #$70 : sta $2D
.B5AB:
    brk #$00

;----- B5AD

    lda $1ED7
    beq .B5B6

    jml _0281A8_81B5

.B5B6:
    !A16
    lda $1EB7 : sta !obj_pos_x+1
    lda $1EB9 : sta !obj_pos_y+1
    !A8
    clc
    lda $1F2B
    adc #$40
    sta $0000
    sec
    sbc $2D
    lsr #3
    sta !obj_direction
    lda !obj_type
    cmp #$AF
    beq .B5E3

    ldx #$3E : jsl update_pos_xy_2
    bra .B5AB

.B5E3:
    ldx #$52 : jsl update_pos_xy_2
    bra .B5AB

;-----

.thing:
    lda $1EC7
    beq .B5F8

    jsl _02F9B2
    jsl _02F9C2
.B5F8:
    rtl
}

{ ;B5F9 - B63B
_03B5F9:

.create:
    lda #$C0 : sta $09
    lda #$04 : sta $1D
    lda #$20 : sta $2D
    jsl set_hp
    lda !obj_hp : sta $3C
    bra _03B59C_B5AB

;-----

.thing:
    lda $1EC7
    beq .B620

    jsl _02F9B2
    jsl _02F9CA
    jsl _02F9FA
.B620:
    lda !obj_hp
    cmp $3C
    beq .B634

    sta $3C
    ldx #$03 : jsl _028048
    lda #!sfx_hit : jsl _018049_8053
.B634:
    rtl

;-----

.destroy:
    inc $1ED7
    jml _0281A8_81B5
}

{ ;B63C -
_03B63C:

.create:
    lda #$C0 : sta $09
    ldy #$C8 : ldx #$21 : jsl set_sprite
    stz $3B
    ldx $07
    txa
    lsr #3
    and #$03
    sta $3C
    lda.w death_crawler_projectile_data_D14F,X : sta !obj_facing : sta !obj_direction
    ldy.w death_crawler_projectile_data_D137,X : jsl set_speed_xyg
    lda #$35 : jsl _018049_8053
.B668:
    brk #$00

;----- B66A

    lda $3C : asl : tax
    jsr (.B673,X)
    bra .B668

.B673: dw .B679, .B693, .B6B0

;-----

.B679:
    jsl update_pos_xyg_add
    !A16
    clc
    lda.w camera_y+1
    adc #$0100
    cmp !obj_pos_y+1
    !A8
    bcs .B692

    pla
    pla
    jml _0281A8_81B5
.B692:
    rts

;-----

.B693:
    jsl _01884B_8860
    jsr .B6C9
    !A16
    clc
    lda.w camera_x+1
    adc #$0100
    cmp !obj_pos_x+1
    !A8
    bcs .B6AF

    pla
    pla
    jml _0281A8_81B5
.B6AF:
    rts

;-----

.B6B0:
    jsl _01884B
    jsr .B6C9
    !A16
    lda.w camera_x+1
    cmp !obj_pos_x+1
    !A8
    bcc .B6C8

    pla
    pla
    jml _0281A8_81B5
.B6C8:
    rts

;-----

.B6C9:
    lda $3B
    bne .B6FD

    !A16
    clc
    lda.w camera_x+1
    adc #$0080
    sec
    sbc !obj_pos_x+1
    clc
    adc #$0090
    cmp #$0120
    !A8
    bcc .B6FD

    lda $07
    and #$07
    asl
    tax
    !A16
    clc : lda.w camera_y+1 : adc.w death_crawler_projectile_data_D12D,X : sta !obj_pos_y+1
    stz !obj_speed_y
    !A8
    stz !obj_speed_y+2
    inc $3B
.B6FD:
    rts

;-----

.thing:
    jsl update_animation_normal
    jsl _02F9BE
    jsl _02F9B2
    ldy #$1E : jsl _02F9CE
    rtl
}

{ ;B711 - B749
_03B711:
    stz $2D
    lda #$04 : sta $1D
.B717:
    ldx $2D
    lda.w _00D16A,X : sta $07 ;todo: labels and data
    txa
    asl #2
    tax
    !A16
    lda.w _00D16A_D177+0,X : sta !obj_pos_x+1
    lda.w _00D16A_D177+2,X : sta !obj_pos_y+1
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

{ ;B74A - B8B1
_03B74A:
    ldy #$3C : jsl set_speed_y
    stz $2D
    lda $07
    lsr
    adc #$0A
    sta $2E
.B759:
    brk #$00

;----- B75B

    !A16
    lda.w camera_y+1
    cmp #$0260
    !A8
    bcc .B759

    ldy #$22 : jsl arthur_range_check
    bcs .B759

    lda #$3C : cop #$00

;----- B773

    stz !obj_direction
    ldy #$CA : ldx #$21 : jsl set_sprite
    lda #$90 : sta $09
    lda #$08 : cop #$00

;----- B785

    ldy #$CC : ldx #$21 : jsl set_sprite
    jsr .B89E
    lda #$08 : cop #$00

;----- B794

    ldy #$CE : ldx #$21 : jsl set_sprite
    jsr .B89E
    lda #$08 : cop #$00

;----- B7A3

    lda $07
    beq .B7B6
    ldy #$12 : ldx #$22 : jsl set_sprite
    jsr .B89E
    lda #$08 : cop #$00

;----- B7B6

.B7B6:
    inc $2D
    ldx $07
    ldy.w lava_pillar_data_D1AF+0,X : lda.w lava_pillar_data_D1AF+1,X : tax : jsl set_sprite
.B7C5:
    brk #$00

;----- B7C7

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .B7C5

    inc !obj_direction
    ldx $07
    ldy.w lava_pillar_data_D1AF+4,X : lda.w lava_pillar_data_D1AF+5,X : tax : jsl set_sprite
    ldx.w difficulty
    lda.w lava_pillar_data_D1AB,X : sta $3B
    cop #$00

;----- B7EA

    lda $3B : cop #$00

;----- B7EE

    ldx $07
    ldy.w lava_pillar_data_D1AF+8,X : lda.w lava_pillar_data_D1AF+9,X : tax : jsl set_sprite
.B7FB:
    brk #$00

;----- B7FD

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .B7FB

    stz $2D
    lda $07
    beq .B81C

    ldy #$12 : ldx #$22 : jsl set_sprite
    lda #$08 : cop #$00

;----- B819

    jsr .B89E
.B81C:
    ldy #$CE : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- B828

    jsr .B89E
    ldy #$CC : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- B837

    jsr .B89E
    ldy #$CA : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- B846

    stz $08
    stz $09
    lda #$3C : cop #$00

;----- B84E

    jmp .B759

;-----

.thing:
    !A16
    lda !obj_pos_x+1
    cmp.w camera_x+1
    !A8
    bcs .B864

    bit $09
    bvs .B864

    jml _0281DD

.B864:
    lda $2D
    bne .B886

    lda $25 : clc : adc #$07 : sta $3C
    jsl _02FD62
    lda $25 : clc : adc #$0A : sta $3C
    jsl _02F9D2
    jsl _01884B_8876
    jml update_animation_normal

.B886:
    lda $25 : clc : adc #$0A : sta $3C
    jsl _02F9D2
    lda $2E : sta.w bowgun_magic_active
    jsl _02FE1E
    stz.w bowgun_magic_active
    rtl

;-----

.B89E:
    !A16
    lda #$0008
    ldx !obj_direction
    beq .B8AA

    lda #$FFF8
.B8AA:
    clc
    adc !obj_pos_y+1
    sta !obj_pos_y+1
    !A8
    rts
}

{ ;B8B2 -
_03B8B2: ;a8 x8
    ldy !options_stage_checkpoint : sty $31
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

    lda !options_difficulty
    cmp #$06
    beq .B994

    clc
    adc #$02
    sta !options_difficulty
    rts

.B985:
    bit #!left
    beq .B994

    lda !options_difficulty
    beq .B994

    sec
    sbc #$02
    sta !options_difficulty
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
    lda !options,X
    adc #$02
    cmp.w _00D1BB-1,X
    bcc .B9AF

    lda #$00
.B9AF:
    sta !options,X
.B9B2:
    rts

.B9B3:
    sec
    lda !options,X
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
    adc !options,X
    and.w _00D1BD,X
    sta !options,X ;only used to set sound mode
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
    lda #$00
    ldx !options_difficulty
    jsl .BB96
    clc
    lda !options_controls
    adc #$08
    tax
    lda #$01
    jsl .BB96
    clc
    lda !options_controls
    adc #$10
    tax
    lda #$01
    jsl .BB96
    lda !options_extra_lives
    lsr
    inc
    ldy #$02
    !X16
    ldx #$041E
    jsr .BBE6
    !X8
    clc
    lda !options_sound
    adc #$18
    tax
    lda #$03
    jsl .BB96
    ldx #$1C
    lda #$04
    jsl .BB96
    rts

;-----

.BA4E: ;secret menu
    brk #$00

;----- BA50

    ldx #$02 : jsl _049262
    stz $0F
    lda !options_stage_checkpoint
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
    lda $2D : asl : ora $2E : sta !options_stage_checkpoint
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
    sta !obj_pos_x+1
    sec
    lda $1737
    sbc.w camera_y+1
    clc
    adc #$0208
    sta !obj_pos_y+1
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
_03BC85:

.create:
    ldx #$03 : jsl _018D5B
    lda #$DC : sta $31
    jsl pot_creation
    jsl set_hp
    jsl get_arthur_relative_side : sta !obj_facing
    !A16
    stz $2D
    lda.w _00ED00+$5C : sta $27
    lda.w #tiny_goblin_data_D215 : sta $13
    !A8
    lda #$FF : sta $26
    lda #$20 : jsl _0187E5
    jsl _02F9DA
    ldy #$FC : ldx #$21 : jsl set_sprite
    jsl _018E32_8E73
    lda #$10 : cop #$00

;----- BCCB

    ldy #$F2 : ldx #$21 : jsl set_sprite
    stz $2F
    lda #$20 : sta $30
.BCD9:
    brk #$00

;----- BCDB

    jsl update_pos_xyg_add
    dec $30
    bne .BCD9

    lda #$02 : sta $2D : sta $2E
.BCE9:
    brk #$00

;----- BCEB

    jsl update_pos_xyg_add
    jsr .BD94
    bcs .BCE9

    jsl _01A559
    beq .BCE9

    lda #$04 : sta $2D
    ldy #$05 : jsl set_speed_xyg
.BD04:
    brk #$00

;----- BD06

    jsl update_pos_xyg_add
    lda $1B
    bmi .BD04

    lda #$06 : sta $2D
.BD12:
    brk #$00

;----- BD14

    jsl update_pos_xyg_add
    jsr .BD94
    bcs .BD12

    jsl _01A559
    beq .BD12

    lda #$08 : sta $2D
    jsl get_arthur_relative_side : sta !obj_direction : sta !obj_facing
    ldy #$F6 : ldx #$21 : jsl set_sprite
    stz $2F
    ldy #$57 : jsl set_speed_x
    lda #$DE : sta $31
.BD43:
    brk #$00

;----- BD45

    jsl update_pos_x
    !A16
    lda !obj_pos_x+1
    sec
    sbc #$0010
    sbc.w camera_x+1
    cmp #$00E0
    !A8
    bcs .BD6B

    jsl _01A593
    bne .BD43

    lda !obj_direction : eor #$01 : sta !obj_direction
    jsl update_pos_x
.BD6B:
    lda #$0A : sta $2D
    lda #$DC : sta $31
    ldy #$05 : jsl set_speed_xyg
    ldy #$F2 : ldx #$21 : jsl set_sprite
    stz $2F
    lda #$40 : sta $30
.BD87:
    brk #$00

;----- BD89

    jsl update_pos_xyg_add
    dec $30
    bne .BD87

    jmp .BCE9

.BD94:
    !A16
    lda !obj_pos_x+1
    sec
    sbc #$0020
    sbc.w camera_x+1
    cmp #$00C0
    !A8
    rts

;-----

.destroy:
    lda !obj_hp
    bne .BDB1

    jsl drop_pot
    jml _028BEC

.BDB1:
    inc $2F
    jsl _02F9DA_F9E0
    ldy #$F4 : ldx #$21 : jsl set_sprite
    lda $2D
    cmp #$08
    bne .BDD7

    stz $2F
.BDC7:
    brk #$00

;----- BDC9

    lda $24
    cmp #$70
    bne .BDC7

    ldy #$F6 : ldx #$21 : jsl set_sprite
.BDD7:
    ldx $2D
    jmp (+,X) : +: dw .BCD9, .BCE9, .BD04, .BD12, .BD43, .BD87

;-----

.thing:
    lda $2E
    beq .BDF0

    bit $09
    bvc .BE1E

.BDF0:
    ldy $31
    jsl pot_spawn_offset
    jsl update_animation_normal
    lda $2F
    beq .BE0E

    lda $24
    cmp #$70
    bne .BE0E

    stz $2F
    ldy #$F2 : ldx #$21 : jsl set_sprite
.BE0E:
    jsl _018E32_8E73
    jsl _02F9BA
    jsl _02F9B6
    jml _02F9B2

.BE1E:
    jsl _028D09
    jml _0281DD
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
    sta !obj_direction
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
    lda !obj_direction : sta $2D
    ldx $07
    lda.w arremer_projectile_data_D222,X : sta $2E
    ldx.w stage
    cpx #$07
    bcc .BEA7

    lda.w arremer_projectile_data_D220-7,X : sta $29
.BEA7:
    !A16
    lda !obj_pos_x+1 : sta !obj_speed_x+1
    lda !obj_pos_y+1 : sta !obj_speed_y+1
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
    lda $2D : sta !obj_direction
    dec $3B
    bne .BEC6

    lda #$06 : cop #$00

;----- BEDF

    jsl set_direction32
    inc
    and #$1F
    lsr
    sta !obj_direction
.BEE9:
    brk #$00

;----- BEEB

    ldx #$14 : jsl update_pos_xy_2
    bra .BEE9

;-----

.BEF3:
    lda $2E
.BEF5:
    sta !obj_direction
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

{ ;BF65 - C1B5
_03BF65: ;a8 x8
    lda $07
    bne .BFB8

    inc $07
    stz $2D
    lda #$04 : sta $1D
.BF71:
    lda $2D
    asl #2
    tax
    !A16
    lda.w killer_data_D24D+0,X : sta !obj_pos_x+1
    lda.w killer_data_D24D+2,X : sta !obj_pos_y+1
    !A8
    inc $2D
    lda $2D
    cmp #$08
    bne .BF90

    jml _0281A8_81B5
.BF90:
    brk #$00

;----- BF92

    !A16
    lda !obj_pos_x+1
    adc #$0020
    sbc.w camera_x+1
    cmp #$0140
    bcs .BF90

    lda !obj_pos_y+1
    adc #$0020
    sbc.w camera_y+1
    cmp #$0140
    bcs .BF90

    !A8
    lda #$93 : jsl prepare_object
    bra .BF71

;----- BFB8

.BFB8:
    !A16
    lda #$0120 ;blue killer
    ldx.w stage
    cpx #$02
    bne +

    lda #$0160 ;fire killer
+:
    sta $29
    !A8
.BFCB:
    brk #$00

;----- BFCD

    ldy #$2C : jsl _0192AD
    bcs .BFCB

    jsl set_hp
    stz $002D ;zeroes 0x2D in zero page! must be a mistake...?
    ldy #$A0 : ldx #$21 : jsl set_sprite
    jsl pot_creation
.BFE8:
    brk #$00

;----- BFEA

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .BFE8

    ldy #$A4 : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
    jsl get_rng_16
    lda.w killer_data_D225,X : sta $2F
.C009:
    ldy #$45 : jsl set_speed_y
    lda $2F ;leftover?
    lda #$0C : sta $30
.C015:
    brk #$00

;----- C017

    dec $30
    bne .C039

    lda #$0C : sta $30
    ldy #$A2
    ldx #$21
    lda $2E
    and #$01
    beq .C033

    ldy #$A4
    ldx #$21
    lda !obj_facing : eor #$01 : sta !obj_facing
.C033:
    jsl set_sprite
    inc $2E
.C039:
    lda $02C3
    and #$0F
    bne +

    jsl get_rng_16
    sta !obj_direction
+:
    ldx #$04
    jsl update_pos_xy_2
    jsl update_pos_y
    dec $2F
    bne .C015

    jsl get_arthur_relative_side
    sta !obj_direction
    sta !obj_facing
    ldy #$A2 : ldx #$21 : jsl set_sprite
    lda $2D : adc #$02 : and #$06 : sta $2D
    lda #$0C : jsl _0187E5
    jsl _019649
    ldx $2D
    and.w killer_data_D235,X
    !A8
    bne .C083

    inc !obj_speed_x+1
    bra .C08A

.C083:
    jsr .C124
    lda !obj_speed_y+2
    bmi .C0A4

.C08A:
    brk #$00

;----- C08C

    bit $09
    bvc .C0C6

    jsl update_pos_xyg_sub
    lda !obj_speed_y+2
    bpl .C08A

    ldy #$14
    jsl get_rng_bool
    beq .C0A2

    ldy #$1E
.C0A2:
    sty $2F
.C0A4:
    brk #$00

;----- C0A6

    bit $09
    bvc .C0C6

    jsl update_pos_xyg_sub
    dec $2F
    bne .C0A4

    ldy #$A4 : ldx #$21 : jsl set_sprite
    jsl get_rng_16
    lda.w killer_data_D23D,X : sta $2F
    jmp .C009

.C0C6:
    jsl _028D09
    jml _0281A8_81B5

;-----

.C0CE: ;kill function
    lda $0F
    bmi .C0DA

    jsl drop_pot
    jml _028C22

.C0DA: ;killed by shield
    stz $29
    stz $2A
    jsl drop_pot
    jml _028BB9

;-----

.C0E6: ;thing
    lda.w stage
    cmp #$08
    bne .C0FA

    !A16
    lda #$0540
    cmp !obj_pos_y+1
    bcc +

    sta !obj_pos_y+1
+:
    !A8
.C0FA:
    ldy #$80 : jsl pot_spawn_offset
    jsl update_animation_normal
    jsl _02F9FA
    jsl _02F9CA
    ldy #$0A : jsl _02F9CE
    jml _02F9B2

;-----

.C116:
    lda #$FE80 : sta !obj_speed_y
    !A8
    dec !obj_speed_y+2
    lda #$30 : sta $2F
    rts

.C124:
    stz $2F
    stz $0000
    !A16
    lda !obj_pos_y+1
    sta $0001
    cmp !arthur_pos_y+1
    bcs .C116

    !A8
    lda #$0E : jsl _0187E5
.C13D:
    inc $2F
    clc
    lda !obj_speed_y   : adc !obj_gravity   : sta !obj_speed_y
    !A16
    lda !obj_speed_y+1 : adc #$0000         : sta !obj_speed_y+1
    clc
    lda $0000          : adc !obj_speed_y   : sta $0000
    !A8
    lda $0002          : adc !obj_speed_y+2 : sta $0002
    !A16
    lda $0001
    cmp !arthur_pos_y+1
    !A8
    bcc .C13D

    jsl get_arthur_relative_side : sta !obj_direction
    !A16
    bne .C180

    sec
    lda !arthur_pos_x+1
    sbc !obj_pos_x+1
    bne .C186 ;supposed to be bra?

.C180:
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1

.C186:
    stz $0000
    sta $0001
    beq .C1B3

    ldy $2F
    jsl _018A7E
    sta !obj_speed_x+1
    sty $0001
    lda $0001
    ldy $2F
    jsl _018A7E
    clc
    adc !obj_speed_x
    sta !obj_speed_x
    lda !obj_speed_x+1
    cmp #$0003
    bcc .C1B3

    lda #$0003
    sta !obj_speed_x+1
.C1B3:
    !A8
    rts
}

{ ;C1B6 - C1E9
_03C1B6: ;a8 x8
    inc $08
    ldy #$B4 : ldx #$21 : jsl set_sprite
    jsl _02F9DA
    ldy #$5D : jsl set_speed_x
.C1CA:
    brk #$00

;----- C1CC

    jsl update_pos_x
    jsl update_animation_normal
    bit $09
    bvs .C1CA

    jml _0281A8_81B5

;-----

.C1DC:
    jsl _02F9BE
    ldy #$0C : jsl _02F9CE
    jml _02F9B2
}

{ ;C1EA -
_03C1EA:
    ldx $07
    jmp (+,X) : +: dw .C1F9, .C24F, .C22F, .C229, .C25F

;-----

.C1F9:
    lda #$04 : jsr .C2B2
.C1FE:
    ldx $0F
    !A16
    lda !obj_speed_x+1 : adc.w explosion_spawner_data+0,X : sta !obj_pos_x+1
    lda !obj_speed_y+1 : adc.w explosion_spawner_data+2,X : sta !obj_pos_y+1
    !A8
    lda #!id_explosion_spawner : jsl prepare_object
    lda #$06 : cop #$00

;----- C21C

    lda $0F : clc : adc #$04 : sta $0F
    cmp #$28
    bne .C1FE

    bra .C24B

;-----

.C229:
    ldy #$18 : ldx #$22
    bra .C233

;-----

.C22F:
    ldy #$76
    ldx #$20

.C233:
    jsl set_sprite
    lda #$16 : sta $3B
    lda #$3B : jsl _018049_8053
.C241:
    brk #$00

;----- C243

    jsl update_animation_normal
    dec $3B
    bne .C241

.C24B:
    jml _0281A8_81B5

;-----

.C24F:
    lda #$14 : sta $2D
    stz $2E
    stz $2F
    lda #$07 : sta $30
    lda #$06
    bra .C26F

.C25F:
    lda #$40 : sta $2D
    lda #$10 : sta $2E : sta $2F
    lda #$0F : sta $30
    lda #$06
.C26F:
    jsr .C2B2
.C272:
    jsl get_rng_16
    and $30
    asl
    clc
    adc $2E
    tax
    !A16
    lda !obj_speed_x+1 : adc.w explosion_spawner_data_D295,X : sta !obj_pos_x+1
    !A8
    jsl get_rng_16
    and $30
    asl
    clc
    adc $2F
    tax
    !A16
    lda !obj_speed_y+1 : adc.w explosion_spawner_data_D2C9,X : sta !obj_pos_y+1
    !A8
    lda #!id_explosion_spawner : jsl prepare_object
    lda #$04 : cop #$00

;----- C2A8

    inc $0F
    lda $0F
    cmp $2D
    bne .C272

    bra .C24B

;-----

.C2B2:
    sta $07
    lda #$04 : sta $1D
    !A16
    lda !obj_pos_x+1 : sta !obj_speed_x+1
    lda !obj_pos_y+1 : sta !obj_speed_y+1
    !A8
    rts
}

{ ;C2C5 - C30D
_03C2C5:

.create:
    lda $07 : and #$07 : tax
    lda.w game_over_text_flames_data_D309,X : sta !obj_pos_x+1
    lda #$78 : sta !obj_pos_y+1
    ldx $07
    cpx #$08
    bcs .C2F6

    lda.w game_over_text_flames_data_D311,X : cop #$00

;----- C2DE

    ldy #$00 : ldx #$20 : jsl set_sprite
.C2E6:
    brk #$00

;----- C2E8

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .C2E6

    jml _0281A8_81B5

.C2F6:
    lda.w game_over_text_flames_data_D311-$07,X : cop #$00

;----- C2FB

    lda $07 : asl : tax
    ldy.w game_over_text_flames_data_D2F9-$10,X : lda.w game_over_text_flames_data_D2F9-$0F,X : tax : jsl set_sprite
.C30A:
    brk #$00

;----- C30C

    bra .C30A
}

{ ;C30E - C329
_03C30E: ;unused?
    lda #$04 : sta $09
    ldy #$C4 : ldx #$21 : jsl set_sprite
    !A16
    lda !obj_pos_x+1 : sta $39
    lda !obj_pos_y+1 : sta $3B
    !A8
.C326:
    brk #$00

;----- C328

    bra .C326
}

{ ;C32A - C34E
_03C32A: ;a8 x8
    lda #$80 : sta $09
    ldy #$04 : ldx #$22 : jsl set_sprite
    lda #$05 : sta !obj_hp
.C33A:
    brk #$00

;----- C33C

    bra .C33A

;-----

.C33E:
    jsl _02F9CA
    jsl _02F9B2
    jsl _02F9BA
    jsl _028074_80A3
    rtl
}

{ ;C34F - C366
_03C34F:
    ldy #$CE : ldx #$21 : jsl set_sprite
.C357:
    brk #$00

;----- C359

    sec : lda $00CE : sbc #$DC : sta !obj_pos_y+1
    jsl update_animation_normal
    bra .C357
}

{ ;C367 - C391
_03C367:

.create:
    !A16
    clc : lda !obj_pos_x+1 : adc #$0010 : sta !obj_pos_x+1
    !A8
    lda #$38 : sta $10
    lda #$07 : sta $08
    lda #$30 : sta $09
    lda $07 : asl : ldy #$FE : ldx #$21 : jsl set_sprite_8480
.C38A:
    brk #$00

;----- C38C

    jsl _028166
    bra .C38A
}

{ ;C392 - C472
_03C392:

.create:
    lda #$32 : cop #$00

;----- C396

    !A16
.C398:
    brk #$00

;----- C39A

    lda !arthur_pos_x+1
    cmp #$01B0
    bcs .C398

    lda !arthur_pos_y+1
    cmp #$0412
    bcs .C398

    !A16
    stz $31
    stz $33
if !version == 0 ;crumbling wall becomes non-solid immediately in JP version
    lda #$E580 : sta $7EF7C2
endif
    !A8
if !version == 0
    lda #$00 : sta $7EF090 : sta $7EF091 : sta $7EF092 : sta $7EF093
endif
.C3CB:
    !AX8
    lda #$39 : jsl _018049_8053
    !AX16
.C3D5:
    ldy $31
    ldx.w crumbling_wall_data_D377,Y : jsr .C428
    !AX8
    lda #$17 : sta $031E
    lda #$0C : cop #$00

;----- C3E6

    !AX16
    lda $33
    cmp #$0008
    bne .C3D5

    stz $33
    lda $31
    cmp #$0006
    beq .C407

    inc $31 : inc $31
    lda $31
    cmp #$0006
    beq .C3D5

    bra .C3CB

.C407:
    !A16
    lda #$E580 : sta $7EF7C2
    !A8
    lda #$00 : sta $7EF090 : sta $7EF091 : sta $7EF092 : sta $7EF093
if !version == 1 || !version == 2
.C411:
    brk #$00

;----- C413

    lda #$17 : sta $031E
    !A16
    lda !arthur_pos_y+1
    cmp #$02E0
    !A8
    bcs .C411
endif

    jml _0281A8_81B5

;-----

.C428:
    !A16
    lda #$0004 : sta $2D
.C42F:
    ldy $33
    lda.w crumbling_wall_data_D37D,Y
    tay
    lda #$0004 : sta $35
.C43A:
    lda $0000,Y : iny #2 : sta $7ED800,X
    lda $0000,Y : iny #2 : sta $7ED802,X
    lda $0000,Y : iny #2 : sta $7ED804,X
    lda $0000,Y : iny #2 : sta $7ED806,X
    txa : clc : adc #$0040 : tax
    dec $35
    bne .C43A

    dec $2D
    bne .C42F

    inc $33 : inc $33
    !AX8
    rts
}

{ ;C473 - C557
_03C473:
    !AX8
    brk #$00

;----- C477

    jsl _028166
    !A16
    lda !arthur_pos_y+1
    cmp !obj_pos_y+1
    bcc _03C473

    lda !arthur_pos_y+1
    sec
    sbc #$0060
    cmp !obj_pos_y+1
    bcs _03C473

    !A8
    ldy #$24 : jsl arthur_range_check
    bcs _03C473

    ldx #$9C : jsl _0196EF
    sta $35
    dec
    asl
    sta $34
    dec $35
    dec $35
    lda $34
    jsl _0195E4
    bcc _03C473

    !X16
    jsl _028B1E
    stz $0007,X
    lda #$01 : sta $000F,X
    lda #!id_lava : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    sty $3C
    !AX8
    lda #$70 : sta $3E
.C4DD:
    !X8 ;this does nothing
    lda $3E : clc : adc #$10 : sta $3E
    !X16
    ldy $3C : jsl _028B1E
    lda #$01 : sta $0007,X
    lda $3E : sta $000F,X
    lda #!id_lava : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    sty $3C
    !AX8
    dec $35
    bne .C4DD

    lda $3E : clc : adc #$10 : sta $3E
    !X16
    ldy $3C : jsl _028B1E
    lda #$02 : sta $0007,X
    lda $3E : sta $000F,X
    lda #!id_lava : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    sty $3C
    !AX8
    lda #$7F : cop #$00

;----- C54D

    ldx #$9E : jsl _0196EF
    cop #$00

;----- C555

    jmp _03C473
}

{ ;C558 - C55B
_03C558: ;unused
    jml _0281A8_81B5
}

{ ;C55C - C5B8
_03C55C:
    lda $0F : cop #$00

;----- C560

    lda $07 : asl : ldy #$DA : ldx #$21 : jsl set_sprite_8480
    !A16
    lda.w #lava_data_D31B : sta $13
    stz $0C
    !A8
    stz $15
    lda $08 : ora #$00 : sta $08
    lda $09 : ora #$90 : sta $09
    lda $07
    bne .C59E

    lda #$20 : sta !obj_speed_y+0
    stz !obj_speed_y+1
    stz !obj_speed_y+2
    lda #$7F : sta $35
.C594:
    brk #$00

;----- C596

    jsl update_pos_y
    dec $35
    bne .C594

.C59E:
    brk #$00

.C5A0:
    !A16
    inc !obj_pos_y+1
    !A8
    jsl _01A559
    beq .C59E

    jml _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _02F9B2
    rtl
}

{ ;C5B9 -
_03C5B9:

.create:
    lda $07 : sta $3C
    stz $07
    !A16
    lda !obj_pos_x+1 : sta $0036 ;todo: does this do anything? mistake?
    lda !obj_pos_y+1 : sta $0038
    !A8
    stz $1EBD
.C5D0:
    brk #$00

;----- C5D2

    lda #$10 : jsl _0195E4
    bcs .C5DD

    jmp .C5D0

.C5DD:
    !AX16
    tya
    clc
    adc #$0010
    tay
    !A8
    inc $07
    lda #$06 : sta $0F
    phd
    plx
.C5EF:
    phx
    jsl _028B2A
    lda #!id_cockatrice_head2 : jsl _02EB57_far
    jsr .C690
    pla : sta $002D,X
    lda $3C : sta $003C,X
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    stz $0031,X
    !A8
    dec $0F
    bne .C5EF

    stx $3A
    phx
    lda #$04 : sta $07
    jsl _028B2A
    lda #!id_cockatrice_head2 : jsl _02EB57_far
    jsr .C690
    pla : sta $002D,X
    lda $3C : sta $003C,X
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    stz $0031,X
    !A8
    stx $34
    stz $07
    jsl _028B2A
    lda #!id_cockatrice_head2 : jsl _02EB57_far
    !A16
    jsr .C690
    lda $3A : sta $002F,X
    lda $3C : sta $003C,X
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    lda $34 : sta $003A,X
    phx
    pla
    ldx $34
    sta $002F,X
    !AX8
    stz $33
.C67C:
    brk #$00

;----- C67E

    lda $33
    beq .C67C

    jml _0281A8_81B5

;-----

.thing: ;unused
    rtl

;-----

.destroy: ;unused
    inc $1FAD
    stz $33
    jml _0281A8_81B5

;-----

.C690:
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    stz $0024,X
    rts
}

{ ;C6A0 -
_03C6A0:

.create:
    stz $0F
    lda $07 : asl : tax
    jmp (+,X) : +: dw .C6B3, .C840, .C6B3, .C840, .C9AA

.C6B3:
    lda.w stage
    cmp #$07
    beq .C6C2

    ldx #$00 : jsl _018D5B
    bra .C6CB

.C6C2:
    !A16
    lda #$0120 : sta $29
    !A8
.C6CB:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$01 : sta $08
    lda $09 : ora #$C0 : sta $09
    !A16
    lda.w _00ED00+$40 : sta $27
    stz !obj_speed_x+0
    stz !obj_speed_y+0
    lda !obj_pos_x+1 : sta $36
    lda !obj_pos_y+1 : sta $38
    !A8
    !X16
    stz $0033,X
    !X8
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    lda #$FF : sta $26
    stz $31
    stz $32
    jsl set_hp
    lda $3C : and #$01
    beq .C723

    inc !obj_facing
    !AX16
    ldx $2F
    lda.w !obj_pos_x+1,X : sta !obj_pos_x+1
    lda.w !obj_pos_y+1,X : sta !obj_pos_y+1
    !AX8
.C723:
    brk #$00

;----- C725

.C725:
    !AX16
    lda.w stage
    cmp #$0008
    beq .C73D

    lda !obj_pos_x+1
    clc
    adc #$00F0
    sec
    sbc !arthur_pos_x+1
    bcc .C755

    bra .C75A

.C73D:
    lda !obj_pos_x+1
    clc
    adc #$0160
    sec
    sbc !arthur_pos_x+1
    bcc .C755

    lda !arthur_pos_y+1
    clc
    adc #$00E0
    sec
    sbc !obj_pos_y+1
    bcs .C75A

.C755:
    !AX8
    jmp .CB84

.C75A:
    !AX8
    lda $0F : asl : tax
    jmp (+,X) : +: dw .C771, .C781, .C7BF, .C7CA, .C7EA, .C803, .C813

;-----

.C771:
    ldy #$EC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    inc $0F
    bra .C723

;-----

.C781:
    lda $32
    bne .C79C

    lda $31
    beq .C723

    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$04 : sta $0F
    jmp .C723

.C79C:
    ldy #$CA : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$4E : sta $1D
    lda #$1F : cop #$00

;----- C7B0

    lda #!id_cockatrice_head2_projectile : jsl prepare_object
    lda #$10 : sta $35
    inc $0F
    jmp .C723

;-----

.C7BF:
    dec $35
    bne .C7C7

    stz $32
    stz $0F
.C7C7:
    jmp .C723

;-----

.C7CA: ;unused shoot code?
    dec $34
    beq .C7E5

    lda #!sfx_cockatrice_spew : jsl _018049_8053
    lda #!id_cockatrice_head2_projectile : jsl prepare_object
    lda #$30 : sta $35
    lda #$02 : sta $0F
    jmp .C723

.C7E5:
    stz $0F
    jmp .C723

;-----

.C7EA:
    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    lda #$02 : sta $31
    lda #$7F : sta $35
    inc $0F
    jmp .C723

;-----

.C803:
    lda $31
    beq .C80E

    dec $35
    beq .C80E

    jmp .C723

.C80E:
    stz $0F
    jmp .C723

;-----

.C813:
    dec $35
    bne .C83D

    ldy #$FC : ldx #$21 : jsl set_sprite
    lda #$FF : sta $26
    jsl update_animation_normal
    sec
    lda.w stage
    sbc #$07
    tay
    ldx.w cockatrice_head2_data2_D375,Y : jsl _018E32
    lda $37 : sta $35
    lda $36 : sta $0F
.C83D:
    jmp .C723

;-----

.C840:
    brk #$00

;----- C842

    lda $31
    beq .C840

    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$04 : sta $08
    lda $0F
    cmp #$08
    beq .C860

    lda $09 : ora #$C0 : sta $09
.C860:
    !AX16
    ldx $2D
    lda $29 : sta $0029,X
    stz $0033,X
    lda #$0001 : sta $0031,X
    lda.w _00ED00+$68 : sta $27
    lda !obj_pos_x+1 : sta $36
    lda !obj_pos_y+1 : sta $38
    stz !obj_speed_x+0
    stz !obj_speed_y+0
    !AX8
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    stz $31
    stz $32
    stz $35
    lda $08 : and #$F7 : sta $08
    lda $3C : and #$01
    beq .C89D

    inc !obj_facing
.C89D:
    brk #$00

;----- C89F

    lda $33
    beq .C8A6

    jmp .CB69

.C8A6:
    lda $0F : asl : tax
    jmp (+,X) : +: dw .C8BD, .C8E1, .C903, .C921, .C94A, .C962, .C974, .C990

;-----

.C8BD:
    lda $31
    beq .C89D

    lda #$04 : cop #$00

;----- C8C5

    lda $08 : ora #$08 : sta $08
    !X16
    ldx $2D
    inc $0031,X
    lda !obj_direction : sta.w !obj_direction,X
    !AX8
    lda #$18 : sta $35
    inc $0F
    bra .C89D

;-----

.C8E1:
    ldx #$2A : jsl update_pos_xy_2
    dec $35
    bne .C89D

    !X16
    ldx $2F
    stz $0031,X
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$1F : sta $35
    inc $0F
    bra .C89D

;-----

.C903:
    dec $35
    bne .C91E

    lda !obj_direction : ora #$10 : sta !obj_direction
    !X16
    ldx $2D
    lda !obj_direction : sta.w !obj_direction,X
    !X8
    lda #$39 : sta $35
    inc $0F
.C91E:
    jmp .C89D

;-----

.C921:
    dec $35
    beq .C939

    !A16
    lda !obj_pos_y+1
    sec
    sbc $38
    bcc .C939

    !A8
    ldx #$28 : jsl update_pos_xy_2
    jmp .C89D

.C939:
    !A16
    lda $36 : sta !obj_pos_x+1
    lda $38 : sta !obj_pos_y+1
    !A8
    inc $0F
    jmp .C89D

;-----

.C94A:
    !X16
    ldx $2D
    lda #$04 : sta $000F,X
    !X8
    lda $08 : and #$F7 : sta $08
    stz $31
    stz $0F
    jmp .C89D

;-----

.C962: ;unused?
    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$07 : sta $0F
    jmp .C89D

;-----

.C974:
    ldx #$2A : jsl update_pos_xy_2
    !X16
    ldx $2D
    lda #$06 : sta $000F,X
    !X8
    lda #$1F : sta $35
    lda #$07 : sta $0F
    jmp .C89D

;-----

.C990:
    dec $35
    bne .C9A7

    !X16
    ldx $2D
    lda !obj_direction : sta.w !obj_direction,X
    !X8
    lda #$7F : sta $35
    lda #$03 : sta $0F
.C9A7:
    jmp .C89D

;-----

.C9AA:
    lda #$02 : cop #$00

;----- C9AE

    ldy #$0A : ldx #$22 : jsl set_sprite
    lda $08 : ora #$05 : sta $08
    lda $09 : ora #$C0 : sta $09
    !A16
    lda.w _00ED00+$68 : sta $27
    lda.w stage
    cmp #$0008
    beq .C9D8

    lda #$012E : sta $29
    bra .C9DD

.C9D8:
    lda #$01CE : sta $29
.C9DD:
    lda !obj_pos_x+1 : sta $36
    lda !obj_pos_y+1 : sta $38
    stz !obj_speed_x+0
    stz !obj_speed_y+0
    !A8
    stz !obj_speed_x+2
    stz !obj_speed_y+2
    lda #$FF : sta $26
    stz $31
    stz $32
    stz $35
    stz $33
    jsl update_animation_normal
    sec
    lda.w stage
    sbc #$07
    tay
    ldx.w cockatrice_head2_data2_D375,Y : jsl _018E32
    !AX16
    ldx $2D
    lda $29 : sta $0029,X
    stz $0033,X
    lda #$0001 : sta $0031,X
    !AX8
    lda $3C : and #$01
    beq .CA29

    inc !obj_facing
.CA29:
    brk #$00

;----- CA29

    lda $33
    beq .CA32

    jmp .CB69

.CA32:
    ldy #$38 : jsl _0192AD
    bcs .CA29

    lda $3C
    and #$02
    beq .CA6E

    ldx #$A4 : jsl _0196EF
    beq .CA6E

    ldx #$A2 : jsl _0196EF : sta $35
.CA50:
    !X16
    ldx $2F
    inc $0032,X
    !X8
    lda #$5F : sta $34
.CA5D:
    brk #$00

;----- CA5D

    lda $33
    beq .CA66

    jmp .CB69

.CA66:
    dec $34
    bne .CA5D

    dec $35
    bpl .CA50

.CA6E:
    ldx #$A0 : jsl _0196EF : sta $35
.CA76:
    brk #$00

;----- CA78

    lda $33
    beq .CA7F

    jmp .CB69

.CA7F:
    dec $35
    bne .CA76

    lda $3C : and #$01
    beq .CA93

    jsl set_direction32
    tax
    lda.w cockatrice_head2_data_D34A,X
    bra .CA9B

.CA93:
    jsl set_direction32 : tax
    lda.w cockatrice_head2_data_D32A,X
.CA9B:
    !X16
    ldx $2D : sta !obj_direction : sta.w !obj_direction,X
    !X8
    lda #$04 : cop #$00

;----- CAAA

    !X16
    ldx $2D
    inc $0031,X
    ldx $2F
    inc $0031,X
    !X8
    lda #$7F : sta $35
.CABC:
    brk #$00

;----- CABE

    lda $33
    beq .CAC5

    jmp .CB69

.CAC5:
    dec $35
    bne .CABC

    !X16
    ldx $2F
    stz $0031,X
    !X8
    jmp .CA29

;-----

.thing:
    jsl _02F9B2
    lda $07
    bne .CB14

    !AX16
    ldx $2F
    lda.w !obj_pos_x+1,X : sta !obj_pos_x+1
    lda.w !obj_pos_y+1,X : sta !obj_pos_y+1
    !AX8
    lda $0F
    cmp #$05
    beq .CB0B

    lda $09 : ora #$40 : sta $09
    jsl update_animation_normal
    sec
    lda.w stage
    sbc #$07
    tay
    ldx.w cockatrice_head2_data2_D375,Y : jsl _018E32
.CB0B:
    jsl _02F9B6
    jsl _02F9BA
    rtl

.CB14:
    jsl _02F9C2
    rtl

;-----

.destroy:
    lda !obj_hp
    beq .CB4A

    lda $0F
    cmp #$06
    beq .CB43

    lda $32
    bne .CB43

    ldy #$0E : ldx #$22 : jsl set_sprite
    lda #$FF : sta $26
    lda $0F : sta $36
    lda $35 : sta $37
    lda #$16 : sta $35
    lda #$06 : sta $0F
.CB43:
    jsl _02F9DA_F9E0
    jmp .C723

.CB4A:
    inc $33
    !X16
    ldx $3A
    inc $0033,X
    !X8
    inc $1FAD
    lda $1FAD
    cmp #$05
    bne .CB65

    lda #!id_crumbling_wall : jsl prepare_object
.CB65:
    jml magician_destroy

;-----

.CB69:
    !X16
    ldx $2D
    inc $0033,X
    !X8
    lda #$1F : cop #$00

;----- CB76

    lda #$04 : sta $1D
    lda #!id_small_explosion : jsl prepare_object
    jml _0281A8_81B5

;-----

.CB84:
    !X16
    ldx $3A
    inc $0033,X
    !X8
    inc $1FAD
    jml _0281A8_81B5
}

{ ;CB94 - CBCC
_03CB94:

.create:
    ldy #$0C : ldx #$22 : jsl set_sprite
    lda $09 : ora #$80 : sta $09
    jsl set_direction32 : sta !obj_direction
.CBA8:
    brk #$00

;----- CBAA

    ldx #$46 : jsl update_pos_xy_2
    lda $09
    and #$40
    bne .CBA8

    jml _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$16 : jsl _02F9CE
    jsl _02F9B2
    rtl
}

{ ;CBCD - CC60
_03CBCD:

.create:
    lda #$03 : sta $08
    lda $07
    bne .CBDF

    ldy #$B8 : ldx #$21 : jsl set_sprite
    bra .CBE7

.CBDF:
    ldy #$BC : ldx #$21 : jsl set_sprite
.CBE7:
    lda $09 : ora #$80 : sta $09
    lda $07 : asl : tax
    !A16
    lda.w ice_bridge_segment_data_D36D,X : sta $2F
.CBF8:
    brk #$00

;----- CBFA

    lda !arthur_pos_x+1
    sec
    sbc $2F
    bcc .CBF8

    !A8
    ldy #$3A : jsl set_speed_xyg
    lda #$10 : cop #$00

;----- CC0E

    lda $0F : asl #2 : inc : cop #$00

;----- CC15

    lda #$43 : jsl _018049_8053
    lda $09 : and #$7F : sta $09
    lda #$16 : sta $35
.CC25:
    brk #$00

;----- CC27

    jsl update_animation_normal
    jsl update_pos_xyg_add
    dec $35
    bne .CC25

    bra .destroy

;-----

.thing:
    lda.w jump_counter
    beq .CC3F

    lda !arthur_speed_y+2
    bmi .CC5C

.CC3F:
    jsl arthur_overlap_check_FED8_8bit
    bcs .CC5C

    lda #$01 : sta $35
    stz !arthur_speed_y+2
    !A16
    lda !obj_pos_y+1 : sec : sbc #$0018 : sta !arthur_pos_y+1
    !A8
    inc $14C3
.CC5C:
    rtl

;-----

.destroy:
    jml _0281A8_81B5
}

{ ;CC61 - CCC9
_03CC61:

.create:
    !A16
    lda !arthur_pos_x+1
    sec
    sbc !obj_pos_x+1
    bcc .CC70

    !A8
    jmp .destroy

.CC70:
    !A8
.CC72:
    brk #$00

;----- CC74

    lda $1FAF
    beq .CC72

.CC79:
    brk #$00

;----- CC7B

    lda $1AEF
    bne .CC79

    lda #$AE : sta $1D
    lda $07
    and #$02
    beq .CC92

    lda #$04 : sta $31 : sta $35 ;half bridge (unused)
    bra .CC98

.CC92:
    lda #$08 : sta $31 : sta $35 ;full bridge
.CC98:
    jsl get_object_slot
    bmi .destroy

    !X16
    lda $31 : sec : sbc $35 : sta $000F,X
    lda #!id_ice_bridge_segment : jsl prepare_object_8C37
    lda $1D : clc : adc #$02 : sta $1D
    dec $35
    bne .CC98

    jml _0281A8_81B5

;-----

.thing: ;unused
    jsl update_animation_normal
    jsl _02F9B2
    rtl

.destroy: ;unused?
    jml _0281A8_81B5
}

{ ;CCCA -
    macro intro_obj_macro(x, y)
    {
        jsr .D0C1
        ldx #<x> : ldy #<y> : jsl .D0BB
    }
    endmacro

;-----

_03CCCA: ;a8 x8
    lda #$10 : sta $09
    ldx $07
    jmp (+,X) : +: dw .CCED, .CD6F, .CD6F, .CD8B, .CD8B, .CDD4, .CE1A, .CF07, .CF11, .CF1D, .CF59, .CF85, .D09D

.CCED:
    %intro_obj_macro($00, $14)
    %intro_obj_macro($00, $04)
    %intro_obj_macro($01, $04)
    %intro_obj_macro($00, $04)
    %intro_obj_macro($00, $12)
    %intro_obj_macro($01, $12)
    %intro_obj_macro($02, $12)
    %intro_obj_macro($03, $12)
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
    lda !obj_direction : sta $12
    jsl set_sprite
    lda #$40 : sta !obj_speed_x
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
    lda #$FFF0 : sta !obj_pos_x+1
    lda #$00B7 : sta !obj_pos_y+1
    !A8
    inc !obj_speed_x+1
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
    inc !obj_direction
    inc $12
    ldy #$A0 : ldx #$21 : jsl set_sprite
    !A16
    lda #$00C0 : sta !obj_pos_x+1
    lda #$00B7 : sta !obj_pos_y+1
    !A8
    inc !obj_speed_x+1
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
    jsr .D0C1
    ldx #$01 : ldy #$0E : jsl .D0BB
    jsr .CEF1
    jsr .D0C1
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
    jsr .D0C1
    ldx #$00 : ldy #$10 : jsl .D0BB
    jsr .D0C1
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
    jsr .D0C1
    ldx #$00 : ldy #$0E : jsl .D0BB
    jsr .D0C1
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
    lda !obj_direction : sta $12
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
    lda !obj_pos_y+1 : sbc #$08 : sta !obj_pos_y+1
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
    lda #$0160 : sta !obj_speed_x
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
    lda #$01 : sta !obj_direction : sta !obj_facing
    ldy #$EA : ldx #$21 : jsl set_sprite
    !A16
    lda #$00F0 : sta !obj_pos_y+1
    !A8
    stz !obj_pos_x
    ldy #$42 : jsl set_speed_y
.CFAA:
    brk #$00

;----- CFAC

    jsl update_pos_y
    !A16
    lda #$01A0
    cmp !obj_pos_y+1
    !A8
    bcs .CFAA

    sta !obj_pos_y+1
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

    stz !obj_facing
    !A16
    sec : lda !obj_pos_x+1 : sbc #$0003 : sta !obj_pos_x+1
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
    inc $0323
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
    lda #$0014 : sta !obj_pos_x+1
    lda #$00CC : sta !obj_pos_y+1
    !A8
.D0B3:
    brk #$00

;----- D0B5

    bra .D0B3

;-----

.thing:
    jml update_animation_normal

;-----

.D0BB:
    lda #$B3
    jml _018C55

.D0C1:
    lda $0F
    inc $0F
    asl #2
    tax
    !A16
    lda.w _00D405+0,X : sta !obj_pos_x+1
    lda.w _00D405+2,X : sta !obj_pos_y+1
    !A8
    rts
}

{ ;D0D7 -
_03D0D7:

.create:
    stz $1EBF
    lda.w stage
    cmp #$07
    bne .D0EB

    !A16
    lda #$0340 : sta.w screen_boundary_left
    !A8
.D0EB:
    brk #$00

;----- D0ED

    ldy #$34 : jsl _0192AD
    bcs .D0EB

    lda.w stage
    cmp #$08
    bne .D104

    lda $0292
    beq .D104

    jmp .D297

.D104:
    lda $0292
    bne .D10F

    lda #!mus_stage_6_7_boss : jsl _018049_8053
.D10F:
    brk #$00

;----- D111

    jsr .D1FE
    bcc .D10F

    ldx #$14 : jsl _028000
    inc $08
    stz $3A
    lda #$1A : clc : adc $07 : sta $3B
    jsl set_hp
    lda #$FF : sta $26
    lda.w stage : asl : tax
    !A16
    lda.w astaroth_nebiroth_data_D441-$0E,X : sta $2E
    lda.w _00ED00+$62 : sta $27
    lda #$0100 : sta $29
    !A8
    ldy #$CE : ldx #$21 : jsl set_sprite
    jsl get_arthur_relative_side : sta !obj_facing
    ldx $3B : jsl _018E32
    ldx #$14 : jsl _028048
    lda #$78 : cop #$00

;----- D165

    jsl _02F9DA_F9E0
    inc !obj_direction
    !A16
    lda !obj_pos_x+1 : sta $35
    stz $33
    !A8
    stz $32
    jsr .D356
    ldy #$D0 : ldx #$21 : jsl set_sprite
.D182:
    stz $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D445,X : sta $37
    ldy #$66 : jsl set_speed_x
    jsl get_rng_bool
    sta !obj_direction
    cmp $33
    bne .D1AA

    inc $34
    inc
    cmp #$03
    bcc .D1AE

    lda !obj_direction : eor #$01 : sta !obj_direction
.D1AA:
    sta $33
    stz $34
.D1AE:
    brk #$00

;----- D1B0

    lda !slot_arthur+$09 : and #$01
    beq .D1BF

    ldy #$2C : jsl arthur_range_check
    bcc .D1D0

.D1BF:
    jsl update_pos_x
    lda $02C3
    and #$1F
    bne .D1D0

    lda #$39 : jsl _018049_8053
.D1D0:
    !A16
    lda $35
    sec
    sbc !obj_pos_x+1
    cmp $2E
    !A8
    bcc .D1E5

    lda !obj_direction : eor #$01 : sta !obj_direction
    bra .D1AE

.D1E5:
    dec $37
    bne .D1AE

    lda #$02 : sta $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D455,X : sta $37
.D1F6:
    brk #$00

;----- D1F8

    dec $37
    bne .D1F6

    bra .D182

;-----

.D1FE:
    clc
    lda !open_object_slots
    adc #$02
    cmp #$02
    bcc .D220

    stz $1EB7
    lda #!id_astaroth_nebiroth_body : ldx #$00 : ldy #$00 : jsl _018C55
    !A16
    stz $1EBB
    stz $1EBD
    !A8
    sec
.D220:
    rts

;-----

.destroy:
    lda !obj_hp
    beq .D24A

    ldx #$03 : jsl _028048
    jsl _02F9DA_F9E0
    ldy #$D2 : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- D23B

    ldy #$D0 : ldx #$21 : jsl set_sprite
    ldx $2D
    bne .D1F6

    jmp .D1AE

.D24A:
    lda $07
    bne .D251

    inc $1ED7
.D251:
    inc $1EB7
    lda #$04 : sta $1D
    ldx #$00 : ldy #$02 : lda #!id_explosion_spawner : jsl _018C55
    jsl _018E32_8E73
    lda $08 : ora #$10 : sta $08
    lda #$30 : cop #$00

;----- D270

    stz $08
    lda $07
    bne .D290

    stz $08
    stz $09
    lda #$20 : cop #$00

;----- D27E

    lda #!id_key : jsl prepare_object
    jsl _018049
    lda #$10 : jsl _018049_8053
    bra .D2A5

.D290:
    brk #$00

;----- D292

    lda $1EBF
    bne .D290

.D297:
    lda #$04 : sta $1D
    lda #!id_nebiroth : ldx #$00 : ldy #$00 : jsl _018C55
.D2A5:
    jml _0281A8_81B5

;-----

.thing:
    !A16
    lda !obj_pos_x+1 : sta $1EBB
    lda !obj_pos_y+1 : sta $1EBD
    !A8
    ldx $3A
    jsr (.D2DC,X)
    lda $3A
    bne .D2C6

    jsl get_arthur_relative_side : sta !obj_facing
.D2C6:
    jsl update_animation_normal
    jsl _02F9BA
    jsl _02F9B6
    jsl _02F9B2
    ldx $3B : jml _018E32

.D2DC: dw .D2E8, .D30D, .D320, .D332, .D345, .D34E

;-----

.D2E8:
    dec $31
    bne .D307

    lda $32
    bne .D308

    lda #$02 : sta $3A
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D465,X : sta $30
    jsl set_direction32 : inc : and #$1F : lsr : sta $39
.D307:
    rts

.D308:
    lda #$06 : sta $3A
    rts

;-----

.D30D:
    lda #$04 : sta $3A
    lda #!id_astaroth_flame : ldx $39 : ldy #$00 : jsl _018C55
    lda #$06 : sta $31
.D31F:
    rts

;-----

.D320:
    dec $31
    bne .D31F

    lda #$02 : sta $3A
    dec $30
    bne .D31F

    stz $3A
    inc $32
    bra .D356

;-----

.D332:
    lda #$08 : sta $3A
    lda #$08 : sta $31
    lda #!id_astaroth_laser : ldx #$00 : ldy #$00 : jsl _018C55
    rts

;-----

.D345:
    lda #$0A : sta $3A
    lda #$60 : sta $31
.D34D:
    rts

;-----

.D34E:
    dec $31
    bne .D34D

    stz $3A
    stz $32
.D356:
    jsl get_rng_16 : stx $0000
    lda.w difficulty
    asl #4
    clc
    adc $0000
    tax
    lda.w astaroth_nebiroth_data_D485,X : sta $31
    rts
}

{ ;D36F - D5C8
_03D36F:
    jsl get_rng_16
    stx $0000
    lda.w difficulty
    asl #4
    clc
    adc $0000
    tax
    lda.w astaroth_nebiroth_data_D4C5,X : sta $31
    rts

;-----

.create:
    lda #$28 : cop #$00

;----- D38C

    lda #$01 : sta !obj_direction : sta !obj_facing
    !A16
    lda #$04D0 : sta !obj_pos_x+1
    !A8
    ldy #$90 : lda.b #_01FF00_5C : ldx #$23 : jsl _01A6FE
.D3A5:
    brk #$00

;----- D3A7

    lda $00DE
    bne .D3A5

    !A16
    lda.w _00ED00+$66 : sta $27
    lda #$0140 : sta $29
    !A8
    lda #$00 : jsl _018E32_8E81
.D3C0:
    brk #$00

;----- D3C2

    jsr _03D0D7_D1FE
    bcc .D3C0

    ldx #$1C : jsl _028000
    stz $3C
    inc $08
    jsl set_hp
    lda #$FF : sta $26
    !A16
    lda.w _00ED00+$64 : sta $27
    lda #$0100 : sta $29
    !A8
    ldy #$D4 : ldx #$21 : jsl set_sprite
    ldx #$1E : jsl _018E32
    ldx #$14 : jsl _028048
    lda #$78 : cop #$00

;----- D3FF

    jsl _02F9DA_F9E0
    !A16
    lda !obj_pos_x+1 : sta $35
    stz $33
    !A8
    stz $32
    jsr _03D36F
    ldy #$D6 : ldx #$21 : jsl set_sprite
.D41A:
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D445,X : sta $37
    ldy #$66 : jsl set_speed_x
    jsl get_rng_bool : sta !obj_direction
    cmp $33
    bne .D440

    inc $34
    inc
    cmp #$03
    bcc .D444

    lda !obj_direction : eor #$01 : sta !obj_direction
.D440:
    sta $33
    stz $34
.D444:
    stz $2D
.D446:
    brk #$00

;----- D448

    jsl get_arthur_relative_side : sta !obj_facing
    dec $31
    beq .D4A8

    lda !slot_arthur+$09
    and #$01
    beq .D461

    ldy #$2C : jsl arthur_range_check
    bcc .D472

.D461:
    jsl update_pos_x
    lda $02C3
    and #$1F
    bne .D472

    lda #$39 : jsl _018049_8053
.D472:
    !A16
    lda $35
    sec
    sbc !obj_pos_x+1
    cmp #$0080
    !A8
    bcc .D488

    lda !obj_direction : eor #$01 : sta !obj_direction
    bra .D446

.D488:
    dec $37
    bne .D446

    lda #$02 : sta $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D455,X : sta $37
.D499:
    brk #$00

;----- D49B

    jsl get_arthur_relative_side : sta !obj_facing
    dec $37
    bne .D499

    jmp .D41A

.D4A8:
    lda #$04 : sta $2D
    jsl get_rng_16
    lda.w astaroth_nebiroth_data_D475,X : sta $30
    lda #$BE : sta $1D
    ldx #$01 : lda !obj_facing
    beq .D4C1

    ldx #$07
.D4C1:
    stx $39
.D4C3:
    lda #!id_nebiroth_flame : ldx $39 : ldy #$00 : jsl _018C55
    lda #$06 : sta $31
.D4D1:
    brk #$00

;----- D4D3

    dec $31
    bne .D4D1

    dec $30
    bne .D4C3

    jsr _03D36F
    jsl get_rng_bool
    bne .D4EF

    inc $3C
    lda $3C
    cmp #$03
    beq .D4EF

    jmp .D444

.D4EF:
    lda #$06 : sta $2D
    ldx.w difficulty
    lda.w astaroth_nebiroth_data_D505,X : sta $37
.D4FB:
    brk #$00

;----- D4FD

    dec $37
    bne .D4FB

    lda #$08 : sta $2D
    stz $3C
    lda #$C0 : sta $1D
    lda #!id_nebiroth_laser : ldx $12 : ldy #$00 : jsl _018C55
    ldx.w difficulty
    lda.w astaroth_nebiroth_data_D509,X : sta $37
.D51D:
    brk #$00

;----- D51F

    dec $37
    bne .D51D

    jmp .D444

;-----

.destroy:
    lda !obj_hp
    beq .D557

    ldx #$03 : jsl _028048
    jsl _02F9DA_F9E0
    ldy #$D8 : ldx #$21 : jsl set_sprite
    lda #$08 : cop #$00

;----- D540

    ldy #$D6 : ldx #$21 : jsl set_sprite
    ldx $2D
    jmp (+,X) : +: dw .D444, .D499, .D4D1, .D4FB, .D51D

;-----

.D557:
    inc $1ED7
    inc $1EB7
    lda #$04 : sta $1D
    ldx #$00 : ldy #$02 : lda #!id_explosion_spawner : jsl _018C55
    jsl _018E32_8E73
    lda $08 : ora #$10 : sta $08
    lda #$30 : cop #$00

;----- D579

    stz $08
    stz $09
    lda #$20 : cop #$00

;----- D581

.D581:
    brk #$00

;----- D583

    lda $1EBF
    bne .D581

    jsl _018049
    lda #!id_key : jsl prepare_object
    lda.w weapon_current
    and #$0E
    cmp #!weapon_bracelet
    bne .D5A1

    lda #$10 : jsl _018049_8053
.D5A1:
    jml _0281A8_81B5

;-----

.thing:
    !A16
    lda !obj_pos_x+1 : sta $1EBB
    lda !obj_pos_y+1 : sta $1EBD
    !A8
    jsl update_animation_normal
    jsl _02F9BA
    jsl _02F9B6
    jsl _02F9B2
    ldx #$1E : jml _018E32
}

{ ;D5C9 - D5F1
_03D5C9:

.create:
    jsl _02F9DA_F9E0
.D5CD:
    brk #$00

;----- D5CF

    !A16
    lda $1EBB : sta !obj_pos_x+1
    clc : lda $1EBD : adc #$002A : sta !obj_pos_y+1
    !A16 ;mistake or unnecessary A16
    lda $1EB7
    beq .D5CD

    jml _0281A8_81B5

;-----

.thing:
    jsl _02F9B2
    jml _02F9C2
}

{ ;D5F2 -
_03D5F2:

.create:
    inc $1EBF
    ldy #$DA : ldx #$21 : jsl set_sprite
    jsl _02F9DA_F9E0
    !A16
    stz !obj_speed_x+1
    lda #$0026 : sta !obj_speed_y+1
    !A8
    jsr .D66F
    lda #$1E : sta $37
.D613:
    brk #$00

;----- D615

    jsr .D66F
    dec $37
    bne .D613

    lda #$59 : jsl _018049_8053
    lda #$20 : sta $37
.D626:
    brk #$00

;----- D628

    jsr .D66F
    ldx #$3C : jsl update_pos_xy_2
    jsr .D684
    dec $37
    bne .D626

    ldy #$DC : ldx #$21 : jsl set_sprite
    lda #$0A : sta $37
.D644:
    brk #$00

;----- D646

    jsr .D66F
    ldx #$3C : jsl update_pos_xy_2
    jsr .D684
    dec $37
    bne .D644

    dec $1EBF
    jml _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$1A : jsl _02F9CE
    jml _02F9B2

;-----

.D66F:
    !A16
    clc : lda $1EBB : adc !obj_speed_x+1 : sta !obj_pos_x+1
    clc : lda $1EBD : adc !obj_speed_y+1 : sta !obj_pos_y+1
    !A8
    rts

;-----

.D684:
    !A16
    sec : lda !obj_pos_x+1 : sbc $1EBB : sta !obj_speed_x+1
    sec : lda !obj_pos_y+1 : sbc $1EBD : sta !obj_speed_y+1
    !A8
    rts

;-----

.laser_create:
    lda $07 : asl : tax
    jmp (+,X) : +: dw .D6AC, .D723, .D783, .D783, .D783, .D783

;-----

.D6AC:
    inc $1EBF
    ldy #$DE : ldx #$21 : jsl set_sprite
    !A16
    stz !obj_speed_x+1
    lda #$0005 : sta !obj_speed_y+1
    !A8
    jsr .D66F
    lda #$30 : sta $37
.D6C9:
    brk #$00

;----- D6CB

    jsr .D66F
    jsl update_animation_normal
    dec $37
    bne .D6C9

    jsl set_direction32 : inc : and #$1F : lsr : sta !obj_direction
    lda #$08 : jsl _0195E4
    bcc .D71F

    !X16
    stz $0000
.D6ED:
    jsl _028B1E
    lda #!id_astaroth_laser : sta.w !obj_type,X
    lda #$0C : sta.w !obj_active,X
    lda !obj_direction : sta.w !obj_direction,X
    !A16
    lda $13ED,Y : sta $002F,X
    lda $13F1,Y : sta $002D,X
    !A8
    inc $0000
    lda $0000
    sta $0007,X
    cmp #$05
    bne .D6ED

    !X8
.D71F:
    jml _0281A8_81B5

;-----

.D723:
    lda #$58 : jsl _018049_8053
    ldx !obj_direction
    lda.w astaroth_laser_data_D531,X : sta !obj_facing
    txa : asl : tax
    ldy.w astaroth_laser_data_D511+0,X : lda.w astaroth_laser_data_D511+1,X : tax : jsl set_sprite
    !A16
    stz !obj_speed_x+1
    lda #$0005 : sta !obj_speed_y+1
    !A8
    jsr .D66F
    jsl _02F9DA_F9E0
.D750:
    brk #$00

;----- D752

    jsr .D66F
    ldx #$50 : jsl update_pos_xy_2
    jsr .D684
    jsl update_animation_normal
    lda $24
    cmp #$78
    bne .D750

.D768:
    brk #$00

;----- D76A

    ldx #$50 : jsl update_pos_xy_2
    bit $09
    bvc .D776

    bra .D768

.D776:
    lda #$04 : jsl _028B52

;-----

.destroy:
    dec $1EBF
    jml _0281A8_81B5

;-----

.D783:
    ldx $07
    lda.w astaroth_laser_data_D50D-2,X : cop #$00

;----- D78A

    jsl _02F9DA_F9E0
    lda !obj_direction : clc : adc #$08 : and #$0F : sta !obj_direction
.D797:
    !AX16
    ldx $2F
    lda.w !obj_pos_x+0,X : sta !obj_pos_x+0
    lda.w !obj_pos_x+2,X : sta !obj_pos_x+2
    lda.w !obj_pos_y+1,X : sta !obj_pos_y+1
    !AX8
    lda #$04 : ldx #$3C : jsl _0189D9
    brk #$00

;----- D7B6

    bra .D797

;-----

.laser_thing:
    jml _02F9B2
}

{ ;D7BC - D831
_03D7BC:

.create:
    inc $1EBF
    ldy #$DA : ldx #$21 : jsl set_sprite
    !A16
    lda.w #nebiroth_flame_data_D541 : sta $13
    !A8
    lda #$14 : sta $37
.D7D4:
    brk #$00

;----- D7D6

    jsl update_animation_normal
    dec $37
    bne .D7D4

    jsl _02F9DA_F9E0
    lda #$59 : jsl _018049_8053
.D7E8:
    brk #$00

;----- D7EA

    jsl _01A559
    beq .D7E8

    ldx #$00
    lda !obj_direction
    dec
    beq .D7F9

    ldx #$08
.D7F9:
    stx !obj_direction
    ldy #$EA : ldx #$21 : jsl set_sprite
    lda #$06 : sta $37
.D807:
    brk #$00

;----- D809

    jsl _01A593
    beq .destroy

    dec $37
    bne .D807

;-----

.destroy:
    dec $1EBF
    jml _0281A8_81B5

;-----

.thing:
    ldx #$3C : jsl update_pos_xy_2
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$1A : jsl _02F9CE
    jml _02F9B2
}

{ ;D832 - D8C4
_03D832:

.create:
    inc $1EBF
    lda !obj_direction : sta !obj_facing
    ldy #$F2 : ldx #$21 : jsl set_sprite
    lda #$08 : sta $37
    jsr .D89C
.D848:
    brk #$00

;----- D84A

    jsl update_animation_normal
    dec $37
    bne .D848

    lda #$10 : cop #$00

;----- D856

    jsr .D89C
    jsl _02F9DA_F9E0
    ldy #$08 : ldx #$22 : jsl set_sprite
    ldy #$75 : jsl set_speed_x
    lda #$58 : jsl _018049_8053
.D871:
    brk #$00

;----- D873

    lda $25
    cmp $0F
    beq .D87F

    sta $0F
    jsl update_pos_x
.D87F:
    lda $25
    cmp #$08
    bne .D871

    ldy #$6F : jsl set_speed_x
.D88B:
    brk #$00

;----- D88D

    jsl update_pos_x
    bit $09
    bvs .D88B

    dec $1EBF
    jml _0281A8_81B5

;-----

.D89C:
    clc
    !A16
    lda !obj_pos_y+1 : adc #$000B : sta !obj_pos_y+1
    !A8
    rts

;-----

;unused, not sure what it's meant to do
    clc
    !A16
    lda !obj_pos_x+1 : adc #$0008 : sta !obj_pos_y+1
    !A8
    rts

;-----

.thing:
    jsl update_animation_normal
    clc : lda $25 : adc #$10 : sta $3C
    jml _02FD62
}

{ ;D8C5 - DA9F
_03D8C5:
    lda $07 : lsr : and #$01 : clc : adc #$0E : sta $3C
    lda $07
    and #$01
    sta !obj_facing
    asl
    tax
    lda.w conveyor_belt_data_D54D+1,X : sta !obj_speed_x+2
    !A16
    lda.w conveyor_belt_data_D54D+0,X : sta !obj_speed_x+0
    !A8
    lda $07
    and #$02
    tax
    lda.w conveyor_belt_data_D545+0,X : sta $2D
    dec #2
    sta $2F
    stz $30
    asl
    sta $31
    stz $32
    lda.w conveyor_belt_data_D545+1,X : sta $2E
    ldy.w conveyor_belt_data_D549+0,X
    lda.w conveyor_belt_data_D549+1,X
    tax
    jsl set_sprite
    jsl _02F9DA_F9E0
    lda $07
    cmp #$08
    bcs .D95C

    cmp #$04
    bcs .D922

.D918:
    brk #$00

;----- D91A

    jsr .D9CB
    jsr .DA65
    bra .D918

.D922:
    lda #$80 : sta $37
    ldy #$3F : jsl set_speed_y
.D92C:
    brk #$00

;----- D92E

    jsr .D9CB
    jsl _01884B_8876
    jsr .D9CD
    jsr .DA65
    dec $37
    beq .D944

    jsr .D9B3
    bra .D92C

.D944:
    lda #$28 : sta $37
.D948:
    brk #$00

;----- D94A

    jsr .D9CB
    jsr .DA65
    dec $37
    bne .D948

    lda !obj_direction : eor #$01 : sta !obj_direction
    bra .D92C

.D95C:
    brk #$00

;----- D95E

    jsr .D9CB
    jsr .DA65
    lda $3A
    beq .D95C

    lda #$20 : jsl _0187E5
.D96E:
    brk #$00

;----- D970

    jsr .D9CB
    jsl update_pos_xyg_add
    jsl _018911
    jsr .D9CD
    jsr .DA65
    jsr .D998
    bit $09
    bvs .D96E

    jml _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _02FD62_FD66
    jml _028156

;-----

.D998:
    lda $3A
    beq .D9CA

    !A16
    lda #$04E0
    cmp !arthur_pos_y+1
    bcs .D9B9

    sta !arthur_pos_y+1
    clc
    adc $14D8
    sta $14DA
    !A8
    rts

.D9B3:
    lda $3A
    beq .D9CA

    !A16
.D9B9:
    lda !obj_pos_y+1
    clc
    adc $27
    sta !arthur_pos_y+1
    clc
    adc $14D8
    sta $14DA
    !A8
.D9CA:
    rts

;-----

.D9CB:
    stz $3A
.D9CD:
    bit $09
    bvc .DA32

    lda $2D : sta $1F1D
    asl : sta $1F1F
    lda $2E : sta $1F21 : dec $1F21
    asl : sta $1F23
    !AX16
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    bcs .DA62

    sec
    lda !obj_pos_y+1
    sbc !arthur_pos_y+1
    clc
    adc $1F21
    cmp $1F23
    bcs .DA62

    lda !obj_pos_y+1
    cmp !arthur_pos_y+1
    bcs .DA33

    adc $1F21
    sta !arthur_pos_y+1
    lda !arthur_speed_y
    bmi .DA1D

    cmp #$0080
    bcs .DA23

.DA1D:
    lda #$0080 : sta !arthur_speed_y
.DA23:
    clc
    lda !arthur_pos_y+1 : adc $14D8 : sta $14DA
    !AX8
    stz !arthur_speed_y+2
.DA32:
    rts

.DA33:
    sbc $1F21
    cmp !arthur_pos_y+1
    beq .DA4C

    tax
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $2F
    cmp $31
    bcs .DA62

    stx !arthur_pos_y+1
.DA4C:
    lda !arthur_pos_y+1
    sec
    sbc !obj_pos_y+1
    sta $27
    clc
    lda !arthur_pos_y+1
    adc $14D8
    sta $14DA
    !AX8
    inc $3A
.DA62:
    !AX8
    rts

;-----

.DA65:
    lda $3A
    beq .DA98

    clc
    lda !obj_speed_x+0 : adc !arthur_pos_x+0 : sta !arthur_pos_x+0
    lda !obj_speed_x+1 : adc !arthur_pos_x+1 : sta !arthur_pos_x+1
    lda !obj_speed_x+2 : adc !arthur_pos_x+2 : sta !arthur_pos_x+2
    !A16
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
    clc
    adc $1F1D
    cmp $1F1F
    !A8
    bcs .DA99

    inc $14C3
.DA98:
    rts

.DA99:
    stz !arthur_speed_x+0
    stz !arthur_speed_x+1
    rts
}

{ ;DAA0 - DB5E
_03DAA0:

.create:
    lda #$02 : sta $08
    lda #$48 : jsl _018049_8053
    lda.w stage
    sec
    sbc #$06
    asl #2
    tax
    !A16
    lda.w gate2_data_D551+0,X : sta !obj_pos_x+1
    lda.w gate2_data_D551+2,X : sta !obj_pos_y+1
    phd : pla : clc : adc #$0030 : sta $13
    !A8
    txa
    asl
    tax
    lda.w gate2_data_D563+0,X : sta $02E6
    lda.w gate2_data_D563+1,X : sta $02E7
    stz $02E8
    lda.w gate2_data_D563+2,X : sta $2F
    stz $31
    stz $32
    lda.w gate2_data_D563+3,X : sta $33
    stz $34
    stz $35
    lda.w gate2_data_D563+4,X : sta $36
    lda.w gate2_data_D563+5,X : sta $37
    lda.w gate2_data_D563+6,X : sta $38
    lda #$01 : sta $39
    stz $3A
    stz $3B
    stz $3C
    lda.w gate2_data_D563+7,X : sta $09
    lda.w stage : asl : tax
    ldy.w gate2_data_D55D-$0C,X : lda.w gate2_data_D55D-$0B,X : tax : jsl set_sprite
.DB1B:
    brk #$00

;----- DB1D

if !version == 0
    jsr .DB35
endif
    dec !obj_pos_y+1
    inc $36
    dec $33
if !version == 1 || !version == 2
    jsr .DB35
endif
    lda $33
    dec
    bne .DB1B

    inc $1F9F
.DB2E:
    brk #$00

;----- DB30

    jsr .DB35
    bra .DB2E

;-----

.DB35:
    sec : lda $2F : sbc.w camera_y+1 : sec : sbc #$28 : sta $30
    !X16
    ldx $13 : stx !A1T7L
    !X8
    stz !A1B7
    lda #$01 : sta !DMAP7
    lda #$26 : sta !BBAD7
    lda $02F0 : ora #$80 : sta $02F0
    rts
}

{ ;DB5F - DD3B
_03DB5F:

.create:
    ldx #$00 : jsl _018D5B
    jsl set_hp
    stz $15
    stz $2D
    inc $08
    lda #$10 : sta $09
    lda #$20 : sta $10
    !A16
    lda.w _00ED00+$06 : sta $27
    lda #mad_dog_data_D5C3 : sta $13
    !A8
    lda #$FF : sta $26
.DB89:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl _02F9DA_F9E0
.DB95:
    brk #$00

;----- DB97

    bit $09
    bvc .DB95

    lda $07 : asl : tax
    jmp (+,X) : +: dw .DBA8, .DC85, .DC7C

.DBA8:
    jsl get_arthur_relative_side : sta !obj_direction : sta !obj_facing
.DBB0:
    ldy #$1C : ldx #$22 : jsl set_sprite
    jsl get_rng_16
    lda.w mad_dog_data_D57B,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w mad_dog_data_D58B,X
    !A16
    and #$00FF
    asl
    sta $37
    !A8
.DBD0:
    brk #$00

;----- DBD2

    jsl get_arthur_relative_side
    cmp !obj_facing
    beq .DBF6

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$2C : sta $37
.DBE6:
    brk #$00

;----- DBE8

    dec $37
    bne .DBE6

    lda !obj_facing : eor #$01 : sta !obj_direction : sta !obj_facing
    bra .DBB0

.DBF6:
    ldy #$14 : jsl _0192AD
    bcc .DC1A

    !A16
    dec $37
    !A8
    bne .DBD0

    ldy #$1E : ldx #$22 : jsl set_sprite
    lda #$77 : sta $37
.DC12:
    brk #$00

;----- DC14

    dec $37
    bne .DC12

    bra .DBB0

.DC1A:
    jsl get_rng_16
    lda.w mad_dog_data_D58F,X
    ldx $9636 ;bug: loads $FF. supposed to be difficulty...?
    clc
    adc.w mad_dog_data_D59F,X
    cop #$00

;----- DC2A

.DC2A:
    ldy #$20 : ldx #$22 : jsl set_sprite
    ldy #$0E : sty $2D
    jsl call_rng : and #$0F : cmp #$08
    bcc .DC41

    iny
.DC41:
    jsl set_speed_xyg
.DC45:
    brk #$00

;----- DC47

    jsl update_pos_xyg_add
    lda !obj_speed_y+2
    bmi .DC45

.DC4F:
    brk #$00

;----- DC51

    jsl update_pos_xyg_add
    bit $09
    bvc .DC4F

    jsl _01A559
    beq .DC4F

    stz $2D
    ldy #$24 : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- DC6D

    ldy #$1C : ldx #$22 : jsl set_sprite
    lda #$0A : cop #$00

;----- DC79

    jmp .DBB0

.DC7C:
    jsl get_rng_16
    lda.w mad_dog_data_D5B3,X : sta $2E
.DC85:
    jsl get_arthur_relative_side : sta !obj_direction : sta !obj_facing
.DC8D:
    brk #$00

;----- DC8F

    ldy #$30 : jsl _0192AD
    bcs .DC8D

    jsl get_rng_16
    lda.w mad_dog_data_D5A3,X : cop #$00

;----- DCA0

.DCA0:
    ldy #$26 : ldx #$22 : jsl set_sprite
    ldy #$63 : sty $2D
    jsl set_speed_x
.DCB0:
    brk #$00

;----- DCB2

    jsl _028074_807D
    jsl update_pos_x
    lda $07
    cmp #$02
    bne .DCCB

    ldy $2E : jsl arthur_range_check
    bcc .DCCB

    jmp .DC2A

.DCCB:
    jsl _01A593
    bne .DCB0

    ldy #$20 : ldx #$22 : jsl set_sprite
    ldy #$0F : jsl set_speed_xyg
.DCDF:
    brk #$00

;----- DCE1

    jsl update_pos_xyg_add
    lda !obj_speed_y+2
    bmi .DCDF

.DCE9:
    brk #$00

;----- DCEB

    jsl update_pos_xyg_add
    jsl _01A559
    beq .DCE9

    stz $2D
    bra .DCA0

;-----

.thing:
    jsl update_animation_normal
    ldx #$02 : jsl _018E32
    lda $2D
    bne .DD15

    jsl _02F9B6
    jsl _02F9BA
    jsl _02F9B2
    bra .DD19

.DD15:
    jsl _0296FE
.DD19:
    jml _028074_80A3

;-----

.destroy:
    lda !obj_hp
    bne .DD25

    jml _028BEC

.DD25:
    jsl _02F9DA_F9E0
    ldy #$22 : ldx #$22 : jsl set_sprite
.DD31:
    brk #$00

;----- DD33

    lda $24
    cmp #$70
    bne .DD31

    jmp .DB89
}

{ ;DD3C -
_03DD3C:
    ldx.w stage
    lda.w grilian_data_D5C7-2,X : sta $3B
    lda $07
    beq .DD5A

    brk #$00

;----- DD4A

    jsl _028053
    bcs _03DD3C

    ldx #$01 : jsl _018D5B
    !A16
    bra .DD61

.DD5A:
    !A16
    lda #$01C0 : sta $29
.DD61:
    lda.w _00ED00+$10 : sta $27
    !A8
    jsl set_hp
    lda #$01 : sta $08
    lda #$2E : sta $1D
    stz $2D
    stz $2E
    lda #$FF : sta $26
    lda #$10 : sta $09
    ldy #$B6 : ldx #$21 : jsl set_sprite
    !A16
    lda.w #grilian_data_D5CD : sta $13
    !A8
    stz $15
    jsl _02F9DA_F9E0
    jsl get_rng_bool : sta !obj_direction
.DD9D:
    ldy #$B6 : ldx #$21 : jsl set_sprite
.DDA5:
    brk #$00

;----- DDA7

    ldy #$20 : jsl _0192AD
    bcs .DDA5

    jsl get_rng_bool : sta !obj_direction
    jsl get_rng_16
    lda.w grilian_data_D5D9,X : sta $37
    ldy #$3F : jsl set_speed_x
.DDC4:
    lda #$02 : sta $2D
    ldy #$B6 : ldx #$21 : jsl set_sprite
.DDD0:
    brk #$00

;----- DDD2

    jsl update_pos_x
    lda $07
    beq .DDEC

    ldy #$08 : jsl _01A4E2_A4E8
    bcs .DDF2

    ldy #$04 : jsl _01A4E2_A4E8
    bcs .DDFA

    bra .DDF2

.DDEC:
    jsl _01A593
    bne .DDFA

.DDF2:
    lda !obj_direction : eor #$01 : sta !obj_direction
    bra .DDFE

.DDFA:
    dec $37
    bne .DDD0

.DDFE:
    lda #$04 : sta $2D
    ldy #$C4 : ldx #$21 : jsl set_sprite
.DE0A:
    brk #$00

;----- DE0C

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .DE0A

    sta $2E
    jsl set_direction32
    inc
    and #$1F
    lsr
    sta $30
    lda #$06 : sta $2D
    lda #$0A : sta $2F
    lda #!id_grilian_projectile : ldx $30 : ldy #$00 : jsl _018C55
    lda #$18 : cop #$00

;----- DE38

.DE38:
    lda #!id_grilian_projectile : ldx $30 : ldy #$02 : jsl _018C55
    lda #$0A : cop #$00

;----- DE46

    dec $2F
    bne .DE38

    stz $2E
    lda #$08 : sta $2D
    jsl get_rng_16
    lda.w grilian_data_D5E9,X
    ldx.w difficulty
    clc
    adc.w grilian_data_D5F8,X
    sta $37
.DE60:
    ldy #$B6 : ldx #$21 : jsl set_sprite
.DE68:
    brk #$00

;----- DE6A

    dec $37
    bne .DE68

    jmp .DDC4

;-----

.DE71:
    ldy #$C4 : ldx #$21 : jsl set_sprite
    lda #$01 : sta $24
    jsl update_animation_normal
    bra .DE38

.destroy:
    ldy #$AE : ldx #$21 : jsl set_sprite
    ldx $3B : jsl _018E32
    lda $0E
    beq .DEAF

.DE95:
    brk #$00

;----- DE97

    jsl update_animation_normal
    ldx $3B : jsl _018E32
    lda $24
    dec
    bne .DE95

    jsl _02F9DA_F9E0
    ldx $2D
    jmp (.DED3,X)

.DEAF:
    ldy #$1F : jsl update_score
    lda #$04 : sta $1D
    stz $07
    lda #!id_explosion_spawner : jsl prepare_object
    jsl _018E32_8E73
    lda $08 : ora #$10 : sta $08
    lda #$20 : cop #$00

;----- DECF

    jml _0281A8_81B5

;-----

.DED3: dw .DD9D, .DDC4, .DDFE, .DE71, .DE60

;-----

.thing:
    lda $2E
    bne .DEEB

    jsl get_arthur_relative_side : sta !obj_facing
    jsl update_animation_normal
.DEEB:
    ldx $3B : jsl _018E32
    jsl _02F9B6
    jsl _02F9BA
    jsl _02F9B2
    lda $07
    !A16
    beq .DF0E

    lda !obj_pos_y+1
    clc
    adc #$0020
    cmp.w camera_y+1
    bra .DF16

.DF0E:
    lda.w camera_y+1
    adc #$0100
    cmp !obj_pos_y+1
.DF16:
    !A8
    bcc .DF1B

    rtl

.DF1B:
    jml _0281DD
}

{ ;DF1F -
_03DF1F:

.create:
    brk #$00

;----- DF21

    lda $1FB1
    bne .create

    inc $1FB1
    !A16
    clc : lda.w camera_x+1 : adc #$0110 : sta !obj_pos_x+1
    lda #$FFF8 : sta $2D
    lda.w #avalanche_data_D5FC : sta $13
    !AX8
    lda #$01 : sta $1F32
    lda #$20 : sta $3C
.DF49:
    brk #$00

;----- DF4B

    !A16
    clc : lda.w camera_x+1 : adc #$0100 : sta !obj_pos_x+1
    !A8
    jsl _01939D
    bne .DF65

    dec $3C
    bne .DF49

    jmp .E01E

.DF65:
    stz $35
    ldy #$69 : jsl set_speed_x
    ldx $07
    lda.w avalanche_data_direction,X : sta !obj_direction
    stz $15
    stz $2D
    !A16
.DF7A:
    brk #$00

;----- DF7C

    lda !arthur_pos_y+1
    cmp #$0427
    bcs .DF7A

    !A8
    lda #$15 : sta $02D7 : sta $02D8
    stz $1A84
    lda #$02 : sta $1A80
.DF96:
    brk #$00

;----- DF98

    lda $1A80
    bne .DF96

    lda #$68 : jsl _018049_8053
    lda $09 : ora #$80 : sta $09
    !A16
    clc : lda !obj_pos_x+1 : adc #$0140 : sta !obj_pos_x+1
    lda #$0200 : sta $19C5
    stz $19C9
    !A8
    brk #$00

;----- DFC0

    lda #$17 : sta $02D5 : sta $02D6 : sta $02D7 : sta $02D8
.DFCE:
    brk #$00

;----- DFD0

    jsl update_pos_x
    jsr .E036
    jsl _01A593
    bne .DFCE

    lda #$2A : sta $3C
.DFE1:
    brk #$00

;----- DFE3

    jsl update_pos_x
    jsr .E036
    dec $3C
    bne .DFE1

    lda #$2A : sta $2E
.DFF2:
    brk #$00

;----- DFF4

    jsl update_pos_x
    jsr .E036
    dec $2E
    bne .DFF2

    ldy #$3B : jsl set_speed_xyg
    inc $35
    stz $14EF
.E00A:
    brk #$00

;----- E00C

    jsl update_pos_xyg_add
    lda $2D
    bne .E00A

    rep #$02 ;mistake, supposed to be rep #$20
    sta $19C5
    stz $19C9
    !A8
.E01E:
    lda #$15 : sta $02D5 : sta $02D6 : sta $02D7 : sta $02D8
    stz $1FB1
    stz $14EF
    jml _0281A8_81B5

;-----

.E036:
    !A16
    clc
    lda !obj_pos_x+1
    adc #$0100
    cmp.w camera_x+1
    !A8
    bcs .E049

    pla : pla
    bra .E01E

.E049:
    rts

;-----

.E04A:
    lda #$0200 : sta $19BD
    !AX8
    rts

.E053:
    !A16
    clc
    lda.w camera_x+1
    adc #$0080
    sec
    sbc !obj_pos_x+1
    clc
    adc #$0180
    cmp #$0300
    bcs .E04A

    sec
    lda !obj_pos_x+1
    sbc.w camera_x+1
    sta $0000
    eor #$FFFF
    inc
    clc
    adc #$0100
    and #$03FF
    sta $19C5
    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc !obj_pos_y+1
    clc
    adc #$0100
    cmp #$0200
    bcs .E04A

    sec : lda !obj_pos_y+1 : sbc.w camera_y+1 : sta $0000
    clc : lda #$0080       : sbc $0000        : sta $19C9
    !AX8
    rts

;-----

.E0A8:
    !A16
    clc
    lda.w camera_x+1
    adc #$0080
    sec
    sbc !obj_pos_x+1
    clc
    adc #$0180
    cmp #$0300
    bcs .E0D1

    clc
    lda.w camera_y+1
    adc #$0080
    sec
    sbc !obj_pos_y+1
    clc
    adc #$0100
    cmp #$0200
    !AX8
    rts

.E0D1:
    !AX8
    rts

;-----

.thing:
    jsr .E0A8
    bcc .E0E9

    !A16
    lda #$0200 : sta $19C5
    stz $19C9
    stz $2D
    !A8
    rtl

.E0E9:
    jsr .E108
    jsr .E053
    inc $2D
    lda $14D1
    bne .E107

    lda $14EF
    beq .E107

    !A16
    clc : lda !obj_pos_x+1 : adc $31 : sta !arthur_pos_x+1
    !A8
.E107:
    rtl

;-----

.E108:
    lda $14F6
    bne .E15F

    lda $14D1
    bne .E15F

    lda.w jump_counter
    ora $35
    bne .E15F

    lda $14EF
    bne .E15F

    !A16
    sec
    lda !arthur_pos_x+1
    sbc !obj_pos_x+1
    clc
    adc #$00C0
    cmp #$0180
    bcs .E15F

    sec
    lda !arthur_pos_y+1
    sbc !obj_pos_y+1
    clc
    adc #$0040
    cmp #$0080
    !A8
    bcs .E15F

    inc $14EF
    lda.b #_01DC19    : sta !arthur_state+1
    lda.b #_01DC19>>8 : sta !arthur_state+2
    stz $14B3
    stz !slot_upgrade2
    !A16
    sec : lda !arthur_pos_x+1 : sbc !obj_pos_x+1 : sta $31
    !A8
.E15F:
    rts
}

{ ;E160 -
_03E160:

.create:
    ldy #$90 : lda.b #_01FF00_5C : ldx #$1C : jsl _01A6FE
.E16A:
    brk #$00

;----- E16C

    lda $00DE
    bne .E16A

.E171:
    brk #$00

;----- E173

    lda !open_object_slots
    cmp #$06
    bcc .E171

    lda #$03 : jsl _0195B2
    jsl get_object_slot
    lda #$0C : sta.w !obj_active,X
    lda #!id_veil_allocen : sta.w !obj_type,X
    stx $1EB7
    ldy #$0000 : jsr .E1E2
    jsl get_object_slot
    lda #$0C : sta.w !obj_active,X
    lda #!id_veil_allocen_part : sta.w !obj_type,X
    stx $1EB9
    ldy #$0004 : jsr .E1E2
    jsl get_object_slot
    lda #$0C : sta.w !obj_active,X
    lda #!id_veil_allocen_claw1 : sta.w !obj_type,X
    stx $1EBB
    ldy #$0008 : jsr .E1E2
    jsl get_object_slot
    lda #$0C : sta.w !obj_active,X
    lda #!id_veil_allocen_claw2 : sta.w !obj_type,X
    stx $1EBD
    ldy #$000C : jsr .E1E2
    !AX8
    jml _0281A8_81B5

.E1E2:
    !A16
    lda.w veil_allocen_data_D608+0,Y : sta.w !obj_pos_x+1,X
    lda.w veil_allocen_data_D608+2,Y : sta.w !obj_pos_y+1,X
    !A8
    rts
}

{ ;E1F3 -
_03E1F3:

.create:
    lda #$01 : sta $08
    lda #$30 : sta $10
    lda #$C4
    sta $1D
    stz $1EC5
    stz $1EC7
    stz $1EC6
    stz $1EC8
    stz $1EC9
    sta $1ECA
    stz $2E
    !A16
.E215:
    brk #$00

;----- E217

    lda.w camera_x+1
    cmp #$0F40
    bcc .E215

    !A8
    jsl set_hp
    lda !obj_hp : sta $3C
    lda #$80 : ora $09 : sta $09
    ldy #$28 : ldx #$22 : jsl set_sprite
.E237:
    brk #$00

;----- E239

    lda $1EC7
    beq .E237

    lda #$03 : sta $31
.E242:
    lda #$20 : sta $32
    lda #$00 : sta $7EF59A : sta $7EF59C
.E250:
    brk #$00

;----- E252

    lda $7EF59A : inc : sta $7EF59A : sta $7EF59C
    inc $0331
    dec $32
    bne .E250

    dec $31
    bne .E242

    lda #$04 : cop #$00

;----- E26E

    lda #$1A : sta $7EF59A
    lda #$12 : sta $7EF59C
    inc $0331
    ldx #$18 : jsl _028000
    brk #$00

;----- E285

    inc $0F
    ldy #$40 : jsl set_speed_xyg
    lda #$10 : sta $2D
.E291:
    brk #$00

;----- E293

    jsl update_pos_xyg_add
    dec $2D
    bne .E291

    lda #$01 : sta $2E
    stz $2F
    lda #$08 : sta $30
    lda #$20 : cop #$00

;----- E2A9

    ldy #$72 : jsl set_speed_x
    lda #$01 : sta $1EC3
    stz $1EC4
    bra .E2BF

.E2B9:
    ldx #$A6 : jsl _0196EF
.E2BF:
    ldx $1EC4
    cmp $1EC3
    bne .E2CE

    inx
    cpx #$03
    bcc .E2D0

    eor #$01
.E2CE:
    ldx #$00
.E2D0:
    sta !obj_direction
    sta $1EC3
    stx $1EC4
    ldx #$A8 : jsl _0196EF : sta $2D
.E2E0:
    brk #$00

;----- E2E2

    jsl update_pos_x
    jsr .E3F9
    dec $2D
    bne .E2E0

    lda #$20 : cop #$00

;----- E2F1

    brk #$00

;----- E2F3

    jsr .E3E4
    bcc .E316

    jsl get_arthur_relative_side
    bne .E30B

.E2FE:
    !A16
    inc !obj_pos_x+1
    brk #$00

;----- E304

    jsr .E3E4
    bcs .E2FE

    bra .E316

.E30B:
    !A16
    dec !obj_pos_x+1
    brk #$00

;----- E311

    jsr .E3E4
    bcs .E30B

.E316:
    lda #$02 : sta $2E
    jsl call_rng : and #$01 : sta $1EC9
.E323:
    brk #$00

;----- E325

    lda $1EC9 : asl #2 : tax
    clc
    lda.w veil_allocen_data_D618+0,X : adc !obj_pos_y+0 : sta !obj_pos_y+0
    lda.w veil_allocen_data_D618+1,X : adc !obj_pos_y+1 : sta !obj_pos_y+1
    lda.w veil_allocen_data_D618+2,X : adc !obj_pos_y+2 : sta !obj_pos_y+2
    !A8
    lda $1EC9
    bne .E353

    !A16
    lda #$0298
    cmp !obj_pos_y+1
    bcc .E362

    bra .E35C

.E353:
    !A16
    lda #$02E0
    cmp !obj_pos_y+1
    bcs .E362

.E35C:
    sta !obj_pos_y+1
    !A8
    bra .E368

.E362:
    !A8
    dec $2D
    bne .E323

.E368:
    lda #$01 : sta $2E
    ldx #$AE : jsl _0196EF
    bne .E381

    inc $1EC5
    lda $1EC5
    cmp #$02
    bcs .E381

    jmp .E2B9

.E381:
    stz $1EC5
    ldx #$AC : jsl _0196EF
    cmp $1EC6
    beq .E394

    stz $1EC8
    bra .E3A3

.E394:
    inc $1EC8
    ldy $1EC8
    cpy #$03
    bcc .E3A3

    eor #$01
    stz $1EC8
.E3A3:
    sta $1EC6
    tax
    bne .E3C3

    inc $1EC2
    ldx #$AA : jsl _0196EF : cop #$00

;----- E3B4

    inc $1EC1
.E3B7:
    brk #$00

;----- E3B9

    lda $1EC1
    ora $1EC2
    bne .E3B7

    bra .E3DD

.E3C3:
    ldy #$2E : ldx #$22 : jsl set_sprite
    lda #!id_veil_allocen_projectile : jsl prepare_object
    lda #$14 : cop #$00

;----- E3D5

    ldy #$28 : ldx #$22 : jsl set_sprite
.E3DD:
    lda #$1F : cop #$00

;----- E3DF

    jmp .E2B9

;-----

.E3E4:
    !A16
    sec
    lda.w camera_x+1
    adc #$0080
    sec
    sbc !obj_pos_x+1
    adc #$0060
    cmp #$00C0
    !A8
    rts

;-----

.E3F9:
    !A16
    sec
    lda !obj_pos_x+1
    sta $0000
    sbc #$1020
    clc
    adc #$0090
    cmp #$0120
    bcc .E41B

    lda $0000 : sta !obj_pos_x+1
    !A8
    lda !obj_direction : eor #$01 : sta !obj_direction
    rts

.E41B:
    !A8
    rts

;-----

.thing:
    lda $0F
    bne .E42A

    lda #$0A : jsl _02F9C6
    bra .E467

.E42A:
    jsr .E488
    !A16
    lda !obj_pos_x+1 : sta $35
    lda !obj_pos_y+1
    sta $37
    sec
    sbc #$0010
    sta !obj_pos_y+1
    !A8
    jsl _02F9FA
    lda #$0B : jsl _02FBE4_FBE7
    !A16
    clc : lda !obj_pos_y+1 : adc #$0020 : sta !obj_pos_y+1
    !A8
    lda #$09 : jsl _02F9C6
    !A16
    lda $35 : sta !obj_pos_x+1
    lda $37 : sta !obj_pos_y+1
    !A8
.E467:
    jsl _02F9B2
    jsl get_arthur_relative_side : eor #$01 : sta !obj_facing
    lda !obj_hp
    cmp $3C
    beq .E487

    sta $3C
    ldx #$06 : jsl _028048
    lda #$38 : jsl _018049_8053
.E487:
    rtl

;-----

.E488:
    lda $2E
    beq .E4BE

    pha
    lda $2F
    asl #2
    tay
    ldx #$03
    pla
    dec
    beq .E49A

    ldx #$00
.E49A:
    clc
    lda !obj_pos_x+0,X : adc.w veil_allocen_data_D620+0,Y : sta !obj_pos_x+0,X
    lda !obj_pos_x+1,X : adc.w veil_allocen_data_D620+1,Y : sta !obj_pos_x+1,X
    lda !obj_pos_x+2,X : adc.w veil_allocen_data_D620+2,Y : sta !obj_pos_x+2,X
    dec $30
    bne .E4BE

    lda #$10 : sta $30
    lda $2F : eor #$01 : sta $2F
.E4BE:
    rts

;-----

.destroy:
    inc $1ED7
    ldy #$30 : ldx #$22 : jsl set_sprite
    jsl _018049_8051
    lda #$04 : sta $1D
    lda #$10 : jsl _018049_8053
    lda #!id_boss_explosion_spawner : jsl prepare_object
    lda $08 : ora #$10 : sta $08
    lda #$7E : cop #$00

;----- E4E8

    jsl _02EBC1
    jml _0281A8_81B5
}

{ ;E4F0 -
_03E4F0:

.create:
    lda #$80 : sta $09
    lda #$01 : sta $08
    ldy #$2A : ldx #$22 : jsl set_sprite
.E500:
    brk #$00

;----- E502

    ldy #$30 : jsl arthur_range_check
    bcs .E500

    lda #$0D : jsl _018049_8053
    brk #$00

;----- E512

    inc $0F
    ldy #$2C : ldx #$22 : jsl set_sprite
    lda #$3F : sta $2D
.E520:
    brk #$00

;----- E522

    jsl update_animation_normal
    dec $2D
    bne .E520

    !A16
    lda #$0140 : sta $29
    lda.w _00ED00+$6E : sta $27
    !A8
    lda #$00 : jsl _018E32_8E81
    inc $1EC7
    jml _0281A8_81B5

;-----

.thing:
    lda $0F
    bne .E54D

    jsl _02F9C2
.E54D:
    rtl
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

    jsl set_direction32 : sta !obj_direction
    inc $1EBF
    ldy #$3A : ldx #$22
    lda !obj_facing
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

    lda !obj_direction : eor #$10 : sta !obj_direction
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
    lda $02C3
    and #$0F
    bne .E5C0

    lda #$67 : jsl _018049_8053
.E5C0:
    rts

;-----

.E5C1:
    !A16
    sec
    lda !obj_pos_y+1
    sbc !arthur_pos_y+1
    bpl .E5D2

    eor #$FFFF
    inc
    sta $0000
.E5D2:
    sec
    lda !obj_pos_x+1
    sbc !arthur_pos_x+1
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
    ldx !obj_facing
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
    lda.w !obj_facing,X : sta !obj_facing
    !X8
    rts

;-----

.E62E:
    jsr .E621
    ldy #$3C : ldx #$22
    lda !obj_facing
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
    lda.w !obj_facing,X
    and #$00FF
    beq .E671

    clc
    tya
    adc #$0008
    tay
.E671:
    clc : lda.w !obj_pos_x+1,X : adc.w veil_allocen_data_D628+0,Y : sta !obj_pos_x+1
    clc : lda.w !obj_pos_y+1,X : adc.w veil_allocen_data_D628+2,Y : sta !obj_pos_y+1
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
    jsl set_direction32 : sta !obj_direction
    inc $1EC0
    ldy #$3A : ldx #$22
    lda !obj_facing
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

    lda !obj_direction : eor #$10 : sta !obj_direction
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
    ldx !obj_facing
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
    lda !obj_facing
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
    lda #$8C : sta !obj_active
.E743:
    rts
}

{ ;E744 -
_03E744:

.create:
    lda #$60 : jsl _018049_8053
    jsl _01918E_set_direction16 : sta !obj_direction
    lda #$80 : sta $09
    ldy #$32 : ldx #$22 : jsl set_sprite
    lda #$33 : sta $2D
.E760:
    brk #$00

;----- E762

    ldx #$56 : jsl update_pos_xy_2
    dec $2D
    bne .E760

    ldy #$34 : ldx #$22 : jsl set_sprite
    lda #$1C : cop #$00

;----- E778

    lda #$07 : sta $000F
.E77D:
    jsl get_object_slot
    bmi .E7A3

    lda #$0C : sta.w !obj_active,X
    lda #!id_freeze_splinter : sta.w !obj_type,X
    !A16
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !A8
    lda $000F : sta.w !obj_direction,X
    !X8
.E7A3:
    dec $000F
    bpl .E77D

    jml _0281A8_81B5

;-----

.thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$10 : jsl _02F9CE
    rtl
}

{ ;E7BB - E7FD
_03E7BB:

.create:
    lda #$80 : sta $09
    ldy #$36 : ldx #$22 : jsl set_sprite
.E7C7:
    brk #$00

;----- E7C9

    ldx #$58 : jsl update_pos_xy_2
    jsl _028074_807D
    bra .E7C7

;-----

.thing:
    jsl update_animation_normal
    jsl _02F9BE
    ldy #$12 : jsl _02F9CE
    jsl arthur_overlap_check_8bit
    bcs .E7FD

    lda #$01 : sta.w is_frozen
    lda #$04 : sta.w frozen_counter
    stz $14B3
    stz !slot_upgrade2
    jsl _0281DD
.E7FD:
    rtl
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
    lda !options,X
    cmp.w _00D638_D648,X
    bcs .E819

    dex : bpl .E80D

    rtl

.E819:
    ldx #$0F
-:
    lda.w _00D638,X : sta !options,X
    dex : bpl -

    rtl
}

{ ;E825 -
_03E825:

.create:
    lda #$03 : sta $08
    ldx $07
    jmp (+,X) : +: dw .E840, .E9B4, .E9FC, .E9F8, .EA33, .EA2D, .EA82, .EA7C, .EAB8

;-----

.E840:
    jsl set_hp
    ldx #$20 : jsl _028000
    lda #$FF : sta $19DC : sta $19DD
    lda #$D2 : sta $1D
    stz $35
    !A16
    lda #$0100 : sta !obj_pos_x+1 : sta $1EB9
    lda #$010C : sta !obj_pos_y+1 : sta $1EBB
    !A8
    stz $37
    lda #$0E : sta $38
    stz $1EBE
    jsl get_rng_bool
    sta !obj_direction
    sta $39
    stz $3A
    sta $1EBD
    ldy #$AA : ldx #$21 : jsl set_sprite
    lda #$B4 : sta $3B
    stz $36
.E890:
    brk #$00

;----- E892

    jsl .EC0E
    dec $3B
    bne .E890

    jsl _02F9DA_F9E0
    ldy #$78 : jsl set_speed_x
.E8A4:
    stz $36
    jsl get_rng_16
    lda.w samael_data_D671,X : sta $3B
.E8AF:
    brk #$00

;----- E8B1

    jsr .EBDB
    lda $37
    cmp $1EBE
    beq .E8AF

    tax
    sta $1EBE
    jsr (.E8C4,X)
    bra .E8AF

.E8C4: dw .E8D0, .E8D4, .E8D5, .E8D4, .E8DB, .E8E0

;-----

.E8D0:
    dec $3B
    beq .E903

.E8D4:
    rts

;-----

.E8D5:
    lda #$39 : jsl _018049_8053
.E8DB:
    jsl update_pos_x
    rts

;-----

.E8E0:
    lda #$39 : jsl _018049_8053
    !A16
    lda !obj_pos_x+1
    sec
    sbc #$0080
    cmp #$0100
    !A8
    bcc .E902

    lda !obj_direction : eor #$01 : sta !obj_direction : sta $1EBD
    pla : pla
    bra .E8AF

.E902:
    rts

.E903:
    pla : pla
    lda #$02 : sta $36 : sta $1EB8
    jsl get_rng_16
    lda.w samael_data_D682,X
    ldx.w difficulty
    clc
    adc.w samael_data_D692,X
    sta $3B
.E91C:
    brk #$00

;----- E91E

    dec $3B
    bne .E91C

    lda #$04 : sta $36 : sta $1EB8
    stz $3B
    lda #!id_samael_laser : ldx #$00 : ldy #$02 : jsl _018C55
    jsl get_rng_bool
    ldx #$00
    ldy #$01
    dec
    beq .E94B

    lda.w difficulty
    cmp #$02
    bcc .E94B

    ldx #$08
    ldy #$FF
.E94B:
    stx $33
    sty $34
.E94F:
    ldy #$AC : ldx #$21 : jsl set_sprite
.E957:
    ldx.w difficulty
    lda.w samael_data_D696,X : cop #$00

;----- E95F

    lda #!id_samael_laser : ldx $33 : ldy #$00 : jsl _018C55
    clc : lda $33 : adc $34 : and #$0F : sta $33
    inc $3B
    lda $3B
    cmp #$10
    bne .E957

    stz $1EB8
    lda #$06 : sta $36
    ldx.w difficulty
    lda.w samael_data_D69A,X : sta $3B
.E989:
    brk #$00

;----- E98B

    dec $3B
    bne .E989

    jsl get_rng_bool
    inc $3A
    sta !obj_direction
    sta $1EBD
    cmp $39
    bne .E9B1

    lda $3A
    cmp #$03
    bne .E9B1

    lda $39 : eor #$01 : sta !obj_direction : sta $1EBD : sta $39
    stz $3A
.E9B1:
    jmp .E8A4

;-----

.E9B4:
    lda #$D0 : sta $1D
.E9B8:
    brk #$00

;----- E9BA

    lda $1EB8
    cmp #$02
    bne .E9B8

    inc $1EB8
    jsl .EC3B

    ldy #$A0 : ldx #$21 : jsl set_sprite
    lda #!id_samael_platform : ldx #$00 : ldy #$00 : jsl _018C55
    lda #!id_samael_platform : ldx #$00 : ldy #$02 : jsl _018C55
    lda #$60 : jsl _018049_8053
.E9EA:
    brk #$00

;----- E9EC

    dec $24
    bne .E9EA

    lda #$02 : sta $08
    stz $09
    bra .E9B8

.E9F8:
    inc !obj_direction
    inc !obj_facing
.E9FC:
    ldy #$B0 : ldx #$21 : jsl set_sprite
    jsl .EC3B
.EA08:
    brk #$00

;----- EA0A

    lda $1EBE
    cmp $37
    beq .EA08

    sta $37
    lda $1EBD
    eor !obj_facing
    clc
    adc $37
    tay
    ldx.w samael_data_D6A2,Y
    !A16
    clc : lda.w samael_data_D6B4,X : adc $33 : sta !obj_speed_y+1
    !A8
    bra .EA08

.EA2D:
    lda #$02 : sta !obj_direction
    inc !obj_facing
.EA33:
    ldy #$B2 : ldx #$21 : jsl set_sprite
    jsl .EC3B
    lda !obj_facing : eor #$01 : sta $28
.EA45:
    brk #$00

;----- EA47

    lda $1EBE
    cmp $37
    beq .EA45

    sta $37
    lda $1EBD
    eor $28
    clc
    adc $37
    tay
    lda.w samael_data_D6A2,Y : asl : tax
    !A16
    lda.w samael_data_D6BA+0,X
    ldy !obj_facing
    beq .EA6B

    eor #$FFFF
    inc
.EA6B:
    clc
    adc $31
    sta !obj_speed_x+1
    clc : lda.w samael_data_D6BA+2,X : adc $33 : sta !obj_speed_y+1
    !A8
    bra .EA45

.EA7C:
    lda #$02 : sta !obj_direction
    inc !obj_facing
.EA82:
    jsl .EC3B
    ldy #$A4 : ldx #$21 : jsl set_sprite
    lda !obj_facing : eor #$01 : sta $28
.EA94:
    brk #$00

;----- EA96

    lda $1EBE
    cmp $37
    beq .EA94

    sta $37
    lda $1EBD
    eor $28
    clc
    adc $37
    tay
    ldx.w samael_data_D6A2,Y
    ldy.w samael_data_D6AE+0,X : lda.w samael_data_D6AE+1,X : tax : jsl set_sprite
    bra .EA94

.EAB8:
    lda $0292
    bmi .EAE5

    lda #$0E : jsl _0195E4
    stz $07
    !X16
.EAC7:
    jsl _028B1E
    lda #$0C : sta.w !obj_active,X
    lda #!id_samael : sta.w !obj_type,X
    lda $07
    sta $0007,X
    clc
    adc #$02
    sta $07
    cmp #$10
    bne .EAC7

    !X8
.EAE5:
    jml _0281A8_81B5

;-----

.destroy:
    ldy #$AE : ldx #$21 : jsl set_sprite
    lda !obj_hp
    beq .EB1E

    lda #$FF : sta $35
    jsl _02F9DA_F9E0
    ldx.w difficulty
    lda.w samael_data_D69E,X : sta $24
.EB05:
    brk #$00

;----- EB07

    dec $24
    bne .EB05

    jsl .EC27
    stz $35
    ldx $36
    jmp (+,X) : +: dw .E8AF, .E91C, .E94F, .E989

.EB1E:
    jsl _018049
    stz $1500
    stz $150E
    stz $151C
    stz $152A
    stz $1538
    stz $1546
    stz $1554
    stz $1562
    jsl _0190B9_90CB
    inc $1EB7
    lda !arthur_hp
    bmi .EB49

    inc $1ED7
.EB49:
    lda $08 : ora #$10 : sta $08
    lda #!id_explosion_spawner : ldx #$00 : ldy #$08 : jsl _018C55
    lda #$FF : sta $3B
.EB5D:
    jsl .EC0E
    brk #$00

;----- EB63

    ldx #$12
    lda $02C3
    and #$01
    bne .EB6E

    ldx #$13
.EB6E:
    jsr .EBA8
    dec $3B
    bne .EB5D

    ldx #$12 : jsr .EBA8
    inc $1EB7
    stz $08
    stz $09
    lda #$FF : cop #$00

;----- EB85

    lda #$19 : sta $031E
    brk #$00

;----- EB8C

    !AX16
    lda #$0010 : jsl _019136_9153
.EB95:
    brk #$00

;----- EB97

    lda.w jump_counter
    bne .EB95

    ldx.b #_01DAB8 : ldy.b #_01DAB8>>8 : jsl _01DAA4
    jml _0281A8_81B5

;-----

.EBA8:
    stx $02D5
    stx $02D6
    stx $02D7
    stx $02D8
    rts

;-----

.EBB5:
    lda $07
    cmp #$02
    bne .EBC3

    ldy #$A2 : ldx #$21 : jsl set_sprite
.EBC3:
    lda $08 : ora #$10 : sta $08
    lda $09 : and #$7F : sta $09
.EBCF:
    brk #$00

;----- EBD1

    lda $1EB7
    dec
    beq .EBCF

    jml _0281A8_81B5

;-----

.EBDB:
    dec $38
    bne .EBEF
    lda #$0E : sta $38
    lda $37
    inc #2
    cmp #$0C
    bne .EBED

    lda #$00
.EBED:
    sta $37
.EBEF:
    rts

;-----

.thing:
    lda $07
    bne .EC55

    jsl _02F9B6
    jsl _02F9BA
    lda $1EB8
    ora $35
    bne .EC0E

    lda $02C3
    and #$0F
    bne .EC0E

    jsl .EC27
.EC0E:
    !A16
    lda !obj_pos_x+1
    sta $1EB9
    sec
    sbc #$0100
    eor #$FFFF
    inc
    clc
    adc $1733
    sta $19BD
    !A8
    rtl

;-----

.EC27:
    jsl _01918E_set_direction16
    lsr
    inc
    and #$06
    tax
    ldy.w samael_data_D64D+0,X : lda.w samael_data_D64D+1,X : tax : jml set_sprite

;-----

.EC3B:
    stz $37
    jsl _02F9DA_F9E0
    lda $07 : asl : tax
    !A16
    lda.w samael_data_D655-4,X : sta !obj_speed_x+1 : sta $31
    lda.w samael_data_D655-2,X : sta !obj_speed_y+1 : sta $33
.EC55:
    lda $1EB7
    beq .EC61

    !A16
    lda.w #.EBB5 : sta !obj_state+1
.EC61:
    !A16
    lda $1EBB : adc !obj_speed_y+1 : sta !obj_pos_y+1
    !A16
    lda $1EB9 : adc !obj_speed_x+1 : sta !obj_pos_x+1
    !A8
    rtl
}

{ ;EC76 - ED7A
_03EC76:

.create:
    ldy #$B6 : ldx #$21 : jsl set_sprite
    stz $13
    lda $07 : inc : sta $27
    stz !obj_pos_y
.EC87:
    brk #$00

;----- EC89

    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .EC87

    !A16
    lda #$0018 : sta $2D
    asl        : sta $2F
    !A8
    lda #$04 : sta !obj_direction
    lda #$01 : sta $3B
.ECA7:
    brk #$00

;----- ECA9

    jsr .ED23
    ldx #$3C : jsl update_pos_xy_2
    jsr .thing
    lda $28
    dec $3B
    bne .ECA7

    ldx $13
    lda.w samael_platform_data_D6C6+0,X : sta $3B
    lda.w samael_platform_data_D6C6+1,X
    ldy $07
    beq .ECCC

    eor #$FF
    inc
.ECCC:
    clc
    adc !obj_direction
    and #$0F
    sta !obj_direction
    txa
    inc #2
    sta $13
    cmp #$20
    bne .ECA7

    ldy #$BE : ldx #$21 : jsl set_sprite
    lda #$47 : jsl _018049_8053
.ECEA:
    brk #$00

;----- ECEC

    jsr .ED23
    jsr .thing
    jsl update_animation_normal
    lda $24
    cmp #$70
    bne .ECEA

.destroy:
    stz $1EBF
    jml _0281A8_81B5

;-----

.thing:
    lda $28
    beq .ED22

    !A16
    clc : lda $31 : adc !obj_pos_x+1 : sta !arthur_pos_x+1
    clc : lda $33 : adc !obj_pos_y+1 : sta !arthur_pos_y+1
    clc :           adc $14D8        : sta $14DA
    !A8
.ED22:
    rts

;-----

.ED23:
    stz $28
    lda $1EBF
    beq .ED2E

    cmp $27
    bne .ED7A

.ED2E:
    !AX16
    lda !obj_pos_x+1
    clc
    adc $2D
    sec
    sbc !arthur_pos_x+1
    cmp $2F
    bcs .ED75

    lda !arthur_pos_y+1
    clc
    adc #$0013
    sec
    sbc !obj_pos_y+1
    cmp #$0008
    bcs .ED75

    eor #$FFFF
    inc
    adc !arthur_pos_y+1
    sta !arthur_pos_y+1
    lda !arthur_pos_x+1 : sec : sbc !obj_pos_x+1 : sta $31
    lda !arthur_pos_y+1 : sec : sbc !obj_pos_y+1 : sta $33
    !AX8
    lda #$80 : sta $14C3
    inc $28
    lda $27 : sta $1EBF
    rts

.ED75:
    !AX8
    stz $1EBF
.ED7A:
    rts
}

{ ;ED7B - EDE1
_03ED7B:

.create:
    lda $07
    bne .EDBE

    lda #$29 : jsl _018049_8053
    ldx !obj_direction
    lda.w astaroth_laser_data_D531,X : sta !obj_facing
    txa : asl : tax
    ldy.w astaroth_laser_data_D511+0,X
    lda.w astaroth_laser_data_D511+1,X
    tax
    jsl set_sprite
    jsl _02F9DA_F9E0
.ED9E:
    brk #$00

;----- EDA0

    ldx #$50 : jsl update_pos_xy_2
    jsl update_animation_normal
    lda $24
    cmp #$78
    bne .ED9E

.EDB0:
    brk #$00

;----- EDB2

    ldx #$50 : jsl update_pos_xy_2
    bit $09
    bvc .destroy

    bra .EDB0

.EDBE:
    ldy #$B4 : ldx #$21 : jsl set_sprite
    lda #$1E : sta $3B
.EDCA:
    brk #$00

;----- EDCC

    jsl update_animation_normal
    dec $3B
    bne .EDCA

.destroy:
    jml _0281A8_81B5

;-----

.thing:
    ldy #$1C : jsl _02F9CE
    jml _02F9B2
}

{ ;EDE2 - EE1C
_03EDE2: ;a8 x8
    lda $0292
    bmi .EDEB

    jml _0281A8_81B5

.EDEB:
    lda #$19 : sta $031E
    brk #$00

;----- EDF2

    !AX16
    lda #$0010 : jsl _019136_9153
    brk #$00

;----- EDFD

    ldy #$E2 : ldx #$21 : jsl set_sprite
    ldy #$00 : jsl set_speed_x
    lda #$01 : sta !obj_facing : sta !obj_direction
.EE11:
    brk #$00

;----- EE13

    jsl update_pos_x
    jsl update_animation_normal
    bra .EE11
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
    lda.w !text_offset,Y
    tay
.EE2E:
    ldx.w !text_offset2,Y
    iny #2
.EE33:
    !A8
    lda #$08 : jsl _01A717_A728
.EE3B:
    lda.w !text_offset2,Y
    cmp #$FF
    bne .EE46

if !version == 1
    plb
endif
    jml _01A717 ;FF: exit

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
    lda.w !text_offset2,Y : jsl _01A717_A728 ;frame count
    iny
    bra .EE3B

;-----

.EE71:
    ;choose text palette? unused?
    iny
    lda.w !text_offset2,Y
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
    lda.w !text_offset2,Y ;tile count
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
    inc $0323
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
    inc $0323
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
_03EF86: ;stage 3 tower tiles to put in layer 2
    dw $0020, $0040, $0060, $0080, $00A0, $00C0, $00E0, $0100
    dw $0120, $0140, $0160, $0180, $01A0, $01C0, $01E0, $0200

.EFA6:
    dw $0084, $0084, $0940, $0942, $0944, $0946, $0948, $094A
    dw $494A, $4948, $4946, $4944, $4942, $4940, $0084, $0084

    dw $0084, $0084, $094C, $094E, $0960, $0962, $0964, $0966
    dw $0968, $096A, $09EC, $09EE, $0A00, $0A02, $0084, $0084

    dw $0084, $0084, $0A04, $0A06, $0A08, $0A0A, $0A0C, $0A0E
    dw $0A20, $0A22, $0A24, $0A26, $0A28, $0A2A, $0084, $0084

    dw $0084, $0084, $0A2C, $0A2E, $0A40, $0A42, $0A44, $0A46
    dw $0A48, $0A4A, $0A4C, $0A4E, $0A60, $0A62, $0084, $0084

    dw $0084, $0084, $0A64, $0A66, $0A68, $0A6A, $0A6C, $0A6E
    dw $0840, $0842, $0844, $0846, $0848, $084A, $0084, $0084

    dw $0084, $0084, $084C, $084E, $0860, $0862, $0864, $0866
    dw $0868, $086A, $086C, $086E, $09C0, $09C2, $0084, $0084

    dw $0084, $0084, $09C4, $09C6, $09C8, $09CA, $09CC, $09CE
    dw $09E0, $09E2, $09E4, $09E6, $09E8, $09EA, $0084, $0084

    dw $0084, $0084, $8940, $8942, $8944, $8946, $8948, $894A
    dw $C94A, $C948, $C946, $C944, $C942, $C940, $0084, $0084

    dw $0084, $0084, $894C, $894E, $8960, $8962, $8964, $8966
    dw $8968, $896A, $89EC, $89EE, $8A00, $8A02, $0084, $0084

    dw $0084, $0084, $8A04, $8A06, $8A08, $8A0A, $8A0C, $8A0E
    dw $8A20, $8A22, $8A24, $8A26, $8A28, $8A2A, $0084, $0084

    dw $0084, $0084, $8A2C, $8A2E, $8A40, $8A42, $8A44, $8A46
    dw $8A48, $8A4A, $8A4C, $8A4E, $8A60, $8A62, $0084, $0084

    dw $0084, $0084, $8A64, $8A66, $8A68, $8A6A, $8A6C, $8A6E
    dw $8840, $8842, $8844, $8846, $8848, $884A, $0084, $0084

    dw $0084, $0084, $884C, $884E, $8860, $8862, $8864, $8866
    dw $8868, $886A, $886C, $886E, $89C0, $89C2, $0084, $0084

    dw $0084, $0084, $89C4, $89C6, $89C8, $89CA, $89CC, $89CE
    dw $89E0, $89E2, $89E4, $89E6, $89E8, $89EA, $0084, $0084

    dw $0084, $0084, $0886, $0888, $088E, $096C, $096C, $096C
    dw $496C, $496C, $496C, $488E, $4888, $4886, $0084, $0084

    dw $0084, $0084, $088A, $088C, $096E, $096C, $096C, $096C
    dw $496C, $496C, $496C, $496E, $488C, $488A, $0084, $0084
}

{ ;F1A6 - F525
_03F1A6: ;hp list. starts at id $20
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 4, 4, 4, 4 ;shell
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 10, 10, 10, 10 ;rosebud
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;eagler
elseif !version == 2
    db 6, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 13, 13, 13, 13 ;chest
    db 0, 0, 0, 0 ;magician
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 1, 1, 1, 1
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 1, 1, 1, 1 ;zombie
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;icicle
elseif !version == 2
    db 4, 8, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;siren
elseif !version == 2
    db 4, 6, 12, 10 ;has more hp in expert than professional!
endif
    db 1, 1, 1, 1 ;flying killer
if !version == 0 || !version == 1
    db 60, 70, 75, 80 ;hydra
elseif !version == 2
    db 60, 70, 95, 105
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 5, 5, 5, 5 ;$5D, unused obj
    db 2, 2, 2, 2 ;ghost
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;flower head
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 160, 170, 179, 184 ;cockatrice head
elseif !version == 2
    db 120, 150, 179, 184
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0 ;cockatrice body
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 10, 10, 10, 10 ;mimic
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 17, 17, 17, 17 ;hannibal
elseif !version == 2
    db 4, 6, 12, 17
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;wolf
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 139, 149, 155, 160 ;storm cesaris
elseif !version == 2
    db 110, 135, 155, 160
endif
    db 0, 0, 0, 0
    db 5, 5, 5, 5
    db 5, 5, 5, 5
    db 0, 0, 0, 0 ;bat
    db 13, 13, 13, 13 ;chest2
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 29, 35, 35, 35 ;grilian
elseif !version == 2
    db 6, 12, 18, 35
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;gargoyle statue
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 17, 17, 17, 17 ;skull flower multi
elseif !version == 2
    db 4, 6, 12, 17
endif
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 18, 29, 29, 29 ;arremer
    db 17, 17, 17, 17
elseif !version == 2
    db 12, 18, 29, 29
    db 4, 6, 12, 17
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 150, 170, 179, 185 ;death crawler
elseif !version == 2
    db 110, 150, 179, 185
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 2, 2, 2, 2
if !version == 0 || !version == 1
    db 5, 5, 5, 5 ;tiny goblin
elseif !version == 2
    db 4, 4, 4, 4
endif
    db 0, 0, 0, 0
    db 23, 23, 23, 23
    db 0, 0, 0, 0
    db 10, 10, 10, 10
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 10, 10, 10, 10
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 119, 129, 139, 149 ;astaroth
    db 180, 190, 209, 219 ;nebiroth
elseif !version == 2
    db 80, 90, 100, 110
    db 90, 100, 110, 120
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 60, 60, 60, 60 ;cockatrice head 2
elseif !version == 2
    db 30, 30, 30, 30
endif
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;mad dog
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 160, 170, 175, 180 ;veil allocen
elseif !version == 2
    db 100, 130, 150, 180
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 180, 200, 224, 255 ;samael
elseif !version == 2
    db 150, 170, 190, 210
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0

    fillbyte $00 : fill 232
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

    lda #$60 : jsl _01A717_A728
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
    lda #$01 : jsl _01A717_A728
    dec $0059
    bne .F74C

    rts

.F767:
    pla : pla : pla : pla
    jsl _0180A6
    jsl _01834C
    rtl
}

{ ;F774 - F7DA
_03F774: ;a8 x8
    lda #$02 : sta $08
    lda $09 : ora #$80 : sta $09
    ldy #$06 : ldx #$20 : jsl set_sprite
    !A16
    lda.w _00ED00+2 : sta $27
    !A8
    lda #$FF : sta $26
    lda $07
    cmp #$02
    beq .F79D

.F799:
    brk #$00

;----- F79B

    bra .F799

.F79D:
    lda #$98
    cop #$00

;----- F7A1

    ldy #$00 : ldx #$20 : jsl set_sprite
    lda #$28 : sta $2D
.F7AD:
    brk #$00

;----- F7AF

    clc
    lda !obj_pos_x   : adc #$00 : sta !obj_pos_x
    lda !obj_pos_x+1 : adc #$02 : sta !obj_pos_x+1
    lda !obj_pos_x+2 : adc #$00 : sta !obj_pos_x+2
    lda #$FE : jsl update_animation_custom_timer
    dec $2D
    bne .F7AD

    inc $1EC7
    ldy #$06 : ldx #$20 : jsl set_sprite
.F7D7:
    brk #$00

;----- F7D9

    bra .F7D7
}

{ ;F7DB - F7DF
_03F7DB: ;a8 x8
    jsl _018E32_8E79
    rtl
}

{ ;F7E0 - F7F8
_03F7E0: ;a8 x8
    ldy #$A0 : ldx #$21
    lda $07
    beq .F7EC

    ldy #$B2 : ldx #$21
.F7EC:
    jsl set_sprite
    lda #$01 : sta !obj_facing
.F7F4:
    brk #$00

;----- F7F6

    bra .F7F4

.F7F8:
    rtl ;dead code
}

{ ;F7F9 -
_03F7F9: ;a8 x8
    lda #$80 : sta $09
    ldy #$A6 : ldx #$21 : jsl set_sprite
    lda #$01 : sta !obj_facing
    jsl get_object_slot
    !X16
    lda #$0C : sta.w !obj_active,X
    lda #!id_satan_wings : sta.w !obj_type,X
    stx $2D
    !X8
    lda #$78 : sta $2F
.F821:
    brk #$00

;----- F823

    dec $2F
    bne .F821

    !A16
    lda #$0754 : sta $35
    stz $37
    !A8
.F832:
    brk #$00

;----- F834

    clc
    lda !obj_pos_x   : adc #$33 : sta !obj_pos_x
    lda !obj_pos_x+1 : adc #$03 : sta !obj_pos_x+1
    lda !obj_pos_x+2 : adc #$00 : sta !obj_pos_x+2
    sec
    lda $35 : sbc #$C0 : sta $35
    lda $36 : sbc #$00 : sta $36
    lda $37 : sbc #$00 : sta $37
    clc
    lda !obj_pos_y   : adc $35 : sta !obj_pos_y
    lda !obj_pos_y+1 : adc $36 : sta !obj_pos_y+1
    lda !obj_pos_y+2 : adc $37 : sta !obj_pos_y+2
    bit $09
    bvs .F832

.F871:
    brk #$00

;----- F873

    bra .F871
}

{ ;F875 - F88D
_03F875: ;a- x-
    !AX16
    ldx $2D
    lda !obj_pos_x+1 : sta.w !obj_pos_x+1,X
    lda !obj_pos_y+1 : sta.w !obj_pos_y+1,X
    !AX8
    rts

.F886: ;F886 | a8 x8
    jsl update_animation_normal
    jsr _03F875
    rtl
}

{ ;F88E - F8A1
_03F88E: ;a8 x8
    ldy #$AC : ldx #$21 : jsl set_sprite
    lda #$01 : sta !obj_facing
.F89A:
    brk #$00

;----- F89C

    jsl update_animation_normal
    bra .F89A
}

{ ;F8A2 - F8A2
_03F8A2: ;a- x-
    rtl
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
    inc $0323
    lda #$17 : sta $02D5 : sta $02D6
    ldx #$17
    jsl _03F526_F61C
    jsl _018360
    ldx #$18 : ldy #$78 : lda.b #_01FF00_08 : jsl _01A6FE
.FA2B:
    lda #$01 : jsl _01A717_A728
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
    lda #$01 : jsl _01A717_A728
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
    lda #$01 : jsl _01A717_A728
    lda $00C6
    bne .FB21

    lda #$01 : sta $1EB7
.FB31:
    lda #$3F : jsl _01A717_A728
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
    lda #$02 : jsl _01A717_A728
    dec $1EB7
    bne .FB49

.FB58:
    lda #$01 : jsl _01A717_A728
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

{ ;FBFA - FC3F
_03FBFA:

.create:
    ldy #$BE : ldx #$21 : jsl set_sprite
    lda $08 : ora #$03 : sta $08
    lda $09 : ora #$10 : sta $09
    !A16
    lda #$0100 : sta $2D
    !A8
.FC17:
    brk #$00

;----- FC19

    jsl update_animation_normal
    !A16
    dec $2D
    !A8
    bne .FC17
.FC25:
    !A8
    lda #$78 : cop #$00

;----- FC2B

    jsl update_animation_normal
    !A16
    lda !obj_pos_y+1
    cmp #$007A
    beq .FC25

    dec !obj_pos_y+1
    bra .FC25

    jml _0281A8_81B5 ;unreachable
}

{ ;FC40 - FC87
_03FC40:

.create:
    lda $07
    beq .FC54

    ldy #$BA : ldx #$21 : jsl set_sprite
    lda $08 : ora #$01 : sta $08
    bra .FC62

.FC54:
    ldy #$BC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$00 : sta $08
.FC62:
    brk #$00

;----- FC64

    jsl update_animation_normal
    lda $1EC5
if !version == 0
    cmp #$03
elseif !version == 1 || !version == 2
    cmp #$02
endif
    bne .FC62

.FC6F:
    brk #$00

;----- FC71

    jsl update_animation_normal
    !A16
    lda !obj_pos_x : sec : sbc #$0040 : sta !obj_pos_x
    !A8
    bra .FC6F

    jml _0281A8_81B5 ;unreachable

    rtl ;unreachable
}

if !version == 0
;dupe code section start

;todo: consider turning into bytes

{ ;FC88 - FC9E
_03FC88:
    ;partial copy of _03FBFA
    cop #$00

;----- FC8A

    jsl update_animation_normal
    !A16
    lda !obj_pos_y+1
    cmp #$007A
    beq _03FC88-4

    dec !obj_pos_y+1
    bra _03FC88-4

    jml _0281A8_81B5
}

{ ;FC9F - FCE6
_03FC9F:
    ;copy of _03FC40

.create:
    lda $07
    beq .FCB3

    ldy #$BA : ldx #$21 : jsl set_sprite
    lda $08 : ora #$01 : sta $08
    bra .FCC1

.FCB3:
    ldy #$BC : ldx #$21 : jsl set_sprite
    lda $08 : ora #$00 : sta $08

.FCC1:
    brk #$00

;----- FCC3

    jsl update_animation_normal
    lda $1EC5
    cmp #$03
    bne .FCC1

.FCCE:
    brk #$00

;----- FCD0

    jsl update_animation_normal
    !A16
    lda !obj_pos_x : sec : sbc #$0040 : sta !obj_pos_x
    !A8
    bra .FCCE

    jml _0281A8_81B5 ;unreachable

    rtl ;unreachable
}

{ ;FCE7 - FFFF
    fillbyte $FF : fill 793
}
elseif !version == 1
    incbin "us_fill_bytes/bank03a.bin"
elseif !version == 2
    incbin "eu_fill_bytes/bank03a.bin"
endif
