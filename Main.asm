.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
MessageBoxA PROTO,
    hWnd:DWORD,
    pText:PTR BYTE,
    pCaption:PTR BYTE,
    style:DWORD

;   Or use the alternative declarations belows: 
;   (If used these, also need to edited the "call" instructions' proc names)
; extern ExitProcess@4 : PROC
; extern MessageBoxA@16 : PROC

.data
myText			db "Hello World", 0
myCaption		db "Message Box Testing", 0

.code
main PROC

        ; see: Win32 API MessageBox
        ; https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messagebox
    push 0                  ; MB_OK 
    push offset myCaption   ; caption's start address
    push offset myText      ; text's start address
    push 0                  ; hwnd: Owner window's handle
    call MessageBoxA        ; Or call MessageBoxA@16
	
        ; see: Win32 API ExitProcess
        ; https://docs.microsoft.com/en-us/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess
	push 12345678           ; exit code
	call ExitProcess        ; Or call ExitProcess@4
main ENDP

END main        ;specifying the program's entry point