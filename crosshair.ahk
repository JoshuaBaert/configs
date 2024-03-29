; This script can make crosshairs appear on your screen.
; You may lock their position.
;
; Start script => nothing will happen (unless you change start-up behaviour)
; Use Ctrl-Numeric0         to toggle display of crosshairs
; Use Ctrl-NumericDot       to lock/unlock position of crosshairs
; Use Numeric0 & NumericDot to quit program


; === Start-up stuff
#NoEnv

SetWinDelay 0
Coordmode Mouse, Screen
Restart:
Selecting := False
OldX := -1, OldY := -1
Locked  := False
Visible := True			;<= determine start-up behaviour
CrosshairOn := True			;<= determine start-up behaviour


ID1 := Box(2,1,40)
ID2 := Box(3,40,1)

SetTimer Ruler, 10
if (Visible == False) {
    WinHide ahk_id %ID1%,, 
    WinHide ahk_id %ID2%,, 
}
Return


; === Toggle lock of crosshairs
^NumpadDot::           ;using hotkey instead of waiting for a key keeps the right click from calling other behavior during script
if (Visible == False) {
    WinShow ahk_id %ID1%,, 
    WinShow ahk_id %ID2%,, 
	Visible := True 
}
if (Locked == False) {
	SetTimer Ruler, Off
	Locked := True 
	}
else {
	SetTimer Ruler, 10
	Locked := False 
	}
Return


; === Toggle display of crosshairs
^Numpad0::
!F11::
if(CrosshairOn) {
    WinHide ahk_id %ID1%,,
    WinHide ahk_id %ID2%,,
    Visible := False
    CrosshairOn := False
} else {
    WinShow ahk_id %ID1%,,
    WinShow ahk_id %ID2%,,
    Visible := True
    CrosshairOn := True
}
Return


~RButton::
if(CrosshairOn) {
    if (Visible == True) {
        WinHide ahk_id %ID1%,,
        WinHide ahk_id %ID2%,,
        Visible := False
    } else {
        WinShow ahk_id %ID1%,,
        WinShow ahk_id %ID2%,,
        Visible := True
    }
}
Return


; === Terminate program
Numpad0::Send {Blind}{Numpad0}	; necessary to make Numpad0 work normally
Numpad0 & NumpadDot::
;Escape::
OutOfHere:
ExitApp



Ruler:
   MouseGetPos RulerX, RulerY
   RulerX := RulerX - 5  ;offset the mouse pointer a bit
   RulerY := RulerY - 5
   If (OldX <> RulerX)
	  OldX := RulerX
   If (OldY <> RulerY)
      OldY := RulerY
   WinMove ahk_id %ID1%,, %RulerX%, % RulerY-20    ;create crosshair by moving 1/2 length of segment
   WinMove ahk_id %ID2%,, % RulerX-20, %RulerY%
Return

Box(n,wide,high)
{
   Gui %n%:Color, fc0004               ; Black
   Gui %n%:-Caption +ToolWindow +E0x20 ; No title bar, No taskbar button, Transparent for clicks
   Gui %n%: Show, Center W%wide% H%high%      ; Show it
   WinGet ID, ID, A                    ; ...with HWND/handle ID
   Winset AlwaysOnTop,ON,ahk_id %ID%   ; Keep it always on the top
   WinSet Transparent,255,ahk_id %ID%  ; Opaque
   Return ID
}
