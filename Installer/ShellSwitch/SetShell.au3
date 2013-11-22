#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Switch_button.ico
#AutoIt3Wrapper_Outfile=SetShell.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         testmad

 Script Function:
	Switch shells between LiteStep and Explorer.

#ce ----------------------------------------------------------------------------
AutoItSetOption("TrayIconHide", 1)

#include <Constants.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Array.au3>

Global $LS_Path
getLSPath()

Global $CurrentUserShell = ""

Global $RegReadError1 = "Unable to open requested key."
Global $RegReadError2 = "Unable to open requested main key."
Global $RegReadError3 = "Unable to remote connect to the registry."
Global $RegReadError4 = "Unable to open requested value."
Global $RegReadError5 = "Value type not supported."

getUserShell()
Dim $tString = formatGet($CurrentUserShell)

$Form1 = GUICreate("Shell Switch", 401, 103, 348, 368, -1, BitOR($WS_EX_TOOLWINDOW,$WS_EX_WINDOWEDGE))
$CurrentShellLabel = GUICtrlCreateLabel("Your shell is currently set to " & formatGet($CurrentUserShell), 121, 16, 180, 40)
$btnSwitch = GUICtrlCreateButton("", 52, 56, 120, 25)

If $tString = "explorer" Then
	GUICtrlSetData(-1, "Switch to LiteStep")
Else
	GUICtrlSetData(-1, "Switch to Explorer")
EndIf

$btnCancel = GUICtrlCreateButton("Cancel", 228, 56, 120, 25)

GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $btnCancel
			Exit
		Case $btnSwitch
			switchShell()
			ExitLoop

	EndSwitch
WEnd

getUserShell()

GUICtrlSetData( $CurrentShellLabel, "Your shell has been changed to " & formatGet($CurrentUserShell) & @CRLF & "Would you like to log off now?")

GUICtrlSetData( $btnSwitch, "Log Off Now")

GUICtrlSetData( $btnCancel, "Later")

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $btnCancel
			Exit
		Case $btnSwitch
			Shutdown(0, "Applied new shell.")
			Exit
	EndSwitch
WEnd

Func switchShell()
	If formatGet($CurrentUserShell) = "explorer" Then
		RegWrite( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", $LS_Path & "\litestep.exe")
		If @error Then
			If @error = 1 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & $RegReadError1)
			ElseIf @error = 2 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError2)
			ElseIf @error = 3 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError3)
			ElseIf @error = -1 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError4)
			ElseIf @error = -2 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError5)
			EndIf
		Else
		EndIf
	Else
		RegWrite( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe")
		If @error Then
			If @error = 1 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & $RegReadError1)
			ElseIf @error = 2 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError2)
			ElseIf @error = 3 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError3)
			ElseIf @error = -1 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError4)
			ElseIf @error = -2 Then
				MsgBox(4096, "Error", "Unable to set shell." & @CRLF & @CRLF & $RegReadError5)
			EndIf
		Else
		EndIf
	EndIf
EndFunc


Func getLSPath()
	$LS_Path = RegRead ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "LitestepDir" )

	If @error Then
		If @error = 1 Then
			MsgBox(4096, "Error", "Unable to get LiteStep Path." & @CRLF & $RegReadError1)
		ElseIf @error = 2 Then
			MsgBox(4096, "Error", "Unable to get LiteStep Path." & @CRLF & @CRLF & $RegReadError2)
		ElseIf @error = 3 Then
			MsgBox(4096, "Error", "Unable to get LiteStep Path." & @CRLF & @CRLF & $RegReadError3)
		ElseIf @error = -1 Then
			MsgBox(4096, "Error", "Unable to get LiteStep Path." & @CRLF & @CRLF & $RegReadError4)
		ElseIf @error = -2 Then
			MsgBox(4096, "Error", "Unable to get LiteStep Path." & @CRLF & @CRLF & $RegReadError5)
		EndIf
	Else
	EndIf
EndFunc

Func getUserShell()
	$CurrentUserShell = RegRead ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )

	If @error Then
		If @error = 1 Then
			MsgBox(4096, "Error", "Unable to get user shell." & @CRLF & @CRLF & $RegReadError1)
		ElseIf @error = 2 Then
			MsgBox(4096, "Error", "Unable to get user shell." & @CRLF & @CRLF & $RegReadError2)
		ElseIf @error = 3 Then
			MsgBox(4096, "Error", "Unable to get user shell." & @CRLF & @CRLF & $RegReadError3)
		ElseIf @error = -1 Then
			MsgBox(4096, "Error", "Unable to get user shell." & @CRLF & @CRLF & $RegReadError4)
		ElseIf @error = -2 Then
			MsgBox(4096, "Error", "Unable to get user shell." & @CRLF & @CRLF & $RegReadError5)
		EndIf
	Else
	EndIf
EndFunc

Func formatGet($gString)
	If $gString = "explorer.exe" Then
		Local $temp = StringLeft($gString, StringLen($gString) - 4)
		$temp = StringReplace($temp, "e","E",1)
	Else
		Local $temp = StringLeft($gString, StringLen($gString) - 4)
		Local $aStrings = StringSplit($temp, "\")
		$temp = $aStrings[$aStrings[0]]
		If $temp = "litestep" Then
			$temp = StringReplace($temp, "l","L")
			$temp = StringReplace($temp, "s","S")
		Else
			MsgBox(4096, "Error", "You changed the exe name.")
		EndIf
	EndIf

	Return $temp

EndFunc

