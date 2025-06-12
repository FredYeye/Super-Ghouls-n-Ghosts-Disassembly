    db $08
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
    %instrument($00)
..4D3A:
    %toggle_triplet_portamento_2_octave_up($00)
    %tempo($0300)
    %volume($5A)
    %lfo($01, $60)
    %lfo($02, $60)
    %lfo($03, $01)
    %duration($1E)
    %release($0C)
    %octave($04)
    %note($10, 1)
    %note($1C, 1)
    %note($1F, 1)
    %toggle_2_octaves_up()
    %note($09, 4)
    %tempo($036D)
    %duration($64)
    %release($18)
    %note($10, 2)
    %note($07, 2)
    %volume($50)
    %note($0C, 2)
    %note($0E, 2)
    %volume($3C)
    %note($04, 2)
    %note($07, 2)
    %volume($28)
    %note($04, 2)
    %note($0B, 2)
    %volume($1E)
    %note($06, 2)
    %note($07, 2)
    %volume($14)
    %note($10, 2)
    %note($11, 2)
    %volume($0A)
    %note($11, 2)
    %note($13, 2)
    %end_track()

..ch1:
    %instrument($13)
    %goto(..4D3A)
    %end_track()
