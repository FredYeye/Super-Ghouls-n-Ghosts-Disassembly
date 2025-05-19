    db $05
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
    %tempo($0200)
    %duration($FF)
    %volume($3C)
    %instrument($00)
    %octave($01)
    %note($18, 2)
    %note($1C, 2)
    %toggle_2_octaves_up()
    %note($08, 2)
    %volume($75)
    %toggle_portamento()
    %note($0C, 5)
    %portamento_time($1E)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($18, 4)
    %volume($50)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0C, 5)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($13, 5)
    %end_track()

..ch1:
    %end_track()
