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
    %end_track()

..ch2:
    %tempo($0266)
    %duration($FF)
    %volume($7F)
    %instrument($11)
    %octave($03)
    %note($11, 2)
    %note($1D, 1)
    %note($15, 2)
    %toggle_2_octaves_up()
    %note($09, 1)
    %toggle_2_octaves_up()
    %note($17, 2)
    %toggle_2_octaves_up()
    %note($0B, 1)
    %note($01, 2)
    %note($0D, 1)
    %note($04, 2)
    %note($10, 1)
    %note($05, 2)
    %end_track()

..ch1:
    %end_track()
