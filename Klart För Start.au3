#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#requireadmin


#include <GUIConstantsEx.au3>
#include <GUI.au3>

;~ Set Primary Window Height and Width variables ~;
Local $pwWidth = IniRead("Resources/config.ini", "PrimaryWindow", "width", "800")
Local $pwHeight = IniRead("Resources/config.ini", "PrimaryWindow", "height", "600")
Static Global $tabButton[9]

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
   CreateGUI()
   WinMove($gui0,"",((@DeskTopWidth/2)-($pwWidth/2)), ((@DeskTopHeight/2)-($pwHeight/2)))
   GUISetState(@SW_SHOW, $gui0)

   ProgramLoop()
EndFunc


Func ProgramLoop()
   While 1
	  Sleep(10)
Switch GUIGetMsg()
   Case $GUI_EVENT_CLOSE
	  ExitLoop
   Case $tabButton[0]
	  GUISetState(@SW_HIDE)
		 Local $guiPos = WinGetPos($gui0)
		 WinMove($gui0,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui0)
  Case $tabButton[1]
	  GUISetState(@SW_HIDE)
		 Local $guiPos = WinGetPos($gui0)
		 WinMove($gui1,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui1)
   Case $tabButton[2]
	  GUISetState(@SW_HIDE)
	  	 Local $guiPos = WinGetPos($gui0)
		 WinMove($gui2,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui2)
   Case $tabButton[3]
	  GUISetState(@SW_HIDE)
		 Local $guiPos = WinGetPos($gui1)
		 WinMove($gui0,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui0)
  Case $tabButton[4]
	  GUISetState(@SW_HIDE)
		 Local $guiPos = WinGetPos($gui1)
		 WinMove($gui1,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui1)
   Case $tabButton[5]
	  GUISetState(@SW_HIDE)
		 Local $guiPos = WinGetPos($gui1)
		 WinMove($gui2,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui2)
   Case $tabButton[6]
	  GUISetState(@SW_HIDE)
		  Local $guiPos = WinGetPos($gui2)
		 WinMove($gui0,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui0)
  Case $tabButton[7]
	  GUISetState(@SW_HIDE)
		  Local $guiPos = WinGetPos($gui2)
		 WinMove($gui1,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui1)
   Case $tabButton[8]
	  GUISetState(@SW_HIDE)
		 Local $guiPos = WinGetPos($gui2)
		 WinMove($gui2,"", $guiPos[0], $guiPos[1])
	  GUISetState(@SW_SHOW, $gui2)
   EndSwitch
WEnd ;End of While Loop
EndFunc