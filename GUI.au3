#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


Func GUIMain()

	  ;---- Menu ----;
Global $menu1 = GUICtrlCreateMenu("File")
Global $menu1button1 = GUICtrlCreateMenuItem("Save to standard", $menu1)
Global $menu1button2 = GUICtrlCreateMenuItem("Set default to standard", $menu1)
Global $menu2 = GUICtrlCreateMenu("Help")

GUICtrlCreateGroup("", 10, 10, 780, 560)

EndFunc

Func GUI0()

Local $boxRowCount = 0
Local $boxTabCount = 0
;---- Set Window ----;
Global $gui0 = GUICreate("Klart För Start - Program Install", $pwWidth, $pwHeight)
GUISetBkColor(0xf8f8ff)
;--------;

;----Create Tab & Menu----;
GUIMain()
$tabButton[0] = GUICtrlCreateButton("Program", 10, 0, 80)
$tabButton[1] = GUICtrlCreateButton("GUI", 90, 0, 80)
$tabButton[2] = GUICtrlCreateButton("GUI", 170, 0, 80)
;--------;


;---- GUI ----;
GUICtrlCreateLabel("Standard", 30, 30)
For $i = 0 To 6
   GUICtrlCreateCheckbox(IniRead("Resources/Ninite.ini", $i, "name", "Error"), 30 + ($boxTabCount * 100), 50 + ($boxRowCount * 30))
   $boxRowCount += 1
Next

$boxRowCount = 0
$boxTabCount += 1
GUICtrlCreateLabel("Non-Standard", 130, 30)
For $i = 7 To 84
   GUICtrlCreateCheckbox(IniRead("Resources/Ninite.ini", $i, "name", "Error"), 30 + ($boxTabCount * 100), 50 + ($boxRowCount * 30))
   $boxRowCount += 1
   if($boxRowCount > 15) Then
	   $boxRowCount = 0
	   $boxTabCount += 1
	   EndIf
	Next

$boxTabCount += 1
GUICtrlCreateLabel("ESET", 30 + ($boxTabCount * 100), 30)
For $i = 0 To 3
   GUICtrlCreateCheckbox("Test", 30 + ($boxTabCount * 100), 50 + ($i * 30))
Next

;--------;

EndFunc

Func GUI1()
;---- Set Window ----;
Global $gui1 = GUICreate("Klart För Start -", $pwWidth, $pwHeight)
GUISetBkColor(0xf8f8ff)
;--------;

;----Create Tab & Menu----;
GUIMain()
$tabButton[3] = GUICtrlCreateButton("Program", 10, 0, 80)
$tabButton[4] = GUICtrlCreateButton("GUI ", 90, 0, 80)
$tabButton[5] = GUICtrlCreateButton("GUI ", 170, 0, 80)

;--------;

EndFunc

Func GUI2()
;---- Set Window ----;
Global $gui2 = GUICreate("Klart För Start -", $pwWidth, $pwHeight)
GUISetBkColor(0xf8f8ff)
;--------;

;----Create Tab & Menu----;
GUIMain()
$tabButton[6] = GUICtrlCreateButton("Program", 10, 0, 80)
$tabButton[7] = GUICtrlCreateButton("GUI ", 90, 0, 80)
$tabButton[8] = GUICtrlCreateButton("GUI ", 170, 0, 80)
;--------;

EndFunc

Func CreateGUI()
   GUI0()
   GUI1()
   GUI2()
EndFunc