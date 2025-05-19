    db $00
    dw be(..ch8), be(..ch7), be(..ch6), be(..ch5), be(..ch4), be(..ch3), be(..ch2), be(..ch1)

..ch8:

if !version == 0 || !version == 1
    %tempo($00CC)
elseif !version == 2
    %tempo($00C6)
    %note($00, 7)
endif

    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %duration($FF)
    %release($14)
    %instrument($08)
    %volume($72)
    %octave($02)
    %note($0D, 6)
    %note($00, 4)
    %duration($B4)
    %toggle_triplet()
    %note($12, 3)
    %note($0D, 3)
    %note($0B, 3)
    %toggle_triplet()
    %note($06, 5)
    %note($11, 4)
    %note($10, 4)
    %duration($FF)
    %note($0D, 6)
    %note($00, 7)
    %end_track()

..ch7:

if !version == 2
    %note($00, 7)
endif

    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %set_dotted_note()
    %note($00, 6)
    %pan($E2)
    %duration($FF)
    %release($14)
    %instrument($09)

if !version == 0 || !version == 1
    %volume($2A)
elseif !version == 2
    %volume($2E)
endif

    %octave($03)
    %note($02, 2)
    %note($06, 2)
    %note($0A, 2)
    %note($0E, 2)
    %note($12, 2)
    %note($16, 2)
    %note($1A, 2)
    %note($1E, 2)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($0E, 4)
    %note($0D, 2)
    %note($0C, 2)
    %set_dotted_note()
    %note($0A, 4)
    %note($09, 2)
    %note($08, 2)
    %set_dotted_note()
    %note($07, 5)
    %note($04, 4)
    %octave($02)

if !version == 0 || !version == 1
    %volume($40)
elseif !version == 2
    %volume($44)
endif

..3A3C:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($00, 4)
    %instrument($09)
    %duration($C0)
    %note($19, 4)
    %note($1A, 4)
    %note($1C, 4)
    %set_dotted_note()
    %note($1E, 5)
    %toggle_triplet()
    %note($12, 3)
    %note($19, 3)
    %note($1E, 3)
    %toggle_portamento()
    %note($1F, 3)
    %toggle_triplet()
    %toggle_portamento()
    %note($1F, 4)
    %toggle_triplet()
    %toggle_2_octaves_up()
    %note($09, 3)
    %note($0B, 3)
    %duration($FF)
    %toggle_triplet()
    %note($0D, 6)
    %note($00, 7)
    %end_track()

..ch6:

if !version == 0 || !version == 1
    %tuning($14)
elseif !version == 2
    %tuning($0F)
endif

    %pan($B5)
    %release($14)
    %duration($FF)
    %volume($35)
    %instrument($09)
    %octave($02)
    %note($06, 6)
    %note($0E, 6)
    %note($0A, 7)
    %note($06, 6)
    %note($0E, 6)
    %note($0A, 7)

if !version == 0 || !version == 1
    %note($06, 7)
elseif !version == 2
    %note($06, 6)
    %note($0E, 6)
    %note($0A, 7)
endif

    %tuning($00)
    %volume($28)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($15, 4)
    %note($14, 2)
    %note($13, 2)
    %set_dotted_note()
    %note($11, 4)
    %note($10, 2)
    %note($0F, 2)
    %set_dotted_note()
    %note($0E, 5)
    %note($0B, 4)
    %note($00, 4)
    %octave($03)
    %instrument($10)
    %volume($20)
    %duration($C0)
    %note($08, 4)
    %note($09, 4)
    %note($0B, 4)
    %set_dotted_note()
    %note($0D, 5)
    %toggle_triplet()
    %note($0D, 3)
    %note($0D, 3)
    %note($0D, 3)
    %toggle_portamento()
    %note($0E, 3)
    %toggle_triplet()
    %toggle_portamento()
    %note($0E, 4)
    %toggle_triplet()
    %note($10, 3)
    %note($0F, 3)
    %duration($FF)
    %toggle_triplet()
    %note($08, 6)
    %note($00, 7)
    %end_track()

..ch5:

if !version == 2
    %note($00, 7)
endif

    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %pan($4B)
    %release($14)
    %duration($FF)
    %volume($28)
    %instrument($09)
    %octave($02)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($0F, 4)
    %note($0E, 2)
    %note($0D, 2)
    %set_dotted_note()
    %note($0B, 4)
    %note($0A, 2)
    %note($09, 2)
    %set_dotted_note()
    %note($08, 5)
    %note($05, 4)
    %note($00, 4)
    %octave($03)
    %instrument($10)
    %volume($20)
    %duration($C0)
    %note($01, 4)
    %note($02, 4)
    %note($04, 4)
    %set_dotted_note()
    %note($0B, 5)
    %toggle_triplet()
    %note($0B, 3)
    %note($0B, 3)
    %note($0B, 3)
    %toggle_portamento()
    %note($0B, 3)
    %toggle_triplet()
    %toggle_portamento()
    %note($0B, 4)
    %toggle_triplet()
    %note($09, 3)
    %note($09, 3)
    %duration($FF)
    %toggle_triplet()
    %note($01, 6)
    %note($00, 7)
    %end_track()

..ch4:
    %pan($5E)
    %volume($2B)
    %release($15)
    %duration($6E)
    %instrument($0B)
    %octave($03)
..3AE9:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($1A, 3)
    %note($1E, 3)
    %toggle_2_octaves_up()
    %note($0C, 3)
    %note($0E, 3)
    %note($12, 3)
    %note($18, 3)
    %note($16, 3)
    %note($06, 3)
    %loop(0, 9, ..3AE9)

if !version == 2
    %octave($04)
endif

    %duration($FF)
    %instrument($0E)

if !version == 0 || !version == 1
    %volume($5A)
elseif !version == 2
    %volume($46)
endif

..3AFE:
    %toggle_triplet_portamento_2_octave_up($28)
    %note($0E, 2)
    %note($0F, 2)
    %loop(0, 9, ..3AFE)
    %note($0E, 2)
    %note($0C, 2)
    %note($0B, 2)
    %note($0A, 2)
..3B0A:
    %toggle_triplet_portamento_2_octave_up($20)
    %note($1A, 2)
    %note($1B, 2)
    %loop(0, 11, ..3B0A)
    %toggle_triplet()
    %note($00, 6)
    %note($00, 4)

if !version == 2
    %octave($03)
endif

    %instrument($05)
    %volume($25)
    %toggle_triplet()
    %note($1E, 3)
    %note($19, 3)
    %note($15, 3)
..3B1D:
    %toggle_triplet_portamento_2_octave_up($20)
    %note($12, 2)
    %loop(0, 11, ..3B1D)
    %toggle_triplet()
    %note($11, 4)
    %toggle_triplet()
    %note($00, 3)
    %note($10, 3)
    %note($0F, 3)
    %instrument($0E)

if !version == 0 || !version == 1
    %volume($5A)
elseif !version == 2
    %volume($50)
endif

..3B2E:
    %toggle_triplet_portamento_2_octave_up($28)
    %note($0D, 2)
    %note($0E, 2)
    %loop(0, 11, ..3B2E)
    %end_track()

..ch3:
    %pan($81)

if !version == 0 || !version == 1
    %volume($0A)
elseif !version == 2
    %volume($0F)
endif

    %duration($6E)
    %instrument($0B)
    %octave($03)
    %note($00, 2)
..3B42:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($1A, 3)
    %note($1E, 3)
    %toggle_2_octaves_up()
    %note($0C, 3)
    %note($0E, 3)
    %note($12, 3)
    %note($18, 3)
    %note($16, 3)
    %note($06, 3)
    %loop(0, 9, ..3B42)
    %end_track()

..ch2:

if !version == 2
    %note($00, 7)
endif

    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %note($00, 7)
    %octave($03)
    %volume($0C)
    %goto(..3A3C)
    %end_track()

..ch1:
    %end_track()
