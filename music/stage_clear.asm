    db $00
    dw be(..ch8), be(..ch7), be(..ch6), be(..ch5), be(..ch4), be(..ch3), be(..ch2), be(..ch1)

..ch8:
    %tempo($0200)
    %release($14)
    %duration($FA)
    %volume($5A)
    %instrument($09)
    %octave($01)
    %tuning($20)
    %note($10, 7)
    %toggle_portamento()
    %note($12, 7)
    %toggle_portamento()
    %note($12, 7)
    %note($00, 7)
    %end_track()

..ch7:
    %pan($BF)
    %duration($F5)
    %release($14)
    %volume($41)
    %instrument($09)
    %octave($02)
    %note($00, 5)
    %toggle_triplet()
    %note($16, 4)
    %note($17, 4)
    %note($1C, 4)
    %set_dotted_note()
    %toggle_triplet()
    %toggle_2_octaves_up()
    %note($0B, 6)
    %toggle_triplet()
    %note($0B, 4)
    %note($0A, 4)
    %note($06, 4)
    %note($0A, 5)
    %note($0B, 5)
    %note($0D, 5)
    %toggle_triplet()
    %note($12, 7)
    %note($00, 7)
    %end_track()

..ch6:
    %pan($41)
    %tuning($23)
    %duration($FF)
    %release($14)
    %volume($48)
    %instrument($0F)
    %octave($03)
    %set_dotted_note()
    %note($00, 6)
    %note($00, 4)
    %toggle_triplet()
    %note($14, 3)
    %note($17, 3)
    %note($1C, 3)
    %toggle_triplet()
    %note($1E, 6)
    %toggle_triplet()
    %note($1C, 5)
    %note($1B, 5)
    %note($19, 5)
    %toggle_triplet()
    %toggle_2_octaves_up()
    %note($0D, 7)
    %note($00, 7)
    %end_track()

..ch5:
    %duration($F5)
    %release($14)
    %volume($26)
    %instrument($09)
    %octave($02)
    %note($17, 7)
    %toggle_portamento()
    %note($19, 7)
    %toggle_portamento()
    %note($19, 7)
    %note($00, 7)
    %end_track()

..ch4:
    %end_track()

..ch3:
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
