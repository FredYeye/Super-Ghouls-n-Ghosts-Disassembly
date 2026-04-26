{
random_values:

.difficulty_offset:
    dw .idx_beginner, .idx_normal, .idx_expert, .idx_professional

.idx:

..beginner:
    dw offset(.idx, .02E0_b), offset(.idx, .02F1_b), offset(.idx, .0315_b), offset(.idx, .0326_b)
    dw offset(.idx, .0337_b), offset(.idx, .0348_b), offset(.idx, .034C_b), offset(.idx, .0354_b)
    dw offset(.idx, .0358_b), offset(.idx, .035A_b), offset(.idx, .035E_b), offset(.idx, .0367_b)
    dw offset(.idx, .0378_b), offset(.idx, .0389_b), offset(.idx, .039A_b), offset(.idx, .03A3_b)
    dw offset(.idx, .03AC_b), offset(.idx, .03BD_b), offset(.idx, .03D7_b), offset(.idx, .03EA_b)
    dw offset(.idx, .03F3_b), offset(.idx, .0404_b), offset(.idx, .0437_b), offset(.idx, .0448_b)
    dw offset(.idx, .0459_b), offset(.idx, .046A_b), offset(.idx, .047B_b), offset(.idx, .04AE_b)
    dw offset(.idx, .04C1_b), offset(.idx, .04F4_b), offset(.idx, .0505_b), offset(.idx, .0516_b)
    dw offset(.idx, .0527_b), offset(.idx, .0528_b), offset(.idx, .0529_b), offset(.idx, .053A_b)
    dw offset(.idx, .054B_b), offset(.idx, .058F_b), offset(.idx, .05C2_b), offset(.idx, .0606_b)
    dw offset(.idx, .0639_b), offset(.idx, .064A_b), offset(.idx, .067D_b), offset(.idx, .0681_b)
    dw offset(.idx, .06A3_b), offset(.idx, .06B7_b), offset(.idx, .06CC_b), offset(.idx, .0710_b)
    dw offset(.idx, .0721_b), offset(.idx, .0734_b), offset(.idx, .0747_b), offset(.idx, .0748_b)
    dw offset(.idx, .0749_b), offset(.idx, .075A_b), offset(.idx, .075B_b), offset(.idx, .075C_b)
    dw offset(.idx, .075D_b), offset(.idx, .077F_b), offset(.idx, .0780_b), offset(.idx, .0781_b)
    dw offset(.idx, .0792_b), offset(.idx, .07B3_b), offset(.idx, .07C6_b), offset(.idx, .07D9_b)
    dw offset(.idx, .07EA_b), offset(.idx, .07F3_b), offset(.idx, .07F4_b), offset(.idx, .07F5_b)
    dw offset(.idx, .07F6_b), offset(.idx, .0807_b), offset(.idx, .0818_b), offset(.idx, .0821_b)
    dw offset(.idx, .0832_b), offset(.idx, .0843_b), offset(.idx, .0876_b), offset(.idx, .08BA_b)
    dw offset(.idx, .08BC_b), offset(.idx, .08BE_b), offset(.idx, .08CF_b), offset(.idx, .08E0_b)
    dw offset(.idx, .0913_b), offset(.idx, .0935_b), offset(.idx, .0957_b), offset(.idx, .0968_b)
    dw offset(.idx, .097B_b), offset(.idx, .098C_b), offset(.idx, .0993_b), offset(.idx, .099E_b)
    dw offset(.idx, .09AB_b), offset(.idx, .09EF_b), offset(.idx, .0A33_b), offset(.idx, .0A58_b)

..normal:
    dw offset(.idx, .02E0_n), offset(.idx, .02F1_n), offset(.idx, .0315_n), offset(.idx, .0326_n)
    dw offset(.idx, .0337_n), offset(.idx, .0348_n), offset(.idx, .034C_n), offset(.idx, .0354_n)
    dw offset(.idx, .0358_n), offset(.idx, .035A_n), offset(.idx, .035E_n), offset(.idx, .0367_n)
    dw offset(.idx, .0378_n), offset(.idx, .0389_n), offset(.idx, .039A_n), offset(.idx, .03A3_n)
    dw offset(.idx, .03AC_n), offset(.idx, .03BD_n), offset(.idx, .03D7_n), offset(.idx, .03EA_n)
    dw offset(.idx, .03F3_n), offset(.idx, .0404_n), offset(.idx, .0437_n), offset(.idx, .0448_n)
    dw offset(.idx, .0459_n), offset(.idx, .046A_n), offset(.idx, .047B_n), offset(.idx, .04AE_n)
    dw offset(.idx, .04C1_n), offset(.idx, .04F4_n), offset(.idx, .0505_n), offset(.idx, .0516_n)
    dw offset(.idx, .0527_n), offset(.idx, .0528_n), offset(.idx, .0529_n), offset(.idx, .053A_n)
    dw offset(.idx, .054B_n), offset(.idx, .058F_n), offset(.idx, .05C2_n), offset(.idx, .0606_n)
    dw offset(.idx, .0639_n), offset(.idx, .064A_n), offset(.idx, .067D_n), offset(.idx, .0681_n)
    dw offset(.idx, .06A3_n), offset(.idx, .06B7_n), offset(.idx, .06CC_n), offset(.idx, .0710_n)
    dw offset(.idx, .0721_n), offset(.idx, .0734_n), offset(.idx, .0747_n), offset(.idx, .0748_n)
    dw offset(.idx, .0749_n), offset(.idx, .075A_n), offset(.idx, .075B_n), offset(.idx, .075C_n)
    dw offset(.idx, .075D_n), offset(.idx, .077F_n), offset(.idx, .0780_n), offset(.idx, .0781_n)
    dw offset(.idx, .0792_n), offset(.idx, .07B3_n), offset(.idx, .07C6_n), offset(.idx, .07D9_n)
    dw offset(.idx, .07EA_n), offset(.idx, .07F3_n), offset(.idx, .07F4_n), offset(.idx, .07F5_n)
    dw offset(.idx, .07F6_n), offset(.idx, .0807_n), offset(.idx, .0818_n), offset(.idx, .0821_n)
    dw offset(.idx, .0832_n), offset(.idx, .0843_n), offset(.idx, .0876_n), offset(.idx, .08BA_n)
    dw offset(.idx, .08BC_n), offset(.idx, .08BE_n), offset(.idx, .08CF_n), offset(.idx, .08E0_n)
    dw offset(.idx, .0913_n), offset(.idx, .0935_n), offset(.idx, .0957_n), offset(.idx, .0968_n)
    dw offset(.idx, .097B_n), offset(.idx, .098C_n), offset(.idx, .0993_n), offset(.idx, .099E_n)
    dw offset(.idx, .09AB_n), offset(.idx, .09EF_n), offset(.idx, .0A33_n), offset(.idx, .0A58_n)

..expert:
    dw offset(.idx, .02E0_e), offset(.idx, .02F1_e), offset(.idx, .0315_e), offset(.idx, .0326_e)
    dw offset(.idx, .0337_e), offset(.idx, .0348_e), offset(.idx, .034C_e), offset(.idx, .0354_e)
    dw offset(.idx, .0358_e), offset(.idx, .035A_e), offset(.idx, .035E_e), offset(.idx, .0367_e)
    dw offset(.idx, .0378_e), offset(.idx, .0389_e), offset(.idx, .039A_e), offset(.idx, .03A3_e)
    dw offset(.idx, .03AC_e), offset(.idx, .03BD_e), offset(.idx, .03D7_e), offset(.idx, .03EA_e)
    dw offset(.idx, .03F3_e), offset(.idx, .0404_e), offset(.idx, .0437_e), offset(.idx, .0448_e)
    dw offset(.idx, .0459_e), offset(.idx, .046A_e), offset(.idx, .047B_e), offset(.idx, .04AE_e)
    dw offset(.idx, .04C1_e), offset(.idx, .04F4_e), offset(.idx, .0505_e), offset(.idx, .0516_e)
    dw offset(.idx, .0527_e), offset(.idx, .0528_e), offset(.idx, .0529_e), offset(.idx, .053A_e)
    dw offset(.idx, .054B_e), offset(.idx, .058F_e), offset(.idx, .05C2_e), offset(.idx, .0606_e)
    dw offset(.idx, .0639_e), offset(.idx, .064A_e), offset(.idx, .067D_e), offset(.idx, .0681_e)
    dw offset(.idx, .06A3_e), offset(.idx, .06B7_e), offset(.idx, .06CC_e), offset(.idx, .0710_e)
    dw offset(.idx, .0721_e), offset(.idx, .0734_e), offset(.idx, .0747_e), offset(.idx, .0748_e)
    dw offset(.idx, .0749_e), offset(.idx, .075A_e), offset(.idx, .075B_e), offset(.idx, .075C_e)
    dw offset(.idx, .075D_e), offset(.idx, .077F_e), offset(.idx, .0780_e), offset(.idx, .0781_e)
    dw offset(.idx, .0792_e), offset(.idx, .07B3_e), offset(.idx, .07C6_e), offset(.idx, .07D9_e)
    dw offset(.idx, .07EA_e), offset(.idx, .07F3_e), offset(.idx, .07F4_e), offset(.idx, .07F5_e)
    dw offset(.idx, .07F6_e), offset(.idx, .0807_e), offset(.idx, .0818_e), offset(.idx, .0821_e)
    dw offset(.idx, .0832_e), offset(.idx, .0843_e), offset(.idx, .0876_e), offset(.idx, .08BA_e)
    dw offset(.idx, .08BC_e), offset(.idx, .08BE_e), offset(.idx, .08CF_e), offset(.idx, .08E0_e)
    dw offset(.idx, .0913_e), offset(.idx, .0935_e), offset(.idx, .0957_e), offset(.idx, .0968_e)
    dw offset(.idx, .097B_e), offset(.idx, .098C_e), offset(.idx, .0993_e), offset(.idx, .099E_e)
    dw offset(.idx, .09AB_e), offset(.idx, .09EF_e), offset(.idx, .0A33_e), offset(.idx, .0A58_e)

..professional:
    dw offset(.idx, .02E0_p), offset(.idx, .02F1_p), offset(.idx, .0315_p), offset(.idx, .0326_p)
    dw offset(.idx, .0337_p), offset(.idx, .0348_p), offset(.idx, .034C_p), offset(.idx, .0354_p)
    dw offset(.idx, .0358_p), offset(.idx, .035A_p), offset(.idx, .035E_p), offset(.idx, .0367_p)
    dw offset(.idx, .0378_p), offset(.idx, .0389_p), offset(.idx, .039A_p), offset(.idx, .03A3_p)
    dw offset(.idx, .03AC_p), offset(.idx, .03BD_p), offset(.idx, .03D7_p), offset(.idx, .03EA_p)
    dw offset(.idx, .03F3_p), offset(.idx, .0404_p), offset(.idx, .0437_p), offset(.idx, .0448_p)
    dw offset(.idx, .0459_p), offset(.idx, .046A_p), offset(.idx, .047B_p), offset(.idx, .04AE_p)
    dw offset(.idx, .04C1_p), offset(.idx, .04F4_p), offset(.idx, .0505_p), offset(.idx, .0516_p)
    dw offset(.idx, .0527_p), offset(.idx, .0528_p), offset(.idx, .0529_p), offset(.idx, .053A_p)
    dw offset(.idx, .054B_p), offset(.idx, .058F_p), offset(.idx, .05C2_p), offset(.idx, .0606_p)
    dw offset(.idx, .0639_p), offset(.idx, .064A_p), offset(.idx, .067D_p), offset(.idx, .0681_p)
    dw offset(.idx, .06A3_p), offset(.idx, .06B7_p), offset(.idx, .06CC_p), offset(.idx, .0710_p)
    dw offset(.idx, .0721_p), offset(.idx, .0734_p), offset(.idx, .0747_p), offset(.idx, .0748_p)
    dw offset(.idx, .0749_p), offset(.idx, .075A_p), offset(.idx, .075B_p), offset(.idx, .075C_p)
    dw offset(.idx, .075D_p), offset(.idx, .077F_p), offset(.idx, .0780_p), offset(.idx, .0781_p)
    dw offset(.idx, .0792_p), offset(.idx, .07B3_p), offset(.idx, .07C6_p), offset(.idx, .07D9_p)
    dw offset(.idx, .07EA_p), offset(.idx, .07F3_p), offset(.idx, .07F4_p), offset(.idx, .07F5_p)
    dw offset(.idx, .07F6_p), offset(.idx, .0807_p), offset(.idx, .0818_p), offset(.idx, .0821_p)
    dw offset(.idx, .0832_p), offset(.idx, .0843_p), offset(.idx, .0876_p), offset(.idx, .08BA_p)
    dw offset(.idx, .08BC_p), offset(.idx, .08BE_p), offset(.idx, .08CF_p), offset(.idx, .08E0_p)
    dw offset(.idx, .0913_p), offset(.idx, .0935_p), offset(.idx, .0957_p), offset(.idx, .0968_p)
    dw offset(.idx, .097B_p), offset(.idx, .098C_p), offset(.idx, .0993_p), offset(.idx, .099E_p)
    dw offset(.idx, .09AB_p), offset(.idx, .09EF_p), offset(.idx, .0A33_p), offset(.idx, .0A58_p)

;-----

.02E0: ;00: zombie spawner, x offset index 1
..b: ..n: ..e: ..p:
    db $10,  $02, $02, $04, $04, $04, $04, $04, $04, $04, $06, $06, $06, $06, $06, $06, $06

.02F1: ;02: zombie spawner, x offset index 1
..n: ..e: ..p:
    db $11,  $00, $00, $04, $04, $04, $04, $04, $04, $04, $06, $06, $06, $06, $06, $06, $06, $06
..b:
    db $11,  $04, $04, $04, $04, $04, $04, $04, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06

.0315: ;04: zombie spawner, x offset index 1
..b: ..n: ..e: ..p:
    db $10,  $00, $02, $02, $02, $02, $02, $02, $06, $06, $06, $06, $06, $06, $06, $06, $06

.0326: ;06: zombie spawner, x offset index 1
..b: ..n: ..e: ..p:
    db $10,  $00, $02, $02, $02, $02, $02, $02, $02, $02, $04, $04, $04, $04, $04, $04, $04

.0337: ;08: zombie spawner, x offset index 1. skull flower unintentionally uses this!
..b: ..n: ..e: ..p:
    db $10,  $02, $02, $02, $02, $04, $04, $04, $04, $04, $04, $04, $04, $06, $06, $06, $06

.0348: ;0A: zombie spawner, x offset index 2
..b: ..n: ..e: ..p:
    db $03,  $0C, $0C, $0E

.034C: ;0C: zombie spawner, x offset index 2
..n: ..e: ..p:
    db $03,  $0A, $0A, $0E
..b:
    db $03,  $0C, $0C, $0E

.0354: ;0E: zombie spawner, x offset index 2
..b: ..n: ..e: ..p:
    db $03,  $0A, $0C, $0C

.0358: ;10: ?
..b: ..n: ..e: ..p:
    db $01,  $00

.035A: ;12: ?
..b: ..n: ..e: ..p:
    db $03,  $00, $00, $02

.035E: ;14: ?
..b: ..n: ..e: ..p:
    db $08,  $00, $00, $00, $02, $02, $02, $04, $04

.0367: ;16: ?
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $00, $02, $02, $02, $02, $02, $04, $04, $04, $04, $04, $06, $06, $06

.0378: ;18: ?
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $02, $02, $02, $02, $04, $04, $04, $04, $06, $06, $06, $06, $08, $08

.0389: ;1A: ?
..b: ..n: ..e: ..p:
    db $10,  $06, $06, $06, $05, $05, $05, $0B, $0B, $0B, $0A, $0A, $0A, $09, $08, $08, $07

.039A: ;1C: ?
..b: ..n: ..e: ..p:
    db $08,  $3C, $3C, $3C, $32, $32, $32, $32, $32

.03A3: ;1E: ?
..b: ..n: ..e: ..p:
    db $08,  $00, $00, $00, $00, $00, $00, $01, $01

.03AC: ;20: ?
..b: ..n: ..e: ..p:
    db $10,  $78, $78, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $F0, $F0, $F0, $F0, $F0

.03BD: ;22: ?
..b: ..n: ..e: ..p:
    db $19,  $00, $02, $04, $06, $0A, $00, $02, $04, $06, $0A, $00, $02, $04, $06, $0A, $00, $02, $04, $06, $0A, $00, $02, $04, $06, $0A

.03D7: ;24: ?
..b: ..n: ..e: ..p:
    db $12,  $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $0C, $0D, $0E, $0F, $10, $11, $12

.03EA: ;26: shell
..b: ..n: ..e: ..p:
    db $08,  $3C, $3C, $3C, $78, $78, $78, $78, $B4

.03F3: ;28: flying killer
..b: ..n: ..e: ..p:
    db $10,  $80, $80, $80, $80, $80, $80, $80, $80, $80, $A0, $A0, $A0, $A0, $A0, $C0, $C0

.0404: ;2A: cockatrice body
..b:
    db $10,  $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
..n:
    db $10,  $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
..e: ..p:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01

.0437: ;2C: hydra
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01

.0448: ;2E: hydra
..b: ..n: ..e: ..p:
    db $10,  $08, $08, $08, $08, $10, $10, $10, $18, $18, $18, $18, $20, $20, $40, $40, $40

.0459: ;30: hydra
..b: ..n: ..e: ..p:
    db $10,  $08, $08, $08, $08, $10, $10, $10, $10, $20, $20, $20, $20, $40, $40, $40, $40

.046A: ;32: hydra
..b: ..n: ..e: ..p:
    db $10,  $08, $08, $08, $08, $10, $10, $10, $10, $20, $20, $20, $20, $40, $40, $40, $40

.047B: ;34: hydra
..b: ..n:
    db $10,  $78, $78, $78, $78, $78, $B4, $B4, $B4, $B4, $B4, $B4, $FA, $FA, $FA, $FA, $FA
..e:
    db $10,  $78, $78, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $B4, $FA, $FA, $FA, $FA, $FA, $FA
..p:
    db $10,  $78, $78, $B4, $B4, $B4, $B4, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA, $FA

.04AE: ;36: hydra
..b: ..n: ..e: ..p:
    db $12,  $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $04, $04, $04, $04, $04, $04

.04C1: ;38: hydra
..b: ..n:
    db $10,  $40, $40, $40, $50, $50, $50, $50, $50, $50, $50, $60, $60, $60, $60, $60, $60
..e:
    db $10,  $40, $40, $40, $40, $40, $40, $50, $50, $50, $50, $50, $60, $60, $60, $60, $60
..p:
if !version == 0 || !version == 1
    db $10,  $20, $20, $20, $40, $40, $40, $40, $40, $50, $50, $50, $50, $50, $50, $50, $50
elseif !version == 2
    db $10,  $40, $40, $40, $40, $40, $40, $40, $40, $50, $50, $50, $50, $50, $50, $50, $50
endif

.04F4: ;3A: hydra
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01

.0505: ;3C: ?
..b: ..n: ..e: ..p:
    db $10,  $40, $40, $40, $60, $60, $60, $60, $60, $60, $60, $80, $80, $80, $80, $C0, $C0

.0516: ;3E: ?
..b: ..n: ..e: ..p:
    db $10,  $40, $40, $40, $80, $80, $80, $80, $80, $80, $C0, $C0, $C0, $C0, $C0, $C0, $00

.0527: ;40: ?
..b: ..n: ..e: ..p:
    db $00

.0528: ;42: ?
..b: ..n: ..e: ..p:
    db $00

.0529: ;44: ?
..b: ..n: ..e: ..p:
    db $10,  $FE, $FE, $FE, $FE, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $02, $02

.053A: ;46: ?
..b: ..n: ..e: ..p:
    db $10,  $20, $20, $20, $20, $40, $40, $40, $40, $60, $60, $60, $60, $80, $80, $80, $80

.054B: ;48: zombie coffin: timer until lid crumbles
..b:
    db $10,  $02, $02, $02, $02, $02, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $0C, $40, $40
..n:
    db $10,  $02, $02, $02, $02, $02, $02, $02, $02, $02, $0C, $0C, $0C, $0C, $0C, $40, $40
..e:
    db $10,  $02, $02, $02, $02, $02, $02, $02, $0C, $0C, $0C, $40, $40, $40, $40, $40, $40
..p:
    db $10,  $02, $02, $02, $02, $02, $02, $02, $02, $0C, $40, $40, $40, $40, $40, $40, $40

.058F: ;4A: cockatrice body
..b:
    db $10,  $01, $01, $03, $03, $03, $03, $03, $03, $03, $05, $05, $05, $05, $05, $05, $05
..n: ..e:
    db $10,  $01, $01, $01, $01, $03, $03, $03, $03, $03, $03, $03, $03, $05, $05, $05, $05
..p:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $03, $03, $03, $03, $03

.05C2: ;4C: cockatrice body
..b:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01
..n:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01
..e:
    db $10,  $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
..p:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01

.0606: ;4E: miniwing
..b:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01
..n:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01
..e: ..p:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01

.0639: ;50: ?
..b: ..n: ..e: ..p:
    db $10,  $20, $20, $30, $30, $30, $30, $30, $30, $40, $40, $40, $40, $40, $40, $40, $40

.064A: ;52: miniwing
..b: ..n:
    db $10,  $28, $28, $28, $28, $28, $28, $28, $28, $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C
..e:
    db $10,  $3C, $3C, $3C, $3C, $3C, $3C, $3C, $3C, $50, $50, $50, $50, $50, $50, $50, $50
..p:
    db $10,  $50, $50, $50, $50, $50, $50, $50, $50, $5A, $5A, $5A, $5A, $5A, $5A, $5A, $5A

.067D: ;54: ?
..b: ..n: ..e: ..p:
    db $03,  $01, $01, $01

.0681: ;56: cockatrice body
..b: ..n:
    db $10,  $01, $01, $01, $01, $03, $03, $03, $03, $03, $03, $06, $06, $06, $06, $06, $06
..e: ..p:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $03, $03, $03, $03, $06, $06

.06A3: ;58: zombie coffin rising flight timer (0 = no flight)
if !version == 0 || !version == 1
..b: ..n: ..e: ..p:
    db $13,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $20, $20, $40
elseif !version == 2
..b:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
..n:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
..e:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $20, $20
..p:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $20, $20, $40
endif

.06B7: ;5A: zombie coffin circling flight timer
..b: ..n: ..e: ..p:
    db $14,  $40, $40, $40, $40, $60, $60, $60, $60, $60, $60, $60, $60, $80, $80, $80, $80, $80, $80, $80, $80

.06CC: ;5C: skull flower timer before rising
..b:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $14, $14, $14, $14, $14, $3C, $3C, $3C, $3C
..n:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $0A, $0A, $0A, $0A, $0A, $1E, $1E, $1E, $1E
..e:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $0A, $0A, $0A, $0A, $0A, $1E, $1E, $1E, $1E
..p:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $14, $14, $14, $14, $14, $3C, $3C, $3C, $3C

.0710: ;5E: siren
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $08, $08, $08, $0B, $0B, $02

.0721: ;60: ?
..b: ..n: ..e: ..p:
    db $12,  $40, $40, $40, $40, $60, $60, $60, $60, $60, $60, $60, $60, $80, $80, $80, $80, $80, $80

.0734: ;62: ?
..b: ..n: ..e: ..p:
    db $12,  $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02

.0747: ;64: ?
..b: ..n: ..e: ..p:
    db $00

.0748: ;66: ?
..b: ..n: ..e: ..p:
    db $00

.0749: ;68: skull dropper related
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $00, $00, $00, $02, $02, $02, $02, $02, $02, $04, $04, $04, $04, $04

.075A: ;6A: ?
..b: ..n: ..e: ..p:
    db $00

.075B: ;6C: ?
..b: ..n: ..e: ..p:
    db $00

.075C: ;6E: ?
..b: ..n: ..e: ..p:
    db $00

.075D: ;70: flying knight spawner
..n: ..e: ..p:
    db $10,  $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $02, $02, $02, $02, $02, $02
..b:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02

.077F: ;72: ?
..b: ..n: ..e: ..p:
    db $00

.0780: ;74: ?
..b: ..n: ..e: ..p:
    db $00

.0781: ;76: bat spawn side
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01

.0792: ;78: bat y spawn
..b: ..n: ..e: ..p:
    db $20,  $40, $40, $40, $40, $40, $40, $40, $40, $70, $70, $70, $70, $70, $70, $70, $70, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $D0, $D0, $D0, $D0, $D0, $D0, $D0, $D0

.07B3: ;7A: pier splinter
..b: ..n: ..e: ..p:
    db $12,  $01, $01, $01, $01, $28, $28, $28, $28, $28, $28, $28, $28, $50, $50, $50, $50, $50, $50

.07C6: ;7C: pier splinter
..b: ..n: ..e: ..p:
    db $12,  $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02

.07D9: ;7E: flying killer
..b: ..n: ..e: ..p:
    db $10,  $60, $60, $60, $60, $80, $80, $80, $80, $80, $80, $A0, $A0, $A0, $A0, $A0, $A0

.07EA: ;80: ?
..b: ..n: ..e: ..p:
    db $08,  $60, $60, $60, $60, $80, $80, $80, $80

.07F3: ;82: ?
..b: ..n: ..e: ..p:
    db $00

.07F4: ;84: ?
..b: ..n: ..e: ..p:
    db $00

.07F5: ;86: ?
..b: ..n: ..e: ..p:
    db $00

.07F6: ;88: ghost related
..b: ..n: ..e: ..p:
    db $10,  $10, $10, $10, $10, $10, $10, $10, $20, $20, $20, $20, $20, $20, $30, $30, $30

.0807: ;8A: ?
..b: ..n: ..e: ..p:
    db $10,  $10, $10, $10, $10, $10, $10, $20, $20, $20, $20, $20, $20, $20, $40, $40, $40

.0818: ;8C: death crawler
..b: ..n: ..e: ..p:
    db $08,  $00, $00, $00, $00, $02, $02, $02, $02

.0821: ;8E: death crawler
..b: ..n: ..e: ..p:
    db $10,  $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $80, $C0, $C0, $C0, $C0, $C0

.0832: ;90: ?
..b: ..n: ..e: ..p:
    db $10,  $08, $08, $08, $08, $08, $08, $20, $20, $20, $20, $20, $20, $20, $40, $40, $40

.0843: ;92: geyser on timer
..b: ..n:
    db $10,  $40, $40, $40, $40, $40, $48, $48, $48, $48, $48, $78, $78, $78, $78, $78, $78
..e:
    db $10,  $48, $48, $48, $48, $60, $60, $60, $60, $60, $A0, $A0, $A0, $A0, $A0, $A0, $A0
..p:
    db $10,  $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $E0, $E0, $E0, $E0, $E0, $E0, $E0

.0876: ;94: geyser off timer
..b:
    db $10,  $40, $40, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $C0, $C0
..n:
    db $10,  $20, $20, $20, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $80
..e:
    db $10,  $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $40, $80, $80, $80
..p:
    db $10,  $20, $20, $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $40, $80

.08BA: ;96: ?
..b: ..n: ..e: ..p:
    db $01,  $00

.08BC: ;98: ?
..b: ..n: ..e: ..p:
    db $01,  $00

.08BE: ;9A: pre-placed coffin: offsets for x range to wake up from
..b: ..n: ..e: ..p:
    db $10,  $1C, $1C, $1C, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $20, $20, $20, $20, $20, $20

.08CF: ;9C: lava dropper
..b: ..n: ..e: ..p:
    db $10,  $03, $03, $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $06, $06, $06, $06

.08E0: ;9E: lava dropper
..b:
    db $10,  $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $80, $80, $C4, $C4, $C4, $C4
..n:
    db $10,  $40, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $80, $80, $C4
..e: ..p:
    db $10,  $30, $30, $30, $30, $30, $40, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80

.0913: ;A0: cockatrice head2
..b: ..n:
    db $10,  $20, $20, $40, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80, $80, $80, $80
..e: ..p:
    db $10,  $20, $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $80, $80, $80, $80

.0935: ;A2: cockatrice head2
..b: ..n:
    db $10,  $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02
..e: ..p:
    db $10,  $00, $00, $01, $01, $01, $01, $01, $01, $02, $02, $02, $02, $02, $02, $02, $02

.0957: ;A4: cockatrice head2
..b: ..n: ..e: ..p:
    db $10,  $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01

.0968: ;A6: veil allocen
..b: ..n: ..e: ..p:
    db $12,  $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01

.097B: ;A8: veil allocen
..b: ..n: ..e: ..p:
    db $10,  $7F, $7F, $7F, $7F, $7F, $60, $60, $60, $60, $60, $60, $40, $40, $40, $40, $40

.098C: ;AA: veil allocen
..b: ..n: ..e: ..p:
    db $06,  $20, $20, $40, $40, $40, $40

.0993: ;AC: veil allocen
..b: ..n: ..e: ..p:
    db $0A,  $00, $00, $00, $00, $01, $01, $01, $01, $01, $01

.099E: ;AE: veil allocen
..b: ..n: ..e: ..p:
    db $0C,  $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01

.09AB: ;B0: zombie coffin: timer until zombie gets out of coffin
..b:
    db $10,  $22, $22, $22, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $40, $40, $40
..n:
    db $10,  $22, $22, $22, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $40, $40, $40
..e:
    db $10,  $22, $22, $22, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $40, $40, $40
..p:
    db $10,  $22, $22, $22, $30, $30, $30, $30, $30, $30, $30, $30, $30, $30, $40, $40, $40

.09EF: ;B2: skull flower cooldown
..b:
    db $10,  $08, $08, $08, $08, $08, $08, $08, $08, $10, $10, $10, $10, $20, $20, $20, $20
..n:
    db $10,  $01, $01, $01, $01, $08, $08, $08, $08, $10, $10, $10, $10, $20, $20, $20, $20
..e:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $08, $08, $08, $10, $10, $10
..p:
    db $10,  $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $08, $08, $08

.0A33: ;B4: skull flower related, but unused due to mistake
..b:
    db $08,  $34, $34, $34, $34, $34, $34, $34, $34
..n:
    db $08,  $34, $34, $34, $34, $34, $34, $32, $32
..e:
    db $09,  $26, $26, $26, $34, $34, $34, $36, $36, $36
..p:
    db $08,  $26, $26, $26, $26, $36, $36, $36, $36

.0A58: ;B6: death crawler related
..b:
    db $0A,  $00, $00, $00, $00, $00, $00, $08, $08, $10, $10
..n: ..e: ..p:
    db $0E,  $00, $00, $00, $00, $00, $00, $08, $08, $08, $08, $10, $10, $10, $10
}
