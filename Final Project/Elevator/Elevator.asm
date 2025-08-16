			.INCLUDE "M32DEF.INC"
			.ORG $000
			RJMP main
			.ORG $004
			RJMP arrive
			.ORG $014
			RJMP timer
			.ORG $100

main:		CBI DDRD,0		; PORTD.0(out): input
			CBI DDRD,1		; PORTD.1(req): input
			CBI DDRD,2		; PORTD.2(alarm): input
			CBI DDRD,3		; PORTD.3(in and INT1): input
			CLR R16			; ...
			OUT SFIOR,R16	; SFIOR.2 = PUD = 0
			SER R16			; ...
			OUT PORTD,R16	; ...

			SBI DDRC,3		; PORTC.3(close): output
			SBI DDRC,7		; PORTC.7(open): output

			LDI R16,$80		; GICR = 1000 0000 = 80h
			LDI R17,$00		; MCUCR = 0000 0000 = 00h
			OUT GICR,R16	; ...
			OUT MCUCR,R17	; ...
			SEI				; SREG.7 = I = 1

			LDI R16,$00		; Init stack pointer when using subroutines
			OUT SPL,R16		; ...
			LDI R16,$02		; ...
			OUT SPH,R16		; ...

			LDI R16,245		; OCR0 = 245
							; 1024 * 245 = 250,880us ~= 0.25s
							; 60 / 0.25 = 240 (for test 24)
							; 30 / 0.25 = 120 (for test 12)
							; 20 / 0.25 = 80 (for test 8)
			OUT OCR0,R16

			LDI R16,$02		; TIMSK = 0000 0010 = 02h
			OUT TIMSK,R16

			CLR R20			; Holds the number of timer interrupts (240 or 120 or 80)

			LDI R21,$0D		; TCCR0 = 0000 1101 = 0Dh -> To start timer
			CLR R22			; TCCR0  = 0 -> To stop timer

loop:		RJMP loop

arrive:		IN R16,PIND		; R16 = PORTD
			SBRS R16,0		; Skip if out == 1
			RJMP open
			SBRS R16,1		; Skip if req == 1
			RJMP open
			RJMP arriveExit
open:		SBI PORTC,7		; open = 1
			LDI R20,8		; Delay 20s (2s for test)
			OUT TCCR0,R21	; Start timer
arriveExit:	RETI

timer:		DEC R20
			CPI R20,0
			BRNE timerExit
timerDone:	IN R17,PINC
			SBRC R17,7		; Skip if open == 0
			RJMP openDone
			SBRC R17,3		; Skip if close == 0
			RJMP closeDone
			RJMP waitDone
openDone:	CBI PORTC,7		; open = 0
			LDI R20,24		; Delay 60s (6s for test)
			OUT TCCR0,R21	; Start timer
			RJMP timerExit
closeDone:	CBI PORTC,3		; close = 0
			OUT TCCR0,R22	; Stop timer
			RJMP timerExit
waitDone:	IN R18,PIND
			SBRS R18,2		; Skip if alarm == 1
			RJMP alarmOn
			SBI PORTC,3		; close = 1
			LDI R20,8		; Delay 20s (2s for test)
			OUT TCCR0,R21	; Start timer
			RJMP timerExit
alarmOn:	LDI R20,12		; Delay 30s (3s for test)
			OUT TCCR0,R21	; Start timer
timerExit:	RETI