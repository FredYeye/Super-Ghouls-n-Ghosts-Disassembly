    db $03
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
    %duration($FF)
    %instrument($01)
    %octave($01)
    %lfo($00, $5A)
    %lfo($02, $64)
..45B5:
    %toggle_triplet_portamento_2_octave_up($40)
    %volume($75)
    %note($19, 3)
    %volume($28)
    %note($1A, 2)
    %volume($75)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($09, 3)
    %loop(0, 4, ..45B5)
    %end_track()

..ch1:
    %end_track()
