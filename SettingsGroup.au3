
$SettingsGroupWrapperStart = GUICtrlCreateDummy()
; ---- Windows ---- ;
$aTVItems[96][3] = GUICtrlCreateDummy()
$bDisable_Printer_Manager = GUICtrlCreateButton("Disable Printer Manager", 10 + ($wWidth * 0.33), 8)
$bDisable_Sound = GUICtrlCreateButton("Disable Sound", 10 + ($wWidth * 0.33), 38)
$bDisable_App_Notific = GUICtrlCreateButton("Disable App Notification", 10 + ($wWidth * 0.33), 68)
$bDisable_Recent_Used = GUICtrlCreateButton("Disable Recent Used Files", 10 + ($wWidth * 0.33), 98)
$bDisable_Start_Suggest = GUICtrlCreateButton("Disable Start Suggestions", 10 + ($wWidth * 0.33), 128)
$bDisable_Task_View_Icon = GUICtrlCreateButton("Disable Task View Icons", 10 + ($wWidth * 0.33), 158)
$bDisable_Taskbar_Search = GUICtrlCreateButton("Disable Taskbar Search", 10 + ($wWidth * 0.33), 188)
$bDisable_Taskbar_Favorites = GUICtrlCreateButton("Disable Taskbar Favorites", 10 + ($wWidth * 0.33), 218)
$aTVItems[96][4] = GUICtrlCreateDummy()


; ---- G4G ---- ;
$aTVItems[94][3] = GUICtrlCreateDummy()
GUICtrlCreateLabel("Computer name: ", 10 + ($wWidth * 0.33), 8)
GUICtrlCreateInput("", 100 + ($wWidth * 0.33), 8, 50, 18)
GUICtrlCreateButton("Apply name", 10 + ($wWidth * 0.33), 28)
$cTest = GUICtrlCreateCombo("", 10 + ($wWidth * 0.33), 58)
GUICtrlSetData($cTest, "Test 1 |Test 2")
$aTVItems[94][4] = GUICtrlCreateDummy()


$SettingsGroupWrapperEnd = GUICtrlCreateDummy()



For $i = $SettingsGroupWrapperStart To $SettingsGroupWrapperEnd
	GUICtrlSetState($i, $GUI_HIDE)
Next
Global $lastSelectedStart = $aTVItems[96][3]
Global $lastSelectedEnd = $aTVItems[96][4]
