    db $0F
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
if !version == 0 || !version == 1
    %tempo($01EB)
..48AA:
    %toggle_triplet_portamento_2_octave_up($08)
    %duration($F5)
    %volume($23)
    %instrument($09)
    %octave($02)
    %note($0A, 3)
    %note($09, 3)
    %note($0A, 3)
    %note($12, 3)
    %note($11, 3)
    %note($12, 3)
    %note($16, 3)
    %note($15, 3)
    %note($16, 3)
endif
    %end_track()

..ch2:
if !version == 0 || !version == 1
    %note($00, 6)
    %note($00, 3)
elseif !version == 2
    %tempo($01EB)
..48AA:
    %toggle_triplet_portamento_2_octave_up($08)
    %duration($F5)
    %volume($23)
    %instrument($09)
    %octave($02)
    %note($0A, 3)
    %note($09, 3)
    %note($0A, 3)
    %note($12, 3)
    %note($11, 3)
    %note($12, 3)
    %note($16, 3)
    %note($15, 3)
    %note($16, 3)
endif
    %end_track()

..ch1:
    %tempo($01EB)
    %per_voice_transpose($FC)
    %goto(..48AA)
    %end_track()
