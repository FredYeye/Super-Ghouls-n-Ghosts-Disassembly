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
    %tempo($02D2)
    %instrument($05)
    %duration($FF)
    %octave($01)
    %volume($7F)
    %note($1D, 2)
    %note($0D, 2)
    %instrument($00)
    %lfo($00, $1E)
    %lfo($01, $5A)
    %lfo($02, $7F)
    %lfo($03, $01)
    %release($1F)
    %note($1B, 2)
    %note($1B, 2)
    %portamento_time($7F)
    %toggle_portamento()
    %note($1B, 2)
    %release($12)
    %duration($1E)
    %set_dotted_note()
    %toggle_portamento()
    %note($0F, 5)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %tempo($02AA)
    %instrument($00)
    %duration($C8)
    %release($12)
    %octave($01)
    %volume($7F)
    %portamento_time($7F)
    %toggle_portamento()
    %note($1B, 2)
    %toggle_portamento()
    %note($0F, 2)
    %instrument($03)
    %lfo($00, $14)
    %lfo($01, $60)
    %lfo($02, $7F)
    %lfo($03, $01)
    %release($1F)
    %note($1D, 2)
    %note($1D, 2)
    %portamento_time($5A)
    %toggle_portamento()
    %note($1D, 2)
    %duration($1E)
    %release($10)
    %set_dotted_note()
    %toggle_portamento()
    %note($11, 5)
    %end_track()
