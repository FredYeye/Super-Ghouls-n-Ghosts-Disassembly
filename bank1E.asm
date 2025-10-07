org $1E8000

{ ;8000 - F3D7
stage1_earthquake_tiles:
	;tiles to place in stage 1 earthquakes

	;count (amount of times to update terrain per earthquake)
	;count
	;tile count, offset into tilemap, tiles

.1: ;8000
	db $08

	db $08
	db $01 : dw $06F8 : dw $1E60
	db $05 : dw $05FA : dw $1E03, $1E21, $1E31, $1E41, $1E61
	db $06 : dw $05BC : dw $1D40, $1E83, $1D08, $1EB2, $1EC8, $1E5B
	db $07 : dw $057E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E66, $1C00
	db $07 : dw $0D40 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1E66, $1C00
	db $06 : dw $0D82 : dw $5CAA, $5E92, $5D08, $5EB2, $5E56, $5E5B
	db $01 : dw $0EC4 : dw $5E61
	db $01 : dw $0EC6 : dw $5E60

	db $0B
	db $05 : dw $05F6 : dw $5E8B, $1E21, $1E31, $1E41, $5E56
	db $06 : dw $05B8 : dw $1D4A, $1E1E, $1D00, $1EB8, $5E56, $1E7F
	db $05 : dw $05FA : dw $1E1F, $1EA9, $1EB9, $1E66, $9E63
	db $05 : dw $05FC : dw $1E2A, $1D04, $1E48, $5E60, $9E64
	db $07 : dw $057E : dw $1E0B, $1E1B, $1E2B, $1E3B, $1E49, $1E6A, $9E65
	db $06 : dw $0D40 : dw $5E0B, $5E1B, $5E2B, $5E3B, $5E49, $5E6A
	db $07 : dw $0D42 : dw $5E0A, $5CA8, $5E2A, $5D04, $5E48, $5E60, $1E65
	db $06 : dw $0D84 : dw $5E81, $5E91, $5EA1, $5EB1, $1E66, $DE64
	db $06 : dw $0D86 : dw $5C6E, $5E90, $5CEC, $5EB0, $5E56, $1E7F
	db $06 : dw $0D88 : dw $5E89, $5E99, $5EA9, $5EB9, $1EC8, $5E56
	db $06 : dw $0D8A : dw $5C82, $5E98, $5D00, $5EB8, $1EC9, $1ED9

	db $0E
	db $06 : dw $05B4 : dw $1C40, $1E9C, $1CE6, $1EBC, $1ECC, $5E56
	db $05 : dw $05F6 : dw $1E8F, $1EAD, $1EBD, $5E56, $1E7F
	db $06 : dw $05B8 : dw $1D40, $1E90, $1D06, $1E4C, $1E68, $9E62
	db $05 : dw $05BA : dw $1E09, $1E91, $1E3F, $1E4D, $1E63
	db $05 : dw $05BC : dw $1D4C, $1E24, $1D02, $1E44, $1E62
	db $07 : dw $057E : dw $1E05, $1E15, $1E25, $1E35, $1E45, $1E66, $1C00
	db $06 : dw $0D40 : dw $5E07, $5E17, $5E27, $5E37, $5E45, $1E7D
	db $07 : dw $0D42 : dw $5E06, $5CA6, $5E26, $5D02, $5E44, $1E61, $1C00
	db $06 : dw $0D44 : dw $1E08, $1C6A, $1E28, $1D0E, $1E48, $5E69
	db $06 : dw $0D46 : dw $1E09, $1E19, $1E29, $1E39, $1E49, $5E67
	db $06 : dw $0D48 : dw $5E0B, $5E1B, $5E2B, $5E3B, $1E48, $1E58
	db $07 : dw $0D4A : dw $5E0A, $5CA8, $5E2A, $5D04, $1E49, $1E49, $1E59
	db $07 : dw $0D4C : dw $5E79, $5E89, $5E99, $5EA9, $5EB9, $5EC9, $5ED9
	db $07 : dw $0D4E : dw $5E78, $5C82, $5E98, $5D00, $5EB8, $5EC8, $5ED8
	
	db $10
	db $05 : dw $05B4 : dw $1D40, $1E92, $1D08, $1EB2, $1EC0
	db $04 : dw $05B6 : dw $1E8E, $1E93, $1EA3, $1EB3
	db $05 : dw $0578 : dw $1E08, $1C8C, $1EA2, $1D0A, $5ED5
	db $06 : dw $057A : dw $1E03, $1E93, $1EA3, $1EB3, $5ED4, $1E7D
	db $07 : dw $057C : dw $1E00, $1C46, $1E30, $1D0A, $1E50, $1E7D, $9E63
	db $07 : dw $053E : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E60
	db $07 : dw $0D00 : dw $5E01, $5E11, $5E21, $5E31, $1D0A, $1E50, $1E60
	db $06 : dw $0D02 : dw $5E00, $5E10, $5C46, $5E30, $1E41, $1E51
	db $07 : dw $0D04 : dw $1E73, $5E83, $5E93, $5EA3, $1D0A, $5ED5, $5E61
	db $06 : dw $0D46 : dw $5E82, $5C8C, $5EA2, $1EB3, $5ED4, $5E60
	db $05 : dw $0D48 : dw $5E07, $5E17, $5E27, $5E37, $5ECD
	db $07 : dw $0D4A : dw $5E06, $5CA6, $5E26, $5D02, $5E44, $5E44, $5E54
	db $07 : dw $0D4C : dw $5E75, $5E85, $5E95, $5EA5, $5EB5, $5EC5, $5ED5
	db $07 : dw $0D4E : dw $5E74, $5C80, $5E94, $5CEE, $5EB4, $5EC4, $5ED4
	db $05 : dw $0DD0 : dw $1E9C, $1C04, $1E30, $1ECC, $1EDC
	db $06 : dw $0D92 : dw $1E8D, $1E9D, $1E21, $1EBD, $1ECD, $1EDD

	db $12
	db $04 : dw $05B0 : dw $1C82, $1E98, $1D00, $1EB8
	db $04 : dw $05B2 : dw $1E89, $1E99, $1EA9, $1EB9
	db $05 : dw $0574 : dw $1E70, $1C6E, $1E90, $1CEC, $1EB0
	db $06 : dw $05B6 : dw $1E06, $1E91, $1EA1, $1EB1, $1E60, $5E7F
	db $06 : dw $0578 : dw $1C00, $1D4E, $1EAE, $1D0E, $1E50, $1E61
	db $05 : dw $057A : dw $1C00, $1E85, $1EAF, $1EBF, $1E51
	db $07 : dw $057C : dw $1E0B, $1C4A, $1E3C, $1D0A, $1E56, $1E7D, $9E64
	db $07 : dw $053E : dw $5E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1E56, $9E64
	db $07 : dw $0D00 : dw $1E08, $1E18, $1C08, $1E38, $1D0A, $1E60, $1C00
	db $07 : dw $0D02 : dw $1E09, $1E19, $1E29, $1E39, $1E49, $1E61, $1C00
	db $07 : dw $0D04 : dw $5E0D, $5E1D, $5E2D, $5E3D, $1D0A, $5E68, $1C00
	db $07 : dw $0D06 : dw $5E0C, $5E1C, $5C4A, $5E3C, $1E41, $5E56, $1E63
	db $06 : dw $0D08 : dw $5E73, $5E83, $5E93, $5EA3, $1D0A, $1EC0
	db $06 : dw $0D0A : dw $5E72, $5E82, $5C8C, $5EA2, $5EB2, $1EC1
	db $05 : dw $0D4C : dw $5E0B, $5E1B, $5E2B, $5E3B, $5E49
	db $05 : dw $0D4E : dw $1C00, $5CA8, $5E2A, $5D04, $5E48
	db $05 : dw $0D50 : dw $5E7B, $5E8B, $5E9B, $5EAB, $5EBB
	db $04 : dw $0D92 : dw $5C82, $5E9A, $5D00, $5EBA

	db $0D
	db $04 : dw $0574 : dw $1E02, $1CCE, $1E22, $1D0C
	db $03 : dw $05B6 : dw $1E8B, $1E23, $1E33
	db $04 : dw $0578 : dw $1E01, $1CAE, $1E32, $1D0A
	db $04 : dw $057A : dw $1E8F, $1E23, $1E33, $1E41
	db $05 : dw $053C : dw $1D40, $1E92, $1D08, $5EB2, $1E40
	db $05 : dw $053E : dw $1E83, $1E93, $1EA3, $5EB3, $1E41
	db $05 : dw $0D00 : dw $1C2C, $1E90, $1CE0, $1EB0, $1EC0
	db $05 : dw $0D02 : dw $1E81, $1E91, $1EA1, $1EB1, $1EC1
	db $04 : dw $0D04 : dw $5E83, $5E93, $5EA3, $5EB3
	db $08 : dw $0D06 : dw $5CAC, $5E92, $5D08, $5EB2, $1E5D, $5E56, $1E63, $DE63
	db $08 : dw $0D08 : dw $5E03, $5E13, $5E23, $5E33, $1D0A, $1E50, $5E43, $1E7F
	db $06 : dw $0D0A : dw $5E02, $5E12, $5CAE, $5E32, $1E41, $1E51
	db $01 : dw $0D4E : dw $5E0A

	db $12
	db $04 : dw $05B0 : dw $1CAC, $1E92, $1D08, $1EB2
	db $04 : dw $05B2 : dw $1E83, $1E93, $1EA3, $1EB3
	db $05 : dw $0574 : dw $1E06, $1CA6, $1E26, $1D02, $1E44
	db $03 : dw $05F6 : dw $1E27, $1E37, $1E45
	db $01 : dw $0678 : dw $1ECC
	db $05 : dw $057A : dw $1E07, $1E23, $1E33, $1E41, $1E56
	db $07 : dw $053C : dw $1D4A, $1E82, $1D00, $1EBA, $1EC8, $1E56, $1E5B
	db $08 : dw $04FE : dw $1E7B, $1E8B, $1E9B, $1EAB, $1EBB, $1EC9, $1E6A, $1C00
	db $07 : dw $0CC0 : dw $1E78, $1C40, $1E98, $1CE4, $1EB8, $5E4D, $5E63
	db $07 : dw $0CC2 : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $5E4C, $5E57
	db $07 : dw $0CC4 : dw $5E7B, $5E8B, $5E9B, $5EAB, $5EBB, $1EC8, $5E6A
	db $08 : dw $0D06 : dw $5C82, $5E9A, $5D00, $5EBA, $1EC9, $1E56, $5E57, $1E7F
	db $03 : dw $0E48 : dw $1E40, $1E58, $5E56
	db $01 : dw $0E4A : dw $1E41
	db $04 : dw $0D4C : dw $5E07, $5E17, $5E27, $5E37
	db $04 : dw $0D4E : dw $5E06, $5CA6, $5E26, $5D02
	db $05 : dw $0D50 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3
	db $04 : dw $0D92 : dw $5CAC, $5E92, $5D08, $5EB2

	db $0B
	db $01 : dw $05B2 : dw $1E8D
	db $01 : dw $0574 : dw $1C00
	db $01 : dw $05B6 : dw $1E8E
	db $01 : dw $0578 : dw $1E07
	db $01 : dw $057A : dw $1E87
	db $04 : dw $053C : dw $1D40, $1E83, $1D08, $1EB2
	db $05 : dw $04FE : dw $1E73, $1E83, $1E93, $1EA3, $1EB3
	db $05 : dw $0CC0 : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0
	db $05 : dw $0CC2 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1
	db $05 : dw $0CC4 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3
	db $04 : dw $0D06 : dw $5CAC, $5E92, $5D08, $5EB2

.2: ;85BE
	db $08

	db $18
	db $01 : dw $0E0A : dw $5E40
	db $01 : dw $0E0C : dw $5EBF
	db $07 : dw $0D68 : dw $1E78, $1C82, $1E98, $1D00, $1EB8, $1EC8, $1ED8
	db $07 : dw $0D6A : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1ED9
	db $07 : dw $0D6C : dw $1C00, $1C40, $1E94, $1CE2, $1EB4, $1EC4, $1ED4
	db $07 : dw $0D6E : dw $1C00, $1E81, $1E95, $1EA5, $1EB5, $1EC5, $1ED5
	db $01 : dw $0D70 : dw $1C00
	db $02 : dw $0D72 : dw $1C00, $1E81
	db $06 : dw $0DB4 : dw $1D40, $1E24, $1D02, $1E44, $1E54, $1E44
	db $06 : dw $0DB6 : dw $1E05, $1E25, $1E35, $1E45, $1E55, $1E45
	db $06 : dw $0DB8 : dw $5E05, $5E25, $5E35, $1E44, $1E54, $1E44
	db $06 : dw $0DBA : dw $5D40, $5E24, $5D02, $1E45, $1E55, $1E45
	db $07 : dw $0D7C : dw $1E0C, $1C6E, $1E2C, $1CEC, $1E4C, $1E5C, $1E7C
	db $07 : dw $0D7E : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1E5D, $1E62
	db $07 : dw $1540 : dw $1E02, $1CA4, $1E22, $1D0E, $1E40, $1E56, $1E64
	db $07 : dw $1542 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E56, $1E65
	db $07 : dw $1544 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E66, $1C00
	db $07 : dw $1546 : dw $5E02, $5CCE, $5E22, $5D0E, $1E41, $1E66, $DE65
	db $04 : dw $1608 : dw $5D0E, $1EC0, $1E56, $5E7E
	db $02 : dw $168A : dw $1E51, $5E7C
	db $04 : dw $160C : dw $5D0A, $1E50, $5EC1, $5E56
	db $05 : dw $15CE : dw $5E3C, $1E41, $1E51, $5EC0, $5ED0
	db $01 : dw $1610 : dw $5D0A
	db $01 : dw $1614 : dw $5D0A

	db $14
	db $05 : dw $0D68 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2
	db $05 : dw $0D6A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3
	db $06 : dw $0DAC : dw $1CAA, $1E2C, $1CEA, $1E4C, $5E5D, $5E6D
	db $07 : dw $0D6E : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $5E5C, $5E6C
	db $07 : dw $0D70 : dw $5E0D, $5E1D, $5E2D, $5E3D, $5E4D, $5E5D, $5E6D
	db $06 : dw $0DB2 : dw $5CAA, $5E2C, $5CEA, $5E4C, $5E5C, $5E6C
	db $02 : dw $0DF4 : dw $1E22, $1D0E
	db $02 : dw $0DF6 : dw $1E23, $1E33
	db $05 : dw $0DF8 : dw $5E21, $5E31, $1E40, $1E50, $1E56
	db $05 : dw $0DFA : dw $5E20, $5D0E, $1E41, $1E40, $9E7E
	db $07 : dw $0D7C : dw $5E01, $5E11, $5E21, $5E31, $1E40, $1E56, $1E61
	db $07 : dw $0D7E : dw $5E00, $5C6A, $5E20, $5D0E, $1E41, $1E56, $1E64
	db $07 : dw $1540 : dw $1E8E, $1CA2, $1EAE, $1D0E, $1ECC, $1E56, $1E65
	db $07 : dw $1542 : dw $1E8F, $1E9F, $1EAF, $1EBF, $1ECD, $5E66, $1C00
	db $07 : dw $1544 : dw $1E88, $1C60, $1EA8, $5D0E, $1EC8, $5E66, $1E65
	db $07 : dw $1546 : dw $1E89, $1E99, $1EA9, $1EB9, $1EC9, $5E56, $1E65
	db $07 : dw $1548 : dw $1E88, $1C60, $1EA8, $5D0E, $1EC8, $1ED8, $5E7C
	db $07 : dw $154A : dw $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1ED9, $5E56
	db $02 : dw $168C : dw $1E58, $1E48
	db $02 : dw $168E : dw $1E59, $1E49

	db $14
	db $07 : dw $0D68 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40
	db $07 : dw $0D6A : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41
	db $07 : dw $0D6C : dw $1E00, $1C24, $1EAC, $1D20, $1ECC, $1EDC, $1ECC
	db $07 : dw $0D6E : dw $1E01, $1E11, $1EAD, $1EBD, $1ECD, $1EDD, $5E56
	db $07 : dw $0D70 : dw $1E00, $1C24, $1EAC, $1D20, $1ECC, $1EDC, $1E60
	db $07 : dw $0D72 : dw $1E01, $1E11, $1EAD, $1EBD, $1ECD, $1EDD, $1E61
	db $06 : dw $0DB4 : dw $1D4C, $1EA8, $1D20, $1EC8, $1ED8, $5E61
	db $06 : dw $0DB6 : dw $5E03, $1EA9, $1EB9, $1EC9, $1ED9, $5E60
	db $06 : dw $0DB8 : dw $1D4C, $1EA4, $1D0A, $1EC4, $1ED4, $5E56
	db $06 : dw $0DBA : dw $5E03, $1EA5, $1EB5, $1EC5, $1ED5, $1E56
	db $08 : dw $0D3C : dw $5E77, $5E87, $5E97, $5EA7, $5D0A, $1EC4, $1E56, $9E7E
	db $05 : dw $0D7E : dw $5E86, $5C8A, $5EA6, $5EB6, $1EC5
	db $06 : dw $1540 : dw $1E86, $1C8A, $1EA6, $5D0E, $1EC4, $1E60
	db $07 : dw $1502 : dw $1E77, $1E87, $1E97, $1EA7, $1EB7, $1EC5, $1E61
	db $08 : dw $1504 : dw $1E0C, $1E1C, $1C4C, $1E3C, $5D0A, $1E5C, $1E57, $1C00
	db $07 : dw $1506 : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1E5D, $1E57
	db $02 : dw $1688 : dw $5E56, $1E65
	db $02 : dw $168A : dw $1EC0, $5E7C
	db $02 : dw $168C : dw $1EDC, $5E56
	db $02 : dw $168E : dw $1EDD, $1ECD

	db $15
	db $04 : dw $0E28 : dw $1D0E, $1EC0, $1ED0, $1EC0
	db $03 : dw $0E6A : dw $1EC1, $1ED1, $1EC1
	db $07 : dw $0D6C : dw $1E82, $1C8C, $1EA2, $1D0A, $1EC0, $1ED0, $1EC0
	db $05 : dw $0D6E : dw $1E83, $1E93, $1EA3, $1EB3, $1EC1
	db $07 : dw $0D70 : dw $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1ED0, $1E62
	db $07 : dw $0D72 : dw $5E82, $5C8C, $5EA2, $5D0A, $1EC1, $5E56, $1E63
	db $07 : dw $0D74 : dw $1E08, $1C8C, $1EA2, $1D0A, $1ED8, $5E56, $5E63
	db $07 : dw $0D76 : dw $1E09, $1E93, $1EA3, $1EB3, $1ED9, $1ED9, $5E62
	db $05 : dw $0D78 : dw $1E08, $1C4A, $1E38, $1D0A, $1E58
	db $05 : dw $0D7A : dw $1E09, $1E29, $1E39, $1E49, $1E59
	db $06 : dw $0D3C : dw $5E0D, $5E1D, $5E2D, $5E3D, $1D0A, $1E5C
	db $08 : dw $0D3E : dw $5E0C, $5E1C, $5C4C, $5E3C, $5E4C, $1E5D, $1E60, $1E65
	db $08 : dw $1500 : dw $1E0C, $1E1C, $1C4C, $1E3C, $1D0A, $1E5C, $1E61, $1C00
	db $07 : dw $1502 : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4F, $1E5D, $1E63
	db $07 : dw $1504 : dw $1E08, $1E18, $1C08, $1E38, $1D0A, $1E58, $1E63
	db $08 : dw $1506 : dw $1E09, $1E19, $1E29, $1E39, $1E49, $1E59, $5E64, $DE65
	db $08 : dw $1508 : dw $5E0D, $5E1D, $5E2D, $5E3D, $1D0A, $1E5C, $5E6B, $DE64
	db $08 : dw $150A : dw $5E0C, $5E1C, $5C4C, $5E3C, $5E4E, $1E5D, $1EC0, $5E7E
	db $01 : dw $160C : dw $1D0A
	db $01 : dw $1610 : dw $1D0A
	db $01 : dw $1614 : dw $1E40

	db $12
	db $08 : dw $0D2C : dw $1E04, $1E14, $1CAE, $1E32, $1D0A, $1E50, $1ED0, $1E61
	db $08 : dw $0D2E : dw $1E05, $1E15, $1E23, $1E33, $1EC1, $1EC1, $5E56, $1E63
	db $08 : dw $0D30 : dw $5E05, $5E15, $5E23, $5E33, $5ED0, $1EC0, $1E66, $1C00
	db $08 : dw $0D32 : dw $5E04, $5E14, $5C86, $5E32, $5D0A, $1EC1, $1E60, $5E65
	db $02 : dw $0DB4 : dw $1C4C, $1E3C
	db $03 : dw $0DB6 : dw $1E2D, $1E3D, $1EC9
	db $02 : dw $0DB8 : dw $1C48, $1E3C
	db $02 : dw $0DBA : dw $1E2D, $1E3D
	db $06 : dw $0D3C : dw $1E00, $1E10, $1C04, $1E36, $1D0A, $1E6C
	db $07 : dw $0D3E : dw $1E01, $1E11, $1E21, $1E31, $1E5D, $1E6D, $1E61
	db $07 : dw $1500 : dw $5E01, $5E11, $5E21, $5E31, $1D0A, $5E56, $1E63
	db $06 : dw $1502 : dw $5E00, $5E10, $5C46, $5E30, $1E5D, $1E56
	db $07 : dw $1504 : dw $1E00, $1E10, $1C04, $1E36, $1D0A, $1E67, $1C00
	db $07 : dw $1506 : dw $1E01, $1E11, $1E21, $1E31, $1E5D, $1E67, $1C00
	db $06 : dw $1508 : dw $5E03, $5E13, $5E23, $5E33, $1D0A, $1E6C
	db $06 : dw $150A : dw $5E02, $5E12, $5C84, $5E32, $1E5D, $1E6D
	db $01 : dw $164C : dw $5EC5
	db $02 : dw $160E : dw $5EC4, $5EC4

	db $12
	db $08 : dw $0D2C : dw $1E02, $1E12, $1CAE, $1E32, $1D0A, $1E50, $5E56, $1E6B
	db $08 : dw $0D2E : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E66, $1C00
	db $07 : dw $0D30 : dw $1E00, $1E10, $1C46, $1E32, $1D0A, $1E50, $1E62
	db $08 : dw $0D32 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E63, $1C00
	db $07 : dw $0D74 : dw $1E00, $5E25, $5E35, $1D0A, $1ED8, $1E60, $5E65
	db $07 : dw $0D76 : dw $1E01, $5C48, $5E34, $1EC9, $1ED9, $5E56, $5E63
	db $05 : dw $0D78 : dw $1E00, $1C04, $1E30, $1D0A, $1E50
	db $05 : dw $0D7A : dw $1E01, $1E21, $1E31, $1E41, $1E51
	db $07 : dw $0CFC : dw $1E78, $1C82, $1E98, $1CEE, $1EB8, $1EC8, $1ED8
	db $07 : dw $0CFE : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1ED9
	db $08 : dw $14C0 : dw $5E79, $5E89, $5E99, $5EA9, $5EB9, $5EC9, $1E66, $1C00
	db $08 : dw $14C2 : dw $5E78, $5C82, $5E98, $5D00, $5EB8, $5EC8, $1E57, $1C00
	db $03 : dw $15C4 : dw $1E30, $1D0A, $1E57
	db $02 : dw $1606 : dw $1E41, $1E66
	db $07 : dw $1508 : dw $1E04, $1E10, $1C04, $1E30, $1D0A, $1E56, $1E7D
	db $06 : dw $150A : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51
	db $06 : dw $150C : dw $1E04, $1E14, $5E25, $1E34, $1D0A, $1E54
	db $06 : dw $150E : dw $1E05, $1E15, $5C48, $1E35, $1E45, $1E55

	db $12
	db $01 : dw $0EAC : dw $1E56
	db $01 : dw $0EEE : dw $9E65
	db $08 : dw $0D30 : dw $1C40, $1E98, $1D00, $1EB8, $1EC8, $1ED8, $1E61, $1E65
	db $07 : dw $0D32 : dw $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1ED9, $1E62
	db $08 : dw $0D34 : dw $1D4A, $1E80, $1CEE, $1EB4, $1EC4, $1ED4, $1E63, $1C00
	db $07 : dw $0D76 : dw $1E81, $1EA5, $1EB5, $1EC5, $1ED5, $1E60, $5E65
	db $08 : dw $0D38 : dw $1D42, $1E80, $1CE2, $1EB4, $1EC4, $1ED4, $5E56, $5E63
	db $07 : dw $0D7A : dw $1E81, $1EA5, $1EB5, $1EC5, $1ED5, $1E56, $9E7E
	db $09 : dw $0CFC : dw $1E70, $1C6E, $1E90, $1CEC, $1EB0, $1EC0, $1ED0, $1E61, $1E65
	db $09 : dw $0CFE : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $5E56, $1E63, $1C00
	db $08 : dw $14C0 : dw $1E70, $1C6E, $1E90, $1CEC, $1EB0, $1EC0, $5E56, $1E7D
	db $08 : dw $14C2 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $5E66, $9E65
	db $06 : dw $14C4 : dw $1E74, $1C2E, $1E94, $1CE2, $1EB4, $1EC4
	db $07 : dw $14C6 : dw $1E75, $1E85, $1E95, $1EA5, $1EB5, $1EC5, $1E57
	db $08 : dw $14C8 : dw $5E75, $5E85, $5E95, $5EA5, $5EB5, $5EC5, $5E56, $5E63
	db $09 : dw $14CA : dw $5E74, $5C80, $5E94, $5CEE, $5EB4, $5EC4, $5ED4, $1E60, $1E7F
	db $08 : dw $150C : dw $1C42, $1E9C, $1CE6, $1EBC, $1ECC, $1EDC, $5E56, $5E7E
	db $08 : dw $150E : dw $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1EDD, $5E6C, $5E56

	db $13
	db $01 : dw $0E28 : dw $1D20
	db $01 : dw $0E2C : dw $1E40
	db $01 : dw $0EAE : dw $5E61
	db $08 : dw $0D30 : dw $1CAA, $1E92, $1D08, $1EB2, $1EC0, $1ED8, $1E61, $1C00
	db $09 : dw $0CF2 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED9, $1E62, $9E63
	db $08 : dw $0D34 : dw $1D4E, $1E22, $1D0E, $1E4C, $1E5C, $1ED4, $1E66, $9E6A
	db $08 : dw $0D36 : dw $1E01, $1E23, $1E33, $1E4D, $1E5D, $9E56, $9E56, $9E7E
	db $08 : dw $0D38 : dw $1D4C, $1E20, $1D0E, $1E40, $5E59, $5E56, $1E69, $1C00
	db $08 : dw $0D3A : dw $1E01, $1E21, $1E31, $1E41, $5E58, $1E69, $1C00, $1C00
	db $09 : dw $0CFC : dw $1E00, $1C24, $1E20, $1D0E, $1E40, $5E59, $5E66, $1C00, $1C00
	db $08 : dw $0CFE : dw $1E01, $1E11, $1E21, $1E31, $1E41, $5E58, $5E62, $1C00
	db $08 : dw $14C0 : dw $1E00, $1C24, $1E20, $1D0E, $1E40, $5E59, $1E7D, $1C00
	db $07 : dw $14C2 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $5E58, $1E57
	db $07 : dw $14C4 : dw $1E00, $1C24, $1E20, $1D0E, $1E40, $5E59, $5E63
	db $06 : dw $14C6 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $5E58
	db $06 : dw $14C8 : dw $5E03, $5E13, $5E23, $5E33, $5E49, $5E59
	db $06 : dw $14CA : dw $5E02, $5CA4, $5E22, $5D0E, $5E48, $5E58
	db $06 : dw $14CC : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $5EC9
	db $05 : dw $150E : dw $5CAC, $5E92, $5D08, $5EB2, $5EC8

.3: ;8ECF
	db $0B

	db $16
	db $02 : dw $1600 : dw $1E7D, $9E65
	db $03 : dw $1602 : dw $5E57, $9E65, $1C00
	db $02 : dw $1604 : dw $5E63, $1C00
	db $04 : dw $1606 : dw $1E57, $1C00, $1C00, $1C00
	db $09 : dw $14C8 : dw $1E00, $1C24, $1E20, $1D0E, $1E40, $5E66, $1C00, $1C00, $9E64
	db $08 : dw $14CA : dw $1E01, $1E11, $1E21, $1E31, $1E41, $5ED4, $5E6A, $1C00
	db $08 : dw $14CC : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1EDC, $5E56, $5E7E
	db $08 : dw $14CE : dw $5E02, $5CA4, $5E22, $5D02, $1E41, $5EC8, $1EC9, $5E56
	db $09 : dw $14D0 : dw $5E71, $5E81, $5E91, $5EA1, $5EB1, $1EC0, $1ED0, $1E40, $1E6A
	db $09 : dw $14D2 : dw $5E70, $5C6E, $5E90, $5CEC, $5EB0, $1EC1, $1ED1, $5E56, $1E61
	db $09 : dw $14D4 : dw $5E0D, $5E1D, $5E2D, $5E3D, $5E4D, $1E5C, $1E6C, $5E56, $1E5B
	db $09 : dw $14D6 : dw $5E0C, $5C6C, $5E2C, $5CEC, $1E6D, $1E5D, $1E6D, $1E57, $1C00
	db $09 : dw $14D8 : dw $1E04, $1C68, $1E24, $1D02, $1E44, $1E54, $1E44, $1E57, $1C00
	db $08 : dw $151A : dw $1E02, $1E25, $1E35, $1E45, $1E55, $1E45, $5E57, $1C00
	db $08 : dw $151C : dw $5E02, $5E2E, $5E3E, $1E44, $1E54, $1E44, $1E40, $5E5B
	db $08 : dw $151E : dw $5D4E, $5E26, $5D02, $1E45, $1E55, $1E45, $5E56, $5E62
	db $08 : dw $1520 : dw $1D44, $1E22, $1D0E, $1E40, $1E50, $1E40, $1E40, $5E56
	db $09 : dw $14E2 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E41, $1E51
	db $0A : dw $14A4 : dw $1E02, $1E12, $1CAE, $1E32, $1D0A, $1E58, $1E40, $1E50, $1E40, $1E50
	db $0A : dw $14A6 : dw $1E03, $1E13, $1E23, $1E33, $1E49, $1E59, $1E41, $1E51, $1E41, $1E51
	db $06 : dw $14A8 : dw $1C42, $1E9C, $1CE6, $1EBC, $1ECC, $1EDC
	db $06 : dw $14AA : dw $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1EDD

	db $0F
	db $05 : dw $14C8 : dw $1E8C, $1C22, $1EAC, $1D0E, $1ECC
	db $05 : dw $14CA : dw $1E8D, $1E9D, $1EAD, $1EBD, $1ECD
	db $04 : dw $14CC : dw $5E01, $5E11, $5E21, $5E31
	db $04 : dw $14CE : dw $5E00, $5C66, $5E20, $5D0E
	db $09 : dw $14D0 : dw $5E09, $5E19, $5E29, $5E39, $1E48, $1E58, $1E48, $5E56, $1E5B
	db $09 : dw $14D2 : dw $5E08, $5C6A, $5E28, $5D04, $1E49, $1E59, $1E49, $1E60, $1C00
	db $09 : dw $14D4 : dw $1E02, $1CA4, $1E22, $1D02, $1E40, $1E50, $5E56, $1E61, $1C00
	db $07 : dw $14D6 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $5E56
	db $07 : dw $14D8 : dw $1E8C, $1C22, $1EAC, $1D0A, $1ECC, $1EDC, $5E56
	db $07 : dw $14DA : dw $5E73, $1E01, $1EAD, $1EBD, $1ECD, $1EDD, $5E56
	db $08 : dw $14DC : dw $5E73, $5E01, $5EAF, $5EBF, $1ECC, $1EDC, $1ECC, $5E56
	db $09 : dw $14DE : dw $1E0D, $5D4E, $5EAE, $5D02, $1ECD, $1EDD, $1ECD, $5E56, $5E56
	db $03 : dw $15E0 : dw $1EC0, $1ED0, $1EC0
	db $03 : dw $15E2 : dw $1EC1, $1ED1, $1EC1
	db $01 : dw $1524 : dw $1C84

	db $0F
	db $05 : dw $14C8 : dw $1E88, $1C62, $1EA8, $1D0E, $1EC8
	db $05 : dw $14CA : dw $1E89, $1E99, $1EA9, $1EB9, $1EC9
	db $06 : dw $148C : dw $1E74, $1E84, $1C60, $1EA4, $1D0A, $1EC4
	db $06 : dw $148E : dw $1E75, $1E85, $1E95, $1EA5, $1EB5, $1EC5
	db $07 : dw $14D0 : dw $5E8B, $5E9B, $5EAB, $5EBB, $1EC8, $1ED8, $1EC8
	db $08 : dw $14D2 : dw $5E8A, $5CA0, $5EAA, $5D0E, $1EC9, $1ED9, $1EC9, $1E66
	db $09 : dw $14D4 : dw $1E1E, $1CC4, $1E3E, $1D0A, $1E5C, $1E6C, $1E5C, $1E62, $5E65
	db $09 : dw $1496 : dw $1E0F, $1E1F, $1E2F, $1E3F, $1E6D, $1E5D, $1E6D, $5E56, $1E63
	db $09 : dw $1498 : dw $5E0D, $5E1D, $5E2D, $5E3D, $1D0A, $1E5C, $1E6C, $1E66, $1C00
	db $08 : dw $14DA : dw $5E08, $5C4C, $5E3C, $5E4C, $1E5D, $1E6D, $1E57, $1C00
	db $09 : dw $14DC : dw $5E09, $5E91, $5EA1, $1D0A, $1EC0, $1ED0, $1EC0, $5E5B, $DE65
	db $09 : dw $14DE : dw $5E08, $5C4E, $5EA0, $5EB0, $1EC1, $1ED1, $1EC1, $5E56, $9E7E
	db $09 : dw $14E0 : dw $5E09, $1C8A, $1E3E, $1D0A, $1E5C, $1E6C, $1E5C, $5E56, $9E7F
	db $0A : dw $14A2 : dw $1E0F, $1E1F, $1E2F, $1E3F, $1E4F, $1E5D, $1E6D, $1E5D, $1E40, $5E56
	db $01 : dw $1530 : dw $5D0A

	db $14
	db $02 : dw $1680 : dw $1E7D, $9E65
	db $02 : dw $1682 : dw $5E57, $9E65
	db $01 : dw $1684 : dw $5E63
	db $01 : dw $1686 : dw $1E57
	db $0A : dw $1490 : dw $1E0A, $1E1A, $1C88, $1E3A, $1D0A, $1EC8, $1ED8, $1EC8, $1E66, $1E65
	db $0A : dw $1492 : dw $1E0B, $1E1B, $1E2B, $1E3B, $1ED9, $1EC9, $1ED9, $1EC9, $1E62, $1E65
	db $0A : dw $1494 : dw $1E04, $1E14, $1C48, $1E34, $1D0A, $1E54, $1E44, $1E54, $1E63, $1C00
	db $09 : dw $1496 : dw $1E05, $1E15, $1E25, $1E35, $1E45, $1E55, $1E45, $1E56, $5E63
	db $0A : dw $1498 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50, $1E44, $1E56, $1E64, $DE64
	db $09 : dw $14DA : dw $1E01, $1E21, $1E31, $1E41, $1E51, $1E45, $1E69, $5E65, $DE64
	db $09 : dw $14DC : dw $1E00, $1C04, $1EB8, $1D0A, $1ED8, $1EC8, $1E63, $1E65, $DE64
	db $09 : dw $14DE : dw $1E01, $1EA9, $1EB9, $1EC9, $1ED9, $1EC9, $5E61, $1C00, $DE64
	db $09 : dw $14E0 : dw $1E86, $5EA9, $5EB9, $1D0A, $1ED8, $1EC8, $5E56, $5E5B, $9E62
	db $09 : dw $14A2 : dw $1E89, $1E99, $5C04, $5EB8, $1EC9, $1ED9, $1EC9, $1ED9, $1EC0
	db $0A : dw $14A4 : dw $1C82, $1E98, $1D00, $1EB8, $1EC8, $1ED8, $1EC8, $1ED8, $1EC0, $5E56
	db $0A : dw $14A6 : dw $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1ED9, $1EC9, $1ED9, $1EC9, $1ED9
	db $0A : dw $14A8 : dw $5E89, $5E99, $5EA9, $5EB9, $1EC8, $1ED8, $1EC8, $1ED8, $1EC8, $1ED8
	db $0A : dw $14AA : dw $5C82, $5E98, $5D00, $5EB8, $1EC9, $1ED9, $1EC9, $1ED9, $1EC9, $1ED9
	db $01 : dw $152C : dw $1D20
	db $01 : dw $1530 : dw $1D0A

	db $16
	db $02 : dw $1680 : dw $1C00, $1C00
	db $02 : dw $1682 : dw $1C00, $1C00
	db $01 : dw $1684 : dw $1C00
	db $01 : dw $1686 : dw $1C00
	db $01 : dw $1588 : dw $1D0A
	db $06 : dw $148C : dw $1E0A, $1E1A, $1C88, $1E3A, $1D0A, $1E48
	db $0A : dw $148E : dw $1E0B, $1E1B, $1E2B, $1E3B, $1EB5, $1E49, $5EC8, $1EC9, $5E56, $5E7E
	db $08 : dw $1490 : dw $1E00, $1E10, $1C46, $1E30, $1D0A, $1E50, $1E40, $1E50
	db $0A : dw $1492 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E62, $1C00
	db $09 : dw $1494 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50, $1E40, $1E66, $1C00
	db $09 : dw $1496 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $5E56, $1E62, $1E65
	db $09 : dw $1498 : dw $5E00, $5E10, $1C04, $1E30, $1D0A, $1ED8, $1EC8, $1E62, $1C00
	db $08 : dw $14DA : dw $5E85, $1EA9, $1EB9, $1EC9, $1ED9, $1E56, $1E65, $1C00
	db $09 : dw $149C : dw $1D40, $1E2A, $1D04, $1E48, $1E58, $1E48, $1E57, $1C00, $1C00
	db $08 : dw $149E : dw $1E05, $1E2B, $1E3B, $1E49, $1E59, $1E49, $1E57, $1E65
	db $0A : dw $14A0 : dw $5E05, $5E2B, $5E3B, $1E48, $1E58, $1E48, $5E56, $1E64, $1C00, $DE69
	db $09 : dw $14A2 : dw $5CA8, $5E2A, $5D04, $1E49, $1E59, $1E49, $1E59, $5E6A, $DE69
	db $0B : dw $1464 : dw $1E70, $1C6E, $1E90, $1CEC, $1EB0, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0
	db $0B : dw $1466 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1
	db $05 : dw $1468 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3
	db $04 : dw $14AA : dw $5CAA, $5E92, $5D08, $5EB2
	db $01 : dw $152C : dw $1D0E

	db $0F
	db $02 : dw $15CC : dw $1E58, $1E48
	db $04 : dw $158E : dw $1E49, $1E59, $1E49, $1E59
	db $01 : dw $16D0 : dw $1C00
	db $09 : dw $1494 : dw $1C82, $1E98, $1CEE, $1EB8, $1EC8, $1ED8, $1E40, $5E7D, $1E64
	db $06 : dw $1496 : dw $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1ED9
	db $0A : dw $1498 : dw $1C6E, $1E90, $1CEC, $1EB0, $1EC0, $1ED0, $5E56, $1E5B, $1E65, $DE65
	db $0A : dw $149A : dw $1E0B, $1E91, $1EA1, $1EB1, $1EC1, $1ED1, $1E57, $1C00, $1C00, $DE65
	db $07 : dw $149C : dw $1D44, $1EA6, $1D0A, $1EC4, $1ED4, $1EC4, $5E66
	db $08 : dw $149E : dw $1E87, $1EA7, $1EB7, $1EC5, $1ED5, $1EC5, $1E57, $1C00
	db $06 : dw $14A0 : dw $5E87, $5EA7, $5EB7, $1EC4, $1ED4, $1EC4
	db $07 : dw $1462 : dw $5E03, $5CC8, $5EA6, $5D0A, $1EC5, $1ED5, $1EC5
	db $0B : dw $1464 : dw $1E06, $1CA6, $1E26, $1D02, $1E44, $1E54, $1E44, $1E54, $1E44, $1E54, $1E44
	db $0B : dw $1466 : dw $1E07, $1E17, $1E27, $1E37, $1E45, $1E55, $1E45, $1E55, $1E45, $1E55, $1E45
	db $0B : dw $1468 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40
	db $0B : dw $146A : dw $5E02, $5CCE, $5E22, $5D02, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41

	db $11
	db $05 : dw $14C8 : dw $1E82, $1C8C, $1EA2, $1D0A, $1EC0
	db $06 : dw $148A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1
	db $07 : dw $148C : dw $1E02, $1E12, $1C84, $1E32, $1D0A, $1E40, $1EDC
	db $08 : dw $148E : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $5EC8, $1EC9
	db $08 : dw $1490 : dw $1C42, $1E9C, $1CE6, $1EBC, $1ECC, $1EDC, $1ECC, $1EDC
	db $08 : dw $1492 : dw $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1EDD, $1ECD, $1EDD
	db $09 : dw $1494 : dw $1CAA, $1E2E, $1D06, $1E4E, $1E5C, $1E6C, $1E5C, $1E66, $1C00
	db $0A : dw $1456 : dw $1E0F, $1E1F, $1E2F, $1E3F, $1E4F, $1E5D, $1E6D, $5E56, $1E62, $1C00
	db $0B : dw $1458 : dw $1E08, $1C28, $1E28, $1CE0, $1E48, $1E58, $1ED0, $1E66, $1C00, $1C00, $1C00
	db $07 : dw $149A : dw $5E00, $1E29, $1E39, $1E49, $1E59, $1ED1, $1E62
	db $07 : dw $149C : dw $1CC2, $1E3C, $1D0A, $1EC4, $1ED4, $1E58, $1E57
	db $0B : dw $145E : dw $1E05, $1E2B, $1E3B, $1ED5, $1EC5, $1ED5, $1E59, $5E63, $1C00, $1C00, $DE63
	db $09 : dw $1460 : dw $1E05, $5E2B, $5E3B, $5ED4, $1EC4, $1ED4, $5E56, $1E64, $1C00
	db $0C : dw $1422 : dw $5E0A, $5E1A, $5CC2, $5E3C, $5D0A, $1EC5, $1ED5, $1E59, $5E6A, $1C00, $DE69, $1EC5
	db $0B : dw $1464 : dw $5E89, $5E99, $5EA9, $5ED4, $1EC8, $1ED8, $1E54, $1E44, $1E54, $1E44, $1EC8
	db $0B : dw $1466 : dw $5E88, $5C62, $5EA8, $5D0A, $1EC9, $1ED9, $1EC9, $1ED9, $1EC9, $1ED9, $1EC9
	db $01 : dw $152A : dw $5D0E

	db $10
	db $06 : dw $1488 : dw $1E02, $1E12, $1CAE, $1E32, $1D0A, $1E50
	db $06 : dw $148A : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $06 : dw $148C : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50
	db $06 : dw $148E : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51
	db $06 : dw $1490 : dw $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0
	db $07 : dw $1452 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1
	db $08 : dw $1454 : dw $1E02, $1CA4, $1E22, $1D0E, $1E40, $1E50, $1E40, $1E50
	db $07 : dw $1456 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41
	db $07 : dw $1458 : dw $1E86, $1C8E, $1EA6, $1D0E, $1EC4, $1ED4, $1EC4
	db $06 : dw $149A : dw $1E85, $1EA7, $1EB7, $1EC5, $1ED5, $1EC5
	db $07 : dw $145C : dw $1E0C, $1C86, $1E36, $1D0A, $1E54, $1E44, $1E54
	db $07 : dw $145E : dw $5E0C, $1E27, $1E37, $1E45, $1E55, $1E45, $1E55
	db $08 : dw $1460 : dw $1E0C, $5E2B, $5E3B, $1D0A, $1E54, $1E44, $1E54, $1E57
	db $0C : dw $1422 : dw $5E09, $5E1A, $5C88, $5E3A, $1E45, $1E55, $1E45, $1E55, $5E63, $1C00, $DE6B, $1E54
	db $08 : dw $1524 : dw $5EB9, $1E6C, $1E5C, $1E6C, $5E6A, $1C00, $DE69, $1EC5
	db $04 : dw $1526 : dw $5D0E, $1E6D, $1E5D, $1E6D

	db $13
	db $06 : dw $148C : dw $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0
	db $07 : dw $144E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1
	db $09 : dw $1450 : dw $1E0C, $1C2A, $1E2C, $1CE0, $1E4C, $1E5C, $1E6C, $1E5C, $1E6C
	db $09 : dw $1452 : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1E5D, $1E6D, $1E5D, $1E6D
	db $0A : dw $1454 : dw $1E1E, $1CC4, $1E3E, $1D0A, $1E5C, $1E6C, $1E5C, $1E40, $1E66, $1E65
	db $0B : dw $1416 : dw $1E0F, $1E1F, $1E2F, $1E3F, $1E4F, $1E5D, $1E6D, $1E5D, $5E56, $1E62, $1E65
	db $0A : dw $1418 : dw $1E08, $1E18, $1C4A, $1E38, $1D0A, $1E58, $1E6C, $1E5C, $1E66, $1E64
	db $0B : dw $145A : dw $5E01, $1E2F, $1E39, $1E49, $1E59, $1E6D, $1E5D, $1E62, $1E65, $1C00, $1C00
	db $0B : dw $145C : dw $5E00, $1C46, $1E30, $1D0A, $1E50, $1E40, $1E50, $1E63, $1C00, $1C00, $DE65
	db $0B : dw $145E : dw $1E01, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E57, $1C00, $1C00, $DE64
	db $0B : dw $1460 : dw $1E85, $1C04, $1E30, $1D0A, $1E50, $1E40, $1E50, $5E62, $1C00, $1C00, $DE63
	db $0C : dw $1422 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E57, $1C00, $1C00, $DE69
	db $0C : dw $1424 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50, $1E40, $1E50, $1E40, $5E6B, $DE69, $1E50
	db $0C : dw $1426 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51
	db $04 : dw $1468 : dw $5C71, $5C73, $5C75, $5C77
	db $04 : dw $146A : dw $5C70, $5C44, $5C74, $5C02
	db $01 : dw $152C : dw $1C02
	db $01 : dw $1D1A : dw $5E32
	db $01 : dw $1D1E : dw $5EA2

	db $13
	db $07 : dw $144C : dw $1E02, $1CCE, $1E22, $1D0E, $1E40, $1E50, $1E40
	db $07 : dw $144E : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41
	db $09 : dw $1450 : dw $5E01, $5E11, $5E21, $5E31, $1E40, $1E50, $1E40, $1ECC, $1EDC
	db $09 : dw $1452 : dw $5E00, $5C66, $5E20, $5D0E, $1E41, $1E51, $1E41, $1ECD, $1EDD
	db $05 : dw $1414 : dw $1E06, $1E16, $1CAE, $1E36, $1E4E
	db $04 : dw $1416 : dw $1E07, $1E17, $1E27, $1E37
	db $0A : dw $1418 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E58, $1E6C, $1E58, $5E57, $1E65
	db $0B : dw $145A : dw $1E8D, $1E21, $1E31, $1E49, $1E59, $1E6D, $1E59, $1E62, $1E65, $1C00, $DE65
	db $0C : dw $141C : dw $1D48, $1E85, $1D00, $1E30, $1EC8, $1ED8, $1EC8, $5E56, $1E63, $1C00, $1C00, $DE64
	db $0B : dw $145E : dw $1E8A, $1EA9, $1EB9, $1EC9, $1ED9, $1EC9, $5E57, $5E65, $1C00, $1C00, $DE63
	db $0C : dw $1420 : dw $1D48, $1E85, $1D00, $1E30, $1EC8, $1ED8, $1EC8, $5E56, $1E64, $1C00, $1C00, $DE69
	db $0B : dw $1462 : dw $1E99, $1EA9, $1EB9, $1EC9, $1ED9, $1EC9, $1ED9, $5E57, $1C00, $DE69, $1EC5
	db $0C : dw $1424 : dw $5E89, $5E99, $5EA9, $5EB9, $1EC8, $1ED8, $1EC8, $1ED8, $1E44, $1E54, $1E44, $1EC8
	db $0C : dw $1426 : dw $5C82, $5E98, $5D00, $5EB8, $1EC9, $1ED9, $1EC9, $1ED9, $1ED9, $1EC9, $1ED9, $1EC9
	db $04 : dw $1468 : dw $5E03, $5E13, $5E23, $5E33
	db $03 : dw $146A : dw $5E02, $5C44, $5E22
	db $01 : dw $152C : dw $1D0E
	db $01 : dw $1D1A : dw $5D02
	db $01 : dw $1D1E : dw $5D04

	db $0D
	db $0C : dw $1410 : dw $1E02, $1E12, $1CAE, $1E32, $1D0A, $1E50, $1E40, $1E40, $1E50, $1E40, $1E5A, $9E63
	db $0C : dw $1412 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51, $5E5C, $DE7F, $1C00, $9E64
	db $0A : dw $1414 : dw $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0, $1EC0, $1E5C, $1E7C, $9E65
	db $0C : dw $13D6 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1, $1EC1, $1E5D, $1E62, $9E65, $1C00
	db $0D : dw $13D8 : dw $5E0A, $1CA4, $1E22, $1D02, $1E40, $1E50, $1E40, $1E50, $1E40, $1E63, $1C00, $1C00, $DE64
	db $0C : dw $141A : dw $1E01, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51, $1E56, $1E63, $1C00, $1C00, $DE64
	db $0C : dw $141C : dw $1D4C, $1E20, $1D02, $1E40, $1E50, $1E40, $1E50, $1E56, $1E57, $1C00, $1C00, $DE63
	db $0C : dw $141E : dw $1E01, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E41, $1E57, $1C00, $1C00, $DE62
	db $0C : dw $1420 : dw $5E02, $5E23, $5E33, $1E40, $1E50, $1E40, $1E50, $1E6C, $DE7E, $1C00, $1C00, $DE61
	db $0D : dw $13E2 : dw $1E0A, $5CA4, $5E22, $5D02, $1E41, $1E51, $1E41, $1E51, $1E6D, $1E56, $5E6B, $5E5B, $DE60
	db $0D : dw $13E4 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0, $1E56, $1ED9
	db $0C : dw $1426 : dw $5CAC, $5E92, $5D08, $5EB2, $1EC1, $1ED1, $1EC1, $1ED9, $1EC9, $1ED9, $1EC9, $1ED9
	db $01 : dw $152C : dw $1D20

.4: ;9C7C
	db $13

	db $1B
	db $08 : dw $1528 : dw $5C77, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC9, $1ED9
	db $09 : dw $146A : dw $5C70, $5C44, $5E22, $5C02, $1E51, $1E41, $1E51, $1E41, $1E51
	db $0B : dw $146C : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $1EC0, $1ED0, $1EC0, $1E40, $1E60
	db $0B : dw $146E : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1EC1, $1ED1, $1EC1, $1E41, $1E61
	db $0B : dw $1470 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1E44, $1E54, $1E51, $1ECC, $1E56, $1E7E
	db $0C : dw $1432 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E45, $1E55, $1E50, $1EDD, $1E56, $1E7E
	db $0C : dw $1434 : dw $1C00, $1E02, $1CA4, $1E22, $1D02, $1E40, $1E50, $1E5C, $1E56, $1E5C, $1E5A, $9E63
	db $0A : dw $1436 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E5D, $1E56, $1E5A
	db $0C : dw $1438 : dw $1C00, $1E82, $1C8C, $1EA2, $1D0A, $1EC0, $1ED0, $1E4C, $1E66, $1C00, $1C00, $9E65
	db $0C : dw $143A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1, $1E4D, $1E57, $1C00, $1C00, $DE63
	db $0C : dw $143C : dw $1E70, $1E80, $1C0C, $1EA0, $1EB0, $1EC0, $1ED0, $1ED8, $5E69, $5E5B, $1C00, $DE63
	db $0C : dw $143E : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1ED1, $1ED9, $1E56, $1E57, $1C00, $DE63
	db $0C : dw $1C00 : dw $1E70, $1E80, $1C0C, $1EA0, $1EB0, $1EC0, $1ED0, $1EC4, $1E56, $1E5A, $1C00, $DE61
	db $0C : dw $1C02 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1ED1, $1EC5, $1E6A, $1C00, $1C00, $9E63
	db $0C : dw $1C04 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1ED0, $1E56, $1E57, $1C00, $1C00, $9E63
	db $09 : dw $1C06 : dw $1C00, $5E82, $5C8C, $5EA2, $5EB2, $1EC1, $1ED1, $1E66, $1C00
	db $0A : dw $1C08 : dw $5E71, $5E81, $1C0C, $5EA1, $5EB1, $1EC0, $1ED0, $1E66, $1C00, $1C00
	db $0A : dw $1C0A : dw $5E70, $5E80, $5E90, $5EA0, $5EB0, $1EC1, $1ED1, $1E57, $9E65, $1C00
	db $05 : dw $1DCC : dw $1E66, $1C00, $1C00, $1C00, $9E64
	db $05 : dw $1DCE : dw $1E57, $9E65, $1C00, $1C00, $9E65
	db $02 : dw $1E10 : dw $1E57, $1C00
	db $03 : dw $1E12 : dw $5E69, $9E65, $1C00
	db $04 : dw $1E14 : dw $5E68, $5E7D, $1C00, $1C00
	db $04 : dw $1E16 : dw $1E56, $5E7E, $1C00, $9E64
	db $03 : dw $1E58 : dw $1E56, $1E65, $DE63
	db $03 : dw $1E5A : dw $1E56, $5E62, $DE62
	db $02 : dw $1E9C : dw $1E56, $1E7F

	db $16
	db $01 : dw $1498 : dw $1E32
	db $05 : dw $1568 : dw $1E40, $1E50, $1ED9, $1EC9, $1ED9
	db $07 : dw $14EA : dw $5C74, $5C02, $1E41, $1E51, $1E41, $1E51, $1E41
	db $0A : dw $14AC : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50
	db $0A : dw $14AE : dw $5E02, $5E12, $5C84, $5E32, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51
	db $0A : dw $14B0 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1E51, $1ECC, $1E51, $5E56
	db $0B : dw $1472 : dw $1C00, $1C00, $5E82, $5C8C, $5EA2, $5D0A, $1EC1, $1E50, $1EDD, $5E56, $5E7F
	db $0A : dw $1474 : dw $1C00, $1C00, $1E00, $1C66, $1E20, $1D02, $1E40, $1E50, $1E40, $5E66
	db $0A : dw $1476 : dw $1C00, $1C00, $1E01, $1E11, $1E21, $1EB7, $1E41, $1E51, $5E56, $1E5A
	db $09 : dw $1478 : dw $1C00, $1C00, $1E86, $1C8E, $1EA6, $5D0A, $1EC4, $1E6D, $1E5A
	db $09 : dw $143A : dw $1C00, $1C00, $1E77, $1E87, $1E97, $1EA7, $1EB7, $1EC5, $1E66
	db $0A : dw $143C : dw $1C00, $1C00, $1E0A, $1E1A, $1C88, $1E3A, $1E48, $1E58, $1E57, $1C00
	db $0A : dw $143E : dw $1C00, $1C00, $1E0B, $1E1B, $1E2B, $1E3B, $1E49, $1E59, $1E66, $1C00
	db $0A : dw $1C00 : dw $1C00, $1C00, $1E0A, $1E1A, $1C88, $1E3A, $1E48, $1E58, $1E56, $5E5B
	db $0A : dw $1C02 : dw $1C00, $1C00, $1E0B, $1E1B, $1E2B, $1E3B, $1E49, $1E59, $1E49, $1E56
	db $0A : dw $1C04 : dw $1C00, $1C00, $1CAC, $1E92, $1D08, $1EB2, $1E40, $1E50, $1E56, $1E5B
	db $08 : dw $1C46 : dw $1C00, $1E83, $1E93, $1EA3, $1EB3, $1E41, $1E51, $1E5B
	db $07 : dw $1C08 : dw $1C00, $1E82, $1CC6, $1EA2, $1D0A, $1E50, $1E40
	db $08 : dw $1C0A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E41, $1E66
	db $04 : dw $1D0C : dw $5ED1, $1EC0, $1ED0, $1E57
	db $05 : dw $1D0E : dw $5D0A, $1EC1, $1ED1, $1E56, $5E5B
	db $01 : dw $1D1E : dw $5D08

	db $1A
	db $01 : dw $15AC : dw $5E40
	db $03 : dw $152E : dw $5CAE, $5E32, $5D0A
	db $09 : dw $14B0 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40, $1E50
	db $09 : dw $14F2 : dw $5E02, $5CCE, $5E22, $5D20, $1E41, $1E51, $1ECC, $1E51, $5E56
	db $09 : dw $14F4 : dw $1E78, $1C80, $1E98, $1D00, $1EB8, $1E50, $1EDD, $5E56, $5E7F
	db $09 : dw $14F6 : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1E50, $1E40, $5E66, $9E63
	db $09 : dw $14F8 : dw $1E0A, $1CA8, $1E2A, $1D04, $1EC4, $1E51, $5E56, $1E5A, $9E64
	db $0A : dw $14BA : dw $1C00, $1E0B, $1E1B, $1E2B, $1E3B, $1EC5, $1E6D, $1E5A, $1E64, $9E65
	db $0A : dw $14BC : dw $1C00, $1E8A, $1C62, $1EAA, $1D0A, $1EC8, $1E66, $1C00, $1E65, $1C00
	db $0A : dw $14BE : dw $1C00, $1E8B, $1E9B, $1EAB, $1EBB, $1EC9, $1E57, $1C00, $1C00, $1C00
	db $0A : dw $1C80 : dw $1E70, $1E80, $1C4E, $1EA0, $1EB0, $1EC0, $1E66, $1C00, $1C00, $DE63
	db $0A : dw $1C82 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1E56, $1C00, $1C00, $DE63
	db $0A : dw $1C84 : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E50, $1E49, $1E63, $1C00, $DE63
	db $0A : dw $1C86 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E56, $1E64, $1C00, $DE61
	db $08 : dw $1C48 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40, $1E5B
	db $0C : dw $1C0A : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $5E66, $1C00, $1C00, $1C00, $9E63
	db $0C : dw $1C0C : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40, $1E50, $5E57, $9E65, $1C00, $1C00, $9E62
	db $0B : dw $1C4E : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $5E6A, $1C00, $1C00, $1C00, $9E63
	db $04 : dw $1E10 : dw $5E57, $1C00, $1C00, $9E65
	db $02 : dw $1E12 : dw $1E57, $1C00
	db $02 : dw $1E14 : dw $5E69, $9E65
	db $04 : dw $1E16 : dw $5E68, $5E7D, $1C00, $1C00
	db $04 : dw $1E18 : dw $1E56, $5E7E, $1C00, $9E64
	db $08 : dw $1D1A : dw $5E32, $1E41, $1E51, $1E41, $1E50, $1E56, $1E65, $DE63
	db $02 : dw $1E9C : dw $5E62, $DE62
	db $02 : dw $1E9E : dw $1E56, $1E7F

	db $1E
	db $01 : dw $14A2 : dw $5E32
	db $05 : dw $14AC : dw $1C00, $5C71, $5C73, $5C75, $5C77
	db $05 : dw $14AE : dw $1C00, $5C70, $5C44, $5C74, $5C02
	db $09 : dw $14F0 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $5E40, $1E50, $1E40, $1E50
	db $09 : dw $14F2 : dw $1C00, $5E02, $5E12, $5CAE, $5E32, $5D0A, $1E51, $1E41, $1E51
	db $09 : dw $14F4 : dw $1C00, $1C00, $5E03, $5E13, $5E23, $5E33, $1EC1, $1EC0, $1ED0
	db $09 : dw $14F6 : dw $1C00, $1C00, $5E02, $5CCE, $5E22, $5D20, $1E40, $1EC1, $1E56
	db $09 : dw $14F8 : dw $1C00, $1C00, $1C00, $1CAC, $1E92, $1D00, $5EB3, $5E56, $1E56
	db $09 : dw $14FA : dw $1C00, $1C00, $1E73, $1E83, $1E93, $1EA3, $5EB2, $5E56, $1E7D
	db $09 : dw $14FC : dw $1C00, $1C00, $1E02, $1CA4, $1E22, $1D02, $5E56, $1E5A, $9E64
	db $09 : dw $14FE : dw $1C00, $1C00, $1E03, $1E13, $1E23, $1E33, $1E5C, $1E64, $9E65
	db $0A : dw $1C80 : dw $1C00, $1C00, $1E02, $1E12, $1CAE, $1E32, $1EB2, $5E57, $1E65, $1C00
	db $0A : dw $1C82 : dw $1C00, $1C00, $1E03, $1E13, $1E23, $1E33, $1EB3, $5E66, $1E65, $1C00
	db $08 : dw $1C84 : dw $1C00, $1C00, $1CAC, $1E92, $1D08, $1EB2, $1EC0, $5E57
	db $0A : dw $1C86 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $5E57, $1C00, $DE63
	db $0B : dw $1C48 : dw $1C00, $1C00, $1E82, $1CC6, $1EA2, $1D0A, $1EC0, $1ED0, $5E66, $1C00, $DE63
	db $0B : dw $1C4A : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1, $5E57, $1C00, $DE61
	db $0B : dw $1C4C : dw $1C00, $1E02, $1E12, $1C84, $1E32, $1E50, $1E40, $1E50, $5E66, $1C00, $9E63
	db $09 : dw $1C4E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $5E56, $1E5A
	db $0B : dw $1C50 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40, $1E67, $1C00, $1C00, $9E62
	db $0B : dw $1C52 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E61, $1C00, $1C00, $9E63
	db $04 : dw $1E14 : dw $5E63, $1C00, $1C00, $9E65
	db $02 : dw $1E16 : dw $1E57, $1C00
	db $04 : dw $1E18 : dw $5E63, $9E65, $1C00, $1C00
	db $04 : dw $1E1A : dw $1E57, $9E65, $1C00, $1C00
	db $06 : dw $1D9C : dw $5EC5, $5ED5, $5E56, $5E5B, $1C00, $9E64
	db $06 : dw $1D9E : dw $5EC4, $5ED4, $5E56, $1E7D, $1C00, $DE63
	db $03 : dw $1E60 : dw $1E56, $5E5B, $DE62
	db $03 : dw $1E62 : dw $1E41, $1E56, $1E7F
	db $03 : dw $1E64 : dw $1EC0, $1E41, $1E56

	db $1F
	db $01 : dw $1694 : dw $1C00
	db $01 : dw $1498 : dw $1D02
	db $0A : dw $14A2 : dw $5D02, $1E41, $1E51, $1E41, $1E51, $1E6D, $1E56, $5E6B, $5E5B, $9E7D
	db $02 : dw $16A4 : dw $1EC0, $1E56
	db $01 : dw $1630 : dw $1E40
	db $01 : dw $1632 : dw $1E41
	db $03 : dw $1674 : dw $1E40, $1E50, $1E40
	db $01 : dw $1676 : dw $1E41
	db $04 : dw $15B8 : dw $1E00, $1E10, $1C04, $1E30
	db $05 : dw $157A : dw $1C00, $1E01, $1E11, $1E21, $1E31
	db $06 : dw $157C : dw $1C00, $1CAA, $1E92, $1D06, $1EB2, $1E60
	db $06 : dw $157E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E61
	db $07 : dw $1D00 : dw $1C00, $1E02, $1CA4, $1E22, $1D02, $1E40, $1E62
	db $07 : dw $1D02 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E63
	db $08 : dw $1D04 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50, $1E64, $1C00
	db $09 : dw $1CC6 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E56, $1E65, $9E65
	db $09 : dw $1CC8 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E6A, $1C00, $9E65
	db $0A : dw $1C8A : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E56, $1E63, $1C00, $9E64
	db $06 : dw $1D0C : dw $1CAE, $1E32, $1E40, $1E50, $1E66, $9E65
	db $04 : dw $1D8E : dw $1E41, $1E51, $1E61, $9E65
	db $08 : dw $1C50 : dw $1C00, $1CAA, $1E92, $1D08, $1EB2, $1EC0, $1ED0, $1E62
	db $08 : dw $1C52 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1E56, $1E63
	db $08 : dw $1C54 : dw $1E02, $1CA4, $1E22, $1E32, $1E40, $1E50, $1E66, $1C00
	db $08 : dw $1C56 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E57, $1C00
	db $03 : dw $1DD8 : dw $5E6A, $5E63, $1C00
	db $03 : dw $1DDA : dw $1E56, $5E62, $1C00
	db $02 : dw $1E1C : dw $1E66, $1C00
	db $02 : dw $1E1E : dw $5EC4, $5E6A
	db $01 : dw $1EA0 : dw $5E62
	db $01 : dw $1E62 : dw $1E51
	db $03 : dw $1E64 : dw $1E50, $1E40, $5E56

	db $1C
	db $01 : dw $1694 : dw $1E65
	db $01 : dw $16E2 : dw $DE60
	db $02 : dw $16A4 : dw $1E56, $1ED9
	db $02 : dw $16B6 : dw $1E51, $1E41
	db $05 : dw $15B8 : dw $5E03, $5E13, $5E23, $5E33, $1E40
	db $06 : dw $15BA : dw $5E02, $5E12, $5C84, $5E32, $1EC1, $1E56
	db $06 : dw $15BC : dw $1E02, $1E12, $1C84, $1E32, $5E56, $1E56
	db $07 : dw $157E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $5E56, $1E7D
	db $07 : dw $1D40 : dw $1C00, $1CAA, $1E92, $1D08, $1EB2, $1E60, $9E64
	db $07 : dw $1D42 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E61, $9E65
	db $07 : dw $1D04 : dw $1C00, $1E82, $1CC6, $1EA2, $1D0A, $1EC0, $1E62
	db $08 : dw $1D06 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1E63, $1C00
	db $09 : dw $1CC8 : dw $1C00, $1E02, $1E12, $1C84, $1E32, $1E50, $1E56, $1E64, $1C00
	db $09 : dw $1CCA : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E51, $1E66, $1E65, $9E65
	db $0A : dw $1C8C : dw $1C00, $1C00, $1CCE, $1E22, $1D20, $1E50, $1E40, $1E60, $1C00, $9E65
	db $0A : dw $1C8E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1E61, $1C00, $9E64
	db $0A : dw $1C90 : dw $1E02, $1E12, $1CAE, $1E32, $1EC0, $1ED0, $1EC0, $1E62, $1C00, $9E63
	db $09 : dw $1C52 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1EC1, $1ED1, $1EC1, $1E63
	db $0A : dw $1C94 : dw $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40, $1E6B, $1C00, $1C00, $9E62
	db $05 : dw $1DD6 : dw $1E41, $5E64, $1C00, $1C00, $9E63
	db $05 : dw $1DD8 : dw $1E40, $5E63, $1C00, $1C00, $9E65
	db $06 : dw $1D1A : dw $5D04, $1E41, $1E51, $1E41, $5E57, $1E65
	db $04 : dw $1E1C : dw $5E57, $1C00, $1C00, $1C00
	db $04 : dw $1E1E : dw $5E56, $5E5B, $1C00, $1C00
	db $04 : dw $1E20 : dw $1EC0, $5E57, $1C00, $9E64
	db $03 : dw $1E62 : dw $5E66, $1C00, $DE63
	db $02 : dw $1EA4 : dw $5E62, $DE62
	db $02 : dw $1EA6 : dw $5E57, $1E7F

	db $1E
	db $01 : dw $16F8 : dw $1E50
	db $02 : dw $16BA : dw $1E41, $1E51
	db $06 : dw $15BC : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1ED0
	db $06 : dw $15BE : dw $1C00, $5E82, $5C8C, $5EA2, $5EB2, $1ED1
	db $06 : dw $1D80 : dw $1E02, $1E12, $1CAE, $1E32, $1EC0, $1ED0
	db $07 : dw $1D42 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1EC1, $1ED1
	db $07 : dw $1D44 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1E56
	db $08 : dw $1D06 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $5E56, $1E7D
	db $08 : dw $1D08 : dw $1C00, $1E82, $1CC6, $1EA2, $1D0A, $1E50, $1E60, $9E64
	db $07 : dw $1D0A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E61
	db $08 : dw $1D0C : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E50, $1E62, $1C00
	db $09 : dw $1CCE : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E63, $1C00
	db $0A : dw $1C90 : dw $1C00, $1C70, $1C44, $1C74, $1C02, $1E40, $1E50, $1E40, $1E64, $1C00
	db $0A : dw $1C92 : dw $1C00, $1C71, $1C73, $1C75, $1C77, $1E41, $1E51, $1E56, $1E65, $9E65
	db $0B : dw $1C54 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1E50, $1E40, $1E50, $1E6B, $1E65, $9E65
	db $0B : dw $1C56 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E41, $1E56, $5E64, $1E65, $9E64
	db $0B : dw $1C58 : dw $1E70, $1C2E, $1E90, $1D08, $1EB0, $1EC0, $1ED0, $1EC0, $5E63, $1C00, $9E63
	db $0B : dw $1C5A : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1ED1, $1EC1, $5E62, $1C00, $9E63
	db $04 : dw $1E1C : dw $1E69, $1E64, $1C00, $9E62
	db $04 : dw $1E1E : dw $5E5A, $1E65, $1C00, $9E63
	db $04 : dw $1E20 : dw $5E59, $5E57, $1C00, $9E65
	db $04 : dw $1E22 : dw $5E59, $5E68, $1C00, $DE6A
	db $04 : dw $1E24 : dw $5E59, $1E69, $1C00, $DE68
	db $04 : dw $1E26 : dw $1E6A, $1E65, $1C00, $9E5A
	db $04 : dw $1E28 : dw $1E57, $1C00, $1C00, $9E64
	db $04 : dw $1E2A : dw $5E61, $1C00, $1C00, $DE63
	db $04 : dw $1E2C : dw $1E56, $5E5B, $1C00, $DE62
	db $01 : dw $1EEE : dw $DE63
	db $01 : dw $1EF0 : dw $9E63
	db $01 : dw $1EB2 : dw $5E5B

	db $1F
	db $06 : dw $1D80 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $1D82 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $06 : dw $1D84 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50
	db $07 : dw $1D46 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E66
	db $07 : dw $1D48 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E60
	db $08 : dw $1D0A : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1EC0, $1E56
	db $06 : dw $1D8C : dw $1CAE, $1E32, $1E40, $1E50, $5E56, $1E6B
	db $02 : dw $1E8E : dw $1E62, $9E64
	db $09 : dw $1CD0 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40, $1E63, $9E65
	db $09 : dw $1CD2 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E56, $1E65, $1C00
	db $0A : dw $1C94 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50, $1E56, $1E5A, $1E65, $1C00
	db $0B : dw $1C56 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E67, $1E65, $1E65, $1C00
	db $0B : dw $1C58 : dw $1C00, $1CCE, $1E92, $1D08, $1EB2, $1E40, $1E40, $1E40, $5E5B, $1C00, $9E65
	db $0B : dw $1C5A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E41, $1E51, $1E41, $1E56, $1E65, $9E65
	db $06 : dw $1D9C : dw $1E40, $1E40, $1E40, $5E56, $5E65, $9E64
	db $08 : dw $1C9E : dw $5CCE, $5E92, $5D08, $5EB2, $1E41, $1E51, $1E50, $1E6B
	db $05 : dw $1DE0 : dw $1E40, $1E6B, $1C00, $1C00, $9E63
	db $04 : dw $1E22 : dw $5E62, $1C00, $1C00, $9E62
	db $04 : dw $1E24 : dw $5E62, $1E65, $1C00, $9E63
	db $04 : dw $1E26 : dw $5E56, $5E5A, $1E65, $9E65
	db $04 : dw $1E28 : dw $1E40, $5E56, $5E64, $1C00
	db $04 : dw $1E2A : dw $1E41, $1E51, $5E63, $1C00
	db $04 : dw $1E2C : dw $5ED1, $5EC1, $1E63, $1C00
	db $03 : dw $1E6E : dw $5EC0, $1E64, $9E64
	db $03 : dw $1E70 : dw $1E6B, $1C00, $DE63
	db $03 : dw $1E72 : dw $5E6A, $1C00, $DE62
	db $03 : dw $1E74 : dw $5E66, $1C00, $DE63
	db $03 : dw $1E76 : dw $5E56, $1C00, $9E63
	db $02 : dw $1EB8 : dw $5E5B, $1E7F
	db $02 : dw $1EBA : dw $1EC0, $5E56
	db $02 : dw $1EBC : dw $1EC0, $5E56

	db $1E
	db $06 : dw $1D84 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $1D86 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $07 : dw $1D48 : dw $1C00, $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50
	db $07 : dw $1D4A : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $08 : dw $1D0C : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40
	db $08 : dw $1D0E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1EC0, $1E56
	db $09 : dw $1CD0 : dw $1C00, $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50, $5E56, $1E6B
	db $09 : dw $1CD2 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E62, $9E64
	db $0A : dw $1C94 : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40, $1E63, $9E65
	db $09 : dw $1C96 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E56, $1E5A, $1E64
	db $0A : dw $1C98 : dw $1C00, $1E82, $1C8C, $1EA2, $1EB2, $1E50, $1E5A, $1C00, $1E65, $1C00
	db $0B : dw $1C5A : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $5E64, $1C00, $1C00, $1C00
	db $0B : dw $1C5C : dw $1C00, $1E02, $1E12, $1C84, $1E32, $1E40, $1E56, $5E6B, $1C00, $1C00, $9E65
	db $0A : dw $1C9E : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E58, $5E6B, $1C00, $9E65
	db $05 : dw $1DE0 : dw $1E56, $1E59, $1E56, $1E7D, $9E64
	db $04 : dw $1E22 : dw $1E56, $1E6B, $1E6A, $9E63
	db $03 : dw $1DE4 : dw $1E56, $1E61, $1E63
	db $04 : dw $1E26 : dw $1E66, $1C00, $1C00, $9E62
	db $04 : dw $1E28 : dw $1E57, $1C00, $1C00, $9E63
	db $04 : dw $1E2A : dw $1E56, $5E5B, $1C00, $9E65
	db $02 : dw $1E6C : dw $5E57, $1C00
	db $03 : dw $1E6E : dw $1E7D, $1C00, $1C00
	db $03 : dw $1E70 : dw $5E57, $1C00, $1C00
	db $03 : dw $1E72 : dw $5E56, $5E5B, $9E64
	db $02 : dw $1E74 : dw $1ED0, $5E61
	db $03 : dw $1E76 : dw $1ED1, $5E60, $DE62
	db $02 : dw $1EB8 : dw $1E56, $1E56
	db $02 : dw $1EBA : dw $1E51, $1E41
	db $02 : dw $1EBC : dw $5E45, $5E55
	db $02 : dw $1EBE : dw $5E44, $5E54

	db $1C
	db $05 : dw $1D88 : dw $1C00, $1E82, $1C8C, $1EA2, $1EB2
	db $05 : dw $1D8A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3
	db $07 : dw $1D4C : dw $1C00, $1E02, $1E12, $1C84, $1E32, $1E40, $1E50
	db $07 : dw $1D4E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $08 : dw $1D10 : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $5E56
	db $08 : dw $1D12 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $5E56, $1E6B
	db $09 : dw $1CD4 : dw $1C00, $1C00, $1E12, $1CAE, $1E32, $1E40, $1E50, $1E56, $1E57
	db $09 : dw $1CD6 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E67, $1E5B
	db $08 : dw $1CD8 : dw $1C00, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E41, $1E64
	db $09 : dw $1C9A : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E56, $1E63
	db $0A : dw $1C9C : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40, $1E56, $1E66, $5E5B, $1C00
	db $09 : dw $1C9E : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E69, $9E5A, $1E5A
	db $0A : dw $1CA0 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50, $1E57, $1C00, $1C00, $9E65
	db $0A : dw $1CA2 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $5E66, $1C00, $1C00, $9E64
	db $05 : dw $1DE4 : dw $1E50, $1E40, $5E5B, $1C00, $DE69
	db $04 : dw $1E26 : dw $1E41, $5E66, $1C00, $9E68
	db $04 : dw $1E28 : dw $1E40, $5E57, $1C00, $DE69
	db $03 : dw $1E6A : dw $1E5B, $1C00, $9E63
	db $01 : dw $1EEC : dw $9E65
	db $01 : dw $1E6E : dw $5E57
	db $01 : dw $1E70 : dw $5E6B
	db $03 : dw $1E72 : dw $5E57, $1C00, $1E65
	db $03 : dw $1E74 : dw $5E56, $5E5B, $9E64
	db $02 : dw $1EB6 : dw $5E61, $DE63
	db $02 : dw $1EB8 : dw $5E60, $DE62
	db $02 : dw $1EBA : dw $5E56, $5E56
	db $02 : dw $1EBC : dw $1E40, $1E50
	db $02 : dw $1EBE : dw $1E41, $1E51

	db $16
	db $07 : dw $1D50 : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $1E50
	db $07 : dw $1D52 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E50, $5E56
	db $07 : dw $1D54 : dw $1C70, $1C44, $1C74, $1C02, $1E40, $5E56, $1E6B
	db $08 : dw $1D16 : dw $1C00, $1C71, $1C73, $1C75, $1C77, $1E41, $1E61, $9E64
	db $08 : dw $1D18 : dw $1CAC, $1E92, $1D08, $1EB2, $1E50, $1E40, $5E7E, $5E7C
	db $09 : dw $1CDA : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E41, $1E67, $1E5B
	db $08 : dw $1CDC : dw $1E02, $1CA4, $1E22, $5D02, $1E40, $1E50, $1E40, $1E6A
	db $09 : dw $1CDE : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $5E56, $1C00, $1C00
	db $08 : dw $1CA0 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40, $1E50, $1E61
	db $0A : dw $1CA2 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $5E56, $1E7D, $1C00, $DE64
	db $0A : dw $1CA4 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50, $1E6B, $9E65, $1C00, $9E62
	db $0A : dw $1CA6 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E64, $1C00, $1C00, $DE69
	db $04 : dw $1E28 : dw $1E57, $1C00, $9E62, $9E56
	db $04 : dw $1E2A : dw $5E56, $5E5B, $9E64, $DE54
	db $03 : dw $1E6C : dw $1E57, $1C00, $9E69
	db $01 : dw $1E6E : dw $1E62
	db $03 : dw $1E70 : dw $1E66, $1C00, $1E65
	db $03 : dw $1E72 : dw $1EC0, $5E5B, $9E64
	db $03 : dw $1E74 : dw $1ED0, $5E61, $DE63
	db $02 : dw $1EB6 : dw $5E60, $DE62
	db $02 : dw $1EB8 : dw $5E56, $5E56
	db $02 : dw $1EBA : dw $1E51, $1E41

	db $15
	db $02 : dw $1E92 : dw $1E41, $1E51
	db $07 : dw $1D54 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E50, $1E40
	db $07 : dw $1D56 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E56
	db $08 : dw $1D18 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50, $5E56, $1E6B
	db $09 : dw $1CDA : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E7C, $1E63
	db $09 : dw $1CDC : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $1E50, $1E67, $9E66
	db $09 : dw $1CDE : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E6A, $9E6B
	db $09 : dw $1CE0 : dw $1E78, $1C80, $1E98, $1D00, $1EB8, $1EC8, $1E56, $1E65, $1C00
	db $09 : dw $1CE2 : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1E66, $1C00, $1C00
	db $0A : dw $1CA4 : dw $1C00, $1E0A, $1CA8, $1E2A, $1D04, $1E48, $1E58, $1E63, $1C00, $9E65
	db $0A : dw $1CA6 : dw $1C00, $1E0B, $1E1B, $1E2B, $1E3B, $1E49, $1E59, $1E64, $1C00, $DE5A
	db $0A : dw $1CA8 : dw $1C00, $1E8A, $1CA0, $1EAA, $1EBA, $1EC8, $1E6B, $1C00, $1E7F, $9E54
	db $0A : dw $1CAA : dw $1C00, $1E8B, $1E9B, $1EAB, $1EBB, $1EC9, $5E7C, $1C00, $9E57, $9E55
	db $0A : dw $1CAC : dw $1E78, $1E88, $1C62, $1EA8, $1EB8, $1EC8, $5E7D, $1C00, $9E64, $9E6A
	db $0A : dw $1CAE : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1EC9, $5E57, $1C00, $1C00, $9E65
	db $04 : dw $1E30 : dw $1E56, $5E5B, $1C00, $1C00
	db $03 : dw $1E72 : dw $5E57, $1C00, $1C00
	db $03 : dw $1E74 : dw $1E56, $5E57, $1E65
	db $02 : dw $1EB6 : dw $5E57, $9E64
	db $02 : dw $1EB8 : dw $5E61, $DE63
	db $02 : dw $1EBA : dw $1E56, $1E56

	db $12
	db $07 : dw $1D54 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1E40, $1E50
	db $07 : dw $1D56 : dw $1C00, $5E02, $5E12, $5C84, $5E32, $1E41, $1E51
	db $08 : dw $1D18 : dw $1C00, $1C00, $1E02, $1E12, $1C84, $1E32, $1E40, $1E50
	db $08 : dw $1D1A : dw $1C00, $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $08 : dw $1D1C : dw $1C00, $1C00, $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0
	db $08 : dw $1D1E : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1
	db $09 : dw $1CE0 : dw $1C00, $1C00, $1E82, $1CC6, $1EA2, $1EB2, $1E59, $1E59, $1E56
	db $09 : dw $1CE2 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $5E56, $5E56, $1E6B
	db $09 : dw $1CE4 : dw $1C00, $1E02, $1E12, $1C84, $1E32, $1E40, $1E61, $1E63, $9E64
	db $09 : dw $1CE6 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E63, $1E64, $9E65
	db $09 : dw $1CE8 : dw $1C00, $1CAA, $1E92, $1D08, $1EB2, $1EC0, $1E64, $1E65, $1C00
	db $09 : dw $1CEA : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E56, $1E65, $1C00, $9E62
	db $0A : dw $1CAC : dw $1C00, $1E0C, $1C6C, $1E2C, $1CEA, $1E4C, $5E66, $1E65, $DE5B, $DE69
	db $0A : dw $1CAE : dw $1C00, $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $5E66, $1C00, $9E66, $9E58
	db $09 : dw $1CF0 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $5E66, $1C00, $1C00, $9E69
	db $09 : dw $1CF2 : dw $1C00, $5CAC, $5E92, $5D08, $5EB2, $1EC1, $5E6B, $1C00, $9E64
	db $02 : dw $1E34 : dw $1E40, $1E50
	db $02 : dw $1E36 : dw $1E41, $1E51

	db $13
	db $06 : dw $1D98 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $5ED1
	db $06 : dw $1D9A : dw $1C00, $5E82, $5C8C, $5EA2, $5EB2, $5ED0
	db $04 : dw $1D9C : dw $1E02, $1E12, $1CAE, $1E32
	db $05 : dw $1D5E : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $07 : dw $1D60 : dw $1C00, $1CAA, $1E92, $1D08, $1EB2, $5EC1, $5ED1
	db $08 : dw $1D22 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $5EC0, $5ED0
	db $08 : dw $1D24 : dw $1C00, $1E82, $1CC6, $1EA2, $1D0A, $5EC1, $5E56, $1E6B
	db $08 : dw $1D26 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $5EC0, $1E63, $9E64
	db $08 : dw $1D28 : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E56, $1E64, $9E65
	db $09 : dw $1CEA : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E56, $1E65, $1C00
	db $09 : dw $1CEC : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $1E6B, $1C00, $1C00
	db $09 : dw $1CEE : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E7C, $1C00, $1C00, $DE5B
	db $09 : dw $1CF0 : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E7C, $1C00, $1C00, $9E60
	db $08 : dw $1D32 : dw $1E01, $1E11, $1E21, $1E31, $1E56, $5E6A, $1C00, $9E60
	db $04 : dw $1E34 : dw $1EC0, $1E56, $1C00, $9E6B
	db $04 : dw $1E36 : dw $1EC1, $1E56, $5E57, $DE63
	db $02 : dw $1EB8 : dw $5E57, $9E64
	db $02 : dw $1EBA : dw $5E61, $DE63
	db $02 : dw $1EBC : dw $1E56, $1E56

	db $11
	db $06 : dw $1D9C : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $1D9E : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $06 : dw $1DA0 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50
	db $07 : dw $1D62 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $07 : dw $1D64 : dw $1C00, $1CAA, $1E92, $1D08, $1EB2, $5ED1, $5EC1
	db $08 : dw $1D26 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $5ED0, $5EC0
	db $08 : dw $1D28 : dw $1C00, $1E82, $1CC6, $1EA2, $1D0A, $1E50, $5E56, $1E6B
	db $08 : dw $1D2A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E63, $9E64
	db $08 : dw $1D2C : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E56, $1E64, $9E65
	db $08 : dw $1D2E : dw $1E03, $1E13, $1E23, $1E33, $1E56, $1E5A, $1E65, $1C00
	db $04 : dw $1E30 : dw $1E40, $1E57, $1C00, $DE65
	db $04 : dw $1E32 : dw $1E41, $1E60, $1C00, $DE63
	db $03 : dw $1E74 : dw $1E57, $1C00, $DE63
	db $03 : dw $1E76 : dw $1E57, $1C00, $9E64
	db $02 : dw $1EB8 : dw $5E6B, $9E65
	db $02 : dw $1EBA : dw $1E56, $9E7E
	db $02 : dw $1EBC : dw $1E40, $1E50

	db $0E
	db $06 : dw $1DA0 : dw $1C00, $1E82, $1C8C, $1EA2, $1EB2, $1EC0
	db $06 : dw $1DA2 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1
	db $06 : dw $1DA4 : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E50
	db $07 : dw $1D66 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $07 : dw $1D68 : dw $1C00, $1CAA, $1E92, $1D08, $1EB2, $5ED0, $5EC0
	db $08 : dw $1D2A : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $5E56, $5E7F
	db $08 : dw $1D2C : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1EC0, $1E63, $9E64
	db $08 : dw $1D2E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1EC1, $1E64, $9E65
	db $08 : dw $1D30 : dw $1E02, $1E12, $1CAE, $1E32, $1E40, $1E56, $1E65, $1C00
	db $08 : dw $1D32 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E57, $1E65, $1C00
	db $03 : dw $1E74 : dw $1E66, $1C00, $1C00
	db $01 : dw $1EF6 : dw $1C00
	db $03 : dw $1E78 : dw $1E66, $1C00, $9E64
	db $02 : dw $1EBA : dw $5E6B, $DE6B

	db $0C
	db $06 : dw $1DA8 : dw $1E00, $1E10, $1C04, $1E30, $1E40, $1E50
	db $07 : dw $1D6A : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E51
	db $07 : dw $1D6C : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1E61, $9E61
	db $07 : dw $1D6E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E63, $9E63
	db $08 : dw $1D30 : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1EC0, $5E57, $9E65
	db $07 : dw $1D32 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1EC1, $1E6B
	db $06 : dw $1D34 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $5E66
	db $07 : dw $1D36 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $5E6B
	db $03 : dw $1E78 : dw $1E40, $5E57, $9E65
	db $02 : dw $1EBA : dw $5E57, $9E64
	db $02 : dw $1EBC : dw $5E6B, $DE6B
	db $01 : dw $1EFE : dw $1E33

	db $0A
	db $06 : dw $1DAC : dw $1E00, $1E10, $1C04, $1E30, $1E60, $9E66
	db $07 : dw $1D6E : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E61, $9E61
	db $07 : dw $1D70 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $5E57, $9E63
	db $07 : dw $1D72 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E6B, $9E65
	db $06 : dw $1D74 : dw $1E0C, $1C2A, $1E2C, $1E3C, $1E4C, $5E57
	db $06 : dw $1D76 : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1E66
	db $07 : dw $1D78 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $5E57, $DE63
	db $07 : dw $1D7A : dw $1C00, $5CAC, $5E92, $5D08, $5EB2, $5E57, $DE61
	db $01 : dw $1EFC : dw $DE66
	db $02 : dw $1EBE : dw $5E41, $5E51

	db $0B
	db $01 : dw $1EEA : dw $1E56
	db $02 : dw $1EAC : dw $1E40, $1E60
	db $02 : dw $1EAE : dw $1E41, $1E61
	db $06 : dw $1DB0 : dw $1E00, $1E10, $1C04, $1E30, $1E40, $5E57
	db $07 : dw $1D72 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E6B
	db $07 : dw $1D74 : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $5E57
	db $07 : dw $1D76 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E66
	db $07 : dw $1D78 : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $5E57
	db $06 : dw $1DBA : dw $1E01, $1E11, $1E21, $1E31, $1E41, $5E57
	db $02 : dw $1EBC : dw $1E40, $5E6B
	db $02 : dw $1EBE : dw $1E41, $1E51

.5 ;B663
	db $0A

	db $18
	db $01 : dw $03E6 : dw $1E73
	db $01 : dw $0530 : dw $5E51
	db $01 : dw $0532 : dw $5E50
	db $07 : dw $0574 : dw $1EDC, $1EDC, $1ECC, $1EDC, $1ECC, $1EDC, $1ECC
	db $07 : dw $0576 : dw $1EDD, $1EDD, $1ECD, $1EDD, $1ECD, $1EDD, $1ECD
	db $0B : dw $0478 : dw $1E8C, $1C22, $1EAC, $1EBC, $1ECC, $1EDC, $1ECC, $1EDC, $1ECC, $1EDC, $1ECC
	db $0B : dw $047A : dw $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1EDD, $1ECD, $1EDD, $1ECD, $1EDD, $1ECD
	db $0E : dw $03BC : dw $1C00, $1C00, $5C00, $1E00, $1C24, $1E20, $1E30, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40
	db $0D : dw $03BE : dw $1C00, $1C00, $5C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51
	db $0B : dw $0C00 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50
	db $09 : dw $0C42 : dw $5E02, $5CCE, $5E22, $5D20, $1E41, $1E51, $1E41, $1E51, $1E41
	db $08 : dw $0C44 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40
	db $06 : dw $0C86 : dw $5E02, $5E12, $5C84, $5E32, $1E41, $1E51
	db $08 : dw $0C88 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1E56, $1E63
	db $09 : dw $0C8A : dw $1C00, $5E82, $5CC6, $5EA2, $5EB2, $1EC1, $1ED1, $1E57, $1C00
	db $07 : dw $0CCC : dw $5E0F, $5E1F, $5E2F, $5E3F, $5E4F, $1E5C, $5E61
	db $07 : dw $0CCE : dw $1C00, $5CAA, $5E2E, $5D06, $5E4E, $1E5D, $5E68
	db $06 : dw $0D92 : dw $5CAE, $5E32, $1E41, $1EDD, $1E66, $5E7E
	db $02 : dw $0E54 : dw $1E50, $1E40
	db $02 : dw $0E56 : dw $1E51, $1E41
	db $02 : dw $0E58 : dw $1E40, $1E56
	db $01 : dw $0E5A : dw $1E41
	db $05 : dw $0D5C : dw $1E78, $1C40, $1E98, $1CE4, $5EB3
	db $05 : dw $0D5E : dw $1E79, $1E89, $1E99, $1EA9, $5EB2

	db $17
	db $07 : dw $0574 : dw $1E50, $1E40, $1E50, $1E40, $1E50, $1E50, $1E40
	db $07 : dw $0576 : dw $1E51, $1E41, $1E51, $1E41, $1E51, $1E51, $1E41
	db $0B : dw $0478 : dw $1E00, $1C24, $1E20, $1E30, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40
	db $0B : dw $047A : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1E67
	db $0C : dw $043C : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1E6A
	db $0C : dw $043E : dw $1C00, $5E02, $5CCE, $5E22, $5D20, $1E41, $1E51, $1E41, $1E51, $1E41, $1E66, $1E7E
	db $0B : dw $0C40 : dw $1C00, $1C42, $1E9C, $1CE6, $1EBC, $1ECC, $1EDC, $1ECC, $1E67, $1E5B, $9E64
	db $0B : dw $0C42 : dw $1C00, $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1EDD, $1E56, $1E63, $1C00, $9E63
	db $0A : dw $0C84 : dw $5E07, $5E17, $5E27, $5E37, $1E54, $1E44, $1E54, $1E61, $1E65, $9E62
	db $0A : dw $0C86 : dw $5E06, $5E16, $5CC0, $5E36, $1E55, $1E45, $1E55, $1E7C, $1E64, $9E62
	db $0A : dw $0C88 : dw $1C00, $5E8B, $5E9B, $5EAB, $5EBB, $1EC8, $1ED8, $5E68, $1E64, $9E64
	db $09 : dw $0CCA : dw $5E8A, $5CCA, $5EAA, $5D0C, $1EC9, $1ED9, $1EC9, $1E62, $9E64
	db $04 : dw $0E0C : dw $5E41, $1EDC, $1E61, $9E65
	db $04 : dw $0E0E : dw $5E40, $1EDD, $1E66, $5E7E
	db $03 : dw $0E50 : dw $1E50, $1E40, $1E7E
	db $03 : dw $0E52 : dw $1E51, $1E41, $1E57
	db $03 : dw $0E54 : dw $1E40, $1E56, $1E7D
	db $03 : dw $0E56 : dw $1E41, $1E51, $1E7C
	db $03 : dw $0E58 : dw $5EB3, $1EC0, $5E69
	db $07 : dw $0D5A : dw $5C00, $5CAC, $5E92, $5D08, $5EB2, $1EC1, $1E61
	db $03 : dw $0E5C : dw $1EB8, $1EC8, $1E67
	db $03 : dw $0E5E : dw $1EB9, $1EC9, $1E7C
	db $01 : dw $0DB6 : dw $5C00

	db $12
	db $01 : dw $0530 : dw $1EC0
	db $01 : dw $0532 : dw $1EC1
	db $0A : dw $0434 : dw $5E73, $5E83, $5E93, $5EA3, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40
	db $0A : dw $0436 : dw $1C00, $5E82, $5C8C, $5EA2, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41
	db $09 : dw $0C80 : dw $1E0C, $1E1C, $1C0A, $1E3C, $1E4C, $1E5C, $1E6C, $1E56, $1E6B
	db $08 : dw $0C82 : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1E5D, $1E6D, $1E57
	db $07 : dw $0C84 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1EC0
	db $07 : dw $0C86 : dw $5C00, $5E82, $5C0C, $5EA2, $5EB2, $1EC1, $1EC1
	db $04 : dw $0CC8 : dw $5E03, $5E13, $5E23, $5E33
	db $04 : dw $0CCA : dw $5E02, $5CCE, $5E22, $5D20
	db $02 : dw $0E0C : dw $1E44, $1E54
	db $02 : dw $0E0E : dw $1E45, $1E55
	db $07 : dw $0D10 : dw $5E0B, $5E1B, $5E2B, $5E3B, $1E48, $1E58, $1E48
	db $07 : dw $0D12 : dw $5E0A, $5E1A, $5CC0, $5E3A, $1E49, $1E59, $1E49
	db $08 : dw $0D14 : dw $5C00, $5E0B, $5E1B, $5E2B, $5E3B, $1E48, $1E58, $1E60
	db $07 : dw $0D16 : dw $5C00, $5E0A, $5CA8, $5E2A, $5D04, $1E49, $1E59
	db $06 : dw $0D58 : dw $1E78, $1C42, $1E9C, $1CE6, $1EBC, $1ECC
	db $07 : dw $0D5A : dw $1E79, $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1E67

	db $15
	db $09 : dw $03B4 : dw $1C00, $1C00, $5E73, $5E83, $5E93, $5EA3, $5EB3, $1E40, $5E51
	db $09 : dw $03B6 : dw $1C00, $1C00, $1C00, $5E82, $5C8C, $5EA2, $5EB2, $1E41, $5E50
	db $03 : dw $03B8 : dw $1C00, $1C00, $1C00
	db $03 : dw $03BA : dw $1C00, $1C00, $1C00
	db $01 : dw $057C : dw $5E40
	db $01 : dw $057E : dw $5D23
	db $07 : dw $0C80 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40, $1E50
	db $08 : dw $0C82 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E60
	db $0A : dw $0C84 : dw $1C00, $1E08, $1C28, $1E28, $1E38, $1E48, $1E58, $1E56, $1E64, $1E7F
	db $0A : dw $0C86 : dw $1C00, $1E09, $1E19, $1E29, $1E39, $1E49, $1E59, $1E49, $1E62, $5E7F
	db $08 : dw $0CC8 : dw $5E0F, $5E1F, $5E2F, $5E3F, $5E4F, $5E5D, $5E6D, $1E57
	db $09 : dw $0CCA : dw $1C00, $5CAA, $5E2E, $5D06, $5E4E, $5E5C, $5E6C, $1E60, $9E63
	db $08 : dw $0CCC : dw $1C00, $5E07, $5E17, $5E27, $5E37, $1E44, $1E54, $5E67
	db $07 : dw $0D0E : dw $5E06, $5E16, $5C86, $5E36, $1E45, $1E55, $1E56
	db $07 : dw $0D10 : dw $5E77, $5E87, $5E97, $5EA7, $5EB7, $1EC4, $1ED4
	db $07 : dw $0D12 : dw $1C00, $5E86, $5CC8, $5EA6, $5D0A, $1EC5, $1ED5
	db $07 : dw $0D14 : dw $1C00, $1E74, $1C2E, $1E94, $1CE2, $1EB4, $1EC4
	db $07 : dw $0D16 : dw $1C00, $1E75, $1E85, $1E95, $1EA5, $1EB5, $1EC5
	db $07 : dw $0D5C : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $1E56
	db $07 : dw $0D5E : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E56
	db $01 : dw $0DB6 : dw $1C00

	db $12
	db $01 : dw $05B4 : dw $1E50
	db $01 : dw $05B6 : dw $1E51
	db $02 : dw $06BE : dw $1E56, $1E64
	db $08 : dw $0CC0 : dw $1C00, $1C42, $1E9C, $1CE6, $1EBC, $1ECC, $1EDC, $1E60
	db $08 : dw $0CC2 : dw $1C00, $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1EDD, $1E63
	db $08 : dw $0CC4 : dw $1C00, $1E04, $1E14, $1C06, $1E34, $1E44, $1E54, $1E57
	db $09 : dw $0CC6 : dw $1C00, $1E05, $1E15, $1E25, $1E35, $1E45, $1E55, $1E66, $5E7E
	db $08 : dw $0CC8 : dw $1C00, $1E04, $1E14, $1C06, $1E34, $1E44, $1E54, $1E66
	db $06 : dw $0D0A : dw $1E05, $1E15, $1E25, $1E35, $1E45, $1E55
	db $04 : dw $0D0C : dw $5E03, $5E13, $5E23, $5E33
	db $08 : dw $0D0E : dw $5E02, $5E12, $5CC0, $5E32, $1E45, $1E55, $1E56, $5E63
	db $08 : dw $0D10 : dw $1C00, $5C71, $5C73, $5C75, $5C77, $5E41, $1E6C, $1E60
	db $07 : dw $0D52 : dw $5C70, $5C44, $5C74, $5C02, $5E40, $1E6D, $1E66
	db $07 : dw $0D54 : dw $1C00, $1E00, $1E10, $1C04, $1E30, $1E40, $1E67
	db $06 : dw $0D56 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $01 : dw $0ED8 : dw $1E7C
	db $01 : dw $0EDA : dw $5E69
	db $01 : dw $0EDC : dw $1E67

	db $0C
	db $08 : dw $0D00 : dw $1E00, $1E10, $1C04, $1E30, $1E40, $1E50, $1E60, $1E65
	db $08 : dw $0D02 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E7C, $1E7F
	db $06 : dw $0D04 : dw $1E0C, $1E1C, $1C0A, $1E3C, $1E4C, $1E5C
	db $06 : dw $0D06 : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1E5D
	db $08 : dw $0D08 : dw $1E70, $1E80, $1C06, $1EA0, $1EB0, $1EC0, $1E56, $1E62
	db $08 : dw $0D0A : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1ED1, $1E7D
	db $08 : dw $0D0C : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1ED0, $1E63
	db $08 : dw $0D0E : dw $1C00, $5E82, $5CC6, $5EA2, $5EB2, $1EC1, $1ED1, $5E61
	db $02 : dw $0E50 : dw $5EB3, $1EC0
	db $02 : dw $0E52 : dw $5EB2, $1EC1
	db $05 : dw $0D54 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3
	db $04 : dw $0D96 : dw $5CAC, $5E92, $5D08, $5EB2

	db $16
	db $01 : dw $06FC : dw $1E67
	db $02 : dw $06BE : dw $1E51, $1E7D
	db $02 : dw $0E80 : dw $1E56, $1E63
	db $01 : dw $0E82 : dw $1E67
	db $06 : dw $0D04 : dw $1E74, $1E84, $1C0E, $1EA4, $1EB4, $1EC4
	db $06 : dw $0D06 : dw $1E75, $1E85, $1E95, $1EA5, $1EB5, $1EC5
	db $06 : dw $0D08 : dw $1C00, $5E8F, $5E9F, $5EAF, $5EBF, $1ECC
	db $07 : dw $0D0A : dw $1C00, $5E8E, $5CA2, $5EAE, $5EBE, $1ECD, $1EDD
	db $07 : dw $0D0C : dw $1C00, $5E0F, $5E1F, $5E2F, $5E3F, $1E4E, $1E5C
	db $06 : dw $0D4E : dw $1C00, $5CAA, $5E2E, $5D06, $1E4F, $1E5D
	db $06 : dw $0D50 : dw $1C00, $1C42, $1E9C, $1CE6, $1EBC, $1ECC
	db $06 : dw $0D52 : dw $1C00, $1E8F, $1E9D, $1EAD, $1EBD, $1ECD
	db $05 : dw $0D54 : dw $1C00, $5E03, $5E13, $5E23, $5E33
	db $04 : dw $0D96 : dw $5E02, $5E12, $5CAE, $5E32
	db $07 : dw $0D58 : dw $1C00, $1C00, $1E82, $1C8C, $1EA2, $1EB2, $5E69
	db $07 : dw $0D5A : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1
	db $06 : dw $0D9C : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E50
	db $04 : dw $0D9E : dw $1E03, $1E13, $1E23, $1E33
	db $02 : dw $0EA0 : dw $1EC0, $1E66
	db $02 : dw $0EA2 : dw $1EC1, $1E60
	db $02 : dw $0EA4 : dw $1E50, $1E61
	db $01 : dw $0EE6 : dw $1E7E

	db $0F
	db $01 : dw $06FA : dw $1E41
	db $06 : dw $05BC : dw $5E50, $1E40, $1E50, $1E40, $1E50, $1E40
	db $06 : dw $05BE : dw $5D22, $1E41, $1E51, $1E41, $1E51, $1E56
	db $08 : dw $0D00 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40, $1E6A
	db $08 : dw $0D02 : dw $5E02, $5E12, $5CAE, $5E32, $1E41, $1E51, $1E41, $1E7C
	db $07 : dw $0D04 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40, $1E66
	db $08 : dw $0D06 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E56, $1E7E
	db $07 : dw $0D48 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E56, $5E6A
	db $07 : dw $0D4A : dw $5E02, $5CCE, $5E22, $5D20, $1E41, $1E51, $1E7C
	db $07 : dw $0D4C : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1E40, $1E60
	db $05 : dw $0DCE : dw $5E92, $5D08, $5EB2, $1E41, $1E66
	db $05 : dw $0D90 : dw $5E03, $5E13, $5E23, $5E33, $1E40
	db $05 : dw $0D92 : dw $5E02, $5E12, $5C84, $5E32, $1E41
	db $05 : dw $0D94 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3
	db $06 : dw $0D96 : dw $1C00, $5E82, $5C8C, $5EA2, $5EB2, $1EC1

	db $10
	db $01 : dw $0EC0 : dw $1E60
	db $01 : dw $0EC2 : dw $1E62
	db $07 : dw $0D44 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E56, $1E64
	db $06 : dw $0D46 : dw $5E02, $5CA4, $5E22, $5E32, $1E41, $1E51
	db $07 : dw $0D48 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1E7D
	db $06 : dw $0D4A : dw $1C00, $5CAC, $5E92, $5D08, $5EB2, $1EC1
	db $05 : dw $0D4C : dw $1C00, $5E03, $5E13, $5E23, $5E33
	db $04 : dw $0D8E : dw $5E02, $5E12, $5C84, $5E32
	db $06 : dw $0D90 : dw $1E70, $1E80, $1C0C, $1EA0, $1EB0, $1EC8
	db $06 : dw $0D92 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1
	db $06 : dw $0D94 : dw $1E78, $1E88, $1C20, $1EA8, $1EB8, $1EC8
	db $05 : dw $0DD6 : dw $1E89, $1E99, $1EA9, $1EB9, $1EC9
	db $02 : dw $0EA0 : dw $1E40, $1E67
	db $02 : dw $0EA2 : dw $1E41, $1E7C
	db $02 : dw $0EA4 : dw $1E40, $1E7D
	db $01 : dw $0EE6 : dw $1E7D

	db $10
	db $01 : dw $0EC2 : dw $1E61
	db $02 : dw $0E84 : dw $5E56, $1E62
	db $06 : dw $0D86 : dw $5CCE, $5E22, $5D20, $1E41, $5E50, $5E62
	db $07 : dw $0D48 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1EC0, $5E61
	db $06 : dw $0D8A : dw $5E02, $5E12, $5C84, $5E32, $1EC1, $5E60
	db $05 : dw $0D8C : dw $1E74, $1E84, $1C0E, $1EA4, $1EB4
	db $06 : dw $0D8E : dw $1E75, $1E85, $1E95, $1EA5, $1EB5, $1E56
	db $05 : dw $0D90 : dw $1E78, $1E88, $1C20, $1EA8, $1EB8
	db $06 : dw $0D92 : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1EC9
	db $06 : dw $0D94 : dw $1C00, $1E8C, $1C22, $1EAC, $1EBC, $1ECC
	db $05 : dw $0DD6 : dw $1E8D, $1E9D, $1EAD, $1EBD, $1ECD
	db $01 : dw $0ED8 : dw $1EC0
	db $02 : dw $0EA0 : dw $1EC0, $1E66
	db $02 : dw $0EA2 : dw $1EC1, $1E60
	db $02 : dw $0EA4 : dw $1E50, $1E61
	db $01 : dw $0EE6 : dw $1E7E

.6: ;C0B7
	db $04

	db $2A
	db $02 : dw $0E80 : dw $5E46, $5EDF
	db $01 : dw $0EC2 : dw $5EE0
	db $02 : dw $0E84 : dw $5E46, $5EDF
	db $01 : dw $0EC6 : dw $5EE0
	db $02 : dw $0E88 : dw $5E46, $5EDF
	db $01 : dw $0ECA : dw $5EE0
	db $02 : dw $0E8C : dw $5E46, $5EDF
	db $01 : dw $0ECE : dw $5EE0
	db $02 : dw $0E90 : dw $5E46, $5EDF
	db $01 : dw $0ED2 : dw $5EE0
	db $02 : dw $0E94 : dw $5E46, $5EDF
	db $01 : dw $0ED6 : dw $5EE0
	db $02 : dw $0E98 : dw $5E46, $5EDF
	db $01 : dw $0EDA : dw $5EE0
	db $02 : dw $0E9C : dw $5E46, $5EE0
	db $01 : dw $0EDE : dw $5EE0
	db $02 : dw $0EA0 : dw $5E46, $5EDF
	db $01 : dw $0EE2 : dw $5EE0
	db $02 : dw $0EA4 : dw $5E46, $5EDF
	db $01 : dw $0EE6 : dw $5EE0
	db $02 : dw $0EA8 : dw $5E46, $5EDF
	db $01 : dw $0EEA : dw $5EE0
	db $02 : dw $0EAC : dw $5E46, $5EDF
	db $01 : dw $0EEE : dw $5EE0
	db $02 : dw $0EB0 : dw $5E46, $5EDF
	db $01 : dw $0EF2 : dw $5EE0
	db $02 : dw $0EB4 : dw $5E46, $5EDF
	db $01 : dw $0EF6 : dw $5EE0
	db $09 : dw $0CF8 : dw $1C00, $1C44, $1C74, $1C02, $1E43, $1EDE, $5E47, $5E46, $5EE0
	db $01 : dw $0EFA : dw $5EE0
	db $0B : dw $0C7C : dw $1C70, $1C44, $1C74, $1C02, $1E54, $1E40, $5E42, $5ECF, $5E47, $5E46, $5EDF
	db $01 : dw $0EFE : dw $5EE0
	db $04 : dw $1344 : dw $1E02, $1CCE, $1E22, $1D20
	db $04 : dw $1346 : dw $1E03, $1E13, $1E23, $1E33
	db $07 : dw $12C8 : dw $1C00, $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50
	db $07 : dw $12CA : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $06 : dw $128C : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1E40
	db $06 : dw $128E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41
	db $06 : dw $1290 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1E40
	db $06 : dw $1292 : dw $1C00, $5E02, $5CA4, $5E22, $5E32, $1E41
	db $05 : dw $12D4 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3
	db $05 : dw $12D6 : dw $1C00, $5CAC, $5E92, $5D08, $5EB2

	db $10
	db $05 : dw $13C0 : dw $1C00, $1E00, $1E10, $1C04, $1E30
	db $05 : dw $13C2 : dw $1C00, $1E01, $1E11, $1E21, $1E31
	db $06 : dw $1344 : dw $1C00, $1C00, $1C70, $1C44, $1C74, $1C02
	db $06 : dw $1346 : dw $1C00, $1C00, $1C71, $1C73, $1C75, $1C77
	db $06 : dw $1308 : dw $1C00, $1C70, $1C44, $1C74, $1C02, $1E40
	db $06 : dw $130A : dw $1C00, $1C71, $1C73, $1C75, $1C77, $1E41
	db $05 : dw $12CC : dw $1C00, $1E00, $1E10, $1C04, $1E30
	db $05 : dw $12CE : dw $1C00, $1E01, $1E11, $1E21, $1E31
	db $05 : dw $12D0 : dw $1C00, $1E00, $1E10, $1C04, $1E30
	db $05 : dw $12D2 : dw $1C00, $1E01, $1E11, $1E21, $1E31
	db $05 : dw $12D4 : dw $1C00, $1E00, $1E10, $1C04, $1E30
	db $04 : dw $1316 : dw $1E01, $1E11, $1E21, $1E31
	db $01 : dw $135E : dw $5E02
	db $01 : dw $13A2 : dw $5E02
	db $01 : dw $13E4 : dw $5E03
	db $01 : dw $13E6 : dw $5E02

	db $15
	db $01 : dw $0D5A : dw $1E40
	db $01 : dw $0D5C : dw $1E41
	db $01 : dw $0D5E : dw $5EB2
	db $01 : dw $0DF6 : dw $1E54
	db $02 : dw $0D38 : dw $1CCE, $1E22
	db $02 : dw $0D3A : dw $1E13, $1E23
	db $05 : dw $0C7C : dw $1C00, $1E02, $1E12, $1CAE, $1E32
	db $05 : dw $0C7E : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $05 : dw $1400 : dw $1C00, $1E02, $1CCE, $1E22, $1D20
	db $05 : dw $1402 : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $05 : dw $13C4 : dw $1C00, $1E02, $1E12, $1CAE, $1E32
	db $05 : dw $13C6 : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $06 : dw $1348 : dw $1C00, $1C00, $1C70, $1C44, $1C74, $1C02
	db $06 : dw $134A : dw $1C00, $1C00, $1C71, $1C73, $1C75, $1C77
	db $07 : dw $130C : dw $1C00, $1E02, $1CCE, $1E22, $1C02, $1E40, $1E50
	db $07 : dw $130E : dw $1C00, $1E03, $1E13, $1E23, $1C77, $1E41, $1E51
	db $07 : dw $1310 : dw $1C00, $1E82, $1C8C, $1EA2, $1EB2, $1EC0, $1ED0
	db $07 : dw $1312 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1
	db $07 : dw $1314 : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E50, $1E40
	db $08 : dw $1316 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51
	db $01 : dw $14E4 : dw $1E40

	db $0B
	db $01 : dw $0DF6 : dw $1C77
	db $01 : dw $1540 : dw $1E50
	db $01 : dw $1542 : dw $1E51
	db $04 : dw $13C8 : dw $1E02, $1CCE, $1E22, $1D20
	db $04 : dw $13CA : dw $1E03, $1E13, $1E23, $1E33
	db $06 : dw $134C : dw $1C00, $1E02, $1E12, $1CAE, $1E32, $1E40
	db $06 : dw $134E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41
	db $06 : dw $1350 : dw $1E02, $1CCE, $1E22, $1D20, $1E50, $1E40
	db $07 : dw $1312 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E51, $1E41
	db $05 : dw $1394 : dw $1CAE, $1E32, $1E40, $1E50, $1E50
	db $02 : dw $1496 : dw $1E51, $1E40

.7: ;C452
	db $03

	db $0C
	db $06 : dw $1B84 : dw $0000, $5E03, $5E13, $5E23, $5E33, $1E40
	db $06 : dw $1B86 : dw $0000, $0000, $5CCE, $5E22, $5D20, $1E41
	db $06 : dw $1B48 : dw $0000, $0000, $0000, $1CCE, $1E22, $1D20
	db $06 : dw $1B4A : dw $0000, $0000, $1E03, $1E13, $1E23, $1E33
	db $07 : dw $1B4C : dw $0000, $0000, $5E03, $5E13, $5E23, $5E33, $1E50
	db $07 : dw $1B4E : dw $0000, $0000, $5E02, $5CCE, $5E22, $5D20, $1E51
	db $05 : dw $1BD0 : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $06 : dw $1BD2 : dw $0000, $5E02, $5E12, $5CAE, $5E32, $1E42
	db $05 : dw $1C54 : dw $5E03, $5E13, $5E23, $5E33, $1E40
	db $03 : dw $1C56 : dw $5E02, $5CCE, $5E22
	db $01 : dw $1CDA : dw $5C70
	db $02 : dw $1CB6 : dw $0000, $0000

	db $0B
	db $01 : dw $1BC6 : dw $5E02
	db $04 : dw $1C08 : dw $1E00, $1E10, $1C04, $1E30
	db $05 : dw $1BCA : dw $0000, $1E01, $1E11, $1E21, $1E31
	db $05 : dw $1BCC : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $05 : dw $1BCE : dw $0000, $5E02, $5E12, $5CAE, $5E32
	db $05 : dw $1C10 : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $05 : dw $1C12 : dw $0000, $5E02, $5CCE, $5E22, $5D20
	db $05 : dw $1C54 : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $05 : dw $1C56 : dw $0000, $5E02, $5E12, $5CAE, $5E32
	db $03 : dw $1CD8 : dw $5E03, $5E13, $5E23
	db $03 : dw $1CDA : dw $5E02, $5CCE, $5E22

	db $0D
	db $06 : dw $1C08 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E50
	db $06 : dw $1C0A : dw $5E02, $5E12, $5CAE, $5E32, $1E41, $1E51
	db $05 : dw $1C0C : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $05 : dw $1C0E : dw $0000, $5E02, $5CCE, $5E22, $5D20
	db $06 : dw $1C50 : dw $0000, $5E03, $5E13, $5E23, $5E33, $5ECF
	db $06 : dw $1C52 : dw $0000, $5E02, $5E12, $5CAE, $5E32, $5E52
	db $06 : dw $1C94 : dw $0000, $5E03, $5E13, $5E23, $5E33, $5ECF
	db $06 : dw $1C96 : dw $0000, $5E02, $5CCE, $5E22, $5D20, $5E52
	db $06 : dw $1CD8 : dw $0000, $5E03, $5E13, $5E23, $5E33, $5ECF
	db $06 : dw $1CDA : dw $0000, $5E02, $5E12, $5CAE, $5E32, $5E52
	db $05 : dw $1D5C : dw $5E03, $5E13, $5E23, $5E33, $5ECF
	db $05 : dw $1D5E : dw $5E02, $5CCE, $5E22, $5D20, $5E52
	db $01 : dw $1E28 : dw $5ED2

.8: ;C620
	db $03

	db $0E
	db $07 : dw $02C8 : dw $1C00, $5E03, $5E13, $5E23, $5E33, $1E50, $1E50
	db $05 : dw $02CA : dw $1C00, $5E02, $5E12, $5C84, $5E32
	db $06 : dw $024C : dw $1C00, $1C00, $1C70, $1C44, $1C74, $1C02
	db $06 : dw $024E : dw $1C00, $1C00, $1C71, $1C73, $1C75, $1C77
	db $05 : dw $0250 : dw $1C00, $1E02, $1E12, $1C84, $1E32
	db $05 : dw $0252 : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $0E : dw $0318 : dw $1ED3, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $049A : dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $049C : dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $049E : dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $04A0 : dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $04A2 : dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $04A4 : dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $04A6 : dw $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00, $1C00

	db $08
	db $05 : dw $0344 : dw $1C00, $1E00, $1E10, $1C04, $1E30
	db $05 : dw $0346 : dw $1C00, $1E01, $1E11, $1E21, $1E31
	db $06 : dw $0308 : dw $1C00, $1C70, $1C44, $1C74, $1C02, $1E40
	db $05 : dw $030A : dw $1C00, $1C71, $1C73, $1C75, $1C77
	db $06 : dw $0290 : dw $1E00, $1E10, $1C84, $1E30, $1E50, $1E40
	db $07 : dw $0292 : dw $1E01, $1E11, $1E21, $1E31, $1E51, $1E41, $1E41
	db $01 : dw $0354 : dw $1E30
	db $01 : dw $0356 : dw $1E31

	db $0C
	db $04 : dw $03C0 : dw $1E02, $1CCE, $1E22, $1D20
	db $04 : dw $03C2 : dw $1E03, $1E13, $1E23, $1E33
	db $04 : dw $0384 : dw $1E02, $1E12, $1CAE, $1E32
	db $04 : dw $0386 : dw $1E03, $1E13, $1E23, $1E33
	db $04 : dw $0348 : dw $1E02, $1CCE, $1E22, $1D20
	db $04 : dw $034A : dw $1E03, $1E13, $1E23, $1E33
	db $05 : dw $02CC : dw $1C00, $1E02, $1E12, $1CAE, $1E32
	db $05 : dw $02CE : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $06 : dw $0290 : dw $1C00, $1E0A, $1CCE, $1E22, $1D20, $1E50
	db $07 : dw $0292 : dw $1C00, $1E0B, $1E13, $1E23, $1E33, $1E41, $1E42
	db $06 : dw $0294 : dw $1C00, $1E02, $1CAE, $1E22, $5E32, $5E42
	db $06 : dw $0296 : dw $1C00, $1E03, $1E13, $1E23, $1D2C, $5D24

.9: ;C818
	db $06

	db $0F
	db $02 : dw $0318 : dw $0000, $1ED3
	db $04 : dw $02EC : dw $5E03, $5E13, $5E23, $5E33
	db $04 : dw $02EE : dw $5E02, $5CCE, $5E22, $5D20
	db $05 : dw $02F0 : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $05 : dw $02F2 : dw $0000, $5E02, $5E12, $5CAE, $5E32
	db $07 : dw $02F4 : dw $0000, $0000, $5E03, $5E13, $5E23, $5E33, $1E50
	db $07 : dw $02F6 : dw $0000, $0000, $5E02, $5CCE, $5E22, $5D20, $1E51
	db $05 : dw $0378 : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $0A : dw $037A : dw $0000, $5E02, $5E12, $5CAE, $5E32, $1E51, $1E41, $1E42, $1ECF, $5ECF
	db $08 : dw $03FC : dw $5E03, $5E13, $5E23, $5E33, $1E50, $1E50, $1E40, $5E52
	db $05 : dw $03FE : dw $5E02, $5CCE, $5E22, $5D20, $1E51
	db $01 : dw $0DC0 : dw $1E52
	db $01 : dw $0DC2 : dw $1ECF
	db $01 : dw $0D8A : dw $5CAE
	db $01 : dw $0D4E : dw $5E02

	db $0F
	db $01 : dw $03D0 : dw $1E40
	db $01 : dw $03D2 : dw $1E41
	db $03 : dw $0326 : dw $0000, $1EC2, $1ED2
	db $05 : dw $02E8 : dw $0000, $1CAC, $1E92, $1D08, $1EB2
	db $05 : dw $02EA : dw $1E73, $1E83, $1E93, $1EA3, $1EB3
	db $05 : dw $02EC : dw $5E73, $5E83, $5E93, $5EA3, $5EB3
	db $05 : dw $02EE : dw $0000, $5CAC, $5E92, $5D08, $5EB2
	db $04 : dw $0330 : dw $1E00, $1E10, $1C04, $1E30
	db $04 : dw $0332 : dw $1E01, $1E11, $1E21, $1E31
	db $05 : dw $0374 : dw $5C71, $5C73, $5C75, $5C77, $1E40
	db $05 : dw $0376 : dw $5C70, $5C44, $5C74, $5C02, $1E41
	db $01 : dw $04FC : dw $1E40
	db $01 : dw $04FE : dw $1E41
	db $01 : dw $0DC2 : dw $1E43
	db $01 : dw $0D8A : dw $5C84

	db $0E
	db $04 : dw $0328 : dw $1E00, $1E10, $1C04, $1E30
	db $05 : dw $02EA : dw $0000, $1E01, $1E11, $1E21, $1E31
	db $05 : dw $02EC : dw $0000, $1E00, $1E10, $1C04, $1E30
	db $04 : dw $032E : dw $1E01, $1E11, $1E21, $1E31
	db $02 : dw $0430 : dw $1E40, $1E50
	db $02 : dw $0432 : dw $1E41, $1E51
	db $05 : dw $03B8 : dw $0000, $5C71, $5C73, $5C75, $5C77
	db $05 : dw $03BA : dw $0000, $5C70, $5C44, $5C74, $5C02
	db $06 : dw $03FC : dw $0000, $0000, $5C71, $5C73, $5C75, $5C77
	db $06 : dw $03FE : dw $0000, $0000, $5C70, $5C44, $5C74, $5C02
	db $05 : dw $0C40 : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $07 : dw $0C42 : dw $0000, $5E02, $5E12, $5CAE, $5E32, $1E42, $1ECF
	db $04 : dw $0CC4 : dw $5E03, $5E13, $5E23, $5E33
	db $03 : dw $0CC6 : dw $5E02, $5CCE, $5E22

	db $0A
	db $02 : dw $0318 : dw $5EC2, $5ED2
	db $04 : dw $0328 : dw $5E03, $5E13, $5E23, $5E33
	db $04 : dw $032A : dw $5E02, $5E12, $5CAE, $5E32
	db $05 : dw $032C : dw $0000, $1E82, $1C8C, $1EA2, $1EB2
	db $05 : dw $032E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3
	db $06 : dw $0330 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0
	db $06 : dw $0332 : dw $5E72, $5E82, $5C8C, $5EA2, $5EB2, $1EC1
	db $04 : dw $0374 : dw $5E03, $5E13, $5E23, $5E33
	db $03 : dw $0376 : dw $5E02, $5CCE, $5E22
	db $01 : dw $0D8A : dw $5CAE

	db $08
	db $04 : dw $036C : dw $5E03, $5E13, $5E23, $5E33
	db $05 : dw $032E : dw $0000, $5E02, $5CCE, $5E22, $5D20
	db $06 : dw $0330 : dw $0000, $0000, $5E03, $5E13, $5E23, $5E33
	db $06 : dw $0332 : dw $0000, $0000, $5E02, $5E12, $5C84, $5E32
	db $05 : dw $0374 : dw $0000, $5E73, $5E83, $5E93, $5EA3
	db $05 : dw $0376 : dw $0000, $0000, $5E82, $5C8C, $5EA2
	db $03 : dw $03F8 : dw $5E03, $5E13, $5E23
	db $04 : dw $03FA : dw $5E02, $5CCE, $5E22, $5D20

	db $10
	db $02 : dw $0608 : dw $5E47, $5EE0
	db $02 : dw $060A : dw $5E46, $5EDF
	db $04 : dw $058C : dw $5E41, $5E4B, $5E43, $5EDE
	db $04 : dw $058E : dw $5E40, $5E50, $5E42, $5ECF
	db $06 : dw $0510 : dw $5E50, $5E40, $DE40, $DE50, $5E50, $5E40
	db $06 : dw $0512 : dw $5E42, $DE42, $1ECF, $9ECF, $9E42, $5E41
	db $01 : dw $046E : dw $1E41
	db $01 : dw $04B0 : dw $1E40
	db $03 : dw $0432 : dw $5CAE, $5E32, $1E41
	db $05 : dw $03B4 : dw $0000, $5E03, $5E13, $5E23, $5E33
	db $04 : dw $03F6 : dw $5E02, $5CCE, $5E22, $5D20
	db $07 : dw $03F8 : dw $0000, $5E03, $5E13, $5E23, $5E33, $1E50, $1E43
	db $07 : dw $03FA : dw $0000, $5E02, $5E12, $5CAE, $5E32, $1E51, $5E42
	db $05 : dw $047C : dw $5E03, $5E13, $5E23, $5E33, $1E50
	db $05 : dw $047E : dw $5E02, $5CCE, $5E22, $5D20, $1E51
	db $01 : dw $0D8A : dw $5C84

.10: ;CB83
	db $04

	db $07
	db $03 : dw $0B0E : dw $1EC2, $1ED2, $0000
	db $07 : dw $0AD0 : dw $5E03, $5E13, $5E23, $5E33, $1ECE, $9ED6, $9EC6
	db $07 : dw $0AD2 : dw $5E02, $5D88, $5E22, $5E32, $1ECF, $DEDE, $DE43
	db $07 : dw $0AD4 : dw $1E70, $1D82, $1E90, $1CE0, $1EB0, $5ECF, $DE4B
	db $09 : dw $0AD6 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1E4B, $1E41, $1E51, $1E4B
	db $09 : dw $0AD8 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1E50, $1E42, $1E50, $5E4B
	db $0A : dw $0ADA : dw $5E72, $5D84, $5E92, $5CE0, $5EB2, $1E4B, $1E41, $1E42, $1ECF, $1ECF

	db $0B
	db $03 : dw $0ACE : dw $1EC2, $1ED2, $0000
	db $06 : dw $0A90 : dw $5E03, $5E13, $5E23, $5E33, $1ECE, $1EC6
	db $06 : dw $0A92 : dw $5E02, $5E12, $5DA0, $5E32, $5E42, $1EDE
	db $07 : dw $0A94 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $5ECF, $1EC7
	db $05 : dw $0AD6 : dw $5E82, $5D8C, $5EA2, $5EB2, $1E4B
	db $05 : dw $0AD8 : dw $5E03, $5E13, $5E23, $1DA4, $1E42
	db $05 : dw $0ADA : dw $5E02, $5D88, $5E22, $5E32, $1E41
	db $05 : dw $0ADC : dw $5E73, $5E83, $5E93, $1DA6, $5EB3
	db $04 : dw $0B1E : dw $5CAC, $5E92, $5EA2, $5EB2
	db $01 : dw $0BA2 : dw $5E20
	db $01 : dw $0BA6 : dw $5E20

	db $07
	db $02 : dw $0B92 : dw $1EC9, $1EC7
	db $07 : dw $0A94 : dw $1E02, $1E12, $1DA0, $1E32, $1EC8, $1ED8, $5ECF
	db $07 : dw $0A96 : dw $1E03, $1E13, $1E23, $1E33, $1EC9, $1ED9, $1EC9
	db $08 : dw $0A98 : dw $5E03, $5E13, $5E23, $5E33, $1EC8, $1ED8, $1EC8, $1ED8
	db $08 : dw $0A9A : dw $5E02, $5E12, $5DA0, $5E32, $1EC9, $1ED9, $1EC9, $1ED9
	db $05 : dw $0ADC : dw $5E03, $5E13, $5E23, $5E33, $1EC8
	db $05 : dw $0ADE : dw $5E02, $5DA2, $5E22, $5DA4, $1EC9

	db $0A
	db $04 : dw $0A4E : dw $1EC2, $1ED2, $0000, $0000
	db $08 : dw $0A10 : dw $5E03, $5E13, $5E23, $5E33, $1ECE, $1EC6, $1EC6, $1ED6
	db $08 : dw $0A12 : dw $5E02, $5E12, $5DA0, $5E32, $5E42, $1EC7, $1EC7, $1ED7
	db $07 : dw $0A54 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $5E42, $5ECF
	db $07 : dw $0A56 : dw $5E02, $5DA2, $5E22, $5DA4, $1E41, $1E51, $1E51
	db $02 : dw $0B98 : dw $1E40, $1E50
	db $02 : dw $0B9A : dw $1E41, $1E51
	db $02 : dw $0B9C : dw $1DA4, $1E40
	db $0A : dw $0B9E : dw $5D20, $1E41, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	db $01 : dw $0B68 : dw $0000

;-----

	;CD73 - CFFF

if !version == 0
	;unused data?
	db $00, $00, $01, $10, $60, $40, $00, $00, $00, $00, $00, $00, $00, $20, $A0, $00
	db $08, $00, $08, $02, $00, $00, $10, $00, $00, $04, $00, $00, $00, $00, $00, $04
	db $00, $00, $08, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $80
	db $80, $00, $00, $00, $00, $00, $00, $00, $40, $00, $00, $00, $00, $02, $01, $00
	db $10, $44, $A0, $08, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $20
	db $00, $0A, $08, $20, $20, $00, $00, $00, $00, $10, $00, $00, $00, $00, $00, $10
	db $00, $40, $30, $D0, $00, $00, $00, $01, $10, $00, $00, $00, $00, $00, $00, $80
	db $00, $08, $00, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $02, $00
	db $04, $58, $0C, $10, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20
	db $00, $28, $08, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $48, $A4, $24
	db $06, $00, $21, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $20, $02, $80, $08, $00, $01, $00, $00, $02, $00, $00, $00, $00, $10
	db $00, $40, $01, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $00
	db $02, $00, $20, $08, $20, $00, $00, $00, $00, $00, $00, $00, $00, $41, $08, $04
	db $80, $08, $20, $20, $20, $00, $00, $14, $00, $00, $00, $00, $00, $80, $01, $00
	db $80, $80, $00, $00, $08, $00, $00, $20, $00, $00, $00, $00, $08, $00, $20, $00
	db $10, $04, $02, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $82, $00
	db $00, $00, $00, $00, $20, $00, $01, $20, $00, $00, $00, $40, $01, $00, $10, $09
	db $00, $00, $14, $00, $80, $00, $00, $00, $00, $00, $01, $00, $00, $02, $20, $08
	db $80, $20, $00, $00, $0A, $00, $00, $00, $00, $00, $00, $00, $01, $08, $40, $41
	db $02, $11, $01, $20, $20, $00, $00, $01, $00, $00, $00, $00, $00, $02, $00, $00
	db $00, $20, $80, $00, $00, $10, $00, $00, $00, $04, $00, $00, $00, $00, $88, $80
	db $00, $02, $00, $00, $80, $00, $00, $00, $00, $04, $00, $00, $01, $00, $00, $00
	db $00, $00, $00, $00, $88, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $00
	db $00, $09, $40, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80
	db $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $45, $38, $08
	db $04, $22, $00, $41, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $02, $00
	db $20, $00, $20, $A0, $00, $42, $00, $00, $00, $20, $00, $00, $00, $02, $12, $03
	db $00, $A4, $06, $80, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08
	db $00, $00, $00, $82, $10, $00, $00, $00, $00, $00, $00, $00, $00, $02, $04, $04
	db $04, $00, $00, $00, $41, $00, $00, $00, $01, $00, $00, $00, $00, $00, $00, $00
	db $00, $06, $00, $80, $80, $00, $00, $00, $10, $00, $00, $00, $20, $00, $40, $11
	db $40, $0D, $02, $20, $28, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $82, $20, $00, $02, $A0, $00, $00, $00, $00, $01, $00, $00, $00, $13, $A0, $10
	db $00, $02, $02, $A8, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00
	db $00, $00, $00, $0A, $02, $00, $00, $00, $40, $00, $00, $20, $00, $20, $C0, $20
	db $80, $44, $02, $00, $14, $00, $00, $00, $01, $00, $00, $00, $00, $08, $00, $02
	db $00, $00, $80, $00, $28, $00, $40, $00, $10, $00, $08, $02, $00, $20, $06, $00
	db $00, $01, $00, $04, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20
	db $20, $00, $00, $00, $02, $04, $00, $08, $00, $00, $00, $00, $00, $00, $80, $A2
	db $10, $04, $10, $42, $08, $00, $00, $00, $00, $00, $00, $00, $00
elseif !version == 1 || !version == 2
	;this could be data that meant something at some point. seems unused now though.
	;store as fill bytes to not clutter up this file, unless it's found out that the data means something.
	incbin "us_fill_bytes/bank1Ea.bin"
endif

;-----

.11: ;D000
	db $0E

	db $1D
	db $05 : dw $1508 : dw $1E00, $1E10, $1C04, $1E30, $1EC0
	db $07 : dw $150A : dw $1E01, $1E11, $1E21, $1E31, $1EC1, $1E51, $1E6A
	db $07 : dw $150C : dw $1E00, $1E10, $1C04, $1E30, $1EC0, $1E56, $1E63
	db $07 : dw $150E : dw $1E01, $1E11, $1E21, $1E31, $1EC1, $1E56, $5E64
	db $08 : dw $1510 : dw $5E03, $5E13, $5E23, $5E33, $1D0A, $1ED0, $5E6B, $9E65
	db $07 : dw $1512 : dw $5E02, $5E12, $5CAE, $5E32, $1EB3, $1ED1, $5E60
	db $03 : dw $1614 : dw $5E33, $1E40, $5E61
	db $04 : dw $1616 : dw $5D0E, $1E41, $5E66, $1C00
	db $03 : dw $1658 : dw $1E50, $1E56, $5E6B
	db $04 : dw $161A : dw $1E41, $1E51, $1E49, $1E60
	db $01 : dw $16DC : dw $1E61
	db $01 : dw $16DE : dw $1E62
	db $03 : dw $1660 : dw $1E50, $1E40, $1E63
	db $04 : dw $1622 : dw $1E41, $1E51, $5E56, $1E64
	db $03 : dw $1664 : dw $1E50, $5E66, $1E65
	db $04 : dw $1626 : dw $1E41, $1E51, $5E66, $5E65
	db $05 : dw $15E8 : dw $1E50, $1E40, $1E50, $1E56, $5E64
	db $06 : dw $15AA : dw $1E41, $1E51, $1E41, $1E51, $1E41, $5E63
	db $02 : dw $16AC : dw $1E56, $1E64
	db $02 : dw $16AE : dw $1E68, $1E65
	db $02 : dw $16B0 : dw $1E6A, $5E65
	db $02 : dw $16B2 : dw $1E63, $1C00
	db $10 : dw $1334 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1EC0, $1D0A, $1EC0, $1E40, $1E50, $1E40, $1E50, $1E40, $1E56, $5E64, $9E65
	db $10 : dw $1336 : dw $1E01, $1E11, $1E21, $1E31, $1EB1, $1EC1, $1EB1, $1EC1, $1E41, $1E51, $1E41, $1E51, $1E41, $1E56, $5E64, $1C00
	db $02 : dw $16B8 : dw $5E62, $1C00
	db $02 : dw $16BA : dw $5E66, $1C00
	db $02 : dw $16BC : dw $1E56, $5E7D
	db $02 : dw $16BE : dw $5E56, $5E7E
	db $02 : dw $1B64 : dw $1E30, $1D0A

	db $1A
	db $01 : dw $16C2 : dw $1E62
	db $01 : dw $16C4 : dw $1E63
	db $01 : dw $1686 : dw $5E56
	db $03 : dw $1608 : dw $1E40, $1E50, $5E56
	db $04 : dw $160A : dw $1E41, $5E56, $1E6B, $1C00
	db $03 : dw $160C : dw $1E40, $1E61, $1C00
	db $03 : dw $160E : dw $1E41, $5E60, $1C00
	db $03 : dw $1610 : dw $5E40, $5E62, $1C00
	db $05 : dw $1592 : dw $5C84, $5E32, $5D0A, $5E69, $1C00
	db $07 : dw $1514 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1E56, $5E63
	db $06 : dw $1556 : dw $5E82, $5C8C, $5EA2, $5D0A, $1E41, $5E69
	db $07 : dw $1558 : dw $1E00, $1C22, $1E20, $1D0A, $1E50, $1E56, $5E7D
	db $03 : dw $155A : dw $1E01, $1E11, $1E21
	db $02 : dw $15A0 : dw $1D0A, $1ED0
	db $02 : dw $15A2 : dw $1EB3, $1ED1
	db $01 : dw $1624 : dw $1E40
	db $01 : dw $16AC : dw $5E56
	db $02 : dw $166E : dw $1E66, $1E6B
	db $02 : dw $1670 : dw $1E61, $1C00
	db $02 : dw $1672 : dw $5E60, $1C00
	db $02 : dw $1674 : dw $5E62, $1C00
	db $02 : dw $1676 : dw $5E69, $1C00
	db $02 : dw $1678 : dw $1E56, $5E63
	db $02 : dw $167A : dw $1E41, $5E69
	db $01 : dw $16FE : dw $1E7C
	db $01 : dw $1B64 : dw $1E32

	db $1B
	db $05 : dw $15C4 : dw $1EC0, $1EC0, $1E50, $1EC0, $1E62
	db $01 : dw $16C6 : dw $1E63
	db $08 : dw $1508 : dw $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1E50, $1E60, $1C00
	db $08 : dw $14CA : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $5E56, $1E5A
	db $06 : dw $14CC : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0, $1EC0
	db $07 : dw $14CE : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1E62
	db $06 : dw $14D0 : dw $5E73, $5E83, $5E93, $5EA3, $5EB1, $1E50
	db $05 : dw $1512 : dw $5CAC, $5E92, $5D08, $1E41, $1E51
	db $05 : dw $1514 : dw $5E03, $5E13, $5E23, $5E33, $5E40
	db $04 : dw $1516 : dw $5E02, $5E12, $5C84, $5E32
	db $04 : dw $1518 : dw $5E0F, $5E1F, $5E2F, $5E3F
	db $04 : dw $151A : dw $5E0E, $5E1E, $5C8C, $5E3E
	db $01 : dw $15DE : dw $1E41
	db $02 : dw $15A0 : dw $1D20, $1D0A
	db $02 : dw $15A2 : dw $1E33, $1E51
	db $01 : dw $1624 : dw $1D0A
	db $01 : dw $166E : dw $1E56
	db $02 : dw $1630 : dw $1E56, $1E6B
	db $02 : dw $1632 : dw $1E67, $1C00
	db $09 : dw $1474 : dw $1E50, $1D0A, $1EC0, $1E40, $1E50, $1E40, $1E50, $5E61, $1C00
	db $0A : dw $1436 : dw $1E41, $1E51, $1EB1, $1EC1, $1E41, $1E51, $1E41, $1E51, $5E66, $1C00
	db $03 : dw $1638 : dw $5E56, $5E6B, $1C00
	db $02 : dw $167A : dw $5E56, $5E6B
	db $01 : dw $167C : dw $5E56
	db $01 : dw $16FE : dw $5E7E
	db $01 : dw $1B38 : dw $1D0E
	db $01 : dw $1B3C : dw $1D0E

	db $1E
	db $01 : dw $14C0 : dw $1E71
	db $01 : dw $14C2 : dw $1E71
	db $02 : dw $15C4 : dw $1E32, $1D0A
	db $08 : dw $14C8 : dw $1E02, $1CCE, $1E22, $1D0E, $1E50, $1EC0, $1E56, $1E5A
	db $08 : dw $14CA : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1EC1, $1E66, $1C00
	db $08 : dw $148C : dw $1E70, $1E80, $1C0E, $1EA0, $1D0C, $1E50, $1EC0, $1E63
	db $08 : dw $148E : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1E51, $1E56, $1E64
	db $08 : dw $1490 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1E50, $1EC0, $5E64
	db $07 : dw $14D2 : dw $5E82, $5C8C, $5EA2, $5D0A, $1E51, $5E56, $5E5B
	db $08 : dw $14D4 : dw $1E00, $1C24, $1E20, $1D02, $1EB0, $1E40, $5E68, $1C00
	db $08 : dw $14D6 : dw $1E01, $1E11, $1E21, $1E31, $1EB1, $1E41, $1E41, $5E6B
	db $07 : dw $14D8 : dw $5E03, $5E13, $5E23, $5EB3, $1E50, $1D0A, $1ED0
	db $09 : dw $14DA : dw $5E02, $5CCE, $5E22, $5D0A, $1E51, $1EB1, $1ED1, $1E49, $1E61
	db $09 : dw $14DC : dw $1E02, $1CCE, $1E22, $1D0C, $1E50, $1D0A, $1ED0, $1E40, $1E62
	db $09 : dw $14DE : dw $1E03, $1E13, $1E23, $1EB1, $1E51, $1EB1, $1ED1, $1E41, $1E63
	db $09 : dw $14E0 : dw $1E82, $1C8C, $1EA2, $1D0A, $1E50, $1D0A, $1ED0, $1E56, $1E64
	db $0A : dw $14A2 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1EB3, $1ED1, $1E66, $1C00
	db $06 : dw $1524 : dw $1C84, $1E32, $1D0A, $1E50, $1D0A, $1ED0
	db $02 : dw $1626 : dw $1EB3, $1ED1
	db $01 : dw $15E8 : dw $1ED0
	db $06 : dw $15AA : dw $1EB3, $1ED1, $1E41, $1E51, $1E56, $5E64
	db $03 : dw $166C : dw $1E56, $1E6B, $1C00
	db $03 : dw $166E : dw $1E66, $1C00, $1C00
	db $03 : dw $1670 : dw $1E63, $1C00, $1C00
	db $02 : dw $14B4 : dw $1E40, $1E50
	db $02 : dw $14B6 : dw $1E41, $1E51
	db $01 : dw $1B30 : dw $1E30
	db $01 : dw $1B34 : dw $1E30
	db $01 : dw $1B38 : dw $1E30
	db $01 : dw $1B3C : dw $1E30

	db $20
	db $09 : dw $14C0 : dw $1C00, $1C00, $1E02, $1CCE, $1E22, $1D0E, $1E50, $1E40, $1E50
	db $09 : dw $14C2 : dw $1C00, $1C00, $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1E67
	db $02 : dw $1684 : dw $1E56, $1E64
	db $02 : dw $1686 : dw $1E67, $1C00
	db $08 : dw $14C8 : dw $1C70, $1C44, $1C74, $1C02, $1E50, $1E40, $1E50, $1E63
	db $06 : dw $14CA : dw $1C71, $1C73, $1C75, $1C77, $1E51, $1E41
	db $06 : dw $148C : dw $1CA8, $1E92, $1D08, $1EB2, $1D0A, $1ED0
	db $07 : dw $144E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EB3, $1ED1
	db $07 : dw $1450 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1D0A, $1ED0
	db $06 : dw $1492 : dw $5CAC, $5E92, $5D08, $5EB2, $1EB3, $1ED1
	db $06 : dw $1494 : dw $5E03, $5E13, $5E23, $5E33, $1D0A, $1E50
	db $06 : dw $1496 : dw $5E02, $5E12, $5C84, $5E32, $1E41, $1E51
	db $0A : dw $1498 : dw $1E70, $1E80, $1C0C, $1EA0, $1D0A, $1ED0, $1EB0, $1E40, $1E66, $DE65
	db $0A : dw $149A : dw $1E71, $1E81, $1E91, $1EA1, $1EC1, $1ED1, $1EB1, $1E41, $5E60, $DE64
	db $09 : dw $14DC : dw $1E1E, $1C84, $1E3E, $1D0A, $1E6C, $1E40, $1E50, $5E66, $DE63
	db $0A : dw $149E : dw $1E0F, $1E1F, $1E2F, $1E3F, $1E4F, $1E6D, $1E41, $1E51, $1E6B, $DE62
	db $0A : dw $14A0 : dw $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED0, $1E56, $1E68, $1C00, $9E63
	db $0B : dw $1462 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EB3, $1ED1, $1E56, $1E63, $1C00, $DE64
	db $0B : dw $1464 : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1D0A, $1ED0, $1E40, $5E62, $1C00, $DE63
	db $0B : dw $1466 : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1EB3, $1ED1, $1E50, $5E68, $1C00, $DE62
	db $0C : dw $1428 : dw $1E02, $1E12, $1CAE, $1E30, $1D0A, $1E50, $1D0A, $1ED0, $1E51, $1E56, $5E65, $9E60
	db $0C : dw $142A : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1EB3, $1ED1, $1E50, $1E56, $5E65, $9E61
	db $06 : dw $15AC : dw $1E41, $1E41, $1E40, $1E6B, $1C00, $9E62
	db $06 : dw $15AE : dw $1E40, $1E40, $1E69, $1C00, $1C00, $9E63
	db $06 : dw $15B0 : dw $1E41, $1E41, $1E62, $1C00, $1C00, $DE65
	db $06 : dw $15B2 : dw $1E40, $1E40, $1E62, $1C00, $1C00, $DE64
	db $06 : dw $15B4 : dw $1E41, $1E41, $5E68, $1C00, $1C00, $DE63
	db $06 : dw $15B6 : dw $1EC0, $1EC0, $1E56, $5E64, $1C00, $DE62
	db $04 : dw $1638 : dw $1E56, $5E63, $1C00, $9E60
	db $03 : dw $167A : dw $5E69, $1C00, $9E61
	db $02 : dw $16BC : dw $5E63, $9E62
	db $02 : dw $167E : dw $5E56, $5E68

	db $1B
	db $01 : dw $16C2 : dw $1E51
	db $02 : dw $1684 : dw $1E40, $1E50
	db $02 : dw $1686 : dw $1E41, $1E56
	db $02 : dw $1688 : dw $1EC0, $1E6B
	db $02 : dw $164A : dw $1E51, $1E66
	db $0B : dw $144C : dw $1C70, $1C44, $1C74, $1C02, $1E50, $1D0A, $1ED0, $1E40, $1ED0, $1E6B, $DE65
	db $0B : dw $144E : dw $1C71, $1C73, $1C75, $1C77, $1E51, $1EB3, $1ED1, $1E41, $1E68, $1C00, $DE64
	db $0B : dw $1450 : dw $1E80, $1C0C, $1EA0, $1D0A, $1EB2, $1D0A, $1ED0, $1E40, $1E6B, $1C00, $DE63
	db $0B : dw $1452 : dw $1E81, $1E91, $1EA1, $1EB1, $1EB3, $1EB3, $1ED1, $1E69, $1C00, $1C00, $DE62
	db $0B : dw $1454 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1D0A, $1ED0, $1E62, $1C00, $1C00, $9E60
	db $0A : dw $1496 : dw $5CAC, $5E92, $5D08, $5EB2, $1EB3, $1ED1, $1E62, $1C00, $1C00, $9E61
	db $0A : dw $1498 : dw $1C42, $1E9C, $1CE6, $1EBC, $1D0A, $1ED0, $5E68, $1C00, $1C00, $9E62
	db $0A : dw $149A : dw $1E8D, $1E9D, $1EAD, $1EBD, $1EB3, $1ED1, $1E51, $5E69, $1C00, $DE62
	db $0A : dw $149C : dw $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED0, $1ED0, $1E66, $1C00, $9E60
	db $0B : dw $145E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EB3, $1ED1, $1ED1, $1E6A, $1C00, $9E61
	db $09 : dw $1460 : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1D0A, $1ED0, $1E56, $5E64
	db $09 : dw $1462 : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1EB3, $1ED1, $1E56, $5E63
	db $04 : dw $1464 : dw $1E82, $1C8C, $1EA2, $1D0A
	db $05 : dw $1426 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3
	db $02 : dw $14A8 : dw $1C84, $1E32
	db $02 : dw $15AC : dw $1E40, $1E51
	db $02 : dw $15AE : dw $1E41, $1E41
	db $02 : dw $15B0 : dw $1E40, $1E40
	db $02 : dw $15B2 : dw $1E41, $1E41
	db $02 : dw $15B4 : dw $1E40, $1E40
	db $02 : dw $15B6 : dw $1E41, $1E41
	db $01 : dw $15F8 : dw $1EC0

	db $15
	db $01 : dw $1584 : dw $1CAE
	db $02 : dw $158C : dw $1E40, $1E50
	db $02 : dw $158E : dw $1E41, $1E51
	db $06 : dw $1410 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50
	db $06 : dw $1412 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51
	db $06 : dw $1414 : dw $1E0F, $5E1F, $5E2F, $5E3F, $5E4F, $1ED0
	db $05 : dw $1456 : dw $5E1E, $5C84, $5E3E, $5D0A, $1ED1
	db $06 : dw $1418 : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1ED0
	db $05 : dw $145A : dw $5E82, $5C8C, $5EA2, $5D0A, $1ED1
	db $05 : dw $145C : dw $1E82, $1C8C, $1EA2, $1D0A, $1ED0
	db $06 : dw $141E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1ED1
	db $05 : dw $1460 : dw $1E1E, $1C84, $1E3E, $1D0A, $1ED0
	db $06 : dw $1422 : dw $1E0F, $1E1F, $1E2F, $1E3F, $1EB3, $1ED1
	db $07 : dw $1424 : dw $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED0, $1EC0
	db $08 : dw $13E6 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EB3, $1ED1, $1EC1
	db $09 : dw $13E8 : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1E40, $1E50, $1E40, $1E50
	db $09 : dw $13EA : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1E51, $1E41, $1E51
	db $0A : dw $13AC : dw $1E02, $1E12, $1CAE, $1E32, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50
	db $0A : dw $13AE : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51, $1E41, $1E40
	db $01 : dw $15F8 : dw $1E51
	db $01 : dw $1BA4 : dw $1E40

	db $17
	db $02 : dw $158C : dw $1D0A, $1ED8
	db $01 : dw $15CE : dw $1ED9
	db $01 : dw $15D0 : dw $1ED8
	db $02 : dw $1592 : dw $1E41, $1ED9
	db $08 : dw $1414 : dw $5E03, $5E13, $5E23, $5E33, $1D0A, $1ED0, $1D0A, $1ED8
	db $08 : dw $1416 : dw $5E02, $5E12, $5C84, $5E32, $1EC1, $1ED1, $1E41, $1ED9
	db $08 : dw $1418 : dw $1E70, $1E80, $1C0C, $1EA0, $1D0A, $1ED0, $1D0A, $1ED8
	db $08 : dw $141A : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1ED1, $1E41, $1ED9
	db $08 : dw $141C : dw $1E02, $1E12, $1C84, $1E32, $1D0A, $1ED0, $1D0A, $1ED8
	db $08 : dw $141E : dw $1E03, $1E13, $1E23, $1E33, $1EB1, $1ED1, $1E41, $1ED9
	db $07 : dw $1420 : dw $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED0, $1EC0
	db $08 : dw $13E2 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EB1, $1ED1, $1EC1
	db $09 : dw $13E4 : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1E40, $1E50, $1E40, $1E50
	db $09 : dw $13E6 : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1E51, $1E41, $1E51
	db $09 : dw $13E8 : dw $1E00, $1C24, $1E20, $1D02, $1E50, $1EC0, $1ED0, $1EC0, $1ED0
	db $09 : dw $13EA : dw $1E01, $1E11, $1E21, $1E31, $1E51, $1EC1, $1ED1, $1EC1, $1ED1
	db $01 : dw $15EE : dw $1E51
	db $0B : dw $1370 : dw $1E02, $1CCE, $1E22, $1D20, $1D0A, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50
	db $0B : dw $1372 : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51
	db $0C : dw $1334 : dw $1E02, $1E12, $1CAE, $1E32, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50
	db $0C : dw $1336 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51
	db $01 : dw $15F8 : dw $1ED0
	db $01 : dw $1BA0 : dw $1EB2

	db $12
	db $01 : dw $1550 : dw $1ED0
	db $07 : dw $13D2 : dw $1E73, $1E01, $1E11, $1E21, $1E31, $1EC1, $1ED1
	db $05 : dw $13D4 : dw $5E73, $1E00, $1E10, $1C04, $1E30
	db $04 : dw $1416 : dw $1E01, $1E11, $1E21, $1E31
	db $06 : dw $1418 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50
	db $0A : dw $141A : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1ED9, $5E67, $5E64
	db $0A : dw $141C : dw $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED8, $1D0A, $1ED8, $5E56, $1E64
	db $0B : dw $13DE : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E41, $1ED9, $1E41, $1ED9, $1E68, $1E65
	db $0B : dw $13E0 : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1D0A, $1ED0, $1ED0, $1E50, $5E68, $1E65
	db $0B : dw $13E2 : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1EB1, $1ED1, $1ED1, $1E51, $1E56, $5E64
	db $0B : dw $13E4 : dw $1E00, $1C24, $1E20, $1D02, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40, $5E61
	db $0B : dw $13E6 : dw $1E01, $1E11, $1E21, $1E31, $1E51, $1E41, $1E51, $1E41, $1E51, $1E50, $5E61
	db $0C : dw $13E8 : dw $1E82, $1C8C, $1EA2, $1D0A, $1E50, $1E44, $1E54, $1E44, $1E54, $1E51, $1E57, $1C00
	db $0D : dw $13AA : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E45, $1E55, $1E45, $1E55, $1E56, $1E63, $1C00
	db $0A : dw $142C : dw $1C84, $1E30, $1D0A, $1E50, $1E40, $1E50, $1EC4, $1E56, $1E69, $1C00
	db $03 : dw $15AE : dw $1EC5, $1E56, $1E63
	db $08 : dw $1430 : dw $1D0C, $1E50, $1E40, $1E50, $1E40, $1E50, $1E50, $1E56
	db $01 : dw $1BA0 : dw $1D0A

	db $17
	db $01 : dw $160C : dw $1EC0
	db $01 : dw $160E : dw $1EC1
	db $01 : dw $1550 : dw $1E50
	db $07 : dw $13D2 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E51
	db $0D : dw $13D4 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED8, $1EC0, $1ED0, $1E62, $1C00, $1C00, $DE61
	db $0D : dw $13D6 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E41, $1ED9, $1EC1, $1ED1, $1E62, $1C00, $1C00, $DE60
	db $0D : dw $13D8 : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0, $1D0A, $1ED8, $1EC0, $1ED0, $5E68, $1C00, $1C00, $9E60
	db $0D : dw $13DA : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1E41, $1ED9, $1EC1, $1ED1, $1E56, $5E65, $1C00, $9E61
	db $0D : dw $13DC : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1D0A, $1ED8, $1E40, $1E50, $1E40, $5E63, $1C00, $9E62
	db $0D : dw $13DE : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1ED9, $1E41, $1E51, $1E41, $5E62, $1C00, $9E63
	db $0D : dw $13E0 : dw $1E82, $1C8C, $1EA2, $1D0A, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $5E62, $1C00, $9E64
	db $0C : dw $13A2 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1E64
	db $0C : dw $13A4 : dw $1E70, $1E80, $1C0C, $1EA0, $1D0A, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0, $1E56, $1E65
	db $0C : dw $13A6 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1, $1E66, $1C00
	db $0C : dw $13A8 : dw $1E02, $1E12, $1C84, $1E32, $1D0A, $1E50, $1E40, $1E50, $1ED0, $1E50, $1E57, $1C00
	db $0C : dw $13AA : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51, $1ED1, $1E51, $5E62, $1C00
	db $0B : dw $13AC : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50, $1E40, $1E50, $1ED0, $1EC0, $5E61
	db $0B : dw $13AE : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1ED1, $1EC1, $5E60
	db $09 : dw $1430 : dw $1D0E, $1E50, $1E40, $1E50, $1E40, $1E50, $1E44, $1E54, $1E60
	db $03 : dw $15B2 : dw $1E45, $1E55, $1E61
	db $02 : dw $15B4 : dw $1EC4, $1ED4
	db $02 : dw $15B6 : dw $1EC5, $1ED5
	db $01 : dw $167A : dw $5E68

	db $20
	db $01 : dw $16C4 : dw $1E56
	db $02 : dw $1686 : dw $1E56, $DE7D
	db $02 : dw $1688 : dw $1E6B, $9E63
	db $03 : dw $164A : dw $1E67, $5E64, $9E64
	db $04 : dw $15CC : dw $1E50, $1EC0, $1E61, $1C00
	db $03 : dw $15CE : dw $1E51, $1EC1, $1E62
	db $04 : dw $1590 : dw $1E40, $1E50, $1E56, $1E63
	db $01 : dw $15D2 : dw $1E51
	db $09 : dw $13D4 : dw $1C70, $1C44, $1C74, $1C02, $1E50, $1D0A, $1ED8, $1E40, $1E50
	db $09 : dw $13D6 : dw $1C71, $1C73, $1C75, $1C77, $1E51, $1E41, $1ED9, $1E41, $1E51
	db $09 : dw $1398 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E58, $1D0A, $1ED8, $1E48
	db $09 : dw $139A : dw $1E01, $1E11, $1E21, $1E31, $1E49, $1E59, $1E41, $1ED9, $1E49
	db $05 : dw $139C : dw $1E00, $1E10, $1C46, $1E30, $1D0A
	db $05 : dw $139E : dw $1E01, $1E11, $1E21, $1E31, $1E41
	db $09 : dw $13A0 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50, $1E40, $1E50, $1E40
	db $09 : dw $13A2 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E41
	db $06 : dw $1364 : dw $1E72, $1CAC, $1E92, $1D08, $1EB2, $1EC0
	db $06 : dw $1366 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1
	db $08 : dw $1368 : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0, $1ED0, $1EC0, $1ED0
	db $08 : dw $136A : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1ED1, $1EC1, $1ED1
	db $09 : dw $136C : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0, $1ED0, $1EC0, $1ED0, $1EC0
	db $09 : dw $136E : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1ED1, $1EC1, $1ED1, $1EC1
	db $09 : dw $1370 : dw $1E06, $1CA6, $1E26, $1D02, $1E54, $1E44, $1E54, $1E44, $1E54
	db $09 : dw $1372 : dw $1E07, $1E17, $1E27, $1E37, $1E55, $1E45, $1E55, $1E45, $1E55
	db $0A : dw $1334 : dw $1C00, $1E86, $1C8E, $1EA6, $1D0C, $1EC0, $1EC4, $1ED4, $1EC4, $1ED4
	db $0A : dw $1336 : dw $1E77, $1E87, $1E97, $1EA7, $1EB7, $1EC1, $1EC5, $1ED5, $1EC5, $1ED5
	db $0B : dw $1338 : dw $1E02, $1E12, $1C84, $1E32, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40
	db $0C : dw $12FA : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41
	db $06 : dw $133C : dw $1CCE, $1E22, $1D0C, $1E40, $1E40, $1E50
	db $02 : dw $143E : dw $1E41, $1E51
	db $02 : dw $1C00 : dw $1E40, $1E50
	db $02 : dw $1C02 : dw $1E41, $1E51

	db $1E
	db $01 : dw $158C : dw $1E40
	db $06 : dw $1410 : dw $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED8
	db $06 : dw $1412 : dw $1E83, $1E93, $1EA3, $1EB3, $1E41, $1ED9
	db $02 : dw $1594 : dw $1EC8, $1ED8
	db $0A : dw $1396 : dw $1E7B, $1C71, $1C73, $1C75, $1C77, $1E51, $1E41, $1ED9, $1EC9, $1ED9
	db $07 : dw $1458 : dw $1E3A, $1D0A, $1ED8, $1E48, $1E58, $1E48, $1E58
	db $08 : dw $141A : dw $1E2B, $1E3B, $1E41, $1ED9, $1E49, $1E59, $1E49, $1E59
	db $06 : dw $141C : dw $1C04, $1E32, $1D0A, $1ED8, $1E40, $1E50
	db $06 : dw $141E : dw $1E23, $1E33, $1E41, $1ED9, $1E41, $1E51
	db $07 : dw $1460 : dw $1E32, $1D0A, $1ED8, $1E40, $1E50, $1E40, $1E50
	db $08 : dw $1422 : dw $1E23, $1E33, $1E41, $1ED9, $1E41, $1E51, $1E41, $1E51
	db $07 : dw $1364 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED8
	db $02 : dw $14A6 : dw $1E41, $1ED9
	db $0A : dw $13A8 : dw $5E83, $5E93, $5EA3, $5EB3, $1D0A, $1ED8, $1EC0, $1ED0, $1EC0, $1ED0
	db $0A : dw $13AA : dw $5CAC, $5E92, $5D08, $5EB2, $1E41, $1ED9, $1EC1, $1ED1, $1EC1, $1ED1
	db $0A : dw $13AC : dw $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0
	db $0A : dw $13AE : dw $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1
	db $0B : dw $1370 : dw $1E82, $1CC6, $1EA2, $1D0A, $1EB2, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0
	db $0C : dw $1332 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EB3, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1
	db $0C : dw $1334 : dw $1E70, $1E80, $1C0C, $1EA0, $1D0A, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0
	db $0C : dw $1336 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1
	db $0C : dw $1338 : dw $1E00, $1E10, $1C84, $1E30, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50
	db $0C : dw $133A : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51
	db $0D : dw $12FC : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0
	db $0D : dw $12FE : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1
	db $01 : dw $1B90 : dw $1E30
	db $01 : dw $1B94 : dw $1E30
	db $01 : dw $1B98 : dw $1E30
	db $01 : dw $1B9C : dw $1E30
	db $01 : dw $1BA0 : dw $1EB2

	db $20
	db $05 : dw $16C0 : dw $1E66, $DC00, $DC00, $DC00, $DC00
	db $06 : dw $1682 : dw $1E56, $1E7E, $DC00, $DC00, $DC00, $DC00
	db $06 : dw $1684 : dw $1E57, $DE65, $DC00, $DC00, $DC00, $DC00
	db $06 : dw $1686 : dw $1E63, $DE63, $DC00, $DC00, $DC00, $DC00
	db $07 : dw $1648 : dw $1E68, $1C00, $9E63, $DC00, $DC00, $DC00, $DC00
	db $06 : dw $168A : dw $1C00, $9E64, $DC00, $DC00, $DC00, $DC00
	db $0A : dw $158C : dw $1D0A, $1ED8, $1EC0, $1E61, $1C00, $DE65, $DC00, $DC00, $DC00, $DC00
	db $09 : dw $15CE : dw $1ED9, $1EC1, $1E62, $1C00, $DE64, $DC00, $DC00, $DC00, $DC00
	db $11 : dw $13D0 : dw $1C70, $1C44, $1C74, $1C02, $1E50, $1D0A, $1ED8, $1E40, $1E50, $1E56, $1E63, $1C00, $DE63, $DC00, $DC00, $DC00, $DC00
	db $11 : dw $13D2 : dw $1C71, $1C73, $1C75, $1C77, $1E51, $1E41, $1ED9, $1E41, $1E51, $1E69, $1C00, $1C00, $DE62, $DC00, $DC00, $DC00, $DC00
	db $12 : dw $1394 : dw $1E00, $1E10, $1C0A, $1E30, $1D0A, $1ED8, $1D0A, $1ED8, $1E40, $1E50, $1E62, $1C00, $1C00, $DE61, $DC00, $DC00, $DC00, $DC00
	db $12 : dw $1396 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1ED9, $1E41, $1ED9, $1E41, $1E51, $1E62, $1C00, $1C00, $DE60, $DC00, $DC00, $DC00, $DC00
	db $12 : dw $1398 : dw $1CAC, $1E92, $1D08, $1EB2, $1D0A, $1ED8, $1EC0, $1ED0, $1EC0, $1ED0, $5E68, $1C00, $1C00, $9E60, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $135A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E41, $1ED9, $1EC1, $1ED1, $1EC1, $1ED1, $1E56, $5E65, $1C00, $9E61, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $135C : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0, $1D0A, $1ED8, $1EC0, $1ED0, $1EC0, $1ED0, $1E40, $5E63, $1C00, $9E62, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $135E : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1E41, $1ED9, $1EC1, $1ED1, $1EC1, $1ED1, $1E41, $5E62, $1C00, $9E63, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $1360 : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0, $1D0A, $1ED8, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $5E62, $1C00, $9E64, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $1362 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1E41, $1ED9, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1E64, $1C00, $DE64, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $1364 : dw $1E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0, $1E56, $1E65, $1C00, $DE63, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $1366 : dw $1C00, $5CAC, $5E92, $5D08, $5EB2, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1, $1E66, $1C00, $1C00, $DE62, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $1368 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0, $1EC0, $1ED0, $1EC0, $1ED0, $1E57, $1C00, $1C00, $9E60, $1C00, $DC00, $DC00, $DC00
	db $13 : dw $136A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1, $1EC1, $1ED1, $1EC1, $1ED1, $5E62, $1C00, $1C00, $9E61, $1C00, $DC00, $DC00, $DC00
	db $13 : dw $136C : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $5E61, $1C00, $1C00, $9E62, $DC00, $DC00, $DC00, $DC00
	db $13 : dw $136E : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1E51, $1E41, $1E51, $1EC1, $1ED1, $5E60, $1C00, $1C00, $9E63, $DC00, $DC00, $DC00, $DC00
	db $14 : dw $1330 : dw $1E02, $1E12, $1CAE, $1E32, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $1E60, $1C00, $1C00, $DE65, $DC00, $DC00, $DC00, $DC00
	db $14 : dw $1332 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1EC1, $1ED1, $1E61, $1C00, $1C00, $DE64, $DC00, $DC00, $DC00, $DC00
	db $14 : dw $1334 : dw $1E00, $1E10, $1C04, $1E30, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $5E68, $1C00, $1C00, $DE63, $DC00, $DC00, $DC00, $DC00
	db $14 : dw $1336 : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1EC1, $1ED1, $1E56, $5E64, $1C00, $DE62, $DC00, $DC00, $DC00, $DC00
	db $12 : dw $13B8 : dw $1C04, $1E30, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1E56, $5E63, $1C00, $9E60, $DC00, $DC00, $DC00, $DC00
	db $04 : dw $173A : dw $DC00, $DC00, $DC00, $DC00
	db $14 : dw $133C : dw $1CAA, $1E92, $1D08, $1EB2, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $1E40, $5E56, $5E63, $9E62, $DC00, $DC00, $DC00, $DC00
	db $10 : dw $143E : dw $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1EC1, $1ED1, $1E41, $5E56, $5E68, $5E7E, $DC00, $DC00, $DC00, $DC00

	db $20
	db $06 : dw $1680 : dw $1E56, $1E6B, $1C00, $1C00, $1C00, $1C00
	db $06 : dw $1682 : dw $1E6A, $DE64, $1C00, $1C00, $1C00, $1C00
	db $07 : dw $1644 : dw $1E56, $1E64, $DE65, $1C00, $1C00, $1C00, $1C00
	db $07 : dw $1646 : dw $1E69, $1C00, $DE63, $1C00, $1C00, $1C00, $1C00
	db $07 : dw $1648 : dw $1E63, $1C00, $9E63, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $160A : dw $1E56, $5E63, $1C00, $9E64, $1C00, $1C00, $1C00, $1C00
	db $0A : dw $158C : dw $1E40, $1E50, $1E56, $1E64, $1C00, $DE65, $1C00, $1C00, $1C00, $1C00
	db $09 : dw $15CE : dw $1E56, $5E66, $1C00, $1C00, $DE64, $1C00, $1C00, $1C00, $1C00
	db $08 : dw $1610 : dw $1E66, $1C00, $1C00, $DE63, $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1712 : dw $1C00, $1C00, $1C00, $1C00
	db $10 : dw $1414 : dw $1C04, $1E30, $1D0A, $1ED8, $1D0A, $1ED8, $1E40, $1E50, $1E62, $1C00, $1C00, $DE61, $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1716 : dw $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1718 : dw $1C00, $1C00, $1C00, $1C00
	db $04 : dw $171A : dw $1C00, $1C00, $1C00, $1C00
	db $0C : dw $151C : dw $1E40, $1E50, $1E40, $1E50, $1E40, $5E63, $1C00, $9E62, $1C00, $1C00, $1C00, $1C00
	db $0C : dw $151E : dw $1E41, $1E51, $1E41, $1E51, $1E41, $5E62, $1C00, $9E63, $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1720 : dw $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1722 : dw $1C00, $1C00, $1C00, $1C00
	db $13 : dw $1364 : dw $1E70, $1C2C, $1E90, $1CE0, $1EB0, $1D0A, $1ED8, $1EC0, $1ED0, $1EC0, $1ED0, $1E56, $1E65, $1C00, $DE63, $1C00, $1C00, $1C00, $1C00
	db $13 : dw $1366 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1E41, $1ED9, $1EC1, $1ED1, $1EC1, $1ED1, $1E66, $1C00, $1C00, $DE62, $1C00, $1C00, $1C00, $1C00
	db $13 : dw $1368 : dw $1E02, $1CA4, $1E22, $1D0E, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $1E57, $1C00, $1C00, $9E60, $1C00, $1C00, $1C00, $1C00
	db $13 : dw $136A : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1E41, $1E51, $1E41, $1E51, $1EC1, $1ED1, $5E62, $1C00, $1C00, $9E61, $1C00, $1C00, $1C00, $1C00
	db $13 : dw $136C : dw $1E82, $1C8C, $1EA2, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $5E61, $1C00, $1C00, $9E62, $1C00, $1C00, $1C00, $1C00
	db $14 : dw $132E : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E41, $1E51, $1E41, $1E51, $1EC1, $1ED1, $5E60, $1C00, $1C00, $9E63, $1C00, $1C00, $1C00, $1C00
	db $12 : dw $13B0 : dw $1C84, $1E32, $1D0A, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $1E60, $1C00, $1C00, $DE65, $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1732 : dw $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1734 : dw $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1736 : dw $1C00, $1C00, $1C00, $1C00
	db $04 : dw $1738 : dw $1C00, $1C00, $1C00, $1C00
	db $04 : dw $173A : dw $1C00, $1C00, $1C00, $1C00
	db $14 : dw $133C : dw $1CAC, $1E92, $1D08, $1EB2, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1EC0, $1ED0, $1E40, $5E56, $5E63, $9E62, $1C00, $1C00, $1C00, $1C00
	db $04 : dw $173E : dw $1C00, $1C00, $1C00, $1C00

.12: ;E96D
	db $0A

	db $17
	db $01 : dw $1C82 : dw $5CAE
	db $0B : dw $1C44 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E50, $1E40, $1E50, $1E40, $1E50, $1E40
	db $0B : dw $1C46 : dw $5E02, $5CCE, $5E22, $5D20, $1E41, $1E51, $1E41, $1E51, $1E41, $1E51, $1E41
	db $01 : dw $1D88 : dw $5C77
	db $01 : dw $1E0C : dw $5C77
	db $02 : dw $1EB4 : dw $1E40, $1E50
	db $02 : dw $1EB6 : dw $1E41, $1E51
	db $06 : dw $1DB8 : dw $5E03, $5E13, $5E23, $5E33, $1E40, $1E50
	db $06 : dw $1DBA : dw $5E02, $5E12, $5C84, $5E32, $1E41, $1E56
	db $07 : dw $1D7C : dw $1C00, $1E02, $1E12, $1C84, $1E32, $1E41, $1E67
	db $07 : dw $1D7E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E67
	db $08 : dw $0500 : dw $1C00, $1C70, $1C44, $1C74, $1C02, $1E40, $1E40, $1E66
	db $07 : dw $0502 : dw $1C00, $1C71, $1C73, $1C75, $1C77, $1E41, $1EC0
	db $08 : dw $04C4 : dw $1C70, $1C44, $1C74, $1C02, $1E40, $1E40, $1E50, $1EC8
	db $09 : dw $04C6 : dw $1C71, $1C73, $1C75, $1C77, $1E41, $1E41, $1E51, $1E56, $1E7C
	db $0A : dw $0488 : dw $1E00, $1E10, $1C04, $1E30, $1E40, $1EC0, $1EC0, $1ED0, $1E56, $1E7D
	db $0A : dw $048A : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1EC1, $1EC1, $1ED1, $1E66, $5E7F
	db $04 : dw $060C : dw $1E40, $1E50, $1E56, $5E7E
	db $04 : dw $060E : dw $1E41, $1E51, $1E56, $1E7D
	db $02 : dw $0690 : dw $5E56, $1E7E
	db $01 : dw $05DC : dw $1EC0
	db $01 : dw $05DE : dw $1EC1
	db $01 : dw $05E0 : dw $1E40

	db $0F
	db $07 : dw $0540 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E40, $1E56
	db $07 : dw $0542 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1EC0, $1E56
	db $09 : dw $04C4 : dw $1C00, $1E02, $1E12, $1CAE, $1E32, $1E40, $1E50, $1E40, $1E66
	db $09 : dw $04C6 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1EC0, $1E66
	db $0A : dw $0488 : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1E40, $1E40, $1E50, $1E40, $1E66
	db $0A : dw $048A : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E41, $1E59, $1EC0, $1E7C
	db $0A : dw $048C : dw $1E78, $1E88, $1C62, $1EA8, $1EB8, $1EC8, $1EC8, $1ED8, $1E56, $1E7D
	db $0A : dw $048E : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1EC9, $1EC9, $1ED9, $5E56, $1E7E
	db $0A : dw $0490 : dw $1E70, $1E80, $1C4E, $1EA0, $1EB0, $1EC0, $1E40, $1E50, $1E56, $1E7D
	db $0A : dw $0492 : dw $1E71, $1E81, $1E91, $1EA1, $1EB1, $1EC1, $1E41, $1EC1, $5E56, $5E7C
	db $0A : dw $0494 : dw $1E02, $1E12, $1C84, $1E32, $1E40, $1E50, $1E50, $1E56, $1E56, $1E7C
	db $0A : dw $0496 : dw $1E03, $1E13, $1E23, $1E33, $1E41, $1E51, $1E51, $1E56, $1E67, $1E64
	db $01 : dw $0698 : dw $1E6B
	db $01 : dw $065A : dw $1E66
	db $02 : dw $061C : dw $1E56, $1E6B

	db $13
	db $01 : dw $1EFA : dw $1E51
	db $06 : dw $1DBC : dw $5E73, $5E83, $5E93, $5EA3, $5EB3, $1EC0
	db $06 : dw $1DBE : dw $1C00, $5E82, $5C8C, $5EA2, $5EB2, $1EC1
	db $05 : dw $0540 : dw $1C00, $1E02, $1E12, $1CAE, $1E32
	db $05 : dw $0542 : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $06 : dw $0504 : dw $1C00, $1E02, $1CCE, $1E22, $1D20, $1E40
	db $06 : dw $0506 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41
	db $05 : dw $04C8 : dw $1C00, $1E02, $1E12, $1CAE, $1E32
	db $07 : dw $04CA : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E51
	db $08 : dw $048C : dw $1C00, $1C00, $1CAC, $1E92, $1D08, $1EB2, $1EC0, $1ED0
	db $08 : dw $048E : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1ED1
	db $08 : dw $0490 : dw $1C00, $1E82, $1CC6, $1EA2, $5D0A, $1EC0, $1EC0, $1ED0
	db $08 : dw $0492 : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1EC1, $1ED1
	db $02 : dw $0614 : dw $1E40, $1E50
	db $02 : dw $0616 : dw $1E41, $1E51
	db $02 : dw $0658 : dw $5E56, $1E6A
	db $03 : dw $061A : dw $1E41, $1E56, $1E64
	db $01 : dw $061E : dw $5E66
	db $01 : dw $0620 : dw $5E66

	db $14
	db $01 : dw $1C82 : dw $5C04
	db $04 : dw $0580 : dw $1C00, $1E82, $1C8C, $1EA2
	db $04 : dw $0582 : dw $1E73, $1E83, $1E93, $1EA3
	db $05 : dw $0544 : dw $1C00, $1E02, $1E12, $1C84, $1E32
	db $05 : dw $0546 : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $06 : dw $0508 : dw $1C00, $1C70, $1C44, $1C74, $1C02, $1E40
	db $06 : dw $050A : dw $1C00, $1C71, $1C73, $1C75, $1C77, $1E41
	db $07 : dw $04CC : dw $1E78, $1E00, $1E10, $1C04, $1E30, $1EC8, $1ED8
	db $07 : dw $04CE : dw $1E79, $1E01, $1E11, $1E21, $1E31, $1EC9, $1ED9
	db $07 : dw $04D0 : dw $1E02, $1CCE, $1E22, $1D20, $1E58, $1E48, $1E58
	db $08 : dw $0492 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E59, $1E49, $1E59
	db $06 : dw $0494 : dw $1C00, $1E02, $1C24, $1E20, $1E32, $1E40
	db $06 : dw $0496 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41
	db $06 : dw $0498 : dw $1C00, $5E8D, $5E9D, $5EAD, $5EBD, $1ECC
	db $06 : dw $049A : dw $1C00, $5E8C, $5C64, $5EAC, $5EBC, $1ECD
	db $08 : dw $049C : dw $1C00, $5E05, $5E15, $5E25, $5E35, $1E44, $1E50, $1E66
	db $07 : dw $04DE : dw $5E04, $5C68, $5E24, $5E34, $1E45, $1E51, $1E69
	db $06 : dw $0520 : dw $5E08, $5E2D, $5E3D, $1E4C, $1E66, $1E64
	db $04 : dw $0522 : dw $5D4A, $5E2C, $5CEA, $1E4D
	db $01 : dw $0524 : dw $5E08

	db $13
	db $05 : dw $05C0 : dw $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $0582 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $01 : dw $0604 : dw $1CAE
	db $05 : dw $0548 : dw $1E02, $1CCE, $1E22, $1D20, $1E50
	db $07 : dw $054A : dw $1E03, $1E13, $1E23, $1E33, $1E51, $1EC0, $1E66
	db $09 : dw $04CC : dw $1C00, $1C00, $1E82, $1C8C, $1EA2, $1EB2, $1EC0, $1E40, $1E66
	db $09 : dw $04CE : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1EC1, $1EC0, $1E7C
	db $07 : dw $04D0 : dw $1C00, $1C00, $1E82, $1C8C, $1EA2, $1E40, $1E50
	db $09 : dw $04D2 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1E41, $1E51, $5E56, $1E7E
	db $09 : dw $04D4 : dw $1C00, $1E04, $1E14, $1C48, $1E34, $1E5C, $1E6C, $1E56, $1E7D
	db $09 : dw $04D6 : dw $1C00, $1E05, $1E15, $1E25, $1E35, $1E5D, $1E6D, $1E56, $1E7D
	db $09 : dw $04D8 : dw $1C00, $1E04, $1E14, $1C48, $1E34, $1E40, $5E56, $1E66, $1E7F
	db $08 : dw $04DA : dw $1C00, $1E05, $1E15, $1E25, $1E35, $1E41, $1E5C, $1E61
	db $08 : dw $04DC : dw $1C00, $1E00, $1E10, $1C04, $1E34, $1E50, $1E56, $1E62
	db $08 : dw $04DE : dw $1C00, $1E01, $1E11, $1E21, $1E35, $1E51, $1E56, $1E64
	db $06 : dw $0520 : dw $1C00, $1E84, $5E25, $5E35, $1E56, $1E6B
	db $06 : dw $0522 : dw $1C00, $1E85, $5C48, $5E34, $1E56, $5E63
	db $06 : dw $0524 : dw $1C00, $1E84, $1C04, $1E30, $1E56, $5E66
	db $07 : dw $0526 : dw $1C00, $1E85, $1E21, $1E31, $1E51, $5E66, $5E65

	db $14
	db $06 : dw $0584 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $0586 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $05 : dw $0548 : dw $1C00, $1E02, $1E12, $1CAE, $1E32
	db $05 : dw $054A : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $05 : dw $054C : dw $1E02, $1CCE, $1E22, $1D20, $1E50
	db $08 : dw $050E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E51, $1E40, $1E66
	db $07 : dw $0550 : dw $1E1E, $1C8A, $1E3E, $1E4E, $1E5C, $1EC0, $1E7C
	db $08 : dw $0512 : dw $1E0F, $1E1F, $1E2F, $1E3F, $1E4F, $1E5D, $1E56, $1E7D
	db $08 : dw $0514 : dw $1E0C, $1E1C, $1C0A, $1E3C, $1E5C, $1E6C, $5E56, $1E7E
	db $04 : dw $0516 : dw $1E0D, $1E1D, $1E2D, $1E3D
	db $04 : dw $0618 : dw $1E5C, $1E6C, $5E56, $1E7E
	db $04 : dw $061A : dw $1E5D, $1E6D, $1E56, $1E7D
	db $05 : dw $05DC : dw $1E30, $1E44, $1E56, $1E66, $1E7F
	db $04 : dw $05DE : dw $1E31, $1E45, $1E56, $1E61
	db $06 : dw $0560 : dw $1E00, $5E25, $5E35, $1E56, $1E56, $1E63
	db $06 : dw $0562 : dw $1E01, $5C48, $5E34, $1E56, $1E66, $1E64
	db $04 : dw $0564 : dw $1E00, $1C08, $1E38, $1E44
	db $04 : dw $0566 : dw $1E01, $1E29, $1E39, $1E45
	db $05 : dw $0528 : dw $1E0C, $1E1C, $1C0A, $1E3C, $1E4C
	db $05 : dw $052A : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D

	db $12
	db $06 : dw $0588 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $058A : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $05 : dw $054C : dw $1C00, $1E02, $1E12, $1CAE, $1E32
	db $05 : dw $054E : dw $1C00, $1E03, $1E13, $1E23, $1E33
	db $07 : dw $0550 : dw $1E02, $1CCE, $1E22, $1D20, $1E40, $1E40, $1E66
	db $08 : dw $0512 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $1E40, $1E66
	db $08 : dw $0514 : dw $1E78, $1E88, $1C62, $1EA8, $1EB8, $1EC8, $5E56, $1E7C
	db $06 : dw $0516 : dw $1E79, $1E89, $1E99, $1EA9, $1EB9, $1EC9
	db $08 : dw $0518 : dw $1E74, $1E84, $1C60, $1EA4, $1EB4, $1EC4, $5E56, $5E7D
	db $08 : dw $051A : dw $1E75, $1E85, $1E95, $1EA5, $1EB5, $1EC5, $1E56, $5E7C
	db $08 : dw $051C : dw $1E0C, $1E1C, $1C4C, $1E3C, $1E4C, $1EC4, $1E56, $1E66
	db $08 : dw $051E : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D, $1EC5, $1E56, $1E7C
	db $05 : dw $05A0 : dw $1C0A, $1E3C, $1E4C, $1E56, $1E6B
	db $05 : dw $05A2 : dw $1E2D, $1E3D, $1E4D, $1E66, $1C00
	db $03 : dw $05A4 : dw $1C0C, $1EA0, $1EB0
	db $05 : dw $05A6 : dw $1E91, $1EA1, $1EB1, $5E66, $1E65
	db $05 : dw $0528 : dw $1E70, $1E80, $1C0C, $1EA0, $1EB0
	db $05 : dw $052A : dw $1E71, $1E81, $1E91, $1EA1, $1EB1

	db $13
	db $01 : dw $1C82 : dw $5CAE
	db $06 : dw $058C : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $058E : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $07 : dw $0550 : dw $1C00, $1E02, $1E12, $1CAE, $1E32, $1E50, $1E40
	db $07 : dw $0552 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E51, $1E41
	db $08 : dw $0514 : dw $1C00, $1C00, $1CAC, $1E92, $1D08, $1EB2, $1E50, $1E56
	db $08 : dw $0516 : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1EB3, $1E51, $1E66
	db $08 : dw $0518 : dw $1C00, $1E08, $1C6A, $1E28, $5D04, $1E48, $5E56, $1E7C
	db $08 : dw $051A : dw $1C00, $1E09, $1E19, $1E29, $1E39, $1E49, $1E56, $1E7D
	db $08 : dw $051C : dw $1C00, $1E00, $1C66, $1E20, $1E30, $1E40, $1E56, $5E7D
	db $08 : dw $051E : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41, $1E56, $5E7C
	db $07 : dw $0560 : dw $1C00, $1D4C, $1EAC, $1EBC, $1E40, $1E56, $1E7C
	db $07 : dw $0562 : dw $1C00, $1E01, $1EAD, $1EBD, $1E41, $1E67, $1E7F
	db $06 : dw $0564 : dw $1C00, $1D4C, $1EAC, $1EBC, $1E40, $5E67
	db $07 : dw $0566 : dw $1C00, $1E01, $1EAD, $1EBD, $1E41, $5E56, $5E7C
	db $08 : dw $0528 : dw $1C00, $1E8C, $1C22, $1EAC, $1EBC, $1ECC, $1E56, $5E7C
	db $08 : dw $052A : dw $1C00, $1E8D, $1E9D, $1EAD, $1EBD, $1ECD, $1E51, $1E7C
	db $06 : dw $052C : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $05 : dw $056E : dw $1E01, $1E11, $1E21, $1E31, $1E41

	db $0D
	db $05 : dw $0590 : dw $1C00, $1E00, $1C24, $1E20, $1E30
	db $05 : dw $0592 : dw $1C00, $1E01, $1E11, $1E21, $1E31
	db $06 : dw $0594 : dw $1E02, $1E12, $1CAE, $1E32, $1EB2, $1E50
	db $07 : dw $0556 : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1EB3, $1E56
	db $07 : dw $0558 : dw $1C00, $1CAC, $1E92, $1D08, $1EB2, $1E51, $1E66
	db $07 : dw $055A : dw $1E73, $1E83, $1E93, $1EA3, $1EB3, $5E56, $1E7C
	db $07 : dw $055C : dw $1E0C, $1C6C, $1E2C, $1CEA, $1E4C, $1E56, $1E7D
	db $05 : dw $055E : dw $1E0D, $1E1D, $1E2D, $1E3D, $1E4D
	db $02 : dw $06A2 : dw $1E56, $5E7C
	db $02 : dw $06A4 : dw $1E51, $1E66
	db $01 : dw $06E6 : dw $1E7C
	db $07 : dw $0568 : dw $1E00, $1C24, $1E20, $1E30, $1E40, $1E56, $1E7D
	db $07 : dw $056A : dw $1E01, $1E11, $1E21, $1E31, $1E41, $1E56, $5E7C

	db $0E
	db $06 : dw $0594 : dw $1C00, $1E00, $1C24, $1E20, $1E30, $1E40
	db $06 : dw $0596 : dw $1C00, $1E01, $1E11, $1E21, $1E31, $1E41
	db $06 : dw $0598 : dw $1E72, $1E82, $1C8C, $1EA2, $1E50, $1E56
	db $07 : dw $055A : dw $1C00, $1E73, $1E83, $1E93, $1EA3, $1E51, $1E66
	db $07 : dw $055C : dw $1C00, $1E02, $1E12, $1C84, $1E32, $1E40, $5E66
	db $07 : dw $055E : dw $1C00, $1E03, $1E13, $1E23, $1E33, $1E41, $5E56
	db $06 : dw $05A0 : dw $1D40, $1E92, $1D08, $1EB2, $1E40, $5E66
	db $06 : dw $05A2 : dw $1E05, $1E93, $1EA3, $1EB3, $1E41, $5E56
	db $06 : dw $05A4 : dw $1D40, $1E22, $1D04, $1E40, $1E40, $5E66
	db $06 : dw $05A6 : dw $1E05, $1E23, $1E33, $1E41, $1E41, $5E56
	db $02 : dw $06A8 : dw $1E40, $1E50
	db $02 : dw $06AA : dw $1E41, $1E51
	db $02 : dw $06AC : dw $1E40, $1E50
	db $02 : dw $06AE : dw $1E41, $1E51
}

{ ;F3D8 - FFFF
if !version == 0
	;lots of unused data
	db $DD, $F7, $F7, $FF, $DF, $D7, $F5, $FD, $BF, $EF, $FF, $EF, $EF, $FB, $FE, $BF
	db $FF, $FF, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FD, $FF, $FF, $FF, $DF, $DF, $F9, $D7, $BF, $FF, $BF, $BB, $BF, $EB, $FB, $BE
	db $CF, $FF, $77, $FF, $FB, $FF, $7D, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $77, $FB, $F7, $F6, $E5, $FD, $DE, $D5, $EF, $FB, $FF, $FF, $FF, $EB, $FF, $FE
	db $FE, $FF, $FF, $EF, $FE, $EF, $AF, $F6, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $BF
	db $D7, $F7, $FD, $77, $7F, $FF, $DF, $F5, $FF, $9B, $FF, $BF, $FA, $FE, $BF, $EF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FE, $F6, $FF, $FF, $FF, $FF, $FF, $FF, $BF, $FF
	db $7F, $6F, $FF, $FD, $DD, $7B, $7D, $DF, $AF, $FF, $EF, $FF, $BF, $FB, $FF, $FF
	db $DF, $FF, $FF, $FF, $FF, $FF, $FF, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $5F, $7F, $D7, $5F, $5F, $BF, $F7, $75, $EB, $FF, $EF, $BF, $BF, $FF, $FF, $EF
	db $FF, $FF, $FF, $2F, $FB, $FF, $F7, $FE, $FF, $FF, $FF, $FF, $FF, $FB, $FF, $FF
	db $3F, $DF, $D5, $D7, $5F, $DF, $57, $FF, $BB, $EF, $FB, $FF, $BF, $BF, $BF, $FF
	db $FF, $FD, $DB, $FB, $FE, $FF, $FB, $BF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $1F, $EE, $F7, $59, $7D, $F7, $75, $33, $BF, $FB, $FB, $BF, $BF, $EB, $FB, $EF
	db $FF, $EF, $FF, $FF, $FF, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $ED, $FF, $B5, $D9, $5D, $FF, $6F, $FF, $FF, $FF, $FB, $FF, $FF, $BF, $FB, $FF
	db $FF, $FF, $FB, $FF, $FF, $FF, $7B, $FF, $FF, $7F, $FF, $FF, $FF, $FF, $FF, $FF
	db $77, $FF, $77, $DF, $7D, $D5, $5E, $F5, $BD, $FF, $AF, $FF, $FF, $FF, $BF, $EF
	db $FD, $F7, $FF, $FD, $FF, $FF, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $75, $B7, $5D, $77, $DD, $7F, $7D, $DC, $FF, $FF, $EF, $BB, $FF, $BF, $FF, $FB
	db $3F, $FF, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $7F, $FF, $FF, $FF
	db $D5, $E7, $D5, $F7, $3F, $DF, $FD, $5E, $BF, $FF, $FF, $FF, $FF, $FF, $F7, $FF
	db $FF, $FF, $FF, $7F, $FF, $BF, $FB, $FF, $FF, $FF, $BF, $FF, $FF, $FF, $DF, $FF
	db $F5, $FF, $B7, $DF, $57, $7E, $3F, $FF, $BE, $FF, $AF, $FF, $BF, $FF, $BB, $FE
	db $FF, $7F, $FF, $E7, $FF, $FB, $F7, $FF, $F7, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $DD, $B7, $FF, $F7, $D7, $5D, $41, $DD, $BF, $FF, $FF, $BA, $7F, $EF, $FF, $FF
	db $BF, $BF, $FF, $CF, $FF, $FB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $BD, $D7, $5D, $55, $77, $77, $FF, $FC, $FF, $FF, $FB, $EB, $AF, $FF, $AF, $FF
	db $FF, $FF, $7F, $7F, $FE, $FF, $FF, $DF, $FF, $FF, $FD, $FF, $FF, $FF, $FF, $FF
	db $F7, $F1, $FF, $FD, $F5, $75, $75, $FF, $AF, $BE, $EF, $E3, $FB, $BF, $AF, $EB
	db $EB, $FF, $FF, $FF, $FD, $FF, $FF, $BF, $FF, $EF, $FF, $FF, $FF, $FF, $FB, $FF
	db $FD, $FF, $DF, $FF, $5D, $C7, $1D, $F4, $F9, $EF, $FE, $BF, $FF, $BB, $BB, $EF
	db $FF, $7D, $FF, $FF, $FB, $93, $EF, $FF, $FF, $FF, $DF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $5F, $7F, $FF, $7D, $DF, $C7, $FD, $AF, $BA, $FB, $4F, $EF, $EF, $FF
	db $FC, $FF, $FF, $FF, $FF, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $F7, $FF, $D7, $FF, $7D, $D5, $FB, $FF, $FF, $BF, $3F, $FB, $FB, $FF, $AF, $EF
	db $FF, $FF, $FF, $FF, $FB, $FF, $FF, $FF, $F7, $FF, $F5, $FF, $FF, $FF, $FF, $FD
	db $F7, $5D, $5D, $FB, $BF, $77, $F6, $8F, $FE, $FB, $EF, $FF, $EF, $EB, $EF, $FF
	db $FF, $FF, $FF, $FE, $FF, $F2, $DE, $FF, $FF, $BF, $FF, $FD, $F7, $FF, $FF, $FF
	db $FF, $FD, $D7, $FF, $DD, $CF, $F7, $D5, $AB, $BD, $BF, $EF, $FB, $FB, $FA, $AF
	db $FF, $FF, $FF, $FF, $FF, $7F, $FF, $FB, $FF, $FB, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $5F, $F7, $F7, $7D, $37, $97, $F4, $FF, $AF, $EF, $BF, $FE, $EF, $FB, $BF
	db $D7, $FF, $FF, $FF, $BF, $BF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $D5, $F5, $7D, $FF, $D9, $B7, $FF, $FF, $FF, $FB, $FF, $BE, $FF, $FA, $FF, $FF
	db $FE, $FD, $1F, $FF, $B2, $F7, $FE, $FD, $FF, $FF, $FF, $7F, $FF, $EF, $FF, $FF
	db $5D, $DF, $7E, $FD, $D7, $FD, $74, $DB, $FF, $EF, $A7, $FB, $FF, $FF, $FF, $FF
	db $7D, $FF, $FF, $9F, $FF, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $3B, $DD, $3D, $FD, $F6, $6D, $DF, $C4, $FF, $FF, $EF, $AF, $FF, $FF, $FB, $FF
	db $FF, $FA, $FF, $FF, $FE, $7F, $FF, $F5, $FF, $FF, $FF, $FB, $FF, $FF, $FF, $FF
	db $56, $F5, $7F, $74, $BF, $FD, $F5, $8E, $BF, $FA, $FB, $AA, $FB, $FF, $EF, $FD
	db $BF, $ED, $FF, $FF, $FF, $DF, $F7, $BF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $7F, $FF, $DF, $ED, $77, $DF, $05, $D7, $BF, $FB, $FF, $EF, $EB, $BF, $F7, $FF
	db $FD, $FE, $5F, $7F, $F7, $FF, $9F, $FB, $FF, $FD, $DF, $FF, $FF, $FF, $FF, $FF
	db $3D, $DF, $FF, $5F, $DD, $BD, $ED, $7E, $FF, $EF, $BF, $EE, $EB, $AF, $FF, $FB
	db $BF, $DF, $BD, $BF, $FF, $FF, $FF, $DB, $FF, $FD, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $79, $FD, $FD, $DF, $EF, $FD, $DD, $AB, $FE, $FE, $EE, $AB, $FF, $FE, $EB
	db $FF, $FF, $FF, $FF, $FD, $FD, $B7, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $ED, $DD, $DF, $57, $DD, $7D, $FF, $FF, $EF, $FF, $BF, $EF, $FE, $FB, $FE, $BF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $7F, $FF, $7F, $FF, $FF, $DF, $FF, $FF, $FF
	db $6E, $75, $D7, $C7, $F5, $DF, $F1, $7F, $FB, $EF, $FF, $FF, $FB, $EF, $FB, $FF
	db $FF, $AF, $EF, $F7, $F7, $77, $77, $BB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FE
	db $FF, $FF, $55, $F7, $CD, $EA, $5E, $FE, $FF, $FF, $AB, $FF, $EB, $FE, $AE, $FF
	db $BF, $FF, $FE, $FF, $FF, $EF, $FE, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $D7, $71, $DF, $F5, $7D, $F7, $FA, $DE, $EF, $FB, $EF, $FF, $FB, $BE, $BF, $BF
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $F7, $FD, $FF, $FF, $C7, $FD, $FD, $FD

	db $00, $28, $08, $00, $00, $00, $08, $00, $00, $00, $00, $00, $00, $20, $00, $02
	db $00, $40, $00, $2A, $00, $08, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $00, $00, $00, $00, $00, $08, $02, $00, $04, $20, $00, $00, $00, $04, $00
	db $08, $08, $14, $00, $00, $80, $42, $02, $00, $10, $00, $00, $00, $00, $00, $00
	db $A0, $80, $00, $00, $08, $80, $00, $00, $00, $81, $00, $00, $00, $00, $20, $00
	db $40, $00, $00, $00, $10, $0C, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $80, $00, $00, $20, $20, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $00, $20, $00, $48, $00, $40, $04, $00, $00, $40, $00, $00, $00, $00, $00
	db $00, $20, $00, $00, $08, $80, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $48, $50, $00, $01, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $20, $00, $00, $02, $08, $00, $00, $00, $00, $00, $00, $40, $00
	db $80, $4A, $22, $52, $00, $05, $18, $86, $00, $00, $00, $50, $00, $00, $00, $00
	db $A0, $00, $00, $02, $00, $00, $88, $2A, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $20, $00, $00, $40, $88, $01, $40, $00, $00, $00, $00, $01, $00, $00, $00
	db $00, $20, $00, $80, $82, $00, $00, $02, $00, $00, $00, $00, $00, $02, $00, $00
	db $00, $09, $00, $20, $00, $08, $02, $08, $00, $00, $10, $00, $00, $40, $04, $00
	db $80, $A8, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $10, $00, $30, $00, $00, $01, $00, $04, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $80, $00, $02, $80, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $64, $08, $20, $00, $4C, $82, $20, $20, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $80, $00, $00, $00, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $04, $01, $01, $0A, $50, $20, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $80, $00, $00, $20, $08, $80, $A8, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $00, $58, $40, $45, $61, $20, $98, $00, $00, $00, $00, $00, $00, $00, $00
	db $20, $00, $80, $80, $20, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $11, $40, $39, $24, $00, $00, $00, $00, $00, $00, $00, $00
	db $28, $00, $00, $02, $00, $00, $82, $08, $00, $04, $0C, $00, $00, $00, $40, $00
	db $00, $0A, $00, $00, $00, $00, $D0, $20, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $00, $00, $20, $20, $20, $00, $08, $20, $00, $20, $00, $80, $02, $00, $00
	db $00, $02, $01, $00, $02, $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $40, $00, $00, $00, $00, $41, $10, $10, $00, $01, $00, $00, $00, $00, $00, $00
	db $88, $00, $02, $00, $00, $22, $80, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $20, $00, $40, $00, $00, $10, $28, $00, $00, $00, $00, $00, $40, $10, $00
	db $00, $20, $00, $00, $00, $80, $20, $00, $00, $00, $00, $00, $10, $00, $00, $00
	db $1E, $00, $04, $20, $00, $30, $00, $08, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $00, $00, $00, $00, $08, $00, $A0, $00, $00, $00, $00, $00, $00, $40, $00
	db $82, $00, $00, $00, $00, $00, $31, $29, $00, $00, $00, $00, $40, $00, $00, $00
	db $80, $00, $00, $20, $00, $08, $80, $00, $00, $00, $00, $80, $00, $00, $00, $00
	db $00, $44, $00, $00, $88, $0D, $21, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $A0, $20, $02, $00, $00, $08, $00, $02, $00, $00, $00, $00, $00, $C0, $00, $00
	db $02, $08, $01, $0C, $00, $00, $00, $80, $00, $10, $00, $00, $00, $00, $00, $00
	db $22, $00, $00, $00, $80, $08, $00, $08, $00, $00, $00, $05, $00, $22, $00, $00
	db $02, $00, $00, $00, $40, $13, $1C, $01, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $8A, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $80, $00
	db $10, $00, $01, $40, $13, $84, $50, $30, $00, $40, $00, $00, $00, $00, $00, $00
	db $00, $08, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00, $00
	db $00, $00, $00, $00, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $40, $00
	db $00, $20, $08, $00, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $40, $20, $20, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $20, $00, $08, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $20
	db $08, $04, $1C, $04, $28, $08, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $22, $02, $00, $00, $00, $08, $08, $81, $00, $00, $00, $40, $00, $00, $00, $00
	db $00, $00, $00, $00, $04, $05, $08, $05, $00, $00, $00, $00, $00, $00, $00, $00
	db $0A, $02, $00, $08, $20, $0A, $A0, $00, $00, $0C, $00, $00, $00, $00, $00, $00
	db $60, $00, $00, $00, $60, $20, $09, $84, $01, $00, $00, $00, $00, $01, $00, $00
	db $80, $80, $00, $02, $08, $02, $08, $00, $00, $00, $00, $00, $20, $00, $00, $00
	db $90, $08, $C0, $01, $01, $04, $44, $40, $00, $00, $00, $00, $04, $00, $00, $00
	db $00, $00, $20, $20, $02, $02, $88, $00, $00, $00, $80, $00, $00, $00, $00, $00
	db $00, $18, $00, $08, $00, $00, $14, $84, $00, $00, $00, $00, $00, $00, $00, $00
	db $28, $80, $00, $00, $00, $00, $02, $02, $00, $82, $08, $00, $00, $04, $00, $00
	db $10, $00, $20, $01, $03, $40, $80, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $00, $80, $22, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $08, $00, $00, $50, $00, $12, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $08, $80, $00, $00, $00, $00, $00, $00, $00, $10, $00, $00, $00, $00, $00
	db $00, $01, $00, $40, $40, $00, $10, $40, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $04, $C0, $41, $00, $48, $84, $34, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $80, $22, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $20, $00, $00, $10, $00, $00, $80, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $80, $00, $00, $20, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00
	db $00, $00, $04, $04, $00, $04, $08, $10, $04, $04, $01, $00, $00, $00, $00, $00
	db $00, $20, $00, $02, $00, $00, $00, $0A, $00, $00, $50, $00, $00, $00, $00, $00
	db $20, $20, $00, $08, $01, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $00, $00, $00, $80, $02, $08, $80, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $05, $08, $00, $02, $00, $A2, $01, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $02, $88, $80, $08, $00, $00, $00, $00, $C0, $00, $00, $00
	db $2C, $20, $20, $00, $40, $20, $20, $04, $00, $00, $00, $00, $00, $04, $00, $00
	db $80, $80, $00, $00, $20, $00, $08, $00, $00, $80, $00, $00, $00, $00, $00, $00
	db $04, $00, $20, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $28, $08, $02, $00, $00, $80, $00, $80, $00, $00, $00, $00, $00, $00, $00, $20
	db $00, $40, $01, $00, $40, $00, $10, $42, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $00, $00, $02, $20, $02, $00, $02, $00, $00, $00, $00, $01, $00, $00, $00
	db $01, $04, $82, $00, $4C, $AC, $45, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $08, $20, $00, $08, $00, $00, $00, $00, $08, $00, $00, $00, $00
	db $14, $00, $00, $02, $10, $01, $80, $04, $40, $00, $00, $00, $00, $00, $00, $00
	db $00, $08, $00, $00, $02, $20, $80, $00, $20, $10, $00, $00, $00, $00, $00, $00
	db $82, $00, $04, $20, $40, $00, $81, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $20, $80, $08, $22, $20, $00, $0A, $08, $00, $00, $00, $04, $00, $00, $00, $00
	db $05, $01, $40, $10, $50, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $08, $08, $00, $08, $02, $00, $00, $00, $00, $00, $20, $00, $00, $00, $80
	db $00, $42, $80, $02, $28, $00, $40, $24, $00, $00, $04, $40, $00, $00, $00, $40
	db $00, $00, $08, $00, $80, $20, $2A, $00, $40, $02, $00, $04, $00, $00, $00, $08
	db $00, $20, $00, $00, $00, $00, $04, $00, $00, $00, $10, $00, $00, $00, $00, $00
	db $00, $00, $00, $80, $80, $22, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $08, $00, $00, $00, $08, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $08, $20, $88, $80, $20, $02, $00, $00, $08, $00, $00, $00, $00, $00, $00, $00
	db $30, $01, $C0, $62, $00, $11, $51, $20, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $40, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $02, $01, $00
	db $00, $00, $24, $10, $10, $00, $00, $8B, $00, $00, $00, $00, $00, $00, $00, $00
	db $08, $80, $00, $02, $00, $00, $28, $00, $00, $00, $40, $00, $01, $00, $00, $00
	db $88, $04, $00, $00, $00, $00, $4C, $80, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $08, $80, $02, $00, $00, $8A, $28, $00, $00, $00, $40, $00, $00, $04, $00
	db $00, $01, $09, $00, $00, $01, $52, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $80, $80, $00, $00, $00, $20, $00, $00, $00, $00, $00, $00, $00, $00, $08, $00
	db $00, $00, $00, $10, $00, $00, $20, $02, $00, $10, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $80, $00, $20, $00, $00, $00, $00, $40, $00
	db $73, $00, $00, $60, $02, $00, $A1, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $20, $00, $00, $08, $20, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $04, $00, $06, $08, $40, $14, $21, $62, $00, $00, $00, $01, $00, $00, $00, $00
	db $00, $00, $20, $00, $02, $00, $20, $08, $00, $00, $08, $00, $00, $00, $01, $00
	db $01, $04, $80, $00, $00, $80, $00, $00, $00, $00, $00, $40, $00, $00, $00, $00
	db $00, $08, $00, $00, $00, $00, $08, $00, $00, $00, $50, $00, $00, $00, $20, $00
	db $00, $40, $00, $00, $00, $08, $00, $04, $00, $00, $01, $00, $80, $00, $00, $00
	db $00, $80, $00, $00, $08, $20, $00, $01, $00, $02, $0C, $00, $00, $00, $00, $00
	db $A2, $22, $08, $00, $40, $00, $48, $10, $00, $00, $00, $00, $00, $00, $00, $00
	db $18, $02, $20, $20, $00, $02, $00, $00, $00, $80, $00, $00, $00, $00, $08, $00
	db $00, $01, $20, $80, $00, $10, $81, $0C, $00, $00, $00, $00, $00, $00, $00, $10
	db $20, $02, $00, $08, $08, $20, $00, $80, $00, $00, $00, $40, $00, $40, $00, $00
	db $10, $04, $01, $80, $40, $D4, $04, $81, $00, $00, $00, $04, $00, $00, $00, $00
	db $00, $08, $00, $00, $00, $00, $80, $00, $00, $00, $02, $10, $00, $10, $00, $00
	db $68, $21, $04, $00, $20, $00, $04, $08, $00, $00, $00, $00, $00, $00, $00, $00
	db $82, $00, $20, $00, $00, $88, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $04, $00, $20, $02, $10, $20, $00, $00, $00, $00, $01, $40, $40, $00, $00
	db $00, $00, $00, $08, $80, $00, $A2, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $80, $0D, $30, $25, $02, $40, $44, $00, $00, $01, $00, $00, $00, $00, $00
	db $00, $00, $20, $08, $00, $00, $00, $26, $00, $00, $00, $00, $00, $80, $00, $84
	db $00, $00, $00, $00, $00, $00, $00, $FA, $00, $00, $00, $00, $00, $00, $00, $91
elseif !version == 1 || !version == 2
	;this could be data that meant something at some point. seems unused now though.
	;store as fill bytes to not clutter up this file, unless it's found out that the data means something.
	incbin "us_fill_bytes/bank1Eb.bin"
endif
}
