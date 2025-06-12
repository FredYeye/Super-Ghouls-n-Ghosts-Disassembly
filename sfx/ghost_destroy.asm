    db $04
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
    %tempo($0133)
    %duration($FF)
    %lfo($00, $2C)
    %lfo($01, $32)
    %lfo($02, $6E)
    %lfo($03, $01)
    %instrument($05)
    %volume($64)
    %octave($01)
    %note($19, 1)
    %toggle_2_octaves_up()
    %note($0D, 1)
    %note($19, 1)
    %instrument($01)
    %portamento_time($7F)
    %toggle_portamento()
    %note($03, 2)
    %portamento_time($00)
    %volume($69)
    %note($11, 2)
    %volume($55)
    %note($11, 2)
    %volume($41)
    %note($11, 2)
    %volume($2D)
    %toggle_portamento()
    %note($11, 2)
    %end_track()
