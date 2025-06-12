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
    %end_track()

..ch1:
    %tempo($036D)
    %lfo($00, $7F)
    %lfo($01, $7F)
    %lfo($02, $7F)
    %lfo($03, $01)
    %volume($3C)
    %duration($1E)
    %octave($07)
    %instrument($0B)
    %toggle_2_octaves_up()
    %note($19, 1)
    %instrument($00)
    %toggle_2_octaves_up()
    %note($0A, 1)
    %note($16, 1)
    %note($19, 1)
    %note($1B, 1)
    %portamento_time($7F)
    %toggle_portamento()
    %note($1D, 1)
    %toggle_portamento()
    %note($1E, 1)
    %volume($28)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0F, 1)
    %toggle_portamento()
    %note($12, 1)
    %volume($14)
    %toggle_portamento()
    %note($16, 1)
    %toggle_portamento()
    %note($19, 1)
    %end_track()
