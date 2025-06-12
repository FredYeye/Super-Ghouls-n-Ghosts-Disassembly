    db $0F
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
    %duration($B1)
    %volume($55)
    %instrument($02)
    %octave($04)
    %lfo($00, $05)
    %lfo($01, $1E)
    %lfo($02, $3C)
    %lfo($03, $00)
    %set_dotted_note()
    %note($17, 4)
    %note($17, 3)
    %note($17, 3)
    %note($17, 3)
    %set_dotted_note()
    %note($17, 2)
    %set_dotted_note()
    %note($17, 2)
    %note($17, 1)
    %set_dotted_note()
    %note($17, 2)
    %note($17, 2)
    %set_dotted_note()
    %note($17, 2)
    %note($17, 2)
    %set_dotted_note()
    %note($17, 2)
    %note($17, 2)
    %note($17, 1)
    %note($17, 2)
    %note($17, 2)
    %note($17, 1)
    %set_dotted_note()
    %note($17, 2)
    %note($17, 2)
    %note($17, 1)
    %note($17, 2)
..4A93:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($17, 1)
    %set_dotted_note()
    %note($17, 2)
    %goto(..4A93)
    %end_track()
