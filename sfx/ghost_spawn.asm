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
    %end_track()

..ch1:
    %tempo($0266)
    %duration($FF)
    %instrument($03)
    %octave($01)
    %lfo($00, $1C)
    %lfo($01, $3C)
    %lfo($02, $78)
    %lfo($03, $00)
    %volume($05)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0D, 3)
    %volume($0A)
    %note($0E, 3)
    %volume($14)
    %note($0E, 3)
    %volume($1E)
    %note($0E, 3)
    %volume($2D)
    %note($0E, 3)
    %portamento_time($1E)
    %set_dotted_note()
    %note($15, 5)
    %release($10)
    %duration($37)
    %toggle_portamento()
    %note($17, 7)
    %end_track()
