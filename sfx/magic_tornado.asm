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
    %tempo($0216)
    %duration($FF)
    %volume($55)
    %instrument($00)
    %octave($01)
    %lfo($00, $18)
    %lfo($02, $7F)
    %lfo($03, $00)
    %portamento_time($7F)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0C, 4)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($18, 4)
    %toggle_portamento()
    %note($11, 5)
    %toggle_2_octaves_up()
    %note($0C, 5)
    %note($11, 5)
    %note($14, 5)
    %duration($1E)
    %release($0C)
    %set_dotted_note()
    %toggle_portamento()
    %note($18, 6)
    %end_track()

..ch1:
    %tempo($0216)
    %duration($FF)
    %volume($55)
    %instrument($00)
    %octave($01)
    %lfo($00, $0C)
    %lfo($01, $0C)
    %lfo($02, $7F)
    %lfo($03, $00)
    %portamento_time($7F)
    %toggle_portamento()
    %note($0C, 5)
    %note($13, 5)
    %note($1A, 5)
    %note($1F, 5)
    %toggle_2_octaves_up()
    %note($0F, 5)
    %duration($1E)
    %release($0C)
    %set_dotted_note()
    %toggle_portamento()
    %note($12, 6)
    %end_track()
