    db $00
    dw be(..ch8), be(..ch7), be(..ch6), be(..ch5), be(..ch4), be(..ch3), be(..ch2), be(..ch1)

..ch8:

if !version == 0 || !version == 1
    %tempo($00FA)
    %volume($44)
    %duration($BE)
    %release($10)
    %instrument($12)
    %octave($02)
    %toggle_triplet()
    %note($00, 3)
    %pan($BA)
    %note($1B, 3)
    %toggle_triplet()
    %note($1E, 2)
    %pan($E7)
    %toggle_2_octaves_up()
    %note($0A, 2)
    %note($0D, 2)
    %pan($19)
    %toggle_triplet()
    %note($11, 3)
    %note($08, 3)
    %pan($46)
    %note($0A, 3)
    %note($0D, 3)
    %lfo($01, $2D)
    %lfo($02, $19)
    %pan($6E)
    %toggle_triplet()
    %note($14, 6)
    %note($00, 6)
elseif !version == 2
    %tempo($0333)
    %pan($B0)
    %master_volume($46)
    %duration($96)
    %instrument($12)
    %octave($03)
    %volume($28)
    %release($18)
    %toggle_triplet()
    %toggle_2_octaves_up()
    %note($11, 4)
    %note($15, 4)
    %volume($32)
    %note($0E, 4)
    %note($11, 4)
    %volume($3C)
    %note($0A, 4)
    %note($0E, 4)
    %volume($46)
    %note($09, 4)
    %note($0E, 4)
    %volume($50)
    %note($0A, 4)
    %note($07, 4)
    %volume($5A)
    %note($05, 4)
    %note($0A, 4)
    %volume($64)
    %note($11, 4)
    %note($15, 4)
    %volume($6E)
    %note($0E, 4)
    %note($11, 4)
    %volume($6E)
    %note($0A, 4)
    %note($0E, 4)
    %volume($78)
    %note($09, 4)
    %note($0E, 4)
    %volume($78)
    %note($0A, 4)
    %note($07, 4)
    %note($05, 4)
    %note($0A, 4)
    %master_volume($35)
    %duration($64)
    %release($0C)
    %pan($81)
    %volume($7F)
    %toggle_triplet()
    %note($00, 5)
    %note($00, 3)
    %toggle_portamento()
    %note($0A, 7)
    %toggle_portamento()
    %note($0A, 5)
endif

    %end_track()

..ch7:

if !version == 0 || !version == 1
    %pan($92)
    %duration($BE)
    %release($10)
    %lfo($03, $01)
    %lfo($01, $46)
    %lfo($02, $19)
    %volume($42)
    %instrument($12)
    %octave($02)
    %set_dotted_note()
    %toggle_portamento()
    %note($14, 6)
    %set_dotted_note()
    %toggle_portamento()
    %note($14, 3)
    %note($00, 6)
elseif !version == 2
    %duration($96)
    %instrument($12)
    %octave($03)
    %volume($28)
    %release($18)
    %note($00, 4)
    %toggle_triplet()
    %toggle_2_octaves_up()
    %note($11, 4)
    %note($15, 4)
    %volume($32)
    %note($0E, 4)
    %note($11, 4)
    %volume($3C)
    %note($0A, 4)
    %note($0E, 4)
    %volume($46)
    %note($09, 4)
    %note($0E, 4)
    %volume($50)
    %note($0A, 4)
    %note($07, 4)
    %volume($5A)
    %note($05, 4)
    %note($0A, 4)
    %volume($64)
    %note($11, 4)
    %note($15, 4)
    %volume($6E)
    %note($0E, 4)
    %note($11, 4)
    %volume($6E)
    %note($0A, 4)
    %note($0E, 4)
    %volume($6E)
    %note($09, 4)
    %note($0E, 4)
    %volume($78)
    %note($0A, 4)
    %note($07, 4)
    %volume($78)
    %note($05, 3)
    %duration($64)
    %release($0C)
    %pan($C4)
    %toggle_triplet()
    %note($00, 5)
    %toggle_portamento()
    %note($07, 7)
    %toggle_portamento()
    %note($07, 5)
endif

    %end_track()

..ch6:

if !version == 2
    %duration($96)
    %pan($50)
    %instrument($12)
    %octave($03)
    %release($18)
    %toggle_triplet()
    %note($00, 5)
    %volume($28)
    %toggle_2_octaves_up()
    %note($11, 4)
    %note($15, 4)
    %volume($32)
    %note($0E, 4)
    %note($11, 4)
    %volume($3C)
    %note($0A, 4)
    %note($0E, 4)
    %volume($46)
    %note($09, 4)
    %note($0E, 4)
    %volume($50)
    %note($0A, 4)
    %note($07, 4)
    %volume($5A)
    %note($05, 4)
    %note($0A, 4)
    %volume($64)
    %note($11, 4)
    %note($15, 4)
    %volume($64)
    %note($0E, 4)
    %note($11, 4)
    %volume($6E)
    %note($0A, 4)
    %note($0E, 4)
    %volume($78)
    %note($09, 4)
    %note($0E, 4)
    %volume($78)
    %note($0A, 4)
    %note($07, 4)
    %duration($64)
    %pan($00)
    %set_dotted_note()
    %toggle_triplet()
    %note($00, 4)
    %toggle_portamento()
    %note($03, 7)
    %toggle_portamento()
    %note($03, 5)
endif

    %end_track()

..ch5:

if !version == 2
    %duration($64)
    %volume($78)
    %instrument($12)
    %octave($03)
    %release($0C)
    %pan($3C)
    %note($00, 7)
    %note($00, 7)
    %note($00, 4)
    %toggle_portamento()
    %note($14, 7)
    %toggle_portamento()
    %note($14, 5)
endif

    %end_track()

..ch4:

if !version == 2
    %duration($64)
    %volume($78)
    %instrument($12)
    %octave($03)
    %release($0C)
    %pan($7F)
    %note($00, 7)
    %note($00, 7)
    %volume($7F)
    %note($00, 3)
    %toggle_portamento()
    %note($13, 7)
    %toggle_portamento()
    %note($13, 5)
endif

    %end_track()

..ch3:

if !version == 2
    %duration($96)
    %instrument($12)
    %octave($04)
    %volume($14)
    %release($18)
    %toggle_triplet()
    %toggle_2_octaves_up()
    %note($11, 4)
    %note($15, 4)
    %volume($28)
    %note($0E, 4)
    %note($11, 4)
    %volume($32)
    %note($0A, 4)
    %note($0E, 4)
    %volume($3C)
    %note($09, 4)
    %note($0E, 4)
    %volume($3C)
    %note($0A, 4)
    %note($07, 4)
    %volume($46)
    %note($05, 4)
    %note($0A, 4)
    %volume($50)
    %note($11, 4)
    %note($15, 4)
    %volume($5A)
    %note($0E, 4)
    %note($11, 4)
    %volume($64)
    %note($0A, 4)
    %note($0E, 4)
    %volume($6E)
    %note($09, 4)
    %note($0E, 4)
    %volume($78)
    %note($0A, 4)
    %note($07, 4)
    %note($05, 4)
    %note($0A, 4)
    %duration($64)
    %release($0C)
    %volume($14)
    %octave($05)
    %toggle_triplet()
    %note($00, 5)
    %note($00, 2)
    %toggle_portamento()
    %note($0A, 7)
    %toggle_portamento()
    %note($0A, 5)
endif

    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
