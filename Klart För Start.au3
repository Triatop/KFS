#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         Kim Lillé, Datoraffären i Karlskrona

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#requireadmin


#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <GUI.au3>

;~ Set Primary Window Height and Width variables ~;
Local $pwWidth = IniRead("Resources/config.ini", "PrimaryWindow", "width", "800")
Local $pwHeight = IniRead("Resources/config.ini", "PrimaryWindow", "height", "600")
Static Local $tabButton[3]

;~ Check if Primary Window Height and Width is less than 800x600, if so sets to 800x600 ~;
if $pwWidth < 800 Then
   $pwWidth = 800
EndIf
if  $pwHeight < 600 Then
   $pwWidth = 600
EndIf

;~ Calls Main function to run program ~;
main()

Func main()
   GUI0()
   ProgramLoop()
EndFunc


Func ProgramLoop()
   While 1
Switch GUIGetMsg()
   Case $GUI_EVENT_CLOSE
	  ExitLoop
   Case $tabButton[0]
	 GUIDelete()
	 GUI0()
  Case $tabButton[1]
	  GUIDelete()
	  GUI1()
   Case $tabButton[2]
	 GUIDelete()
	 GUI2()
EndSwitch
WEnd ;End of While Loop
EndFunc