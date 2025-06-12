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
    %end_track()

..ch2:
    %end_track()

..ch1:
    %tempo($0249)
    %instrument($05)
    %octave($01)
    %duration($FF)
    %volume($6E)
    %note($12, 1)
    %instrument($00)
    %lfo($01, $20)
    %lfo($00, $10)
    %lfo($02, $37)
    %lfo($03, $00)
    %portamento_time($5A)
    %volume($50)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($17, 2)
    %note($0F, 2)
    %volume($78)
    %note($06, 2)
    %volume($64)
    %note($05, 2)
    %volume($5A)
    %note($02, 2)
    %volume($46)
    %toggle_2_octaves_up()
    %note($18, 2)
    %volume($3C)
    %toggle_portamento()
    %note($15, 2)
    %end_track()
