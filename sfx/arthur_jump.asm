    db $06
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
    %tempo($0300)
    %duration($DC)
    %release($1E)
    %instrument($14)
    %octave($07)
    %lfo($00, $7F)
    %lfo($02, $7F)
    %lfo($03, $00)
    %portamento_time($7F)
    %volume($5F)
    %toggle_portamento()
    %note($17, 1)
    %volume($73)
    %note($17, 1)
    %volume($7F)
    %note($17, 1)
    %toggle_portamento()
    %note($0E, 1)
    %end_track()

..ch1:
    %end_track()
