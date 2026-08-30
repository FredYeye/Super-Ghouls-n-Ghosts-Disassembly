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
    %tempo($036D)
    %duration($FF)
    %volume($75)
    %instrument($01)
    %octave($04)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($08, 3)
    %portamento_time($5A)
    %note($06, 3)
    %note($09, 3)
    %note($07, 3)
    %note($08, 3)
    %note($0B, 3)
    %note($09, 3)
    %toggle_portamento()
    %note($13, 3)
    %end_track()

..ch1:
    %end_track()
