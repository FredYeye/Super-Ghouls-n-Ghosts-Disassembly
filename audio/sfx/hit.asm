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
    %duration($FF)
    %volume($64)
    %instrument($00)
    %lfo($00, $40)
    %lfo($01, $60)
    %lfo($02, $60)
    %lfo($03, $00)
    %octave($02)
    %portamento_time($7F)
    %toggle_portamento()
    %note($19, 1)
    %toggle_2_octaves_up()
    %note($0A, 1)
    %note($03, 1)
    %toggle_portamento()
    %note($08, 4)
    %end_track()
