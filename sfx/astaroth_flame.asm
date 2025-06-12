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
    %tempo($0249)
..52B5:
    %toggle_triplet_portamento_2_octave_up($48)
    %duration($FF)
    %per_voice_transpose($01)
    %instrument($00)
    %octave($00)
    %volume($7F)
    %note($08, 4)
    %portamento_time($32)
    %toggle_portamento()
    %note($0C, 2)
    %end_track()

..ch1:
    %tempo($0249)
    %tuning($5A)
    %note($00, 2)
    %goto(..52B5)
    %end_track()
