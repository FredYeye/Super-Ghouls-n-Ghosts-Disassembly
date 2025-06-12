    db $02
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

if !version == 2
    %end_track()

..ch1:
endif

    %tempo($036D)
    %duration($FF)
    %instrument($00)
    %octave($02)
    %per_voice_transpose($02)
    %portamento_time($7F)
    %volume($78)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($15, 2)
    %volume($6E)
    %note($15, 2)
    %volume($64)
    %note($14, 2)
    %volume($5F)
    %note($15, 2)
    %volume($5A)
    %note($15, 2)
    %volume($55)
    %note($15, 2)
    %volume($50)
    %note($15, 2)
    %volume($4B)
    %note($14, 2)
    %volume($46)
    %note($15, 2)
    %volume($41)
    %note($15, 2)
    %volume($3C)
    %note($14, 2)
    %volume($37)
    %note($15, 2)
    %volume($32)
    %note($14, 2)
    %volume($2D)
    %note($15, 2)
    %volume($28)
    %note($14, 2)
    %volume($23)
    %toggle_portamento()
    %note($15, 2)
    %end_track()

if !version == 0 || !version == 1
..ch1:
    %end_track()
endif
