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
    %duration($FF)
    %lfo($00, $7F)
    %lfo($01, $7F)
    %lfo($02, $7F)
    %lfo($03, $01)
    %instrument($02)
    %octave($01)
    %volume($5A)
    %tempo($00F0)
..4E30:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($19, 2)
    %loop(0, 2, ..4E30)
    %tempo($0199)
..4E3A:
    %toggle_triplet_portamento_2_octave_up($00)
    %tuning($43)
    %note($19, 2)
    %loop(0, 2, ..4E3A)
    %tuning($00)
    %tempo($02AA)
..4E48:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($1A, 2)
    %loop(1, 4, ..4E48)
    %tempo($0249)
..4E52:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($1B, 2)
    %loop(2, 4, ..4E52)
    %tempo($0199)
..4E5C:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($1C, 2)
    %loop(3, 4, ..4E5C)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
