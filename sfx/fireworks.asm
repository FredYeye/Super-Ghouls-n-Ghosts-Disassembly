    db $02
    dw be(..ch8), be(..ch7), be(..ch6), be(..ch5), be(..ch4), be(..ch3), be(..ch2), be(..ch1)

..ch8:
    %tempo($00CC)
    %instrument(!sample_snare)
    %tuning($E0)
..4E7E:
    %toggle_triplet_portamento_2_octave_up($00)
    %volume($7F)
    %octave($01)
    %duration($7F)
    %note($12, 2)
    %end_track()

..ch7:
    %tempo($00CC)
    %tuning($B3)
    %instrument(!sample_snare)
    %goto(..4E7E)
    %end_track()

..ch6:
    %tempo($00CC)
..4E96:
    %toggle_triplet_portamento_2_octave_up($00)
    %volume($1E)
    %duration($FF)
    %instrument(!sample_timpani)
    %octave($00)
    %note($1B, 5)
    %end_track()

..ch5:
    %tempo($00CC)
    %per_voice_transpose($02)
    %goto(..4E96)
    %end_track()

..ch4:
    %end_track()

..ch3:
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
