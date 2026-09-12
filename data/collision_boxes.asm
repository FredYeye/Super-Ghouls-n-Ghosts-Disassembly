{ ;DAA2 - DC1D
_00DAA2:
    ;hitboxes for collision with arthur
    ;starts on obj id $20

    db $02, $03
    db $08, $1C
    db $08, $08
    db $08, $08
    db $00, $00
    db $04, $1C
    db $00, $00
    db $30, $20
    db $00, $00
    db $04, $02 ;flower part
    db $18, $18
    db $18, $18
    db $08, $08
    db $00, $00
    db $00, $00
    db $0C, $0C ;shell
    db $03, $03 ;shell pearl
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $08 ;belial
    db $06, $06
    db $08, $10
    db $06, $06 ;hydra fireball
    db $00, $00
    db $05, $05 ;rosebud uses other values, see below
    db $04, $02
    db $01, $08 ;bars
    db $0A, $0A ;eagler
    db $18, $08
    db $0D, $08 ;chest
    db $08, $10 ;magician
    db $02, $08 ;armor item
    db $07, $08 ;weapon item
    db $06, $06 ;shield item
    db $08, $03 ;trap
    db $10, $10 ;magician orb
    db $00, $00
    db $00, $00
    db $06, $08 ;point statue
    db $10, $10 ;stage 4 exit
    db $16, $04 ;raft pulley
    db $08, $10 ;zombie
    db $00, $F0
    db $00, $F0
    db $00, $F0
    db $03, $03 ;flower projectile
    db $00, $00
    db $08, $08 ;icicle
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $10 ;siren
    db $06, $04 ;flying killer
    db $0A, $0A ;hydra
    db $0C, $0C ;hydra genie
    db $06, $08 ;key
    db $00, $00
    db $00, $00
    db $07, $09 ;guillotine
    db $00, $00
    db $0A, $0C ;ghost
    db $00, $00
    db $06, $06 ;flower head
    db $08, $70 ;cockatrice legs
    db $06, $00 ;cockatrice neck
    db $18, $10 ;cockatrice head
    db $03, $03 ;siren projectile
    db $00, $00
    db $0A, $0A ;miniwing
    db $18, $10 ;cockatrice wings
    db $00, $00 ;cockatrice body
    db $06, $06 ;skulls
    db $0A, $0A ;moneybag
    db $08, $08 ;mimic
    db $08, $04 ;mimic ghost
    db $06, $06 ;hannibal
    db $08, $03 ;storm cesaris projectile
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $0B ;wolf
    db $48, $1C ;pier
    db $00, $00 ;rosebud chunk
    db $08, $08
    db $0D, $0D ;storm cesaris
    db $0D, $0D ;storm cesaris parts
    db $04, $08 ;flying knight
    db $00, $F8
    db $08, $08 ;bat
    db $08, $08 ;chest2
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $14, $18 ;grilian
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $0A, $0A ;gargoyle statue
    db $06, $06 ;grilian projectile
    db $00, $00
    db $04, $04 ;skull flower multi
    db $00, $00 ;arremer projectile
    db $0A, $0D ;arremer
    db $00, $00
    db $00, $00
    db $08, $08 ;death crawler part
    db $08, $08 ;death crawler
    db $00, $00
    db $06, $40 ;geyser
    db $08, $08
    db $20, $08
    db $06, $06 ;killer
    db $08, $08 ;tiny goblin
    db $00, $00
    db $00, $00
    db $02, $02 ;hannibal projectile
    db $05, $05 ;coral
    db $00, $00
    db $00, $00
    db $02, $02 ;arremer killers
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00 ;lava
    db $10, $16 ;astaroth
    db $10, $16 ;nebiroth
    db $00, $00
    db $00, $00
    db $08, $0A ;cockatrice head 2
    db $00, $00
    db $0B, $0B ;mad dog
    db $06, $06 ;astaroth flame
    db $02, $02 ;astaroth laser
    db $00, $00
    db $10, $10 ;ice bridge segment
    db $00, $00
    db $00, $00
    db $04, $04 ;death crawler projectile
    db $0C, $0C ;death crawler head?
    db $04, $04 ;cockatrice head 2 projectile
    db $20, $18 ;veil allocen
    db $30, $30
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $08 ;veil allocen claw 1
    db $10, $08 ;veil allocen claw 2
    db $00, $00
    db $06, $06 ;nebiroth flame
    db $00, $00
    db $00, $00
    db $04, $04 ;freeze splinter
    db $18, $1D ;astaroth / nebiroth body
    db $00, $00
    db $10, $10 ;samael
    db $10, $02 ;samael platform
    db $02, $02 ;samael laser

.DBEA:
    db $00, $00, $00, $00, $0B, $0B, $10, $10 ;rosebud
    db $08, $08, $10, $10, $10, $20 ;todo: what uses this?
    db $04, $04, $08, $08, $0C, $0C, $05, $08 ;lava pillar
    db $05, $10, $05, $18, $05, $20, $20, $08, $18, $08 ;todo ?
    db $04, $10, $08, $10, $0C, $10, $10, $10, $14, $10, $18, $10, $1C, $10, $20, $10, $24, $10 ;nebiroth laser, every other hitbox is unused though
    db $0C, $0C ;rosebud chunk
}

{ ;DC1E - DD93
weapon_collision_boxes:
    ;object hitboxes for weapon collision checking, starts on obj id $20
    db $30, $30
    db $08, $1C
    db $08, $08
    db $08, $08
    db $00, $00
    db $04, $1C
    db $00, $00
    db $06, $20
    db $00, $00
    db $00, $00 ;flower part
    db $18, $18
    db $18, $18
    db $08, $08
    db $00, $00
    db $00, $00
    db $10, $10 ;shell
    db $00, $00 ;shell pearl
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $08 ;belial
    db $06, $06
    db $08, $10
    db $08, $08
    db $00, $00
    db $00, $00 ;rosebud uses other values, see below
    db $04, $02
    db $01, $08
    db $10, $08 ;eagler
    db $00, $00
    db $0C, $0A ;chest
    db $08, $10 ;magician
    db $00, $00
    db $00, $00
    db $00, $00
    db $0D, $04
    db $10, $10
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $10 ;zombie
    db $00, $F0
    db $00, $F0
    db $00, $F0
    db $00, $00
    db $00, $00
    db $08, $08 ;icicle
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $18 ;siren
    db $10, $0B ;flying killer
    db $10, $12 ;hydra
    db $10, $0B ;hydra genie
    db $00, $00
    db $00, $00
    db $00, $00
    db $07, $09 ;guillotine
    db $00, $00
    db $12, $12 ;ghost
    db $00, $00
    db $09, $09 ;flower head
    db $10, $30 ;cockatrice legs
    db $08, $08 ;cockatrice neck
    db $10, $20 ;cockatrice head
    db $03, $03 ;siren projectile
    db $00, $00
    db $0C, $10 ;miniwing
    db $20, $30 ;cockatrice wings
    db $30, $10
    db $06, $06
    db $00, $00
    db $0C, $0C ;mimic
    db $08, $04 ;mimic ghost
    db $0C, $0C ;hannibal
    db $04, $04
    db $00, $00
    db $00, $00
    db $00, $00
    db $08, $0B ;wolf
    db $00, $00
    db $00, $00
    db $08, $08
    db $10, $10 ;storm cesaris
    db $10, $10
    db $04, $08 ;flying knight
    db $00, $F8
    db $08, $08 ;bat
    db $08, $08 ;chest 2
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $15, $18 ;grilian
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $0C, $0C ;gargoyle statue
    db $00, $00
    db $00, $00
    db $06, $06 ;skull flower multi
    db $00, $00
    db $0A, $0C ;arremer
    db $00, $00
    db $00, $00
    db $08, $08 ;death crawler part
    db $08, $08 ;death crawler
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $07, $07 ;killer
    db $0A, $0A ;tiny goblin
    db $00, $00
    db $00, $00
    db $02, $02
    db $06, $0A ;coral
    db $00, $00
    db $00, $00
    db $03, $03 ;arremer killers
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $10 ;astaroth
    db $10, $10 ;nebiroth
    db $00, $00
    db $00, $00
    db $0F, $0F ;cockatrice head 2
    db $00, $00
    db $0B, $0B ;mad dog
    db $06, $06
    db $02, $02
    db $00, $00
    db $08, $08
    db $08, $08
    db $00, $00
    db $04, $04
    db $0C, $0C ;death crawler head?
    db $08, $08
    db $10, $10
    db $10, $10 ;veil allocen part
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $00, $00
    db $10, $0A ;veil allocen claw 1
    db $10, $0A ;veil allocen claw 2
    db $00, $00
    db $06, $06
    db $00, $00
    db $00, $00
    db $00, $00
    db $18, $1D ;astaroth / nebiroth body
    db $00, $00
    db $10, $10 ;samael
    db $00, $00 ;samael platform
    db $02, $02 ;samael laser

.DD66:
    db $00, $00, $00, $00, $08, $08, $10, $10 ;rosebud
    db $08, $08, $10, $10, $10, $20, $05, $08, $05, $10, $05, $18 ;todo: don't know what these are
    db $05, $20, $10, $10, $14, $12 ;lava pillar
    db $14, $16, $14, $32, $10, $30, $10, $60 ;todo: don't know what these are
    db $0B, $22 ;stone pillar
    db $0B, $2A ;stone pillar 2
    db $0B, $20, $0B, $14 ;todo: don't know what these are
    db $18, $08, $20, $18 ;veil allocen
}

{ ;DD94 - DD95
_00DD94: db $10, $20 ;todo: unused? most likely connected to DD96?
}

{ ;DD96 - DDAD
_00DD96: ;byte pairs, stone/lava pillar sizes
    db $14, $28
    db $14, $30
    db $14, $30
    db $10, $18
    db $10, $30
    db $14, $36 ;pillar 1
    db $14, $3E ;pillar 2, 3
    db $14, $30
    db $14, $28
    db $18, $18

    ;lava pillars
    db $0F, $28
    db $0F, $30
}

{ ;DDAE - DDB1
    db $40, $18, $30, $18 ;unused? possibly stone/lava pillar sizes
}

{ ;DDB2 - DDD5
shield_hitboxes:
    db $0C, $1C
    db $08, $18
    db $08, $18
    db $08, $18
    db $14, $24
    db $08, $18
    db $08, $18
    db $18, $18
    db $10, $14
    db $08, $14
    db $0C, $0C
    db $0C, $0C
    db $18, $18
    db $08, $16
    db $08, $15
    db $10, $14
    db $10, $0C
    db $14, $24
}
