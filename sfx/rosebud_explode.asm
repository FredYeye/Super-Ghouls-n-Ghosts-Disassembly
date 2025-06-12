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
    %end_track()

..ch1:
    %tempo($0333)
    %duration($FF)
    %octave($01)
    %instrument($00)
    %volume($3C)
    %toggle_2_octaves_up()
    %note($13, 2)
    %note($11, 2)
    %volume($78)
    %instrument($04)
    %lfo($00, $32)
    %lfo($01, $7F)
    %lfo($02, $46)
    %duration($BE)
    %release($0B)
    %toggle_portamento()
    %note($11, 2)
    %portamento_time($7F)
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($11, 6)
    %end_track()
