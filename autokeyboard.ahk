RunOnce(AppPath, App, PID ) {
    if WinExist("ahK_pid" . PID)
    {
        if WinActive("ahk_pid" . PID)
        {
            WinMinimize, ahk_pid %PID%
            MsgBox,,"Minimize",, 0.001
        }
        else
        {
            ;WinActivate, ahk_pid %PID%
            WinMinimize, ahk_pid %PID%
            WinRestore, ahk_pid %PID%
        }
    }
    else
    {
        if WinExist("ahk_exe" . App)
        {
            if WinActive("ahk_exe" . App)
            {
                WinMinimize, ahk_exe %App%
                MsgBox,,"Minimize",, 0.001
            }
            else
            {
                ;WinActivate, ahk_pid %PID%
                WinMinimize, ahK_exe %App%
                WinRestore, ahk_exe %App%
            }
            WinGet, PID, PID, ahk_exe %App%
        }
        else
            if FileExist(AppPath)
                Run, %AppPath%,,,PID
            else
                MsgBox "PATH ERROR, %AppPath%"
    }
    Return %PID%
}

; ------------------- Variables ---------------------------------------------- ;
; Procexp64
ProcexpPath := "c:\Applications\Scoop\apps\procexp\current\procexp64.exe"
ProcexpExe := "procexp64.exe"

; Totalcmd64
TotalcmdPath := "c:\Applications\Scoop\apps\totalcmd64\current\Totalcmd64.exe"
TotalcmdExe  := "Totalcmd64.exe"

; Emacs
EmacsPath := "c:\Applications\Scoop\apps\emacs-dev\current\bin\runemacs.exe"
EmacsExe  := "emacs.exe"

; Foobar2000
Foobar2kPath := "c:\Applications\Scoop\apps\foobar2000\current\foobar2000.exe"
Foobar2kExe := "foobar2000.exe"
;; ------------------ Variables --------------------------------------------- ;;


; ---------------------------------------------------------------------------- ;
; Keyboard
; ---------------------------------------------------------------------------- ;
^#p::PrPID := RunOnce(ProcexpPath, ProcexpExe, PrPID)

#e::TotalcmdPid := RunOnce(TotalcmdPath, TotalcmdExe, TotalcmdPid)

^#n::EmacsPid := RunOnce(EmacsPath, EmacsExe, EmacsPid)

^#m::Foobar2kPid := RunOnce(Foobar2kPath, Foobar2kExe, Foobar2kPid)