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
Global $menu2 = GUICtrlCreateMenu("Help")

GUICtrlCreateGroup("", 10, 10, 780, 560)

For $i = 0 To 2
    GUICtrlCreateTabItem("Tab " & $i)
   $tabButton[$i] = GUICtrlCreateButton("GUI " & $i, 10 + ($i * 80), 0, 80)
Next

EndFunc

Func GUI0()

Local $boxRowCount = 0
Local $boxTabCount = 0
;---- Set Window ----;
Global $gui0 = GUICreate("GUI-Test", $pwWidth, $pwHeight)
GUISetBkColor(0xf8f8ff)
GUISetState(@SW_SHOW, $gui0)
;--------;

   ;----Leave furthest down----;
GUIMain()
;--------;


;---- GUI ----;
GUICtrlCreateLabel("Standard", 30, 30)
For $i = 0 To 6
   GUICtrlCreateCheckbox(IniRead("Resources/Ninite.ini", $i, "name", "Error"), 30, 50 + ($i * 30))
Next

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
Global $gui1 = GUICreate("GUI-Test", $pwWidth, $pwHeight)
GUISetBkColor(0xf8f8ff)
GUISetState(@SW_SHOW, $gui1)
;--------;

;----Leave furthest down----;
GUIMain()
;--------;

EndFunc

Func GUI2()
;---- Set Window ----;
Global $gui2 = GUICreate("GUI-Test", $pwWidth, $pwHeight)
GUISetBkColor(0xf8f8ff)
GUISetState(@SW_SHOW, $gui2)
;--------;

;----Leave furthest down----;
   GUIMain()
;--------;

EndFunc