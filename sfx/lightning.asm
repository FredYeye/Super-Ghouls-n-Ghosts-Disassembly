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
    %tempo($0200)
    %duration($FA)
    %instrument($00)
    %octave($03)
    %release($15)
    %volume($7F)
    %toggle_2_octaves_up()
    %note($15, 1)
    %note($09, 1)
    %note($14, 1)
    %note($08, 1)
    %note($13, 1)
    %note($07, 1)
    %note($12, 1)
    %note($06, 1)
    %set_dotted_note()
    %note($00, 5)
    %lfo($00, $28)
    %lfo($02, $7F)
    %release($15)
    %duration($7F)
    %instrument($05)
    %volume($7F)
    %per_voice_transpose($FF)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0B, 2)
    %note($09, 2)
    %note($04, 2)
    %note($06, 2)
    %note($04, 2)
    %note($02, 2)
    %toggle_portamento()
    %note($01, 2)
    %per_voice_transpose($FD)
    %toggle_portamento()
    %note($0C, 2)
    %note($0A, 2)
    %note($05, 2)
    %note($07, 2)
    %note($05, 2)
    %note($07, 2)
    %note($05, 2)
    %note($03, 2)
    %note($05, 2)
    %release($15)
    %toggle_portamento()
    %note($03, 5)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
