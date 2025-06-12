    db $0E
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
    %tempo($0266)
    %duration($FF)
    %volume($6E)
    %octave($02)
    %instrument($05)
    %lfo($00, $08)
    %lfo($01, $20)
    %lfo($02, $40)
    %lfo($03, $00)
    %portamento_time($7F)
..532F:
    %toggle_triplet_portamento_2_octave_up($40)
    %note($0F, 1)
    %toggle_portamento()
    %note($13, 2)
    %toggle_portamento()
    %note($11, 2)
    %toggle_portamento()
    %note($0E, 2)
    %goto(..532F)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %tempo($0249)
    %duration($FF)
    %volume($7F)
    %instrument($03)
    %octave($01)
    %lfo($00, $0A)
    %lfo($01, $40)
    %lfo($02, $40)
    %lfo($03, $01)
    %portamento_time($7F)
..5356:
    %toggle_triplet_portamento_2_octave_up($40)
    %note($0E, 2)
    %note($0F, 2)
    %note($11, 2)
    %note($13, 2)
    %note($15, 2)
    %note($16, 2)
    %note($18, 2)
    %note($16, 2)
    %note($15, 2)
    %note($13, 2)
    %note($11, 2)
    %note($0F, 2)
    %note($0E, 2)
    %goto(..5356)
    %end_track()
