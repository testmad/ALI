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
Global $sEvars
Global $padding = 5
Global $header = 36
Global $EvarName[1]
Global $EvarPath[1]
Global $EvarDir[1]
Global $eGUI

eeMain()

Func eeMain()
	$mGUI = GUICreate("Easy Evars", 329, 129, 384, 294)
	$btnOpen = GUICtrlCreateButton("Browse to evars.rc", 102, 32, 125, 25)
	$btnSave = GUICtrlCreateButton("Save to evars.rc", 102, 72, 125, 25)

	GUISetState()

	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $btnOpen
				GUICtrlSetState($btnOpen, $GUI_DISABLE)
				openEvars()
			Case $btnNew
				MsgBox(4096, "bleh",$nMsg & $btnNew)
				_ArrayAdd($sEvars, "NewEvarName     ""New\Evar\Path\""")
;~ 				_ArrayAdd($EvarName, GUICtrlCreateInput("NewEvarName", 10, $header + UBound($sEvars)*21 + UBound($sEvars)*$padding, 200, 21))
;~ 				_ArrayAdd($EvarPath, GUICtrlCreateInput("New Evar Path",220, $header + UBound($sEvars)*21 + UBound($sEvars)*$padding, 290, 21))
;~ 				_ArrayAdd($EvarDir, GUICtrlCreateButton("...", 516, $header + UBound($sEvars)*21 + UBound($sEvars)*$padding, 25, 21))
				GUIDelete($eGUI)
				getEvars()
		EndSwitch
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
	WEnd
EndFunc

Func openEvars()
	If Not _FileReadToArray("C:\Users\testmad\Desktop\ALI\Personal\evars.rc", $sEvars) Then
		MsgBox(4096, "Error", " Error reading evars.rc to Array     error:" & @error)
		Exit
	EndIf
	getEvars()
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
	ReDim  $EvarName[UBound($sEvars)]
	ReDim  $EvarPath[UBound($sEvars)]
	ReDim  $EvarDir[UBound($sEvars)]

	$eGUI = GUICreate("Easy Evars Editor", 551, 482, -1, -1,$WS_EX_MDICHILD)
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
		$EvarName[$n] = GUICtrlCreateInput($line[1], 10, $header + $n*21 + $n*$padding, 200, 21)
		$EvarPath[$n] = GUICtrlCreateInput($line[2],220, $header + $n*21 + $n*$padding, 290, 21)
		$EvarDir[$n] = GUICtrlCreateButton("...", 516, $header + $n*21 + $n*$padding, 25, 21)
	Next

	Local $buttonTop = UBound($sEvars)*21 + $header + UBound($sEvars)*$padding

	$btnNew = GUICtrlCreateButton("Create New Evar", 9, $buttonTop, 518, 25)

	_GUIScrollbars_Generate($eGUI, 0, $buttonTop + 25)
	GUISetState()
	_ArrayDisplay($sEvars)

EndFunc