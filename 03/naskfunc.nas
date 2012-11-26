; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; 制作目标文件的模式
[BITS 32]					; 32模式用的机器语言


; 源文件信息

[FILE "naskfunc.nas"]				; 源文件名称

		GLOBAL	_io_hlt			; 程序中包含的函数名


; 以下是实际函数

[SECTION .text]					;目标文件写完了这些以后再写程序

_io_hlt:	; void io_hlt(void);
		HLT
		RET
