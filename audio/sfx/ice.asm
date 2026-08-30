    db $0A
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
    %tempo($036D)
    %instrument($00)
    %octave($05)
    %lfo($01, $40)
    %lfo($02, $60)
    %lfo($03, $01)
    %duration($1E)
    %release($0C)
    %volume($38)
    %note($10, 1)
    %volume($6A)
    %toggle_2_octaves_up()
    %note($0D, 3)
    %duration($64)
    %release($18)
    %note($10, 1)
    %volume($60)
    %note($07, 1)
    %volume($51)
    %note($0E, 2)
    %note($09, 1)
    %volume($3F)
    %note($02, 2)
    %note($06, 1)
    %end_track()

..ch1:
    %tempo($036D)
    %octave($05)
    %instrument($13)
    %lfo($01, $40)
    %lfo($02, $60)
    %lfo($03, $01)
    %duration($1E)
    %release($0C)
    %volume($5F)
    %note($10, 1)
    %note($1A, 1)
    %volume($7A)
    %toggle_2_octaves_up()
    %note($09, 3)
    %duration($64)
    %release($18)
    %note($10, 1)
    %note($07, 1)
    %volume($64)
    %note($0E, 2)
    %note($0C, 1)
    %volume($4B)
    %note($02, 2)
    %note($06, 1)
    %end_track()
