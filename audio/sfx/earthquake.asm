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
    %tempo($0266)
    %duration($FF)
    %volume($75)
    %octave($02)
    %instrument($00)
    %lfo($01, $64)
    %lfo($02, $64)
    %lfo($03, $00)
..4858:
    %toggle_triplet_portamento_2_octave_up($40)
    %note($0A, 1)
    %note($0E, 2)
    %note($0C, 2)
    %note($07, 2)
    %loop(0, 9, ..4858)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
