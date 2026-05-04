.segment "HEADER"

; 21-byte internal ROM name
.byte "HVASTRA              "

.byte $20   ; LoROM
.byte $00   ; Chipset (ROM only)
.byte $05   ; 32KB ROM
.byte $00   ; no SRAM
.byte $01   ; USA
.byte $00   ; licensee
.byte $00   ; version

.word $0000 ; checksum complement placeholder
.word $FFFF ; checksum placeholder
