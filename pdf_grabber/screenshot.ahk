#SingleInstance force
;;https://autohotkey.com/board/topic/77421-printscreen-to-paint-automatically/
;;https://drive.google.com/file/d/0B57_32KKob2yd21OemRCRUVuUDA/view



;;Send Alt-printscreent
#s::
MouseMove 960, 540
Sleep, 3000
Loop, 5 ;; SPREMEN NA ŠT STRANI
{	
	
	;MsgBox, Iteration number is %A_Index%. 
	Sendinput {Alt down}{PrintScreen}{Alt up}
	;;If the window "Untitled - Paint" is present


	;;Run paint
	Run %windir%\System32\mspaint.exe
	;;Wait until "Untitled - Paint" is done loading
	WinWait Untitled - Paint
	;;Activate the paint window
	WinActivate                                   

	;;Paste image
	Sendinput ^v
	;;Save image using control s
	Sendinput {Ctrl down}{s down}{s up}{Ctrl up}
	;;Wait until save as dialog is done loading
	WinWait Save As
	;;Activate window
	WinActivate
	;;Paste desktop location
	Send, test_%A_Index%
	Loop, 6
	{
		Send, `t ;;6x
	}
	Send, {Enter}
	Send, C:\Users\Jan\Desktop\pdf_grabber\pdf
	Send, {Enter}
	Loop, 8
	{
		Send, `t ;;8x
	}
	Send, {Enter}
	WinWaitClose Save As
	SendInput {LAlt Down}{F4 down}{F4 up}{LAlt Up}
	Sleep, 1000
	WinActivate, Chrome
	MouseMove 960, 540
	Send, {MButton}
	MouseMove, 0, 40 , , R
	Sleep, 100
	; 16 pixlov teme pr normalnm zoomu pa dvema plusoma 924px je slika
	iter:=0
	Loop,
	{
		PixelGetColor, color_up, 960, 1078
		PixelGetColor, color_down, 960, 1079
		Sleep, 1
		iter:=1+iter
		if((color_down< 0xF00000) && (color_up>0xe00000))
		{
			;MsgBox brejk
			break
		}
	}
	Send, {MButton}
;MsgBox,	%color_down%
;MsgBox,	%iter%




	
}
return