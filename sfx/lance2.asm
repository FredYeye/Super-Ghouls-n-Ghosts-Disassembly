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
    %tempo($02D2)
    %duration($FF)
    %volume($75)
    %instrument($01)
    %octave($02)
    %toggle_2_octaves_up()
    %note($0D, 2)
    %note($0B, 2)
    %note($0D, 2)
    %lfo($00, $0B)
    %lfo($02, $46)
    %lfo($03, $01)
    %note($01, 6)
    %end_track()

..ch1:
    %end_track()
