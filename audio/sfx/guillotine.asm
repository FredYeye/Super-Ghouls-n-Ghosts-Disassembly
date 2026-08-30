    db $07
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
    %instrument($00)
    %duration($FF)
    %tempo($036D)
    %lfo($00, $06)
    %lfo($02, $37)
    %lfo($01, $20)
    %lfo($03, $01)
    %octave($01)
    %volume($14)
    %toggle_portamento()
    %note($1B, 2)
    %volume($32)
    %note($1B, 2)
    %portamento_time($28)
    %volume($64)
    %duration($1E)
    %release($12)
    %toggle_portamento()
    %note($0D, 6)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
