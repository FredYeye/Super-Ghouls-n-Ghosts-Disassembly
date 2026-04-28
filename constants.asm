;!task_?    = $01 ;not ready?
!task_pause = $02
!task_ready = $04
;!task_?    = $08
!task_init  = $0C

;-----

!obj_create  = $0C
!obj_destroy = $8C

;-----

;$0278
;!game_state_? = 0 ;intro cutscene / menu / demo
!game_state_time_over         = 6
!game_state_mosaic_transition = 7

;-----

!sub_state_intro = 0
!sub_state_menu = 1
!sub_state_demo = 2
!sub_state_menu_cancel_demo = 3
!sub_state_replay_intro = 4
!sub_state_game_start = 5

;0279 is also used for a second set of states!

;-----

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

;-----

!pi = 3.14159265359
!step = 2*!pi/128 ;used for stage 4 rotation values

;-----

