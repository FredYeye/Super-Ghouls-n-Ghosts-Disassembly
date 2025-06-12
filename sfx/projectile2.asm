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
    %tempo($0300)
    %instrument($00)
    %duration($FF)
    %portamento_time($7F)
    %lfo($00, $01)
    %lfo($01, $0E)
    %lfo($02, $7F)
    %lfo($03, $00)
    %volume($2D)
    %octave($01)
    %toggle_portamento()
    %note($16, 1)
    %octave($03)
    %note($19, 1)
    %octave($06)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($08, 1)
    %volume($6C)
    %duration($1E)
    %release($10)
    %note($14, 5)
    %end_track()
