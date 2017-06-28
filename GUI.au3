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
 Global $menu2button1 = GUICtrlCreateMenuItem("Save to defaults", $menu2)
 Global $menu2button2 = GUICtrlCreateMenuItem("Restore defaults", $menu2)
 Global $menu3 = GUICtrlCreateMenu("Help")

 EndFunc

Func GUI0()
;~~~ Create Variables ~~~;
Local $boxRowCount = 0
Local $boxTabCount = 0


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

$GUI0InstallCheckbox[89] = GUICtrlCreateCheckbox("Nod32", 20 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount = $boxRowCount + 1
$GUI0InstallCheckbox[90] = GUICtrlCreateCheckbox("Internet Security", 20 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount = $boxRowCount + 1
$GUI0InstallCheckbox[91] = GUICtrlCreateCheckbox("Smart Security", 20 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
$boxRowCount = $boxRowCount + 1
$GUI0InstallCheckbox[92] = GUICtrlCreateCheckbox("Smart Security Pro", 20 + ($boxTabCount * 110), 50 + ($boxRowCount * 30))
;--------;

;~ Load default values ~~;
CheckDefaultPrograms()

   $uncheckBtn = GUICtrlCreateButton("Uncheck all", 20, 545, 80, 25)
   $checkBtn = GUICtrlCreateButton("Check defaults", 105, 545, 90, 25)
   $installBtn = GUICtrlCreateButton("Apply", 710, 545, 70, 25)

EndFunc

;~~~ ~~~;
Func GUI1()
   ;~~~
   ;~~~
EndFunc

;~~~ ~~~;
Func GUI2()
   ;~~~
   ;~~~
EndFunc