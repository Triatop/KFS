#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=if_toolbox_86483.ico
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_Comment=Auto KFS
#AutoIt3Wrapper_Res_Description=Install KFS
#AutoIt3Wrapper_Res_Fileversion=0.1.0.7
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=p
#AutoIt3Wrapper_Res_LegalCopyright=Datoraffären i Karlskrona
#AutoIt3Wrapper_Res_Language=1053
#AutoIt3Wrapper_Res_Field=ProductName|Klart För Start
#AutoIt3Wrapper_Run_Tidy=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.14.2
	Author:         myName

	Script Function:
	Installing "Klart För Start"

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#Region Includes
#include <GUIConstantsEx.au3>
#include <InetConstants.au3>
#include <SendMessage.au3>
#include <WindowsConstants.au3>
#include <GuiTreeView.au3>
#include <GUIConstants.au3>
#include <GuiEdit.au3>
#include <Array.au3>
#include <RegChanges.au3>
#include <File.au3>
#include <ScrollBarsConstants.au3>
#include <StringConstants.au3>

#EndRegion Includes

#Region Window size
Global $wWidth = 800, $wHeight = 600
Static Global $wWidth_min = 600, $wHeight_min = 400

If (@DesktopHeight <= 1024) Then
	$wWidth = $wWidth_min
	$wHeight = $wHeight_min
ElseIf (@DesktopWidth <= 1280) Then
	$wWidth = $wWidth_min
	$wHeight = $wHeight_min
EndIf
#EndRegion Window size


#Region Variables
;----- VARIABLES -----;
Static Global $wName = "Klart För Start"
Global $wCaption = ""
;----- Files -----;
Static Global $dir = @TempDir & "\KFS"
Static Global $log = $dir & "\Log.txt"
Static Global $iniNinite = "Resources/Ninite.ini"
;----- Hardcoded url -----;
Static Global $BGPKillerUrl = "http://bgpkiller.weebly.com/uploads/4/1/2/2/41220059/bgpkiller_setup_v0.9.6.0.exe"
Static Global $uncheckyUrl = "https://unchecky.com/files/unchecky_setup.exe"
;----- Lower Button variables -----;

Global $lowerButton_1_X_Pos = 8
Global $lowerButton_2_X_Pos = 98
Global $lowerButton_3_X_Pos = $wWidth - 90
Global $lowerButton_Y_Pos = $wHeight - 60

Global $lowerButton_Width = 80
;----- GUI Boxes -----;
Global $topGUIBoxes_Height = $wHeight * 0.67
;----- Log Box ------;
Global $log_Output
Global $logBox_X_Pos = $wHeight * 0.69
Global $logBox_Height = $wHeight * 0.33 - 80
;----- Create tree array  -----;
Global $aTVItems[97][5]
;----- GUI option variables -----;
#EndRegion Variables

;----- Create GUI -----;
$wGUI = GUICreate($wName & $wCaption, $wWidth, $wHeight, -1, -1, BitOR($WS_CAPTION, $WS_THICKFRAME))

;----- Create file menu -----;
$Menu_1 = GUICtrlCreateMenu("File")
$Menu_1_Child_1 = GUICtrlCreateMenuItem("1. ", $Menu_1)
$Menu_2 = GUICtrlCreateMenu("Save")
$Menu_2_Child_1 = GUICtrlCreateMenuItem("1. Save logfile to desktop", $Menu_2)

;----- Create tree -----;
$tvItems = GUICtrlCreateTreeView(8, 8, $wWidth * 0.33, $topGUIBoxes_Height, BitOR($GUI_SS_DEFAULT_TREEVIEW, $TVS_CHECKBOXES), _
		$WS_EX_DLGMODALFRAME + $WS_EX_CLIENTEDGE)
$hTV = GUICtrlGetHandle(-1)
_Create_Tree_Items()

#include <SettingsGroup.au3>

If (DirCreate($dir)) Then
	_Create_Log()
Else
	MsgBox($MB_SYSTEMMODAL, "ERROR", "Cannot create directory: " & $dir)
EndIf

;----- Create buttons to set/clear all -----;
$bCheckStandard = GUICtrlCreateButton("Check Standard", $lowerButton_1_X_Pos, $lowerButton_Y_Pos, $lowerButton_Width + 10, 30)
$hClear = GUICtrlCreateButton("Clear All", $lowerButton_2_X_Pos, $lowerButton_Y_Pos, $lowerButton_Width, 30)
$hApply = GUICtrlCreateButton("Apply", $lowerButton_3_X_Pos, $lowerButton_Y_Pos, $lowerButton_Width, 30)

_Check_Standard_Programs()

GUISetState()

Main()

Func Main()
	While 1
		$guiMsg = GUIGetMsg()
		Switch $guiMsg
			Case $GUI_EVENT_CLOSE
				_Edit_Log("Script closing, cleaning up")
				_Cleanup()
				Exit
			Case $bCheckStandard
				_Check_Standard_Programs()
			Case $hClear
				_Edit_Log("Clearing all checkboxes")
				_Adjust_All(False)
			Case $hApply
				_Apply_Changes()
			Case $Menu_2_Child_1
				_Save_Log()
			Case $bDisable_Printer_Manager
				_disable_printer_manager()
			Case $bDisable_Sound
				_disable_theme_sound()
			Case $bDisable_App_Notific
				_disable_app_notifications()
			Case $bDisable_Recent_Used
				_disable_recent_used_list()
			Case $bDisable_Start_Suggest
				_disable_start_suggestion()
			Case $bDisable_Task_View_Icon
				_disable_taskview_icon()
			Case $bDisable_Taskbar_Search
				_disable_taskbar_search()
			Case $bDisable_Taskbar_Favorites
				_disable_taskbar_favorites()
			Case $bDisable_Taskbar_Contacts
				_disable_taskbar_contacts()
			Case $bApplyTheme
				ShellExecute("Resources\Themes\" & GUICtrlRead($cbTheme))
			Case $aTVItems[0][2]
				_Only_One_AV($guiMsg)
			Case $aTVItems[7][2]
				_Only_One_AV($guiMsg)
			Case $aTVItems[8][2]
				_Only_One_AV($guiMsg)
			Case $aTVItems[89][2]
				_Only_One_AV($guiMsg)
			Case $aTVItems[90][2]
				_Only_One_AV($guiMsg)
			Case $aTVItems[91][2]
				_Only_One_AV($guiMsg)
			Case $aTVItems[92][2]
				_Only_One_AV($guiMsg)

		EndSwitch

		For $i = 0 To UBound($aTVItems, $UBOUND_ROWS) - 1
			If $guiMsg = $aTVItems[$i][2] Then
				_ShowOptions($aTVItems[$i][3], $aTVItems[$i][4])
				If (Not _GUICtrlTreeView_GetChecked($hTV, $aTVItems[$i][0])) Then
					_Adjust_Children($aTVItems[$i][0], False)
				ElseIf (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[$i][0])) Then
					_Adjust_Children($aTVItems[$i][0], True)
				EndIf
			EndIf
		Next

;~ 		If ($guiMsg = $aTVItems[0][2]) Then
;~ 			_GUICtrlTreeView_SetChecked($hTV, $aTVItems[7][0], False)
;~ 			_GUICtrlTreeView_SetChecked($hTV, $aTVItems[8][0], False)
;~ 			_GUICtrlTreeView_SetChecked($hTV, $aTVItems[89][0], False)
;~ 			_GUICtrlTreeView_SetChecked($hTV, $aTVItems[90][0], False)
;~ 			_GUICtrlTreeView_SetChecked($hTV, $aTVItems[91][0], False)
;~ 			_GUICtrlTreeView_SetChecked($hTV, $aTVItems[92][0], False)
;~ 			; 0, 7, 8, 89, 90, 91, 92
;~ 		EndIf

		Sleep(10)
	WEnd
	GUIDelete($wGUI)
EndFunc   ;==>Main

Func _Adjust_All($fState = True)
	;----- Loop through items -----;
	For $n = 0 To UBound($aTVItems) - 1
		;----- Adjust items -----;
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[$n][0], $fState)
		$aTVItems[$n][1] = $fState
	Next
EndFunc   ;==>_Adjust_All

Func _Adjust_Children($hPassedItem, $fState = True)
	Local $iIndex

	;----- Get the handle of the first child -----;
	Local $hChild = _GUICtrlTreeView_GetFirstChild($tvItems, $hPassedItem)
	If $hChild = 0 Then Return
	;----- Loop through children -----;
	While 1
		;----- Adjust the array -----;
		$iIndex = _ArraySearch($aTVItems, $hChild)
		If @error Then Return
		$aTVItems[$iIndex][1] = $fState
		;----- Adjust the child -----;
		_GUICtrlTreeView_SetChecked($tvItems, $hChild, $fState)
		;----- And now do the same for the generation beow -----;
		_Adjust_Children($hChild, $fState)
		;----- Now get next child -----;
		$hChild = _GUICtrlTreeView_GetNextChild($tvItems, $hChild)
		;----- Exit the loop if no more found -----;
		If $hChild = 0 Then ExitLoop
	WEnd
EndFunc   ;==>_Adjust_Children

Func _Create_Tree_Items()
	FileOpen($iniNinite)

	$aTVItems[93][2] = GUICtrlCreateTreeViewItem("Common", $tvItems)
	$aTVItems[94][2] = GUICtrlCreateTreeViewItem("G4G", $tvItems)
	$aTVItems[95][2] = GUICtrlCreateTreeViewItem("Uncommon", $tvItems)
	$aTVItems[96][2] = GUICtrlCreateTreeViewItem("Windows", $tvItems)

	For $i = 0 To UBound($aTVItems) - 5
		If (IniRead($iniNinite, $i, "category", "")) = "standard" Then
			$aTVItems[$i][2] = GUICtrlCreateTreeViewItem(IniRead($iniNinite, $i, "name", 0), $aTVItems[93][2])
		ElseIf (IniRead($iniNinite, $i, "category", "")) = "g4g" Then
			$aTVItems[$i][2] = GUICtrlCreateTreeViewItem(IniRead($iniNinite, $i, "name", 0), $aTVItems[94][2])
		Else
			$aTVItems[$i][2] = GUICtrlCreateTreeViewItem(IniRead($iniNinite, $i, "name", 0), $aTVItems[95][2])
		EndIf
	Next
	FileClose($iniNinite)
	ControlTreeView($wGUI, "", $hTV, "Expand", "Common")

	;----- Set initial unchecked state and get item handles
	For $i = 0 To UBound($aTVItems) - 1
		$aTVItems[$i][0] = GUICtrlGetHandle($aTVItems[$i][2])
		$aTVItems[$i][1] = False
		$aTVItems[$i][3] = Null
		$aTVItems[$i][4] = Null
	Next
EndFunc   ;==>_Create_Tree_Items

Func _Check_Parents($hHandle)

	;----- Get the handle of the parent
	$hParent = _GUICtrlTreeView_GetParentHandle($hTV, $hHandle)
	;----- If there is no parent
	If $hParent = 0 Then
		Return
	EndIf
	;----- Check the parent
	_GUICtrlTreeView_SetChecked($hTV, $hParent)
	;----- And look for the grandparent and so on
	_Check_Parents($hParent)

EndFunc   ;==>_Check_Parents

Func _Check_Standard_Programs()
	_Edit_Log("Checking common checkboxes")
	_GUICtrlTreeView_SetChecked($hTV, $aTVItems[93][0])
	_Adjust_Children($aTVItems[93][0], True)
EndFunc   ;==>_Check_Standard_Programs

Func _Apply_Changes()
	_Edit_Log("Applying changes")
	_Install_Programs()
	_Set_Settings()
EndFunc   ;==>_Apply_Changes

Func _Install_Programs()
	_Edit_Log("Installing programs")
	_Install_Datoraffaren_Support()
	_Install_Adobe_Reader()
	_Install_BGP_Killer()
	_Install_Unchecky()
	_Install_Ninite()
	_Install_ESET()
	_Edit_Log("")
	_Edit_Log("DONE! Programs installed")
EndFunc   ;==>_Install_Programs

Func _Install_Ninite()
	FileOpen($iniNinite)
	Local $install = False
	Local $urlNinite = "https://ninite.com/"

	For $i = 0 To UBound($aTVItems) - 4 Step 1
		; --- 85 -> 92 --- ;
		If $i < 85 Then
			If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[$i][0])) Then
				$urlNinite &= "-" & IniRead($iniNinite, $i, "url", "")
				If $install <> True Then
					$install = True
				EndIf
			EndIf
		ElseIf $i > 92 Then
			If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[$i][0])) Then
				$urlNinite &= "-" & IniRead($iniNinite, $i, "url", "")
				If $install <> True Then
					$install = True
				EndIf
			EndIf
		EndIf
	Next

	If ($install == True) Then
		_Edit_Log("Downloading Ninite")
		$urlNinite &= "/ninite.exe"
		InetGet($urlNinite, $dir & "/Ninite.exe")

		;----- Install Ninite
		_Edit_Log("Installing Ninite")
		Run($dir & "/ninite.exe")
		Do
			If (WinExists("Ninite", "Finished.")) Then
				ControlClick("Ninite", "", 2)
			EndIf
			Sleep(100)
		Until (Not ProcessExists("ninite.exe"))
	EndIf
	FileClose($iniNinite)
EndFunc   ;==>_Install_Ninite

Func _Install_Adobe_Reader()
	;----- Download Adobe Reader
	If _GUICtrlTreeView_GetChecked($hTV, $aTVItems[85][0]) Then
		_Edit_Log("Downloading Adobe Reader Changelog")
		;----- Get Adobe reader changelog
		InetGet("https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html", $dir & "/readerChangeLog")
		Local $hFileOpen = FileOpen($dir & "/readerChangeLog")
		Local $sFileRead = FileRead($hFileOpen)
		FileClose($hFileOpen)

		;----- Find the current version number in the changelog
		Local $versionNrArray = StringRegExp($sFileRead, "\d{2}.\d{3}.\d{5}", $STR_REGEXPARRAYGLOBALMATCH)
		Local $versionNr = StringReplace($versionNrArray[0], ".", "")

		;----- Download the latest version of Adobe reader
		_Edit_Log("Downloading Adobe Reader")
		Local $versionNr = ""
		Local $readerUrl = ""
		Local $readerDownloadSucess = 0
		For $i = 0 To UBound($versionNrArray) Step 1
			$versionNr = StringReplace($versionNrArray[$i], ".", "")
			$readerUrl = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/" & $versionNr & "/AcroRdrDC" & $versionNr & "_sv_SE.exe"
			$readerDownloadSucess = InetGet($readerUrl, $dir & "/reader.exe", $INET_DOWNLOADBACKGROUND)
			If $readerDownloadSucess <> 0 Then ExitLoop
		Next

		;----- Install Adobe Reader
		_Edit_Log("Installing Adobe Reader")
		If FileExists($dir & "/reader.exe") Then
			Run($dir & "/reader.exe")
			Do
				If (WinExists("Adobe Acrobat Reader DC (Continuous)", "Klart att installera Adobe Acrobat Reader DC")) Then
					ControlClick("Adobe Acrobat Reader DC (Continuous)", "", "[CLASS:Button; INSTANCE:4]")
				ElseIf (WinExists("Adobe Acrobat Reader DC (Continuous)", "Installationen är klar")) Then
					ControlClick("Adobe Acrobat Reader DC (Continuous)", "", "[CLASS:Button; INSTANCE:1]")
				EndIf
				Sleep(100)
			Until (Not ProcessExists("reader.exe"))
		EndIf
	EndIf
EndFunc   ;==>_Install_Adobe_Reader

Func _Install_BGP_Killer()
	;----- Download BGP Killer
	If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[86][0])) Then
		_Edit_Log("Downloading BGP Killer")
		InetGet($BGPKillerUrl, $dir & "/BGP_Killer.exe")
		;----- Install BGP Killer
		If FileExists($dir & "/BGP_Killer.exe") Then
			_Edit_Log("Installing BGP Killer")
			Run($dir & "/BGP_Killer.exe")
			Do
				If (WinExists("Setup - BGPKiller", "Welcome to the BGPKiller Setup Wizard")) Then
					ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:1]")
				ElseIf (WinExists("Setup - BGPKiller", "License Agreement")) Then
					ControlClick("Setup - BGPKiller", "", "[CLASSNN:TNewRadioButton1]")
					ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:2]")
				ElseIf (WinExists("Setup - BGPKiller", "Select Destination Location")) Then
					ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:3]")
				ElseIf (WinExists("Setup - BGPKiller", "Select Start Menu Folder")) Then
					ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
				ElseIf (WinExists("Setup - BGPKiller", "Select Additional Tasks")) Then
					ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
				ElseIf (WinExists("Setup - BGPKiller", "Ready to Install")) Then
					ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
				ElseIf (WinExists("Setup - BGPKiller", "&Finish")) Then
					ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
				EndIf
				Sleep(500)
			Until (Not ProcessExists("BGP_Killer.exe"))
		EndIf
	EndIf
EndFunc   ;==>_Install_BGP_Killer

Func _Install_Unchecky()
	;----- Download Unchecky
	If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[87][0])) Then
		_Edit_Log("Downloading Unchecky")
		InetGet($uncheckyUrl, $dir & "/unchecky.exe")
		;----- Install Unchecky
		If FileExists($dir & "/unchecky.exe") Then
			_Edit_Log("Installing Unchecky")
			Run($dir & "/unchecky.exe")
			Do
				If (WinExists("Unchecky", "Installera")) Then
					ControlClick("Unchecky", "", "[CLASS:Button; INSTANCE:2]")
					WinWait("Unchecky", "Gratulerar!", 20000)
				ElseIf (WinExists("Unchecky", "Gratulerar!")) Then
					ControlClick("Unchecky", "", "[CLASS:Button; INSTANCE:2]")
				EndIf
				Sleep(500)
			Until (Not ProcessExists("unchecky.exe"))
		EndIf
	EndIf
EndFunc   ;==>_Install_Unchecky

Func _Install_Datoraffaren_Support()
	If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[88][0])) Then
		_Edit_Log("Placing Datoraffären Support on Desktop")
		InetGet("http://www.datoraffaren.se/datoraffarensupport.exe", @DesktopDir & "/Datoraffärensupport.exe")
	EndIf
EndFunc   ;==>_Install_Datoraffaren_Support

Func _Install_ESET()
	If _GUICtrlTreeView_GetChecked($hTV, $aTVItems[89][0]) Then
		_Edit_Log("Downloading ESET")
		InetGet("http://download.eset.com/special/live-installer/eset_nod32_antivirus_live_installer.exe", $dir & "\ESET.exe")
	EndIf
	If _GUICtrlTreeView_GetChecked($hTV, $aTVItems[90][0]) Then
		_Edit_Log("Downloading ESET")
		InetGet("http://download.eset.com/special/live-installer/eset_internet_security_live_installer.exe", $dir & "\ESET.exe")
	EndIf
	If _GUICtrlTreeView_GetChecked($hTV, $aTVItems[91][0]) Then
		_Edit_Log("Downloading ESET")
		InetGet("http://download.eset.com/special/live-installer/eset_smart_security_live_installer.exe", $dir & "\ESET.exe")
	EndIf
	If _GUICtrlTreeView_GetChecked($hTV, $aTVItems[92][0]) Then
		_Edit_Log("Downloading ESET")
		InetGet("http://download.eset.com/special/live-installer/eset_smart_security_premium_live_installer.exe", $dir & "\ESET.exe")
	EndIf

	If (Run($dir & "/ESET.exe")) Then _Edit_Log("Running ESET")
EndFunc   ;==>_Install_ESET

Func _Set_Settings()
EndFunc   ;==>_Set_Settings

Func _Cleanup()
	FileClose($log)
	FileDelete($log)
	DirRemove($dir, 1)
EndFunc   ;==>_Cleanup

Func _Cleanup_Desktop()
	If FileExists(@DesktopCommonDir & "/Acrobat Reader DC.lnk") Then
		FileDelete(@DesktopCommonDir & "/Acrobat Reader DC.lnk")
	EndIf
	If FileExists(@DesktopCommonDir & "/ImgBurn.lnk") Then
		FileDelete(@DesktopDir & "/ImgBurn.lnk")
	EndIf
	If FileExists(@DesktopDir & "/Unchecky.lnk") Then
		FileDelete(@DesktopDir & "/Unchecky.lnk")
	EndIf
	If FileExists(@DesktopDir & "/VLC Media PLayer.lnk") Then
		FileDelete(@DesktopDir & "/VLC Media Player.lnk")
	EndIf
	If FileExists(@DesktopDir & "/Spotify.lnk") Then
		FileDelete(@DesktopDir & "/Spotify.lnk")
	EndIf
EndFunc   ;==>_Cleanup_Desktop

Func _Create_Log()
	If (FileOpen($log)) Then _Edit_Log("Log created")
	_Edit_Log("Screen height: " & @DesktopHeight)
	_Edit_Log("Screen width: " & @DesktopWidth)
	_Edit_Log("Script started")

	$log_Output = GUICtrlCreateEdit(FileRead($log), 8, $logBox_X_Pos, $wWidth - 16, $logBox_Height)
	GUICtrlSetBkColor(-1, 0xFFFFFF)
EndFunc   ;==>_Create_Log

Func _Edit_Log($addToLog)
	FileWriteLine($log, $addToLog)
	_Change_Log_Output()
EndFunc   ;==>_Edit_Log

Func _Save_Log()
	If (FileCopy($log, @DesktopDir)) Then
		_Edit_Log("Saving logfile to desktop")
	EndIf
EndFunc   ;==>_Save_Log

Func _Change_Log_Output()
	GUICtrlSetData($log_Output, FileRead($log))
	_GUICtrlEdit_Scroll($log_Output, $SB_SCROLLCARET)
EndFunc   ;==>_Change_Log_Output


Func _ShowOptions($start, $end)
	If $lastSelectedStart <> Null Then
		For $i = $lastSelectedStart To $lastSelectedEnd
			GUICtrlSetState($i, $GUI_HIDE)
		Next
	EndIf

	If $start <> Null Then
		For $i = $start To $end
			GUICtrlSetState($i, $GUI_SHOW)
		Next
	EndIf

	$lastSelectedStart = $start
	$lastSelectedEnd = $end
EndFunc   ;==>_ShowOptions

Func _Only_One_AV($input)
	If ($input <> $aTVItems[0][2]) Then
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[0][0], False)
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[86][0], False)
	EndIf
	If ($input <> $aTVItems[7][2]) Then
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[7][0], False)
	EndIf
	If ($input <> $aTVItems[8][2]) Then
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[8][0], False)
	EndIf
	If ($input <> $aTVItems[89][2]) Then
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[89][0], False)
	EndIf
	If ($input <> $aTVItems[90][2]) Then
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[90][0], False)
	EndIf
	If ($input <> $aTVItems[91][2]) Then
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[91][0], False)
	EndIf
	If ($input <> $aTVItems[92][2]) Then
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[92][0], False)
	EndIf
EndFunc   ;==>_Only_One_AV



