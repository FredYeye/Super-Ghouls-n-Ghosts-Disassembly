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
    %tempo($0199)
..51F9:
    %toggle_triplet_portamento_2_octave_up($00)
    %instrument($00)
    %octave($03)
    %duration($FF)
    %release($0C)
    %volume($32)
    %note($1D, 2)
    %note($1F, 2)
    %volume($7F)
    %toggle_2_octaves_up()
    %note($11, 3)
    %volume($14)
    %toggle_2_octaves_up()
    %note($16, 3)
    %volume($50)
    %toggle_2_octaves_up()
    %note($13, 3)
    %volume($14)
    %toggle_2_octaves_up()
    %note($16, 3)
    %volume($32)
    %toggle_2_octaves_up()
    %note($15, 3)
    %volume($14)
    %toggle_2_octaves_up()
    %note($16, 3)
    %volume($1E)
    %toggle_2_octaves_up()
    %note($17, 3)
    %volume($0A)
    %toggle_2_octaves_up()
    %note($16, 3)
    %volume($14)
    %toggle_2_octaves_up()
    %note($18, 3)
    %volume($0A)
    %toggle_2_octaves_up()
    %note($16, 3)
    %volume($0F)
    %toggle_2_octaves_up()
    %note($19, 3)
    %volume($05)
    %toggle_2_octaves_up()
    %note($16, 3)
    %end_track()

..ch1:
    %tempo($0199)
    %tuning($B0)
    %note($00, 2)
    %goto(..51F9)
    %end_track()
