{
hp_list: ;hp per difficulty for obj IDs $20-$FF
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 4, 4, 4, 4 ;shell
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 10, 10, 10, 10 ;rosebud
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;eagler
elseif !version == 2
    db 6, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 13, 13, 13, 13 ;chest
    db 0, 0, 0, 0 ;magician
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 1, 1, 1, 1
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 1, 1, 1, 1 ;zombie
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;icicle
elseif !version == 2
    db 4, 8, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;siren
elseif !version == 2
    db 4, 6, 12, 10 ;has more hp in expert than professional!
endif
    db 1, 1, 1, 1 ;flying killer
if !version == 0 || !version == 1
    db 60, 70, 75, 80 ;hydra
elseif !version == 2
    db 60, 70, 95, 105
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 5, 5, 5, 5 ;$5D, unused obj
    db 2, 2, 2, 2 ;ghost
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;flower head
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 160, 170, 179, 184 ;cockatrice head
elseif !version == 2
    db 120, 150, 179, 184
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0 ;cockatrice body
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 10, 10, 10, 10 ;mimic
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 17, 17, 17, 17 ;hannibal
elseif !version == 2
    db 4, 6, 12, 17
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;wolf
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 139, 149, 155, 160 ;storm cesaris
elseif !version == 2
    db 110, 135, 155, 160
endif
    db 0, 0, 0, 0
    db 5, 5, 5, 5
    db 5, 5, 5, 5
    db 0, 0, 0, 0 ;bat
    db 13, 13, 13, 13 ;chest2
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 29, 35, 35, 35 ;grilian
elseif !version == 2
    db 6, 12, 18, 35
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;gargoyle statue
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 17, 17, 17, 17 ;skull flower multi
elseif !version == 2
    db 4, 6, 12, 17
endif
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 18, 29, 29, 29 ;arremer
    db 17, 17, 17, 17
elseif !version == 2
    db 12, 18, 29, 29
    db 4, 6, 12, 17
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 150, 170, 179, 185 ;death crawler
elseif !version == 2
    db 110, 150, 179, 185
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 2, 2, 2, 2
if !version == 0 || !version == 1
    db 5, 5, 5, 5 ;tiny goblin
elseif !version == 2
    db 4, 4, 4, 4
endif
    db 0, 0, 0, 0
    db 23, 23, 23, 23
    db 0, 0, 0, 0
    db 10, 10, 10, 10
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 10, 10, 10, 10
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 119, 129, 139, 149 ;astaroth
    db 180, 190, 209, 219 ;nebiroth
elseif !version == 2
    db 80, 90, 100, 110
    db 90, 100, 110, 120
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 60, 60, 60, 60 ;cockatrice head 2
elseif !version == 2
    db 30, 30, 30, 30
endif
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 10, 10, 10, 10 ;mad dog
elseif !version == 2
    db 4, 6, 10, 10
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 160, 170, 175, 180 ;veil allocen
elseif !version == 2
    db 100, 130, 150, 180
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
if !version == 0 || !version == 1
    db 180, 200, 224, 255 ;samael
elseif !version == 2
    db 150, 170, 190, 210
endif
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0
    db 0, 0, 0, 0

    fillbyte $00 : fill 232
}
