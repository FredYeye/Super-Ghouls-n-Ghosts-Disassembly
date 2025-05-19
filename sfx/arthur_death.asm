    db $00
    dw be(..ch8), be(..ch7), be(..ch6), be(..ch5), be(..ch4), be(..ch3), be(..ch2), be(..ch1)

..ch8:
    %tempo($0300)
    %octave($04)
    %volume($7F)
..473E:
    %toggle_triplet_portamento_2_octave_up($08)
    %instrument($11)
    %duration($FF)
    %note($0C, 3)
    %note($06, 3)
    %note($07, 3)
    %note($08, 3)
    %note($03, 3)
    %note($04, 3)
    %note($05, 3)
    %toggle_2_octaves_up()
    %note($18, 3)
    %note($19, 3)
    %note($1A, 3)
    %note($14, 3)
    %note($15, 3)
    %note($16, 3)
    %note($0F, 3)
    %note($11, 3)
    %note($12, 3)
    %volume($44)
    %note($0F, 3)
    %note($11, 3)
    %note($12, 3)
    %volume($23)
    %note($0F, 3)
    %note($11, 3)
    %note($12, 3)
    %volume($19)
    %note($0F, 3)
    %note($11, 3)
    %note($12, 3)
    %end_track()

..ch7:
    %tempo($0300)
    %volume($7F)
    %octave($03)
    %note($00, 2)
    %goto(..473E)
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
    %end_track()
