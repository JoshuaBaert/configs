#InstallKeybdHook
#InstallMouseHook

^!Numpad1::
Send, {Media_Prev}
return

^!Numpad2::
Send, {Media_Play_Pause}
return

^!Numpad3::
Send, {Media_Next}
return

^!NumpadDiv::
Send, {Volume_Mute}
return
^!NumpadMult::
Send, {Volume_Down}
return
^!NumpadSub::
Send, {Volume_Up}
return

^f12::
DllCall("user32.dll\LockWorkStation")
return

^f11::
Run calc.exe
return

^f10::
KeyHistory
return

^f1::
Run, powershell.exe "no-sleep"
return


^#i::
Run, "%LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe"
return

^#n::
Run, "C:\ProgramData\chocolatey\bin\micro.exe"
return

^#Up:: 
Send, {LWin}
Send, {Tab}
return


; !f1::
; Send, {1}
; Send, {A}
; Send, {Click}
; Sleep, 200  
; Send, {2}
; Send, {A}
; Send, {Click}
; Sleep, 200
; Send, {3}
; Send, {A}
; Send, {Click}
; Sleep, 200
; return
