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
    %end_track()

..ch2:
    %tempo($0200)
    %duration($5A)
    %volume($34)
    %octave($04)
    %release($10)
    %instrument($11)
    %note($11, 4)
    %note($18, 4)
    %note($1F, 4)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($0E, 4)
    %volume($0E)
    %set_dotted_note()
    %note($0E, 4)
    %volume($05)
    %note($0E, 4)
    %end_track()

..ch1:
    %tempo($0200)
    %duration($5A)
    %volume($2A)
    %octave($04)
    %release($10)
    %instrument($11)
    %note($00, 3)
    %note($14, 4)
    %note($1B, 4)
    %set_dotted_note()
    %toggle_2_octaves_up()
    %note($0A, 4)
    %volume($0E)
    %set_dotted_note()
    %note($0A, 4)
    %volume($05)
    %note($0A, 4)
    %end_track()
