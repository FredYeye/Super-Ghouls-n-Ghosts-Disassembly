    db $01
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
    %tempo($01EB)
    %duration($FF)
    %volume($7F)
    %instrument($05)
    %per_voice_transpose($03)
    %octave($01)
    %portamento_time($7F)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($0B, 2)
    %note($08, 2)
    %toggle_portamento()
    %note($01, 2)
    %release($1F)
    %toggle_2_octaves_up()
    %note($16, 3)
    %end_track()
