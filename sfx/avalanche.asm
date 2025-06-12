    db $0B
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
    %volume($7F)
    %octave($02)
    %instrument($05)
    %lfo($00, $60)
    %lfo($01, $15)
    %lfo($02, $7F)
    %lfo($03, $00)
    %toggle_portamento()
    %note($0A, 1)
    %toggle_portamento()
    %note($0E, 2)
    %toggle_portamento()
    %note($0C, 2)
    %toggle_portamento()
    %note($07, 2)
    %end_track()
