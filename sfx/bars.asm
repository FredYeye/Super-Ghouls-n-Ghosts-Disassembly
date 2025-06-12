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
    %tempo($0199)
    %duration($FF)
    %instrument($01)
    %octave($02)
    %volume($5A)
    %toggle_portamento()
    %note($07, 1)
    %portamento_time($0A)
    %volume($6E)
    %note($08, 1)
    %volume($5A)
    %toggle_portamento()
    %note($09, 1)
    %portamento_time($00)
    %instrument($02)
    %volume($50)
    %toggle_2_octaves_up()
    %note($11, 1)
    %note($0F, 1)
    %end_track()
