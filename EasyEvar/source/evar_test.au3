#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <File.au3>
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

;$winWidth = 550

$EES = GUICreate("Easy Evar Setup", 551, 482, 385, 298)
$InfoBorder = GUICtrlCreateLabel("", -1, -1, 554, 51, BitOr($SS_WHITERECT, $SS_CENTER))
$InfoBg = GUICtrlCreateLabel("", 0, 0, 551, 49, $SS_CENTER)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$Info1 = GUICtrlCreateLabel("Specify the paths to your applications.", 5, 5, 540, 17, $SS_CENTER)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$Info2 = GUICtrlCreateLabel("Evar Name", 4, 27, 270, 17, $SS_CENTER)
GUICtrlSetBkColor(-1, 0xFFFFFF)
$Info3 = GUICtrlCreateLabel("Application Path", 277, 27, 270, 17, $SS_CENTER)
GUICtrlSetBkColor(-1, 0xFFFFFF)


Global $sEvars

If Not _FileReadToArray("C:\Users\testmad\Desktop\ALI\Personal\evars.rc", $sEvars) Then
    MsgBox(4096, "Error", " Error reading evars.rc to Array     error:" & @error)
    Exit
EndIf

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

$aSize = UBound($sEvars)
$sEvars[0] = $aSize

For $n = 1 to UBound($sEvars) - 1
	$line = StringSplit($sEvars[$n], """",1)
    ConsoleWrite($line[1] & @LF)
	ConsoleWrite($line[2] & @LF)
Next

;_ArrayDisplay($sEvars, "List of Evars")

GUISetState(@SW_SHOW)

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd