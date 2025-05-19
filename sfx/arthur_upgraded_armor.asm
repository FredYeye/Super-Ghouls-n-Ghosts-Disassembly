    db $0D
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
    %duration($C8)
    %volume($64)
    %octave($01)
    %instrument($06)
    %note($10, 2)
    %note($19, 2)
    %instrument($02)
    %note($1C, 2)
    %toggle_2_octaves_up()
    %note($09, 2)
    %note($06, 2)
    %instrument($13)
    %note($0D, 2)
    %note($09, 2)
    %instrument($02)
    %note($10, 2)
    %note($0B, 2)
    %instrument($13)
    %note($12, 2)
    %note($10, 2)
    %instrument($02)
    %note($15, 2)
    %note($17, 2)
    %note($19, 2)
    %end_track()

..ch1:
    %end_track()
