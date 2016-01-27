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
	
	mov si, mysecond
	call os_print_string
	
	mov ax, .about1
	mov bx, .about2
	mov cx, 0
	mov dx, 0
	call os_dialog_box
	
    mov ax, .title_msg
	mov bx, .footer_msg
	;       WRGB
	mov cx, 00110000b	; Colour
	call os_draw_background
	
	call os_wait_for_key
    call os_clear_screen

	ret

    .title_msg      db  'Eric`s Program', 0
	.footer_msg     db  'Press any key to continue.', 0

    .about1         db  'This is a really simple app by', 0
    .about2         db  'Eric Lynema', 0
	
	mystring db 'Welcome to my App:', 0
	mysecond db '>', 0

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