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
    %end_track()

..ch1:
    %tempo($0333)
    %duration($DC)
    %instrument($02)
    %octave($01)
    %volume($6E)
    %release($1F)
    %note($1C, 2)
    %note($1A, 3)
    %instrument($00)
    %note($15, 2)
    %note($0D, 4)
    %end_track()
