#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=..\easy_evar.exe
#AutoIt3Wrapper_UseUpx=n
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <File.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#include "GUIScrollbars_Ex.au3"


Global $btnNew = 1774151450265015
Global $btnOpen
Global $btnSave
Global $sEvars
Global $padding = 5
Global $header = 36
Global $EvarName[1]
Global $EvarPath[1]
Global $EvarDir[1]
Global $EvarDel[1]
Global $eGUI
Global $eGUIPos[3]
Global $evarFile

$eGUIPos[1] = -1
$eGUIPos[2] = -1

eeMain()

Func eeMain()
	$mGUI = GUICreate("Easy Evars", 329, 129, 384, 294)
	$btnOpen = GUICtrlCreateButton("Browse to evars.rc", 102, 32, 125, 25)
	$btnSave = GUICtrlCreateButton("Save to evars.rc", 102, 72, 125, 25)
	GUICtrlSetState($btnSave, $GUI_DISABLE)
	GUISetState()

	While 1
		While 1
			$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $btnOpen
				GUICtrlSetState($btnOpen, $GUI_DISABLE)
				openEvars()
			Case $btnSave
				saveEvars()
			Case $btnNew
				_ArrayAdd($sEvars, "NewEvarName     ""New\Evar\Path\""")
				Local $sTemp = WinGetPos("[ACTIVE]")
				$eGUIPos[1] = $sTemp[0]
				$eGUIPos[2] = $sTemp[1]

				GUIDelete($eGUI)
				getEvars()
		EndSwitch
		For $n = 1 to UBound($sEvars) - 1
			If $nMsg = $EvarDel[$n] Then
				_ArrayDelete($sEvars, $n)
				$sEvars[0] = UBound($sEvars)
				Local $sTemp = WinGetPos("[ACTIVE]")
				$eGUIPos[1] = $sTemp[0]
				$eGUIPos[2] = $sTemp[1]
				GUIDelete($eGUI)
				editEvars()

				ExitLoop
			EndIf
		Next

		For $n = 1 to UBound($sEvars) - 1
			If $nMsg = $EvarDir[$n] Then
				Local $tStorePath = GUICtrlRead($EvarPath[$n])
				Local $sPath = FileOpenDialog("Path to Application", @HomeDrive,  "All (*.*)", 1)
					If @error Then
						$sPath = $tStorePath
					EndIf
				GUICtrlSetData($EvarPath[$n],$sPath)

			EndIf
		Next
		Wend
	WEnd
EndFunc

Func openEvars()

	$evarFile = FileOpenDialog("Browse to evars.rc...", @HomeDrive, "LiteStep RC Files (*.rc)", 1, "evars.rc")

	If @error Then
		MsgBox(4096, "", "No File(s) chosen")
		GUICtrlSetState($btnOpen, $GUI_ENABLE)
	Else
		$file = StringSplit($evarFile, "\",1)
		$temp = $file[0]
		If $file[$temp] <> "evars.rc" Then
			MsgBox(4096, "", "This is not the evars.rc file.")
			GUICtrlSetState($btnOpen, $GUI_ENABLE)

		Else
		_FileReadToArray($evarFile, $sEvars)
		If @error Then
			MsgBox(4096, "Error", " Error reading evars.rc to Array     error:" & @error)
			Exit
		Else
			getEvars()
		EndIf
		EndIf
	EndIf

EndFunc

Func getEvars()
	For $n = UBound($sEvars) - 1 to 0 step -1
		If $sEvars[$n] = "" Then
		_ArrayDelete($sEvars, $n)
		EndIf
	Next

	For $n = UBound($sEvars) - 1 to 0 step -1
		If StringLeft($sEvars[$n], 1)= ";" Then
		_ArrayDelete($sEvars, $n)
		EndIf
	Next

	$sEvars[0] = UBound($sEvars)
	editEvars()
EndFunc

Func editEvars()
	GUICtrlSetState($btnSave, $GUI_ENABLE)
	ReDim  $EvarName[UBound($sEvars)]
	ReDim  $EvarPath[UBound($sEvars)]
	ReDim  $EvarDir[UBound($sEvars)]
	ReDim  $EvarDel[UBound($sEvars)]
	ReDim  $eGUIPos[UBound($eGUIPos)]

	$eGUI = GUICreate("Easy Evars Editor", 551, 482, $eGUIPos[1], $eGUIPos[2],$WS_EX_MDICHILD)
	$InfoBorder = GUICtrlCreateLabel("", -1, -1, 554, 51, BitOr($SS_WHITERECT, $SS_CENTER))
	$InfoBg = GUICtrlCreateLabel("", 0, 0, 551, 49, $SS_CENTER)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Info1 = GUICtrlCreateLabel("Specify the paths to your applications.", 5, 5, 540, 17, $SS_CENTER)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Info2 = GUICtrlCreateLabel("Evar Name", 4, 27, 270, 17, $SS_CENTER)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
	$Info3 = GUICtrlCreateLabel("Application Path", 277, 27, 270, 17, $SS_CENTER)
	GUICtrlSetBkColor(-1, 0xFFFFFF)

	For $n = 1 to UBound($sEvars) - 1
		$line = StringSplit($sEvars[$n], """",1)
		$temp = StringStripWS ($line[1], 8)
		$line[1] = $temp
		$EvarName[$n] = GUICtrlCreateInput($line[1], 10, $header + $n*21 + $n*$padding, 200, 21)
		$EvarPath[$n] = GUICtrlCreateInput($line[2],214, $header + $n*21 + $n*$padding, 265, 21)
		$EvarDir[$n] = GUICtrlCreateButton("...", 482, $header + $n*21 + $n*$padding, 25, 21)
		$EvarDel[$n] = GUICtrlCreateButton(" X ", 512, $header + $n*21 + $n*$padding, 25, 21)
	Next

	Local $buttonTop = UBound($sEvars)*21 + $header + UBound($sEvars)*$padding

	$btnNew = GUICtrlCreateButton("Create New Evar", 9, $buttonTop, 518, 25)

	_GUIScrollbars_Generate($eGUI, 0, $buttonTop + 25)
	GUISetState()

EndFunc

Func saveEvars()
	Local $file = FileOpen($evarFile, 2)

	; Check if file opened for writing OK
	If $file = -1 Then
		MsgBox(0, "Error", "Unable to open file for writing.")
		Exit
	EndIf

	FileWrite($file, ";------------------------------------------------------------------------------" & @CRLF)
	FileWrite($file, ";    Edit *only* the paths as needed, and leave the file's *FORMAT* unchanged" & @CRLF)
	FileWrite($file, ";------------------------------------------------------------------------------" & @CRLF)

	For $n = 1 to UBound($sEvars) - 1
		$str1 = GUICtrlRead($EvarName[$n])
		$str2 = GUICtrlRead($EvarPath[$n])
		FileWrite($file, $str1 & @TAB & @TAB & @TAB & @TAB & """" & $str2 & """"  & @CRLF)
	Next
	FileClose($file)
EndFunc