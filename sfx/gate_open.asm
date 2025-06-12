    db $0A
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
    %tempo($0180)
    %instrument($05)
    %volume($64)
..4D9A:
    %toggle_triplet_portamento_2_octave_up($00)
    %octave($01)
    %duration($FF)
..4DA0:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($18, 3)
    %toggle_portamento()
    %note($15, 2)
    %note($14, 2)
    %toggle_portamento()
    %note($13, 2)
    %loop(0, 5, ..4DA0)
    %end_track()

..ch2:
    %note($00, 5)
    %note($00, 5)
    %note($00, 5)
    %set_dotted_note()
    %note($00, 4)
    %end_track()

..ch1:
    %tempo($0180)
    %instrument($03)
    %per_voice_transpose($FF)
    %volume($6B)
    %goto(..4D9A)
    %end_track()
