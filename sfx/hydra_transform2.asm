    db $0B
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
    %per_voice_transpose($03)
    %instrument($03)
..56D7:
    %toggle_triplet_portamento_2_octave_up($48)
    %duration($FF)
    %octave($01)
    %lfo($01, $64)
    %lfo($02, $7F)
    %volume($37)
    %note($0D, 2)
    %volume($4B)
    %note($0D, 2)
    %volume($5F)
    %note($0D, 2)
    %volume($64)
    %note($0D, 2)
    %duration($1E)
    %release($12)
    %toggle_portamento()
    %note($0D, 6)
    %end_track()

..ch1:
    %tempo($036D)
    %tuning($5A)
    %instrument($04)
    %goto(..56D7)
    %end_track()
