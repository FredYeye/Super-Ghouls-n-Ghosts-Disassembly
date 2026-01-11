{ ;toggle register widths
    !A8   = "sep #$20"
    !A16  = "rep #$20"

    !X8   = "sep #$10"
    !X16  = "rep #$10"

    !AX8  = "sep #$30"
    !AX16 = "rep #$30"
}

{ ;snes registers
    INIDISP   = $2100 ;Display Control 1
    OBSEL     = $2101 ;Object Size and Object Base
    OAMADDL   = $2102 ;OAM Address (lower 8bit)
    OAMADDH   = $2103 ;OAM Address (upper 1bit) and Priority Rotation
    !BGMODE   = $2105 ;BG Mode and BG Character Size
    !MOSAIC   = $2106 ;Mosaic Size and Mosaic Enable
    !BG1SC    = $2107 ;BG1 Screen Base and Screen Size
    !BG2SC    = $2108 ;BG2 Screen Base and Screen Size
    !BG3SC    = $2109 ;BG3 Screen Base and Screen Size
    !BG12NBA  = $210B ;BG Character Data Area Designation
    !BG34NBA  = $210C ;BG Character Data Area Designation
    !BG1HOFS  = $210D ;BG1 Horizontal Scroll (X) (write-twice) / M7HOFS
    !BG1VOFS  = $210E ;BG1 Vertical Scroll   (Y) (write-twice) / M7VOFS
    !BG2HOFS  = $210F ;BG2 Horizontal Scroll (X) (write-twice)
    !BG2VOFS  = $2110 ;BG2 Vertical Scroll   (Y) (write-twice)
    !BG3HOFS  = $2111 ;BG3 Horizontal Scroll (X) (write-twice)
    !BG3VOFS  = $2112 ;BG3 Vertical Scroll   (Y) (write-twice)
    !VMAIN    = $2115 ;VRAM Address Increment Mode
    !VMADDL   = $2116 ;VRAM Address (lower 8bit)
    !VMADDH   = $2117 ;VRAM Address (upper 8bit)
    !VMDATAL  = $2118 ;VRAM Data Write (lower 8bit)
    !VMDATAH  = $2119 ;VRAM Data Write (upper 8bit)
    !M7SEL    = $211A ;Rotation/Scaling Mode Settings
    !M7A      = $211B ;Rotation/Scaling Parameter A & Maths 16bit operand (w2)
    !M7B      = $211C ;Rotation/Scaling Parameter B & Maths 8bit operand (w2)
    !M7C      = $211D ;Rotation/Scaling Parameter C         (write-twice)
    !M7D      = $211E ;Rotation/Scaling Parameter D         (write-twice)
    !M7X      = $211F ;Rotation/Scaling Center Coordinate X (write-twice)
    !M7Y      = $2120 ;Rotation/Scaling Center Coordinate Y (write-twice)
    !CGADD    = $2121 ;Palette CGRAM Address
    !W12SEL   = $2123 ;Window BG1/BG2 Mask Settings
    !W34SEL   = $2124 ;Window BG3/BG4 Mask Settings
    !WOBJSEL  = $2125 ;Window OBJ/MATH Mask Settings
    !WH0      = $2126 ;Window 1 Left Position (X1)
    !WH1      = $2127 ;Window 1 Right Position (X2)
    !WH2      = $2128 ;Window 2 Left Position (X1)
    !WH3      = $2129 ;Window 2 Right Position (X2)
    !WBGLOG   = $212A ;Window 1/2 Mask Logic (BG1-BG4)
    !WOBJLOG  = $212B ;Window 1/2 Mask Logic (OBJ/MATH)
    !TM       = $212C ;Main Screen Designation
    !TS       = $212D ;Sub Screen Designation
    !TMW      = $212E ;Window Area Main Screen Disable
    !TSW      = $212F ;Window Area Sub Screen Disable
    !CGWSEL   = $2130 ;Color Math Control Register A
    !CGADSUB  = $2131 ;Color Math Control Register B
    !COLDATA  = $2132 ;Color Math Sub Screen Backdrop Color
    !SETINI   = $2133 ;Display Control 2

    !MPYM     = $2135 ;PPU1 Signed Multiply Result   (middle 8bit)
    !MPYH     = $2136 ;PPU1 Signed Multiply Result   (upper 8bit)
    !SLHV     = $2137 ;PPU1 Latch H/V-Counter by Software (Read=Strobe)
    !RDVRAML  = $2139 ;PPU1 VRAM Data Read           (lower 8bits)
    !RDVRAMH  = $213A ;PPU1 VRAM Data Read           (upper 8bits)
    !OPVCT    = $213D ;PPU2 Vertical Counter Latch   (read-twice)
    !STAT78   = $213F ;PPU2 Status and PPU2 Version Number

    !APUI00   = $2140 ;Main CPU to Sound CPU Communication Port 0
    !APUI01   = $2141 ;Main CPU to Sound CPU Communication Port 1
    !APUI02   = $2142 ;Main CPU to Sound CPU Communication Port 2
    !APUI03   = $2143 ;Main CPU to Sound CPU Communication Port 3

    !NMITIMEN = $4200 ;Interrupt Enable and Joypad Request
    !WRIO     = $4201 ;Joypad Programmable I/O Port (Open-Collector Output)
    !WRMPYA   = $4202 ;Set unsigned 8bit Multiplicand
    !WRMPYB   = $4203 ;Set unsigned 8bit Multiplier and Start Multiplication
    !WRDIVL   = $4204 ;Set unsigned 16bit Dividend (lower 8bit)
    !WRDIVH   = $4205 ;Set unsigned 16bit Dividend (upper 8bit)
    !WRDIVB   = $4206 ;Set unsigned 8bit Divisor and Start Division
    !HTIMEL   = $4207 ;H-Count Timer Setting (lower 8bits)
    !HTIMEH   = $4208 ;H-Count Timer Setting (upper 1bit)
    !VTIMEL   = $4209 ;V-Count Timer Setting (lower 8bits)
    !VTIMEH   = $420A ;V-Count Timer Setting (upper 1bit)
    !MDMAEN   = $420B ;Select General Purpose DMA Channel(s) and Start Transfer
    !HDMAEN   = $420C ;Select H-Blank DMA (H-DMA) Channel(s)

    !RDNMI    = $4210 ;V-Blank NMI Flag and CPU Version Number (Read/Ack)
    !TIMEUP   = $4211 ;H/V-Timer IRQ Flag (Read/Ack)
    !HVBJOY   = $4212 ;H/V-Blank flag and Joypad Busy flag (R)
    !RDDIVL   = $4214 ;Unsigned Division Result (Quotient) (lower 8bit)
    !RDMPYL   = $4216 ;Unsigned Division Remainder / Multiply Product (lower 8bit)
    !RDMPYH   = $4217 ;Unsigned Division Remainder / Multiply Product (upper 8bit)
    !JOY1L    = $4218 ;Joypad 1 (gameport 1, pin 4) (lower 8bit)

    !DMAP0    = $4300 ;DMA/HDMA Parameters
    !DMAP1    = $4310 ;DMA/HDMA Parameters
    !DMAP2    = $4320 ;DMA/HDMA Parameters
    !DMAP3    = $4330 ;DMA/HDMA Parameters
    !DMAP4    = $4340 ;DMA/HDMA Parameters
    !DMAP5    = $4350 ;DMA/HDMA Parameters
    !DMAP7    = $4370 ;DMA/HDMA Parameters

    !BBAD0    = $4301 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD1    = $4311 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD2    = $4321 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD3    = $4331 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD4    = $4341 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD5    = $4351 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)
    !BBAD7    = $4371 ;DMA/HDMA I/O-Bus Address (PPU-Bus aka B-Bus)

    !A1T0L    = $4302 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T1L    = $4312 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T2L    = $4322 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T3L    = $4332 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T4L    = $4342 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T5L    = $4352 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T6L    = $4362 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)
    !A1T7L    = $4372 ;HDMA Table Start Address (low)  / DMA Curr Addr (low)

    !A1T0H    = $4303 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T1H    = $4313 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T3H    = $4333 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T4H    = $4343 ;HDMA Table Start Address (high) / DMA Curr Addr (high)
    !A1T5H    = $4353 ;HDMA Table Start Address (high) / DMA Curr Addr (high)

    !A1B0     = $4304 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B1     = $4314 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B2     = $4324 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B3     = $4334 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B4     = $4344 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B5     = $4354 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)
    !A1B7     = $4374 ;HDMA Table Start Address (bank) / DMA Curr Addr (bank)

    !DAS0L    = $4305 ;Indirect HDMA Address (low)  / DMA Byte-Counter (low)
    !DAS0H    = $4306 ;Indirect HDMA Address (high) / DMA Byte-Counter (high)

    !DAS1B    = $4317 ;Indirect HDMA Address (bank)
    !DAS3B    = $4337 ;Indirect HDMA Address (bank)
    !DAS4B    = $4347 ;Indirect HDMA Address (bank)
    !DAS5B    = $4357 ;Indirect HDMA Address (bank)

    !A2A1L    = $4318 ;HDMA Table Current Address (low)
    !A2A2L    = $4328 ;HDMA Table Current Address (low)
    !A2A3L    = $4338 ;HDMA Table Current Address (low)
    !A2A4L    = $4348 ;HDMA Table Current Address (low)
    !A2A5L    = $4358 ;HDMA Table Current Address (low)
    !A2A6L    = $4368 ;HDMA Table Current Address (low)
    !A2A7L    = $4378 ;HDMA Table Current Address (low)

    !NTRL1    = $431A ;HDMA Line-Counter (from current Table entry)
    !NTRL2    = $432A ;HDMA Line-Counter (from current Table entry)
    !NTRL3    = $433A ;HDMA Line-Counter (from current Table entry)
    !NTRL4    = $434A ;HDMA Line-Counter (from current Table entry)
    !NTRL5    = $435A ;HDMA Line-Counter (from current Table entry)
    !NTRL6    = $436A ;HDMA Line-Counter (from current Table entry)
    !NTRL7    = $437A ;HDMA Line-Counter (from current Table entry)
}

{ ;SPC ports
    !TEST    = $00F0 ;Testing functions
    !CONTROL = $00F1 ;Timer, I/O and ROM Control
    !DSPADDR = $00F2 ;DSP Register Index
    !DSPDATA = $00F3 ;DSP Register Data
    !CPUIO0  = $00F4 ;CPU Input and Output Register 0
    !CPUIO1  = $00F5 ;CPU Input and Output Register 1
    !CPUIO2  = $00F6 ;CPU Input and Output Register 2
    !CPUIO3  = $00F7 ;CPU Input and Output Register 3
    !AUXIO4  = $00F8 ;Unused
    !AUXIO5  = $00F9 ;Unused
    !T0DIV   = $00FA ;Timer 0 Divider
    !T1DIV   = $00FB ;Timer 1 Divider
    !T2DIV   = $00FC ;Timer 2 Divider
    !T0OUT   = $00FD ;Timer 0 Output
    !T1OUT   = $00FE ;Timer 1 Output
    !T2OUT   = $00FF ;Timer 2 Output
}

{ ;joypad inputs
    ;todo: maybe prefix these with button or something
    ;lower byte
    !r      = $10
    !l      = $20
    !x      = $40
    !a      = $80

    ;upper byte
    !right  = $01
    !left   = $02
    !down   = $04
    !up     = $08
    !start  = $10
    !select = $20
    !y      = $40
    !b      = $80
}
