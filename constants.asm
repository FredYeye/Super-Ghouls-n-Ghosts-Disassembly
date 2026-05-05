{ ;weapon IDs
    !weapon_lance    = $00
    !weapon_knife    = $02
    !weapon_bowgun   = $04
    !weapon_scythe   = $06
    !weapon_torch    = $08
    !weapon_axe      = $0A
    !weapon_triblade = $0C ;JP name: cross sword. todo: rename? most things are based on the jp names...
    !weapon_bracelet = $0E
}

{ ;magic IDs
    !magic_thunder     = 0
    !magic_fire_dragon = 1
    !magic_seek        = 2
    !magic_shield      = 3
    !magic_lightning   = 4
    !magic_tornado     = 5
    !magic_nuclear     = 6
}

{ ;armor states
    !arthur_state_underwear = $00
    !arthur_state_steel     = $01
    ; $02 is unused
    !arthur_state_bronze    = $03
    !arthur_state_gold      = $04
    !arthur_state_baby      = $05
    !arthur_state_seal      = $06
    !arthur_state_bee       = $07
    !arthur_state_maiden    = $08

    !arthur_state_transformed = $05
}

{
    ;!task_?    = $01 ;not ready?
    !task_pause = $02
    !task_ready = $04
    ;!task_?    = $08
    !task_init  = $0C
}

{
    !obj_create  = $0C
    !obj_destroy = $8C
}

{
    ;$0278
    ;!game_state_? = 0 ;intro cutscene / menu / demo
    !game_state_time_over         = 6
    !game_state_mosaic_transition = 7
}

{
    !sub_state_intro = 0
    !sub_state_menu = 1
    !sub_state_demo = 2
    !sub_state_menu_cancel_demo = 3
    !sub_state_replay_intro = 4
    !sub_state_game_start = 5

    ;0279 is also used for a second set of states!
}

{
    !stage_1  = 0
    !stage_2  = 1
    !stage_3  = 2
    !stage_4  = 3
    !stage_4b = 4
    !stage_4c = 5
    !stage_5  = 6
    !stage_6  = 7
    !stage_7  = 8
    !stage_8  = 9
    ;todo     = 10
    ;todo     = 11
    ;todo     = 12
    ;todo     = 13
    ;todo     = 16
    ;todo     = 17
    ;todo     = 18
    ;todo     = 19
}

{
    !pi = 3.14159265359
    !step = 2*!pi/128 ;used for stage 4 rotation values
}
