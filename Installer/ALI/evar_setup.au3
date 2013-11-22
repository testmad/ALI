#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.8.1
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$EES = GUICreate("Easy Evar Setup", 551, 481, 385, 300)
GUISetIcon("C:\Users\testmad\Desktop\ALI\Installer\ALI\ALI_ls.ico", -1)
$Info = GUICtrlCreateLabel("Specify the paths to your applications.", 0, 5, 550, 17, $SS_CENTER)
$Label2 = GUICtrlCreateLabel("File Manager:", 31, 37, 68, 17)
$Input1 = GUICtrlCreateInput("...", 175, 37, 313, 21)
$Button1 = GUICtrlCreateButton("...", 495, 37, 25, 21)
$Button2 = GUICtrlCreateButton("...", 495, 64, 25, 21)
$Input2 = GUICtrlCreateInput("...", 175, 64, 313, 21)
$Label3 = GUICtrlCreateLabel("Text Editor:", 31, 64, 58, 17)
$Label4 = GUICtrlCreateLabel("Command Prompt:", 31, 93, 90, 17)
$Input3 = GUICtrlCreateInput("...", 175, 93, 313, 21)
$Button3 = GUICtrlCreateButton("...", 495, 93, 25, 21)
$Button4 = GUICtrlCreateButton("...", 495, 120, 25, 21)
$Input4 = GUICtrlCreateInput("...", 175, 120, 313, 21)
$Label5 = GUICtrlCreateLabel("Audio Player:", 31, 120, 66, 17)
$Label6 = GUICtrlCreateLabel("Media Player:", 31, 149, 68, 17)
$Input5 = GUICtrlCreateInput("...", 175, 149, 313, 21)
$Button5 = GUICtrlCreateButton("...", 495, 149, 25, 21)
$Button6 = GUICtrlCreateButton("...", 495, 176, 25, 21)
$Input6 = GUICtrlCreateInput("...", 175, 176, 313, 21)
$Label7 = GUICtrlCreateLabel("Graphics Viewer:", 31, 176, 84, 17)
$Label8 = GUICtrlCreateLabel("Graphics Editor:", 31, 205, 79, 17)
$Input7 = GUICtrlCreateInput("...", 175, 205, 313, 21)
$Button7 = GUICtrlCreateButton("...", 495, 205, 25, 21)
$Button8 = GUICtrlCreateButton("...", 495, 232, 25, 21)
$Input8 = GUICtrlCreateInput("...", 175, 232, 313, 21)
$Label9 = GUICtrlCreateLabel("Web Browser:", 31, 232, 71, 17)
$Label1 = GUICtrlCreateLabel("Instant Messaging:", 31, 344, 93, 17)
$Input9 = GUICtrlCreateInput("...", 175, 344, 313, 21)
$Button9 = GUICtrlCreateButton("...", 495, 344, 25, 21)
$Button10 = GUICtrlCreateButton("...", 495, 317, 25, 21)
$Input10 = GUICtrlCreateInput("...", 175, 317, 313, 21)
$Label10 = GUICtrlCreateLabel("FTP:", 31, 317, 27, 17)
$Label11 = GUICtrlCreateLabel("IRC Client:", 31, 288, 54, 17)
$Input11 = GUICtrlCreateInput("...", 175, 288, 313, 21)
$Button11 = GUICtrlCreateButton("...", 495, 288, 25, 21)
$Button12 = GUICtrlCreateButton("...", 495, 261, 25, 21)
$Input12 = GUICtrlCreateInput("...", 175, 261, 313, 21)
$Label12 = GUICtrlCreateLabel("E-Mail Client:", 31, 261, 65, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
