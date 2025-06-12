    db $09
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
    %duration($FF)
    %volume($7D)
    %instrument($03)
    %octave($01)
    %lfo($00, $5A)
    %lfo($01, $46)
    %lfo($02, $7F)
    %lfo($03, $00)
    %toggle_portamento()
    %note($0E, 2)
    %portamento_time($7F)
    %note($13, 2)
    %note($15, 2)
    %note($16, 2)
    %note($18, 2)
    %note($19, 2)
    %note($1A, 2)
    %note($1B, 2)
    %note($1C, 2)
    %note($1D, 2)
    %duration($64)
    %release($10)
    %toggle_portamento()
    %note($1E, 5)
    %end_track()
