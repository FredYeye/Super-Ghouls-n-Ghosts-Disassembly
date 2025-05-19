    db $03
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

if !version == 0 || !version == 1
    %tempo($0333)
elseif !version == 2
    %tempo($036D)
    %per_voice_transpose($08)
endif

    %duration($FF)
    %volume($75)

if !version == 0 || !version == 1
    %instrument($01)
    %octave($01)
    %lfo($00, $46)
    %lfo($02, $46)
elseif !version == 2
    %instrument($02)
    %octave($04)
    %note($0D, 1)
    %instrument($01)
    %octave($03)
    %lfo($00, $64)
    %lfo($02, $40)
endif

    %set_dotted_note()
    %toggle_portamento()
    %note($0B, 4)

if !version == 0 || !version == 1
    %portamento_time($32)
elseif !version == 2
    %portamento_time($5A)
endif

    %set_dotted_note()
    %toggle_portamento()
    %toggle_2_octaves_up()
    %note($17, 4)
    %end_track()

..ch1:
    %end_track()
