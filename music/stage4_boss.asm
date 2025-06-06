    db $00
    dw be(..ch8), be(..ch7), be(..ch6), be(..ch5), be(..ch4), be(..ch3), be(..ch2), be(..ch1)

..ch8:
    %tempo($0155)
    %duration($F5)
    %release($15)
    %volume($7D)
    %instrument($08)
    %octave($02)
    %toggle_portamento()
    %note($0F, 6)
    %note($0F, 4)
    %tempo($010B)
    %set_dotted_note()
    %toggle_portamento()
    %note($0F, 5)
    %tempo($0155)
..2F7A:
    %toggle_triplet_portamento_2_octave_up($00)
..2F7C:
    %toggle_triplet_portamento_2_octave_up($00)
    %duration($C8)
    %note($08, 3)
    %note($0A, 3)
    %note($0B, 3)
    %note($12, 3)
    %note($11, 3)
    %note($0D, 3)
    %note($0B, 3)
    %note($05, 3)
    %note($06, 3)
    %note($05, 3)
    %note($06, 3)
    %note($07, 3)
    %loop(0, 5, ..2F7C)
..2F90:
    %toggle_triplet_portamento_2_octave_up($00)
..2F92:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($0F, 3)
    %note($10, 3)
    %note($0F, 3)
    %note($16, 3)
    %note($12, 3)
    %note($13, 3)
    %note($12, 3)
    %note($10, 3)
    %note($0F, 3)
    %note($10, 3)
    %note($0F, 3)
    %note($12, 3)
    %loop(0, 1, ..2F92)
    %loop_break(1, 0, ..2FBE)
..2FA8:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($08, 3)
    %note($0A, 3)
    %note($0B, 3)
    %note($12, 3)
    %note($11, 3)
    %note($0D, 3)
    %note($0B, 3)
    %note($05, 3)
    %note($06, 3)
    %note($05, 3)
    %note($06, 3)
    %note($07, 3)
    %loop(0, 3, ..2FA8)
    %loop(1, 1, ..2F90)
..2FBE:
    %goto(..2F7A)
    %end_track()

..ch7:
    %tuning($DD)
    %pan($46)
    %duration($DC)
    %release($10)
    %volume($2E)
    %instrument($09)
    %octave($02)
    %toggle_2_octaves_up()
    %note($08, 4)
    %note($06, 4)
    %set_dotted_note()
    %note($05, 5)
    %note($06, 4)
    %note($08, 4)
    %note($09, 4)
..2FD8:
    %toggle_triplet_portamento_2_octave_up($08)
    %octave($02)
    %note($08, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($09, 4)
    %note($08, 3)
    %set_dotted_note()
    %note($00, 6)
    %note($08, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($07, 4)
    %note($06, 3)
    %set_dotted_note()
    %note($00, 6)
    %note($08, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($0B, 4)
    %note($0A, 3)
    %set_dotted_note()
    %note($00, 6)
    %set_dotted_note()
    %note($04, 4)
    %note($03, 3)
    %set_dotted_note()
    %note($07, 5)
    %note($00, 3)
    %note($06, 3)
    %set_dotted_note()
    %note($0A, 4)
    %note($09, 3)
    %note($0E, 3)
    %set_dotted_note()
    %note($0D, 4)
    %note($13, 3)
    %set_dotted_note()
    %note($12, 4)
    %pan($AB)
    %octave($03)
    %volume($28)
    %note($00, 5)
    %toggle_2_octaves_up()
    %note($14, 3)
    %note($16, 3)
    %note($17, 3)
    %note($1E, 3)
    %set_dotted_note()
    %note($1D, 4)
    %note($19, 3)
    %set_dotted_note()
    %note($1C, 4)
    %note($1E, 3)
    %note($1B, 6)
    %note($00, 5)
    %note($14, 3)
    %note($16, 3)
    %note($17, 3)
    %note($1E, 3)
    %set_dotted_note()
    %note($1D, 4)
    %note($19, 3)
    %note($1C, 4)
    %note($19, 3)
    %note($1C, 3)
    %note($1B, 6)
    %pan($46)
    %volume($30)
    %note($03, 3)
    %note($08, 3)
    %note($0D, 3)
    %note($0A, 3)
    %note($0F, 3)
    %note($14, 3)
    %note($0D, 3)
    %note($12, 3)
    %note($17, 3)
    %note($0F, 3)
    %note($14, 3)
    %note($19, 3)
    %note($16, 3)
    %note($1B, 3)
    %toggle_2_octaves_up()
    %note($08, 3)
    %note($01, 3)
    %note($06, 3)
    %note($0B, 3)
    %note($03, 3)
    %note($08, 3)
    %note($0D, 3)
    %note($06, 3)
    %note($0D, 3)
    %note($0F, 3)
    %goto(..2FD8)
    %end_track()

..ch6:
    %tuning($DD)
    %pan($BA)
    %duration($DC)
    %release($10)
    %volume($30)
    %instrument($09)
    %octave($02)
    %note($1D, 4)
    %note($1B, 4)
    %set_dotted_note()
    %note($1A, 5)
    %note($1B, 4)
    %note($1D, 4)
    %note($1E, 4)
..3059:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($1B, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($1E, 4)
    %note($1D, 3)
    %set_dotted_note()
    %note($00, 6)
    %note($1B, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($1C, 4)
    %note($1B, 3)
    %set_dotted_note()
    %note($00, 6)
    %note($1B, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($1A, 4)
    %note($19, 3)
    %set_dotted_note()
    %note($00, 6)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($0A, 4)
    %note($09, 3)
    %note($0D, 5)
    %set_dotted_note()
    %note($00, 4)
    %note($0C, 3)
    %set_dotted_note()
    %note($10, 4)
    %note($0F, 3)
    %note($14, 3)
    %set_dotted_note()
    %note($13, 4)
    %note($18, 3)
    %set_dotted_note()
    %note($17, 4)
    %note($00, 7)
    %note($00, 6)
    %tuning($FB)
    %lfo($00, $01)
    %lfo($02, $3C)
    %pan($3C)
    %volume($20)
    %instrument($0C)
    %note($03, 3)
    %note($05, 3)
    %note($06, 3)
    %note($0F, 3)
    %set_dotted_note()
    %note($0E, 4)
    %note($0B, 3)
    %note($0D, 4)
    %note($0A, 3)
    %note($0D, 3)
    %set_dotted_note()
    %note($0B, 6)
    %tuning($00)
    %pan($BA)
    %volume($2E)
    %instrument($09)
    %toggle_2_octaves_up()
    %note($0A, 3)
    %note($0F, 3)
    %note($14, 3)
    %note($0F, 3)
    %note($14, 3)
    %note($16, 3)
    %note($14, 3)
    %note($19, 3)
    %note($1E, 3)
    %note($16, 3)
    %note($1B, 3)
    %toggle_2_octaves_up()
    %note($08, 3)
    %note($03, 3)
    %note($08, 3)
    %note($0D, 3)
    %note($08, 3)
    %note($0D, 3)
    %note($12, 3)
    %note($0A, 3)
    %note($0F, 3)
    %note($14, 3)
    %note($0D, 3)
    %note($12, 3)
    %note($14, 3)
    %goto(..3059)
    %end_track()

..ch5:
    %pan($00)
    %duration($DC)
    %release($10)
    %volume($30)
    %instrument($09)
    %octave($02)
    %note($17, 4)
    %note($15, 4)
    %set_dotted_note()
    %note($14, 5)
    %note($15, 4)
    %note($17, 4)
    %note($18, 4)
..30D9:
    %toggle_triplet_portamento_2_octave_up($00)
    %volume($2E)
    %instrument($09)
    %note($14, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($18, 4)
    %note($17, 3)
    %set_dotted_note()
    %note($00, 6)
    %note($14, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %note($16, 4)
    %note($15, 3)
    %set_dotted_note()
    %note($00, 6)
    %note($14, 4)
    %note($00, 4)
    %note($00, 5)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($08, 4)
    %note($07, 3)
    %note($00, 7)
    %note($00, 7)
    %note($00, 5)
    %volume($33)
    %instrument($0F)
    %octave($03)
..30FF:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($14, 5)
    %toggle_2_octaves_up()
    %note($08, 6)
    %toggle_2_octaves_up()
    %note($14, 5)
    %note($14, 3)
    %note($16, 3)
    %note($17, 3)
    %note($1E, 3)
    %note($1D, 5)
    %loop(0, 1, ..30FF)
    %set_dotted_note()
    %toggle_portamento()
    %note($19, 6)
    %toggle_portamento()
    %note($1B, 6)
    %toggle_2_octaves_up()
    %note($0F, 5)
    %octave($02)
    %goto(..30D9)
    %end_track()

..ch4:
    %note($00, 7)
..311D:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($00, 5)
    %pan($CE)
    %duration($FA)

if !version == 0 || !version == 1
    %volume($5C)
    %instrument($0E)
    %octave($03)
elseif !version == 2
    %volume($46)
    %instrument($0E)
    %octave($04)
endif

    %toggle_2_octaves_up()
    %note($08, 3)
    %note($0A, 3)
    %note($0B, 3)
    %note($12, 5)
    %note($11, 6)
    %note($00, 3)
    %note($11, 3)
    %note($00, 3)
    %note($0D, 3)
    %note($11, 5)
    %note($10, 5)
    %note($00, 3)
    %note($10, 3)
    %note($00, 3)
    %note($0D, 3)
    %note($10, 3)
    %set_dotted_note()
    %note($0F, 6)
    %note($00, 5)
    %note($08, 3)
    %note($0A, 3)
    %note($0B, 3)
    %note($12, 5)
    %note($11, 6)
    %note($00, 3)
    %note($11, 5)
    %note($10, 5)
    %note($0F, 5)
    %note($0D, 5)
    %note($0A, 5)
    %note($07, 5)
    %note($03, 5)
    %pan($3C)
    %volume($26)
    %instrument($0C)
    %octave($03)
    %lfo($00, $01)
    %lfo($02, $3C)
    %tuning($F8)
..315B:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($14, 3)
    %note($16, 3)
    %note($17, 3)
    %note($1E, 3)
    %set_dotted_note()
    %note($1D, 4)
    %note($19, 3)
    %note($1C, 3)
    %note($00, 3)
    %note($19, 3)
    %note($1C, 3)
    %set_dotted_note()
    %note($1B, 6)
    %loop(0, 1, ..315B)
    %note($00, 7)
    %note($00, 6)
    %goto(..311D)
    %end_track()

..ch3:
    %note($00, 7)
    %tuning($0F)
    %duration($D2)
    %volume($47)
    %instrument($0F)
    %octave($02)
..317F:
    %toggle_triplet_portamento_2_octave_up($00)
    %set_dotted_note()
    %note($00, 6)
..3183:
    %toggle_triplet_portamento_2_octave_up($00)
    %note($00, 5)
    %toggle_2_octaves_up()
    %note($0F, 5)
    %note($06, 5)
    %loop_break(0, 8, ..3194)
    %toggle_2_octaves_up()
    %note($14, 5)
    %note($00, 6)
    %loop(0, 2, ..3183)
..3194: %toggle_triplet_portamento_2_octave_up($00)
    %set_dotted_note()
    %note($00, 6)
    %loop(0, 7, ..3194)
    %goto(..317F)
    %end_track()

..ch2:
    %end_track()

..ch1:
    %end_track()
