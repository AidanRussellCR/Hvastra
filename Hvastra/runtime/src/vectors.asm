.import Reset
.import NMI
.import IRQ

.segment "VECTORS"

.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word NMI
.word $0000
.word IRQ

.word $0000
.word $0000
.word $0000
.word $0000
.word $0000
.word NMI
.word Reset
.word IRQ
