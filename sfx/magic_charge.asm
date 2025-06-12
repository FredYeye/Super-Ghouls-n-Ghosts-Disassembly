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
    %instrument($0D)
    %tempo($0090)
    %lfo($01, $2D)
    %lfo($02, $64)
    %lfo($03, $01)
    %duration($FA)
    %volume($50)
    %portamento_time($30)
    %octave($02)
    %toggle_portamento()
    %note($08, 2)
    %duration($D2)
    %release($0E)
    %octave($06)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($19, 6)
    %end_track()

..ch1:
    %end_track()
