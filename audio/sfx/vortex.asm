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
    %tempo($0155)
    %octave($01)
    %lfo($00, $14)
    %lfo($02, $5A)
    %lfo($03, $00)
    %instrument($00)
    %duration($A0)
    %release($0A)
    %portamento_time($5A)
..4AC8:
    %toggle_triplet_portamento_2_octave_up($40)
    %volume($2D)
    %note($1A, 4)
    %volume($37)
    %note($1B, 5)
    %volume($41)
    %note($1C, 5)
    %volume($37)
    %note($1D, 4)
    %volume($2D)
    %note($1C, 5)
    %volume($37)
    %note($1B, 5)
    %goto(..4AC8)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
