    db $08
    dw be(..ch8), be(..ch7), be(..ch6), be(..ch5), be(..ch4), be(..ch3), be(..ch2), be(..ch1)

..ch8:
    %end_track()

..ch7:
    %end_track()

..ch6:
    %end_track()

..ch5:
    %end_track()

..ch4:
    %end_track()

..ch3:
    %end_track()

..ch2:
    %end_track()

..ch1:
    %tempo($0266)
    %instrument($09)
    %octave($01)
    %duration($64)
    %release($10)
    %lfo($00, $04)
    %lfo($01, $28)
    %lfo($02, $24)
    %lfo($03, $00)
    %volume($0A)
    %toggle_portamento()
    %note($1A, 3)
    %volume($14)
    %note($1A, 3)
    %volume($1E)
    %note($1A, 3)
    %volume($2E)
    %note($1A, 3)
    %volume($3C)
    %note($1A, 7)
    %toggle_portamento()
    %note($1A, 7)
    %end_track()
