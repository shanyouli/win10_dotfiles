#NoEnv
SetWorkingDir %A_ScriptDir%
; ahk2exe.exe
if FileExist("c:\Applications\Scoop\apps\autohotkey-installer\current\compiler\Ahk2Exe.exe")
    AHK2exe := "C:\Applications\Scoop\apps\autohotkey-installer\current\Compiler\Ahk2Exe.exe"
else if FileExist("C:\Applications\Apps\autohotkey\Comipler\Ahk2Exe.exe")
    AHK2exe := "C:\Applications\Apps\autohotkey\Comipler\Ahk2Exe.exe"
else if FileExist("C:\Program Files\autohotkey\Comipler\Ahk2Exe.exe")
    AHK2exe := "C:\Program Files\autohotkey\Comipler\Ahk2Exe.exe"
else if FileExist("C:\Applications\Scoop\apps\autohotkey\current\compiler\Ahk2Exe.exe")
    AHK2exe := "C:\Applications\Scoop\apps\autohotkey\current\compiler\Ahk2Exe.exe"

if  ! AHK2exe
    MsgBox 16,, Not Ahk2exe.exe "," Please determine the location of ak2exe.exe.

; build autostartapps.ahk
Run, %AHK2exe% /in "AutoRunapp.ahk"

; build Autokeybord
Run, %AHK2exe% /in "autokeyboard.ahk" /icon "AutoKeyBoard.ico"