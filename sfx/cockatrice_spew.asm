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
    %duration($FF)
    %octave($01)
    %lfo($00, $7F)
    %lfo($02, $7F)
    %lfo($03, $00)
    %instrument($00)
    %volume($6D)
    %toggle_portamento()
    %note($1A, 2)
    %portamento_time($64)
    %toggle_portamento()
    %note($11, 3)
    %portamento_time($00)
    %instrument($03)
    %duration($64)
    %release($0E)
    %toggle_portamento()
    %note($1A, 3)
    %portamento_time($64)
    %toggle_portamento()
    %note($11, 4)
    %end_track()
