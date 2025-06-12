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
    %tempo($036D)
..5194:
    %toggle_triplet_portamento_2_octave_up($40)
    %octave($02)
    %instrument($00)
    %duration($FF)
    %portamento_time($7F)
    %volume($3C)
    %note($19, 2)
    %volume($78)
    %toggle_portamento()
    %note($1D, 2)
    %portamento_time($00)
    %lfo($00, $1E)
    %lfo($01, $14)
    %lfo($02, $7F)
    %release($10)
    %duration($78)
    %volume($50)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($09, 2)
    %volume($64)
    %note($09, 2)
    %volume($7F)
    %toggle_portamento()
    %note($09, 2)
    %lfo($00, $00)
    %instrument($11)
    %octave($01)
    %portamento_time($7F)
    %toggle_portamento()
    %note($16, 1)
    %octave($07)
    %duration($1E)
    %release($15)
    %toggle_portamento()
    %note($18, 6)
    %end_track()

..ch1:
    %tempo($036D)
    %per_voice_transpose($F9)
    %tuning($3C)
    %goto(..5194)
    %end_track()
