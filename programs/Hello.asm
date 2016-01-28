	BITS 16
	ORG 32768
	%INCLUDE 'mikedev.inc'

start:
	mov ax, .title_msg
	mov bx, .footer_msg
	;       WRGB
	mov cx, 00110000b	; Colour
	call os_draw_background
	
	mov si, mystring
	call os_print_string
	call os_print_newline
	
	call datetime
	
    mov ax, .title_msg
	mov bx, .footer_msg
	;       WRGB
	mov cx, 00110000b	; Colour
	call os_draw_background
    jmp loop

	
	call os_wait_for_key
    call os_clear_screen

	ret

    .title_msg      db  'Eric`s Program', 0
	.footer_msg     db  'v0.1', 0

    .about1         db  'This is a really simple app by', 0
    .about2         db  'Eric Lynema', 0
	
	mystring db 'Welcome to My Program', 0


loop:	
    mov si, prompt
    call os_print_string
    mov ax, .string
    call os_input_string
    call os_print_newline
	mov si, .string
	mov di, .quit
	call os_string_compare
	jc .quitProgram

	jmp loop


 .quitProgram:
    ret
    
    .string		times 256 db 0
    prompt db '> ', 0
;-------------------------------------------------------------
datetime:
    mov bx, tmpstring
	call os_get_time_string
	mov si, bx
	call os_print_string
	call os_print_newline

	mov bx, tmpstring
	call os_get_date_string
	mov si, bx
	call os_print_string
	call os_print_newline
    ret
    
    tmpstring db 'BLAHBLAHBLAH',0
;-------------------------------------------------------------    
