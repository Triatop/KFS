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
Global $menu2 = GUICtrlCreateMenu("Save")
Global $menu2button1 = GUICtrlCreateMenuItem("Save to standard", $menu2)
Global $menu2button2 = GUICtrlCreateMenuItem("Set default to standard", $menu2)
Global $menu3 = GUICtrlCreateMenu("Help")

GUICtrlCreateGroup("", 10, 10, 780, 560)

EndFunc

Func GUI0()

Local $boxRowCount = 0
Local $boxTabCount = 0
;---- Set Window ----;
Global $gui0 = GUICreate($caption &" - Program Install", $pwWidth, $pwHeight)
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
   $GUI0InstallCheckbox[$i] = GUICtrlCreateCheckbox(IniRead("Resources/Ninite.ini", $i, "name", "Error"), 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
   $boxRowCount += 1
Next

$GUI0InstallCheckbox[85] = GUICtrlCreateCheckbox("Adobe Reader", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount += 1
$GUI0InstallCheckbox[86] = GUICtrlCreateCheckbox("BGP Killer", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount += 1
$GUI0InstallCheckbox[87] = GUICtrlCreateCheckbox("UnChecky", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount += 1
$GUI0InstallCheckbox[88] = GUICtrlCreateCheckbox("Support på distans", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))

$boxRowCount = 0
$boxTabCount += 1
GUICtrlCreateLabel("Non-Standard", 130, 30)
For $i = 7 To 84
   $GUI0InstallCheckbox[$i] = GUICtrlCreateCheckbox(IniRead("Resources/Ninite.ini", $i, "name", "Error"), 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
   $boxRowCount += 1
   if($boxRowCount > 15) Then
	   $boxRowCount = 0
	   $boxTabCount += 1
	   EndIf
	Next

$boxTabCount += 1
$boxRowCount = 0
GUICtrlCreateLabel("ESET", 30 + ($boxTabCount * 110), 30)

GUICtrlCreateCheckbox("Nod32", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount = $boxRowCount + 1
GUICtrlCreateCheckbox("Internet Security", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount = $boxRowCount + 1
GUICtrlCreateCheckbox("Smart Security", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount = $boxRowCount + 1
GUICtrlCreateCheckbox("Smart Security Pro", 30 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))

   $installBtn = GUICtrlCreateButton("Install", 710, 535, 70, 25)
   GUICtrlSetState(-1, @SW_SHOW)
;--------;

EndFunc

Func GUI1()
;---- Set Window ----;
Global $gui1 = GUICreate($caption &" -", $pwWidth, $pwHeight)
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
Global $gui2 = GUICreate($caption &" -", $pwWidth, $pwHeight)
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