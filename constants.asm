;!task_?    = $01 ;not ready?
!task_pause = $02
!task_ready = $04
;!task_?    = $08
!task_init  = $0C

;-----

!dmap_mode_0 = 0 ;1b | x+0
!dmap_mode_1 = 1 ;2b | x+0, x+1
!dmap_mode_2 = 2 ;2b | x+0, x+0
!dmap_mode_3 = 3 ;4b | x+0, x+0, x+1, x+1
!dmap_mode_4 = 4 ;4b | x+0, x+1, x+2, x+3

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

!obj_create = $0C
