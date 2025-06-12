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
    %tempo($02AA)
    %instrument($00)
    %duration($B1)
    %octave($01)
    %volume($78)
    %note($19, 1)
    %toggle_2_octaves_up()
    %note($0D, 1)
    %instrument($04)
    %lfo($00, $1E)
    %lfo($01, $64)
    %lfo($02, $64)
    %lfo($03, $00)
    %release($11)
    %toggle_portamento()
    %note($01, 1)
    %note($03, 1)
    %note($05, 2)
    %note($08, 1)
    %note($0A, 2)
    %note($0D, 1)
    %volume($6E)
    %octave($02)
    %note($0F, 1)
    %note($11, 1)
    %volume($64)
    %note($14, 2)
    %note($16, 1)
    %volume($5A)
    %note($18, 2)
    %note($14, 1)
    %octave($01)
    %volume($50)
    %note($11, 2)
    %note($0D, 1)
    %note($08, 1)
    %note($05, 2)
    %note($01, 1)
    %toggle_2_octaves_up()
    %note($17, 2)
    %note($15, 1)
    %note($14, 1)
    %note($13, 1)
    %note($12, 1)
    %toggle_portamento()
    %note($11, 1)
    %end_track()
