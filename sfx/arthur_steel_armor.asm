    db $0D
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
    %tempo($02AA)
    %duration($FF)
    %volume($64)
    %instrument($00)
    %octave($02)
    %toggle_portamento()
    %note($19, 3)
    %toggle_portamento()
    %note($1D, 3)
    %instrument($15)
if !version == 0 || !version == 1
    %octave($05)
elseif !version == 2
    %per_voice_transpose($05)
    %octave($00)
endif
    %toggle_2_octaves_up()
    %note($0A, 3)
    %note($08, 2)
    %note($10, 4)
    %end_track()

..ch1:
    %end_track()
