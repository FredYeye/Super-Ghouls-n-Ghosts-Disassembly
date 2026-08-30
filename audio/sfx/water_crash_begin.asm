    db $0B
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
    %tempo($0199)
    %duration($FF)
    %volume($1E)
    %instrument($01)
    %octave($01)
    %note($11, 3)
    %note($1A, 3)
    %volume($46)
    %note($11, 3)
    %note($16, 3)
    %volume($75)
    %note($11, 3)
    %toggle_portamento()
    %note($15, 3)
    %portamento_time($3C)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0B, 5)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
