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
    %end_track()

..ch1:
    %tempo($036D)
    %duration($FF)
    %instrument($02)
    %octave($02)
    %volume($46)
    %note($05, 1)
    %note($0C, 1)
    %instrument($01)
    %volume($6E)
    %note($0F, 1)
    %note($0A, 1)
    %note($11, 1)
    %volume($78)
    %toggle_portamento()
    %note($06, 1)
    %portamento_time($7F)
    %volume($78)
    %note($06, 1)
    %volume($6E)
    %note($08, 1)
    %volume($64)
    %note($0A, 1)
    %volume($5A)
    %note($0C, 1)
    %volume($50)
    %note($0D, 1)
    %volume($46)
    %note($0F, 1)
    %volume($3C)
    %note($11, 1)
    %volume($32)
    %note($12, 1)
    %volume($28)
    %note($14, 1)
    %volume($1E)
    %note($16, 1)
    %volume($14)
    %note($18, 1)
    %volume($0A)
    %note($19, 1)
    %volume($05)
    %toggle_portamento()
    %note($1B, 1)
    %end_track()
