#Persistent
#WinActivateForce
SetBatchLines, -1
Process, Priority,, High

Gui +LastFound
hWnd := WinExist()

DllCall("RegisterShellHookWindow", UInt, hWnd)
MsgNum := DllCall("RegisterWindowMessage", Str,"SHELLHOOK")
OnMessage(MsgNum, "ShellMessage")
Return
SetTitleMatchMode, 2
ShellMessage(wParam,lParam) {
	If (wParam = 32772 And WinExist("ahk_id " lParam)) 
	{ 
		WinGetTitle, Title, ahk_id %lParam%
		IfInString, Title, Sublime 
		{
			SetTitleMatchMode, 2
			WinActivate, Powershell
			WinActivate, Sublime
			Sleep 2000
		}
	} 
}