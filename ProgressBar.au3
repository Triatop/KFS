#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         myName

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

   Static $progressBar_Width = 150
   Static $progressBar_Height = 50
   Global $progressbar_current = 0
   Global $progressbar_goal = 0
   Global $progressText = ""


Func ProgressBarInit() ;~
   Global $guiProgressBar = GUICreate("Progress Bar", $progressBar_Width, $progressBar_Height, (@DeskTopWidth - $progressBar_Width), (@DeskTopHeight  - ($progressBar_Height*2)))
   GUICtrlCreateLabel("Progress:", $progressBar_Width/2 - 10 ,$progressBar_Height/2 - 20 )
   $progressText = GUICtrlCreateLabel($progressbar_current & '/' & $progressbar_goal, $progressBar_Width/2 ,$progressBar_Height/2 )
   EndFunc

Func ProgressBarUpdate() ;~
	  GUICtrlSetData($progressText, $progressbar_current & '/' & $progressbar_goal)
   EndFunc

Func ProgressBarIncrease() ;~
	  $progressbar_current = $progressbar_current + 1
	  ProgressBarUpdate()
   EndFunc

Func ProgressBarIncreaseGoal() ;~
	  $progressbar_goal = $progressbar_goal + 1
   EndFunc

Func ProgressBarCheckGoal() ;~
	  for $i = 0 to 84
   If GUICtrlRead($GUI0InstallCheckbox[$i]) = $GUI_CHECKED Then
		 ProgressBarIncreaseGoal()
		 if $progressbar_goal <> 0 Then
			ExitLoop
		 EndIf
	  EndIf
   Next
   for $i = 85 to 88
   If GUICtrlRead($GUI0InstallCheckbox[$i]) = $GUI_CHECKED Then
		 ProgressBarIncreaseGoal()
		 EndIf
	  Next
   ProgressBarUpdate()
EndFunc

Func ProgressBarClear() ;~
	  $progressbar_current = 0
	  $progressbar_goal = 0
   EndFunc