    db $04
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
    %tempo($036D)
    %instrument($00)
    %octave($03)
    %duration($64)
    %release($10)
    %lfo($00, $0A)
    %lfo($01, $7F)
    %lfo($02, $7F)
    %lfo($03, $00)
    %volume($28)
    %note($1D, 3)
    %volume($46)
    %note($1D, 3)
    %end_track()
