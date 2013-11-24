#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=ShellSwitch.ico
#AutoIt3Wrapper_Outfile=..\ShellSwitch.exe
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Description=ShellSwitch
#AutoIt3Wrapper_Res_Fileversion=0.0.3.2
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

Global $RegReadError1 = "Unable to open requested key."
Global $RegReadError2 = "Unable to open requested main key."
Global $RegReadError3 = "Unable to remote connect to the registry."
Global $RegReadError4 = "Unable to open requested value."
Global $RegReadError5 = "Value type not supported."

Global $RunBefore = ""
Global $LS_Path
Global $CurrentUserShell = ""

$RunBefore = RegRead ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "SSBefore" ) ;Check if ShellSwitch was installed by ALI.
If @error Then
	$ans = MsgBox(1, "First Run", "ShellSwitch was not installed with ALI." & @CRLF & "A required registry key must be created to continue.")
	If $ans = 2 Then
		Exit
	ElseIf $ans = 1 Then
		RegWrite ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "SSBefore", "REG_SZ", "0" ) ;Create the needed key.
	EndIf
EndIf

$RunBefore = RegRead ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "SSBefore" ) ;Check if ShellSwitch was run before.
If $RunBefore = "0" Then
	$ans = MsgBox(1, "First Run", "This is the first time you have run ShellSwitch." & @CRLF & "It will check various shell keys and set them to defaults before continuing.")
	If $ans = 2 Then
		RegWrite ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "SSBefore", "REG_SZ", "0" )
		MsgBox(4096, "First Run", "No keys were changed.")
		Exit
	ElseIf $ans = 1 Then
		RegWrite ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "SSBefore", "REG_SZ", "1" )
	EndIf
ElseIf $RunBefore = "1" Then
EndIf

getLSPath()
fixMixedKeys()
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

Func getUserShell()
	$CurrentUserShell = RegRead ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )
	If @error Then
		MsgBox(4096, "Status", "User shell key does not exist.  Checking System shell key.")
		If @OSArch = "X86" Then
			$temp32 = RegRead ( "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )
			MsgBox(4096, "Status", "Found System shell key. Creating User shell key and setting System key to defualt.")
			RegWrite ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", $temp32)
			RegWrite ( "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe")
			$CurrentUserShell = RegRead ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )
		ElseIf @OSArch = "X64" Then
			$temp32 = RegRead ( "HKEY_LOCAL_MACHINE64\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )
			$temp64 = RegRead ( "HKEY_LOCAL_MACHINE64\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )
			If $temp32 <> $temp64 Then
				MsgBox(4096, "Status", "System shell values mismatched. Setting System keys to default and creating User shell key.")
				RegWrite ( "HKEY_LOCAL_MACHINE64\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe" )
				RegWrite ( "HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe" )
				RegWrite ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe")
				$CurrentUserShell = RegRead ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )
			Else
				MsgBox(4096, "Status", "Setting System keys to default and creating User shell key.")
				RegWrite ( "HKEY_LOCAL_MACHINE64\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe" )
				RegWrite ( "HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe" )
				RegWrite ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell", "REG_SZ", "explorer.exe")
				$CurrentUserShell = RegRead ( "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Winlogon", "Shell" )
			EndIf
		EndIf
	EndIf
EndFunc

Func getLSPath()
	$LS_Path = RegRead ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "LitestepDir" )
	If @error Then
		MsgBox(4096, "Error", "LiteStep was not installed with ALI." & @CRLF & @CRLF & "Please locate the LiteStep executable.")
		Local $var = FileOpenDialog( "Browse to LiteStep...", @WindowsDir & "\", "Executables (*.exe)", 1)
		If @error Then
			MsgBox(4096, "", "No File(s) chosen")
			Exit
		Else
			$var = StringReplace($var, "|", @CRLF)
			RegWrite ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "LitestepDir", "REG_SZ", $var )
			$LS_Path = RegRead ( "HKEY_LOCAL_MACHINE\Software\LOSI\Installer", "LitestepDir" )
		EndIf
	Else
	EndIf
EndFunc

Func fixMixedKeys()
	If @OSArch = "X86" Then
		RegWrite( "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\IniFileMapping\system.ini\boot", "Shell", "REG_SZ", "SYS:Microsoft\Windows NT\CurrentVersion\Winlogon")
	ElseIf @OSArch = "X64" Then
		$temp32 = RegRead( "HKEY_LOCAL_MACHINE64\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\IniFileMapping\system.ini\boot", "Shell")
		$temp64 = RegRead( "HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows NT\CurrentVersion\IniFileMapping\system.ini\boot", "Shell")
		If $temp32 <> $temp64 Then
			MsgBox(4096, "Status", "INIFileMapping values mismatched. Fixing.")
			RegWrite( "HKEY_LOCAL_MACHINE64\SOFTWARE\Wow6432Node\Microsoft\Windows NT\CurrentVersion\IniFileMapping\system.ini\boot", "Shell", "REG_SZ", "SYS:Microsoft\Windows NT\CurrentVersion\Winlogon")
			RegWrite( "HKEY_LOCAL_MACHINE64\SOFTWARE\Microsoft\Windows NT\CurrentVersion\IniFileMapping\system.ini\boot", "Shell", "REG_SZ", "SYS:Microsoft\Windows NT\CurrentVersion\Winlogon")
		EndIf
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
		EndIf
	EndIf
	Return $temp
EndFunc

