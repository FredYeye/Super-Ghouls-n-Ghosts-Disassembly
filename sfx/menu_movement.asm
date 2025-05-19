    db $0F
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
    %tempo($02AA)
    %duration($32)
    %release($0A)
    %volume($46)
    %octave($07)
    %lfo($01, $7F)
    %lfo($02, $7F)
    %instrument($03)
    %toggle_2_octaves_up()
    %note($19, 3)
    %volume($19)
    %note($19, 2)
    %volume($0A)
    %note($19, 2)
    %note($00, 2)
    %end_track()

..ch1:
    %end_track()
