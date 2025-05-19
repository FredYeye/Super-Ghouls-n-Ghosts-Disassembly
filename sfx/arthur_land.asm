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
    %end_track()

..ch2:
    %tempo($02D2)
    %instrument($00)
    %octave($07)
    %lfo($00, $7F)
    %lfo($01, $7F)
    %lfo($02, $7F)
    %lfo($03, $01)
    %release($1F)
    %duration($46)
    %volume($46)
    %toggle_2_octaves_up()
    %note($16, 2)
    %note($00, 2)
    %note($16, 2)
    %end_track()

..ch1:
    %end_track()
