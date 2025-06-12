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
    %tempo($011D)
..508E:
    %toggle_triplet_portamento_2_octave_up($00)
    %lfo($00, $0C)
    %lfo($01, $40)
    %lfo($02, $7F)
    %lfo($03, $01)
    %octave($03)
    %instrument($00)
    %volume($28)
    %duration($32)
    %note($14, 2)
    %note($11, 1)
    %note($0D, 1)
    %volume($7F)
    %portamento_time($7F)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($18, 2)
    %note($06, 2)
    %octave($02)
    %duration($1E)
    %release($12)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($06, 5)
    %end_track()

..ch1:
    %tempo($0111)
    %per_voice_transpose($FE)
    %goto(..508E)
    %end_track()
