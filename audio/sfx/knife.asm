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
    %tempo($01C7)
    %duration($FF)
    %volume($6B)
    %instrument($00)
    %octave($05)
    %note($12, 2)
    %end_track()

..ch1:
    %end_track()
