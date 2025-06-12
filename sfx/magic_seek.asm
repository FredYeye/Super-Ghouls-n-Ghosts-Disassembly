    db $09
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
..50D9:
    %toggle_triplet_portamento_2_octave_up($40)
    %octave($02)
    %tempo($0111)
    %instrument($09)
    %duration($FF)
    %volume($1E)
    %portamento_time($7F)
    %note($0F, 1)
    %note($16, 1)
    %note($19, 1)
    %note($1D, 1)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0A, 1)
    %portamento_time($00)
    %octave($03)
    %instrument($00)
    %lfo($00, $0C)
    %lfo($01, $3C)
    %lfo($02, $50)
    %duration($1E)
    %release($0F)
    %volume($7F)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($16, 6)
    %end_track()

..ch1:
    %tempo($0111)
    %tuning($46)
    %goto(..50D9)
    %end_track()
