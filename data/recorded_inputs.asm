{
recorded_inputs:
    ;buttons, count

    ;F100: demo 1
    db $00,             $01
    db !left,           $3E
    db $00,             $03
    db !right,          $35
    db !right|!down,    $01
    db !down,           $04
    db $00,             $02
    db !left,           $15

    db !left|!b,        $09
    db !left,           $0B
    db !left|!b,        $0E
    db !left,           $06
    db $00,             $03
    db !right,          $53
    db !right|!down,    $03
    db !down,           $10

    db !right|!down,    $02
    db !right,          $0F
    db !right|!down,    $03
    db !down,           $0D
    db $00,             $01
    db !left,           $0D
    db $00,             $02
    db !right,          $0A

    db !right|!down,    $02
    db !right|!down|!y, $08
    db !right|!down,    $01
    db !down,           $01
    db $00,             $0B
    db !right,          $0E
    db !right|!y,       $02
    db !y,              $05

    db $00,             $0F
    db !right,          $0E
    db !right|!y,       $06
    db !right,          $01
    db $00,             $04
    db !y,              $07
    db $00,             $07
    db !right,          $11

    db !right|!y,       $02
    db !y,              $05
    db $00,             $04
    db !y,              $07
    db $00,             $04
    db !y,              $07
    db $00,             $04
    db !y,              $07

    db $00,             $03
    db !y,              $07
    db $00,             $04
    db !y,              $08
    db $00,             $02
    db !right,          $1C
    db !right|!y,       $08
    db !right,          $0E

    db !y,              $09
    db $00,             $05
    db !y,              $08
    db $00,             $01
    db !left,           $13
    db $00,             $01
    db !right,          $06
    db !right|!y,       $09

    db !right,          $12
    db !right|!b,       $09
    db !right,          $09
    db !right|!b,       $0E
    db !right,          $36
    db $00,             $0E
    db !right,          $09
    db $00,             $0E

    db !right,          $0E
    db !right|!b,       $0A
    db !right,          $0F
    db $00,             $10
    db !right,          $08
    db $00,             $04
    db !down,           $0D
    db $00,             $01

    db !left,           $14 ;arthur dies here (default controls)
    db !up,             $01
    db !right,          $07
    db !right|!down,    $04
    db !down,           $02
    db !down|!y,        $01
    db !right|!down|!y, $06
    db !right|!down,    $09

    db !right|!down|!y, $08
    db !right|!down,    $06
    db !right|!down|!y, $07
    db !right|!down,    $04
    db !right,          $05
    db !right|!down,    $03
    db !right|!down|!y, $0E
    db !right|!down,    $01

    db !right,          $18
    db !right|!b,       $09
    db !right,          $06
    db !right|!b,       $0A
    db !right,          $3D ;last input read
    db $81, $07
    db $01, $04
    db $00, $21

    db $02, $0F
    db $00, $01
    db $01, $06
    db $41, $08
    db $01, $0A
    db $81, $08
    db $01, $06
    db $81, $0D

    db $01, $0E
    db $00, $16
    db $01, $03
    db $81, $07
    db $01, $05
    db $00, $28
    db $02, $2F
    db $01, $3D

    db $00, $4E

    fillbyte $00 : fill 14

;-----

    ;F200: demo 2
if !version == 0 || !version == 1
    db $00, $5A
    db $01, $48
    db $81, $18
    db $01, $3A
    db $81, $09
    db $01, $31
    db $81, $0C
    db $01, $FF

    db $01, $41
    db $00, $0C
    db $80, $08
    db $00, $08
    db $80, $09
    db $00, $2C
    db $01, $52
    db $81, $0A

    db $01, $03
    db $00, $3B
    db $02, $19
    db $00, $02
    db $01, $01
    db $05, $04
    db $04, $16
    db $44, $07

    db $04, $07
    db $44, $09
    db $04, $16
    db $44, $0C
    db $04, $07
    db $00, $01
    db $01, $A6
    db $81, $0C

    db $01, $32
    db $81, $0D
    db $01, $5C
    db $00, $0E
    db $80, $0B
    db $00, $0C
    db $80, $21
    db $00, $05

    db $02, $47
    db $82, $08
    db $02, $04
    db $00, $26
    db $02, $19
    db $00, $03
    db $01, $0B
    db $09, $02

    db $08, $75
    db $0A, $11
    db $8A, $08
    db $0A, $02
    db $08, $03
    db $01, $22
    db $00, $01
    db $41, $03

    db $40, $09
    db $00, $11
    db $04, $10
    db $44, $08
    db $04, $1C
    db $44, $0B
    db $04, $03
    db $00, $38

    db $01, $7C
    db $00, $03
    db $10, $01
    db $00, $55

    fillbyte $00 : fill 120
elseif !version == 2
    db $00, $A7
    db $01, $38
    db $81, $13
    db $01, $45
    db $81, $0D
    db $01, $2F
    db $00, $11
    db $02, $06

    db $42, $09
    db $02, $04
    db $42, $07
    db $02, $05
    db $42, $07
    db $02, $05
    db $42, $08
    db $02, $10

    db $00, $1D
    db $02, $09
    db $82, $18
    db $02, $09
    db $00, $0F
    db $01, $4C
    db $81, $07
    db $01, $1E

    db $81, $0C
    db $01, $05
    db $00, $01
    db $02, $1D
    db $00, $06
    db $40, $08
    db $00, $2D
    db $01, $07

    db $81, $0E
    db $01, $D6
    db $81, $13
    db $01, $65
    db $05, $09
    db $45, $07
    db $05, $07
    db $45, $06

    db $05, $05
    db $45, $06
    db $05, $05
    db $45, $07
    db $05, $11
    db $01, $38
    db $00, $3D
    db $01, $56

    db $81, $06
    db $08, $01
    db $02, $06
    db $42, $0B
    db $02, $1E
    db $00, $24
    db $02, $04
    db $82, $08

    db $02, $06
    db $82, $06
    db $02, $14
    db $00, $02
    db $01, $1D
    db $41, $06
    db $01, $09
    db $00, $0B

    db $02, $10
    db $00, $37
    db $01, $2A
    db $00, $2D
    db $01, $47
    db $00, $01
    db $02, $13
    db $82, $07

    db $02, $04
    db $82, $08
    db $02, $32
    db $00, $0F
    db $01, $54
    db $00, $02
    db $02, $05
    db $42, $07

    db $02, $01
    db $00, $05
    db $02, $3F
    db $00, $14
    db $02, $10
    db $08, $09
    db $0A, $03
    db $02, $09

    db $08, $67
    db $00, $5B

    fillbyte $00 : fill 76
endif

;-----

    ;F300
    db $00, $66
    db $01, $2A
    db $81, $0A
    db $01, $0A
    db $81, $1C
    db $01, $11
    db $00, $29
    db $01, $0E

    db $81, $0B
    db $01, $27
    db $81, $10
    db $01, $47
    db $00, $01
    db $04, $01
    db $00, $01
    db $02, $06

    db $00, $05
    db $40, $09
    db $00, $0F
    db $40, $08
    db $00, $05
    db $40, $06
    db $00, $05
    db $40, $09

    db $00, $08
    db $04, $0D
    db $44, $08
    db $04, $11
    db $00, $0A
    db $80, $09
    db $00, $0B
    db $80, $21

    db $00, $1D
    db $01, $28
    db $81, $0F
    db $01, $06
    db $81, $2A
    db $01, $14
    db $81, $0E
    db $01, $27

    db $00, $06
    db $04, $08
    db $00, $03
    db $02, $12
    db $00, $02
    db $01, $03
    db $05, $06
    db $04, $1C

    db $44, $08
    db $04, $07
    db $44, $08
    db $04, $1E
    db $05, $02
    db $01, $34
    db $00, $4E
    db $80, $06

    db $01, $0E
    db $81, $08
    db $01, $04
    db $00, $38
    db $01, $03
    db $81, $07
    db $01, $33
    db $41, $0A

    db $40, $01
    db $00, $0F
    db $80, $0A
    db $00, $09
    db $40, $10
    db $00, $10
    db $01, $3B
    db $00, $04

    db $01, $25
    db $00, $07
    db $01, $37
    db $00, $11
    db $01, $19
    db $00, $1C
    db $01, $33
    db $81, $0F

    db $01, $0F
    db $41, $0F
    db $01, $0F
    db $00, $04
    db $80, $0A
    db $00, $09
    db $40, $0E
    db $00, $1E

    db $02, $04
    db $00, $28
    db $04, $8C
    db $44, $09
    db $04, $1F
    db $00, $01
    db $02, $9B
    db $08, $01

    db $00, $01
    db $01, $6F
    db $41, $0B
    db $01, $19
    db $81, $0C
    db $01, $10
    db $81, $2D
    db $01, $12

    db $81, $0B
    db $01, $03
    db $00, $1C
    db $02, $34
    db $06, $07
    db $02, $17
    db $00, $02
    db $01, $03

    db $05, $05
    db $04, $08
    db $44, $06
    db $04, $20
    db $00, $01
    db $01, $36
    db $81, $08
    db $01, $08

    db $81, $0E
    db $01, $08
    db $00, $4C
    db $01, $01
    db $81, $09
    db $C1, $04
    db $41, $05
    db $01, $01

;-----

    ;F400 ending slide, zombie
    db $00, $71
    db $01, $0F
    db $41, $04
    db $40, $05
    db $00, $06
    db $02, $0C
    db $00, $01
    db $01, $06

    db $41, $08
    db $40, $02
    db $00, $07
    db $01, $1A
    db $81, $0D
    db $01, $12
    db $81, $16
    db $01, $0C
    db $00, $17

    db $04, $04
    db $44, $09
    db $04, $09
    db $40, $0B
    db $00, $10
    db $04, $0B
    db $00, $10
    db $40, $0C
    db $00, $2F

    fillbyte $00 : fill 204

;-----

    ;F500 ending slide, ghost
    db $00, $5B
    db $01, $21
    db $81, $0B
    db $01, $07
    db $81, $0F
    db $01, $0D
    db $00, $0F
    db $01, $16
    db $81, $08

    db $01, $03
    db $81, $08
    db $01, $0B
    db $00, $04
    db $02, $01
    db $42, $0A
    db $02, $12
    db $00, $05
    db $01, $07

    db $81, $08
    db $01, $05
    db $81, $09
    db $01, $05
    db $00, $24
    db $01, $18
    db $00, $03
    db $02, $0F
    db $00, $03

    db $01, $02
    db $81, $0E
    db $01, $06
    db $00, $02
    db $02, $38
    db $00, $06
    db $01, $06
    db $00, $02
    db $02, $14

    db $00, $03
    db $01, $03
    db $81, $05
    db $80, $02
    db $02, $0F
    db $42, $05
    db $02, $24
    db $82, $0A
    db $02, $03

    db $82, $09
    db $02, $01
    db $00, $1A
    db $01, $15
    db $81, $0A
    db $01, $06
    db $81, $13
    db $01, $23

    fillbyte $00 : fill 150

;-----

    ;F600 ending slide, mimic
    db $00, $49
    db $02, $5F
    db $06, $01
    db $04, $0C
    db $44, $07
    db $04, $01
    db $44, $05
    db $04, $06

    db $44, $03
    db $04, $10
    db $44, $04
    db $04, $13
    db $00, $0E
    db $80, $0B
    db $00, $16
    db $04, $1A

    db $44, $04
    db $04, $06
    db $44, $04
    db $04, $0A
    db $00, $13
    db $80, $0F
    db $00, $70

    fillbyte $00 : fill 210

;-----

    ;F700 ending slide, woo
    db $00, $30
    db $01, $C2
    db $81, $0D
    db $01, $16
    db $81, $09
    db $01, $6A
    db $00, $04
    db $08, $02

    db $88, $0C
    db $08, $10
    db $88, $09
    db $08, $03
    db $00, $31

    fillbyte $00 : fill 230

;-----

    ;F800 ending slide, cockatrice and miniwing
    db $00, $63
    db $01, $87
    db $81, $0E
    db $01, $58
    db $00, $02
    db $02, $0B
    db $82, $0C
    db $02, $11

    db $00, $02
    db $01, $12
    db $41, $05
    db $40, $05
    db $00, $0A
    db $40, $08
    db $00, $06
    db $40, $07

    db $00, $0B
    db $40, $06
    db $00, $06
    db $40, $08
    db $00, $07
    db $40, $06
    db $00, $06
    db $40, $08

    db $00, $12
    db $02, $02
    db $82, $0A
    db $02, $0C
    db $00, $03
    db $01, $0D
    db $41, $07
    db $40, $02

    db $00, $08
    db $40, $07
    db $00, $08
    db $40, $07
    db $00, $0D
    db $C0, $06
    db $40, $02
    db $00, $1C

    db $40, $09
    db $00, $04
    db $02, $38
    db $00, $01
    db $01, $07
    db $00, $01
    db $40, $07
    db $00, $0A

    db $40, $08
    db $00, $08
    db $40, $08
    db $00, $0C
    db $01, $08
    db $81, $0A
    db $01, $01
    db $00, $08

    db $40, $08
    db $00, $19
    db $80, $01
    db $C0, $05
    db $40, $01
    db $00, $0B
    db $40, $0B
    db $00, $14

    db $01, $1A
    db $00, $16
    db $02, $4A
    db $00, $03
    db $01, $12
    db $81, $0A
    db $01, $11
    db $81, $18

    db $01, $48
    db $00, $10
    db $01, $05

    fillbyte $00 : fill 106

;-----

    ;F900 ending slide, hydra
    db $00, $3E
    db $01, $76
    db $00, $02
    db $40, $03
    db $00, $02
    db $40, $04
    db $00, $0D
    db $01, $02

    db $41, $03
    db $40, $01
    db $00, $03
    db $40, $04
    db $00, $0E
    db $80, $04
    db $00, $03
    db $40, $04

    db $00, $02
    db $40, $06
    db $00, $14
    db $40, $06
    db $00, $03
    db $02, $15
    db $82, $04
    db $80, $01

    db $01, $02
    db $00, $09
    db $01, $15
    db $41, $05
    db $01, $0B
    db $81, $04
    db $01, $05
    db $81, $08

    db $01, $01
    db $00, $0C
    db $40, $04
    db $00, $1A

    fillbyte $00 : fill 184

;-----

    ;FA00 ending slide, astaroth
    db $00, $3D
    db $01, $63
    db $81, $0D
    db $01, $0E
    db $41, $0B
    db $01, $2E
    db $00, $09
    db $02, $02

    db $82, $0B
    db $02, $02
    db $00, $03
    db $01, $05
    db $41, $0A
    db $01, $08
    db $41, $09
    db $01, $1F

    db $41, $09
    db $01, $01
    db $05, $01
    db $04, $04
    db $44, $08
    db $04, $05
    db $44, $07
    db $04, $06

    db $44, $02
    db $04, $05
    db $00, $06
    db $02, $06
    db $82, $0A
    db $02, $07
    db $00, $01
    db $01, $05

    db $41, $0A
    db $01, $1A
    db $41, $06
    db $45, $01
    db $05, $02
    db $04, $03
    db $05, $03
    db $45, $03

    db $05, $03
    db $04, $0F
    db $44, $03
    db $45, $02
    db $05, $04
    db $04, $01
    db $05, $03
    db $01, $32

    db $81, $15
    db $01, $11
    db $11, $0B
    db $10, $02
    db $00, $93

    fillbyte $00 : fill 150

;-----

    ;FB00 ending slide, nebiroth
    db $00, $32
    db $01, $1B
    db $00, $0F
    db $02, $0B
    db $00, $03
    db $01, $06
    db $81, $0C
    db $01, $07

    db $41, $07
    db $01, $04
    db $41, $07
    db $01, $1A
    db $81, $07
    db $01, $04
    db $41, $06
    db $01, $05

    db $41, $05
    db $01, $03
    db $41, $08
    db $01, $2D
    db $81, $06
    db $01, $20
    db $81, $05
    db $01, $07

    db $41, $05
    db $01, $05
    db $41, $05
    db $01, $04
    db $41, $07
    db $01, $18
    db $81, $05
    db $01, $03

    db $00, $1F
    db $02, $22
    db $08, $01
    db $01, $07
    db $00, $01
    db $40, $07
    db $00, $08
    db $02, $0D

    db $82, $07
    db $80, $01
    db $00, $02
    db $01, $03
    db $41, $06
    db $40, $01
    db $00, $04
    db $40, $05

    db $00, $05
    db $40, $07
    db $00, $11
    db $80, $07
    db $00, $08
    db $40, $07
    db $00, $05
    db $40, $06

    db $00, $04
    db $40, $07
    db $00, $0D
    db $02, $05
    db $82, $06
    db $80, $03
    db $01, $08
    db $41, $07

    db $01, $06
    db $41, $05
    db $01, $25
    db $81, $07
    db $01, $0B
    db $00, $2E
    db $02, $29
    db $00, $06

    db $02, $11
    db $04, $11
    db $06, $05
    db $02, $1A
    db $00, $01
    db $01, $0C
    db $00, $19
    db $01, $10

    db $81, $03
    db $01, $02
    db $00, $0B
    db $04, $04
    db $05, $19
    db $04, $01
    db $05, $19
    db $45, $05

    db $05, $3F

    fillbyte $00 : fill 78

;-----

    ;FC00 ending slide, samael
    db $00, $35
    db $01, $1B
    db $81, $0B
    db $01, $0A
    db $81, $0A
    db $01, $04
    db $41, $05
    db $01, $05

    db $41, $07
    db $01, $15
    db $81, $07
    db $01, $03
    db $41, $05
    db $01, $06
    db $41, $04
    db $01, $04

    db $41, $07
    db $01, $1A
    db $00, $03
    db $02, $10
    db $82, $05
    db $80, $04
    db $00, $01
    db $01, $04

    db $41, $06
    db $01, $05
    db $41, $06
    db $01, $04
    db $41, $09
    db $01, $3F
    db $00, $06
    db $02, $08

    db $42, $09
    db $02, $07
    db $00, $0A
    db $02, $08
    db $00, $58
    db $02, $15
    db $00, $09
    db $01, $0E

    db $00, $09
    db $88, $06
    db $08, $13
    db $88, $27

    fillbyte $00 : fill 168

;-----

    ;FD00 ending slide, red arremer ace
    db $00, $57
    db $01, $1E
    db $81, $0A
    db $01, $2C
    db $81, $09
    db $01, $79
    db $81, $07
    db $01, $15

    db $81, $0A
    db $01, $09
    db $41, $07
    db $01, $05
    db $41, $09
    db $01, $17
    db $00, $05
    db $02, $0B

    db $82, $0C
    db $02, $13
    db $82, $0E
    db $02, $0B
    db $00, $04
    db $01, $0A
    db $00, $01
    db $02, $10

    db $82, $07
    db $02, $05
    db $82, $02
    db $8A, $01
    db $88, $02
    db $81, $02
    db $01, $02
    db $05, $05

    db $04, $07
    db $44, $04
    db $46, $01
    db $06, $01
    db $02, $0C
    db $42, $09
    db $02, $06
    db $00, $01

    db $01, $40
    db $00, $02
    db $02, $3B
    db $82, $0A
    db $02, $03
    db $00, $01
    db $01, $0B
    db $41, $07

    db $01, $40
    db $05, $02
    db $45, $09
    db $05, $0B
    db $01, $23
    db $00, $03
    db $02, $07
    db $82, $09

    db $02, $07
    db $82, $04
    db $80, $01
    db $81, $05
    db $01, $0B
    db $41, $0A
    db $01, $2B
    db $81, $0B

    db $01, $54
    db $00, $02
    db $02, $3F
    db $00, $03
    db $01, $35
    db $05, $05

    fillbyte $00 : fill 116

;-----

    ;FE00 ending slide, princess prin prin
    db $00, $EC

    fillbyte $00 : fill 254

;-----

    ;FF00 ending slide, knight arthur
    db $00, $D5
    db $04, $11
    db $44, $09
    db $04, $05
    db $44, $08
    db $04, $06
    db $44, $06
    db $04, $05

    db $44, $06
    db $40, $01
    db $00, $02
    db $40, $09
    db $00, $05
    db $40, $07
    db $00, $05
    db $40, $08

    db $00, $07
    db $40, $08
    db $00, $0B
    db $40, $0A
    db $00, $03
    db $02, $0A
    db $82, $08
    db $80, $02

    db $00, $01
    db $41, $08
    db $01, $29
    db $41, $0A
    db $01, $24
    db $41, $0B
    db $01, $22
    db $41, $05

    db $40, $04
    db $00, $05
    db $40, $08
    db $00, $05
    db $40, $09
    db $00, $05
    db $01, $11
    db $41, $01

    db $40, $07
    db $00, $0A
    db $40, $08
    db $00, $1D
    db $40, $07
    db $00, $08
    db $40, $0A
    db $00, $05

    db $01, $09
    db $81, $08
    db $01, $0E
    db $81, $15
    db $01, $1F
    db $81, $09
    db $01, $38
    db $00, $02

    db $02, $03
    db $42, $06
    db $40, $02
    db $00, $01
    db $01, $24
    db $81, $06
    db $01, $07
    db $81, $0B

    db $01, $43
    db $81, $07
    db $01, $06
    db $81, $12
    db $01, $05
    db $00, $19
    db $01, $09
    db $00, $1A

    db $40, $DB
    db $00, $31

    fillbyte $00 : fill 108
}
