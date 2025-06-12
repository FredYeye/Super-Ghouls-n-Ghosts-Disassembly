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
    %instrument($00)
    %duration($FF)
    %tempo($036D)
    %lfo($00, $60)
    %lfo($01, $1E)
    %lfo($02, $7F)
    %lfo($03, $00)
    %octave($01)
    %portamento_time($7F)
    %volume($1E)
    %toggle_portamento()
    %note($1D, 2)
    %volume($28)
    %note($1D, 2)
    %volume($32)
    %note($1D, 2)
    %volume($3C)
    %note($1D, 2)
    %volume($6E)
    %portamento_time($7F)
    %note($1D, 2)
    %toggle_2_octaves_up()
    %note($18, 4)
    %duration($1E)
    %release($12)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0C, 6)
    %end_track()

..ch1:
    %end_track()
