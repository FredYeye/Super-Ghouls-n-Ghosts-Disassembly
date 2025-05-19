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
    %end_track()

..ch2:
    %tempo($0333)
    %lfo($01, $28)
    %lfo($02, $7F)
    %lfo($03, $00)
    %duration($1E)
    %release($1F)
    %volume($7F)
    %instrument($00)
    %octave($02)
    %toggle_2_octaves_up()
    %note($12, 2)
    %note($06, 2)
    %toggle_2_octaves_up()
    %note($12, 2)
    %lfo($01, $00)
    %duration($FF)
    %release($00)
    %instrument($02)
    %toggle_2_octaves_up()
    %note($11, 3)
    %volume($46)
    %note($11, 3)
    %volume($32)
    %note($11, 3)
    %volume($28)
    %note($11, 3)
    %volume($1E)
    %note($11, 3)
    %volume($14)
    %note($11, 3)
    %end_track()

..ch1:
    %end_track()
