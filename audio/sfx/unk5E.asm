    db $0A
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
    %tempo($036D)
    %duration($FF)
    %octave($05)
    %instrument($00)
    %volume($50)
    %toggle_2_octaves_up()
    %note($0D, 1)
    %note($0F, 1)
    %note($11, 1)
    %note($13, 1)
    %end_track()
