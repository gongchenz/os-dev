; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; 僆僽僕僃僋僩僼傽僀儖傪嶌傞儌乕僪	
[INSTRSET "i486p"]				; 486偺柦椷傑偱巊偄偨偄偲偄偆婰弎
[BITS 32]						; 32價僢僩儌乕僪梡偺婡夿岅傪嶌傜偣傞
[FILE "naskfunc.nas"]			; 僜乕僗僼傽僀儖柤忣曬


; 源文件信息

		GLOBAL	_io_hlt				; 程序中包含的函数名
		GLOBAL	_write_mem8			
; 以下是实际函数

[SECTION .text]					;目标文件写完了这些以后再写程序

_io_hlt:	; void io_hlt(void)
		HLT
		RET

_write_mem8:	; void write_mem8(int addr, int data)
		MOV		ECX,[ESP+4]
		MOV		AL,[ESP+8]
		MOV		[ECX],AL
		RET
