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
    %tempo($02AA)
    %duration($FF)
    %volume($75)
    %instrument($00)
    %octave($01)
    %note($13, 3)
..44B3:
    %toggle_triplet_portamento_2_octave_up($40)
    %note($16, 4)
    %portamento_time($14)
    %note($17, 4)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($09, 4)
    %portamento_time($00)
    %loop(0, 3, ..44B3)
    %end_track()

..ch1:
    %end_track()
