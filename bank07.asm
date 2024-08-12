org $078000

{ ;APU data
	arch spc700

	incbin "audio/06D405.bin":$2BFB..$0 ;continued from previous bank

	;-----

	dw $0000, $0300

	arch 65816
}

{ ; - FFFF
	fillbyte $FF : fill 1479
}
