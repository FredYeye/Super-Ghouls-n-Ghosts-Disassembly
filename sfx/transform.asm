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
    %tempo($01A7)
    %instrument($0A)
    %duration($96)
    %release($1C)
    %octave($04)
    %volume($3B)
    %toggle_2_octaves_up()
    %note($11, 3)
    %note($12, 3)
    %note($00, 3)
    %note($0C, 3)
    %note($0D, 3)
    %note($00, 3)
    %note($04, 3)
    %note($05, 3)
    %end_track()

..ch1:
    %end_track()
