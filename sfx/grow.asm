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
    %end_track()

..ch1:
    %tempo($014C)
    %instrument($02)
    %octave($00)
    %duration($FF)
    %lfo($00, $66)
    %lfo($02, $7F)
    %volume($46)
    %note($19, 2)
    %note($1B, 2)
    %note($1D, 2)
    %note($1E, 2)
    %toggle_2_octaves_up()
    %note($08, 2)
    %volume($50)
    %note($09, 2)
    %note($0B, 2)
    %volume($55)
    %note($0D, 2)
    %note($0F, 2)
    %note($11, 2)
    %note($13, 2)
    %note($14, 2)
    %note($15, 2)
    %note($17, 2)
    %note($19, 2)
    %end_track()
