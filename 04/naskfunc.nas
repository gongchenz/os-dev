; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; 制作目标程序的模式
[INSTRSET "i486p"]				; 使用486的指令
[BITS 32]					; 制作32位模式机器语言
[FILE "naskfunc.nas"]			        ; 源程序名称 


; 源文件信息

		GLOBAL  _io_hlt, _io_cli, _io_sti, _io_stihlt	; 程序中包含的函数名
                GLOBAL  _io_in8, _io_in16, _io_in32
                GLOBAL  _io_out8, _io_out16, _io_out32
                GLOBAL  _io_load_eflags, _io_store_eflags
		GLOBAL  _write_mem8
; 以下是实际函数

[SECTION .text]					;目标文件写完了这些以后再写程序

_io_hlt:	; void io_hlt(void)
		HLT
		RET

_io_cli:        ; void io_cli(void)
                CLI
                RET

_io_sti:        ; void io_sti(void)
                STI
                RET

_io_stihlt:     ; void io_stihlt(void)
                STI
                HLT
                RET

_io_in8:        ; int io_in8(int port)
                MOV EDX, [ESP+4]
                MOV EAX, 0
                IN  AL, DX
                RET

_io_in16:       ; int io_in16(int port)
                MOV EDX, [ESP+4]
                MOV EAX,0
                IN  AX, DX
                RET

_io_in32:       ; int io_in32(int port)
                MOV EDX, [ESP+4]
                IN  EAX, DX
                RET

_io_out8:       ; void io_out8(int port, int data)
                MOV EDX, [ESP+4]
                MOV AL, [ESP+8]
                OUT DX, AL
                RET

_io_out16:       ; void io_out16(int port, int data)
                 MOV EDX, [ESP+4]
                 MOV EAX, [ESP+8]
                 OUT DX, AX
                 RET

_io_out32:       ; void io_out32(int port, int data)
                 MOV EDX, [ESP+4]
                 MOV EAX, [ESP+8]
                 OUT DX, EAX
                 RET

_io_load_eflags: ;int io_load_eflags(void)
                 PUSHFD ;push eflags
                 POP EAX
                 RET

_io_store_eflags: ;void io_store_eflags(void)
                 MOV EAX, [ESP+4]
                 PUSH EAX
                 POPFD  ;pop eflags
                 RET

_write_mem8:	; void write_mem8(int addr, int data)
		MOV		ECX,[ESP+4]
		MOV		AL,[ESP+8]
		MOV		[ECX],AL
		RET

