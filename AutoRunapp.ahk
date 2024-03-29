#NoEnv

Autoapp := {}

; quicklook, v2rayn, listary, keepassxc, translucenttb, copyq
Autoapp.quicklook     := "C:\Applications\Scoop\apps\quicklook\current\QuickLook.exe"
Autoapp.V2rayN        := "C:\Applications\Scoop\apps\v2rayn\current\v2rayN.exe"
Autoapp.Listary       := "C:\Applications\Scoop\apps\listary\current\Listary.exe"
Autoapp.keepassxc     := "C:\Applications\Scoop\apps\keepassxc\current\KeePassXC.exe"
Autoapp.TransLucentTB := "C:\Applications\Apps\TranslucentTB\TranslucentTB.exe"
Autoapp.copyq         := "C:\Applications\Scoop\apps\copyq\current\copyq.exe"
Autoapp.ShareX        := "C:\Applications\Scoop\apps\sharex\current\ShareX.exe"

; 设置更高的优先级给脚本
Process, Priority,, Realtime
For key, value in Autoapp
{
    Sleep 500
    if FileExist(value)
    {
        Run, %value%,, Hide
    }
}