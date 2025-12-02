namespace stage4_exit

{
create:
  lda #$04 : sta $09
  !A16
  lda.b obj.pos_x+1 : sta $39
  lda.b obj.pos_y+1 : sta $3B
  !A8
.F7CF:
  brk #$00

;----- F7D1

  lda $14D1
  bne .F7CF

  lda !armor_state
  cmp #$05
  bcs .F7CF

  jsr arthur_overlap_check_8bit_local
  bcs .F7CF

  lda #$07 : sta $0278
  lda #$04
  ldx $07
  beq .F7EF

  lda #$05
.F7EF:
  sta $1F9D
  jmp _0281A8_81B5
}

namespace off
