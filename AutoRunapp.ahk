#NoEnv

Autoapp := {}

Autoapp.quicklook := "C:\Applications\Scoop\apps\quicklook\current\QuickLook.exe"
Autoapp.V2rayN := "C:\Applications\Scoop\apps\v2rayn\current\v2rayN.exe"
Autoapp.Emacs := "C:\Applications\Scoop\apps\emacs-dev\current\bin\runemacs.exe"

Sleep 3000
; 设置更高的优先级给脚本
Process, Priority,, Realtime
For key, value in Autoapp
{
    Sleep 3000
    if FileExist(value)
    {
        if (Key == "Emacs")
        {
            Run, %Value%, Hide,, EmacsPid
            Process, Priority, %EmacsPid%, High
        }
        Else
            Run, %value%, Hide
    }
}