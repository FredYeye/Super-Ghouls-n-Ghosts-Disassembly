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
    %end_track()

..ch2:
    %tempo($036D)
..567F:
    %toggle_triplet_portamento_2_octave_up($40)
    %instrument($04)
    %duration($7F)
    %octave($03)
    %volume($48)
    %portamento_time($7F)
    %note($16, 3)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0A, 3)
    %volume($2D)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($18, 3)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0C, 3)
    %volume($23)
    %toggle_portamento()
    %note($01, 3)
    %toggle_portamento()
    %note($0D, 3)
    %volume($19)
    %toggle_portamento()
    %note($03, 3)
    %toggle_portamento()
    %note($0F, 3)
    %volume($14)
    %toggle_portamento()
    %note($05, 3)
    %toggle_portamento()
    %note($11, 3)
    %volume($0A)
    %toggle_portamento()
    %note($06, 3)
    %toggle_portamento()
    %note($12, 3)
    %end_track()

..ch1:
    %tempo($036D)
    %tuning($64)
    %goto(..567F)
    %end_track()
