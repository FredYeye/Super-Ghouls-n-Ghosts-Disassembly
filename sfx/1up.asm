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
    %tempo($0199)
    %volume($41)
..550A:
    %toggle_triplet_portamento_2_octave_up($00)
    %duration($FF)

if !version == 0 || !version == 1
    %octave($03)
elseif !version == 2
    %octave($02)
endif

    %instrument($15)
    %note($1F, 2)
    %note($1B, 2)
    %toggle_2_octaves_up()
    %note($0A, 2)
    %note($0F, 2)
    %note($0A, 2)
    %note($0F, 2)
    %note($13, 2)
    %note($0F, 2)
    %note($13, 2)
    %duration($1E)
    %release($10)
    %note($16, 4)
    %end_track()

..ch1:
    %tempo($0249)
    %tuning($46)
    %note($00, 3)
    %volume($2D)
    %goto(..550A)
    %end_track()
