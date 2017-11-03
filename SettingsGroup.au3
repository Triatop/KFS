
$SettingsGroupWrapperStart = GUICtrlCreateDummy()
; ---- Windows ---- ;
$aTVItems[96][3] = GUICtrlCreateDummy()
$bEmptyActionbar = GUICtrlCreateButton("Remove Icons from Actionbar", 10 + ($wWidth * 0.33), 8)
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
