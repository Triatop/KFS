$SettingsGroupWrapperStart = GUICtrlCreateDummy()
; ---- Windows ---- ;
$aTVItems[96][3] = GUICtrlCreateDummy()
$bDisable_Printer_Manager = GUICtrlCreateButton("Disable Printer Manager", 10 + ($wWidth * 0.33), 8, 175)
$bDisable_Sound = GUICtrlCreateButton("Disable Sound", 10 + ($wWidth * 0.33), 38, 175)
$bDisable_App_Notific = GUICtrlCreateButton("Disable App Notification", 10 + ($wWidth * 0.33), 68, 175)
$bDisable_Recent_Used = GUICtrlCreateButton("Disable Recent Used Files", 10 + ($wWidth * 0.33), 98, 175)
$bDisable_Start_Suggest = GUICtrlCreateButton("Disable Start Suggestions", 10 + ($wWidth * 0.33), 128, 175)
$bDisable_Task_View_Icon = GUICtrlCreateButton("Disable Task View Icons", 10 + ($wWidth * 0.33), 158, 175)
$bDisable_Taskbar_Search = GUICtrlCreateButton("Disable Taskbar Search", 10 + ($wWidth * 0.33), 188, 175)
$bDisable_Taskbar_Favorites = GUICtrlCreateButton("Disable Taskbar Favorites", 10 + ($wWidth * 0.33), 218, 175)
$bDisable_Taskbar_Contacts = GUICtrlCreateButton("Disable Taskbar Contacts", 10 + ($wWidth * 0.66), 8, 175)

Global $cbTheme = GUICtrlCreateCombo("", 10 + ($wWidth * 0.66), 96, 175, 200, $CBS_DROPDOWNLIST)
Local $aTeman = _FileListToArray ("Resources\Themes", "*.themepack", $FLTA_FILES)
$bApplyTheme = GUICtrlCreateButton("Apply Theme", 10 + ($wWidth * 0.66), 120, 175)
For $i=1 To Ubound($aTeman)-1
    GUICtrlSetData($cbTheme,$aTeman[$i])
Next
$aTVItems[96][4] = GUICtrlCreateDummy()


; ---- G4G ---- ;
$aTVItems[94][3] = GUICtrlCreateDummy()

$aTVItems[94][4] = GUICtrlCreateDummy()


$SettingsGroupWrapperEnd = GUICtrlCreateDummy()



For $i = $SettingsGroupWrapperStart To $SettingsGroupWrapperEnd
	GUICtrlSetState($i, $GUI_HIDE)
Next
Global $lastSelectedStart = $aTVItems[96][3]
Global $lastSelectedEnd = $aTVItems[96][4]