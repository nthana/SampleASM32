.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
MessageBoxA PROTO,
    hWnd:DWORD,
    pText:PTR BYTE,
    pCaption:PTR BYTE,
    style:DWORD

; Or use the alternative declarations belows. (also need to edited the calls statements.)
; extern ExitProcess@4 : PROC
; extern MessageBoxA@16 : PROC

.data
myText			db "Hello World", 0
myCaption		db "Message Box Testing", 0

.code
main PROC

        ; calling MessageBox Win32 API 
        ; (see: Win32 API MessageBox document)
    push 0                  ; MB_OK 
    push offset myCaption   ; caption's start address
    push offset myText      ; text's start address
    push 0                  ; hwnd: Owner window's handle
    call MessageBoxA        ; Or call MessageBoxA@16
	

	push 12345678           ; exit code
	call ExitProcess        ; Or call ExitProcess@4
main ENDP

END main        ;specify the program's entry point