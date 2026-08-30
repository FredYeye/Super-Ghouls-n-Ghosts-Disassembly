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
    %tempo($036D)
    %instrument($00)
..4986:
    %toggle_triplet_portamento_2_octave_up($48)
    %octave($01)
    %per_voice_transpose($09)
    %duration($FF)
    %release($12)
    %portamento_time($7F)
    %volume($1E)
    %note($08, 1)
    %volume($28)
    %note($07, 2)
    %volume($37)
    %note($07, 2)
    %volume($4B)
    %note($07, 2)
    %volume($60)
    %note($07, 2)
    %volume($78)
    %note($07, 2)
    %volume($50)
    %note($08, 2)
    %volume($4B)
    %note($09, 2)
    %volume($46)
    %note($0A, 2)
    %volume($41)
    %note($0B, 2)
    %volume($37)
    %note($0C, 2)
    %volume($2D)
    %note($0D, 2)
    %volume($23)
    %note($0E, 2)
    %volume($19)
    %note($0F, 2)
    %volume($14)
    %note($10, 2)
    %volume($12)
    %note($11, 2)
    %volume($10)
    %note($12, 2)
    %volume($0E)
    %note($13, 2)
    %volume($0C)
    %note($14, 2)
    %volume($0A)
    %note($15, 2)
    %volume($08)
    %note($17, 2)
    %volume($06)
    %toggle_portamento()
    %note($07, 4)
    %end_track()

..ch1:
    %tempo($036D)
    %instrument($00)
    %tuning($BF)
    %goto(..4986)
    %end_track()
