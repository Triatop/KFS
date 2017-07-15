#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.14.2
	Author:         myName

	Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here

#RequireAdmin

#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiTreeView.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>

; Create variables
Static Global $wWidth = 800, $wHeight = 600
Static Global $wName = "Klart För Start" ; - "
Global $wCaption = "" ; "Start"
Global $aTVItems[95][3]
Global $status = True
Global $dir = @TempDir & "/KFS/"
Global $iniNinite = "Resources/Ninite.ini"
Global $BGPKillerUrl = "http://bgpkiller.weebly.com/uploads/4/1/2/2/41220059/bgpkiller_setup_v0.9.6.0.exe"
Global $uncheckyUrl = "https://unchecky.com/files/unchecky_setup.exe"

; Create GUI
$wGUI = GUICreate($wName & $wCaption, $wWidth, $wHeight)

; Create tree
$tvItems = GUICtrlCreateTreeView(8, 8, $wWidth * 0.33, $wHeight - 150, BitOR($GUI_SS_DEFAULT_TREEVIEW, $TVS_CHECKBOXES), _
		$WS_EX_DLGMODALFRAME + $WS_EX_CLIENTEDGE)
$hTV = GUICtrlGetHandle(-1)
_Create_Tree_Items()

DirCreate($dir)


;
GUICtrlCreateEdit("Status output", 8, $wHeight - 140, $wWidth - 18, 90)


; Create buttons to set/clear all
$bCheckStandard = GUICtrlCreateButton("Check Standard", 8, $wHeight - 40, 80, 30)
$hClear = GUICtrlCreateButton("Clear All", 88, $wHeight - 40, 80, 30)
$hApply = GUICtrlCreateButton("Apply", $wWidth - 90, $wHeight - 40, 80, 30)

_Check_Standard_Programs()

GUISetState()

Main()

Func Main()
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				_Cleanup()
				Exit
			Case $bCheckStandard
				_Check_Standard_Programs()
			Case $hClear
				_Adjust_All(False)
			Case $hApply
				_Apply_Changes()
		EndSwitch

		; Get selected item
		$hSelected = _GUICtrlTreeView_GetSelection($hTV)
		; Is it checked?
		If _GUICtrlTreeView_GetChecked($hTV, $hSelected) Then
			; If so check its parent
			_Check_Parents($hSelected)
		EndIf

	WEnd
	GUIDelete($wGUI)
EndFunc   ;==>Main

Func _Adjust_All($fState = True)
	; Loop through items
	For $n = 0 To UBound($aTVItems) - 1
		; Adjust items
		_GUICtrlTreeView_SetChecked($hTV, $aTVItems[$n][0], $fState)
		$aTVItems[$n][1] = $fState
	Next
EndFunc   ;==>_Adjust_All

Func _Adjust_Children($hPassedItem, $fState = True)

	Local $iIndex

	; Get the handle of the first child
	Local $hChild = _GUICtrlTreeView_GetFirstChild($tvItems, $hPassedItem)
	If $hChild = 0 Then Return
	; Loop through children
	While 1
		; Adjust the array
		$iIndex = _ArraySearch($aTVItems, $hChild)
		If @error Then Return
		$aTVItems[$iIndex][1] = $fState
		; Adjust the child
		_GUICtrlTreeView_SetChecked($tvItems, $hChild, $fState)
		; And now do the same for the generation beow
		_Adjust_Children($hChild, $fState)
		; Now get next child
		$hChild = _GUICtrlTreeView_GetNextChild($tvItems, $hChild)
		; Exit the loop if no more found
		If $hChild = 0 Then ExitLoop
	WEnd
EndFunc   ;==>_Adjust_Children

Func _Create_Tree_Items()
	FileOpen($iniNinite)

	$aTVItems[93][2] = GUICtrlCreateTreeViewItem("Common", $tvItems)
	$aTVItems[94][2] = GUICtrlCreateTreeViewItem("Uncommon", $tvItems)

	For $i = 0 To UBound($aTVItems) - 3 Step 1
		If (IniRead($iniNinite, $i, "name", "0")) = "0" Then
		EndIf
		If (IniRead($iniNinite, $i, "category", "")) = "standard" Then
			$aTVItems[$i][2] = GUICtrlCreateTreeViewItem(IniRead($iniNinite, $i, "name", 0), $aTVItems[93][2])
		Else
			$aTVItems[$i][2] = GUICtrlCreateTreeViewItem(IniRead($iniNinite, $i, "name", 0), $aTVItems[94][2])
		EndIf
	Next
	FileClose($iniNinite)

	; Set initial unchecked state and get item handles
	For $i = 0 To UBound($aTVItems) - 1
		$aTVItems[$i][1] = False
		$aTVItems[$i][0] = GUICtrlGetHandle($aTVItems[$i][2])
	Next
EndFunc   ;==>_Create_Tree_Items

Func _Check_Parents($hHandle)

	; Get the handle of the parent
	$hParent = _GUICtrlTreeView_GetParentHandle($hTV, $hHandle)
	; If there is no parent
	If $hParent = 0 Then
		Return
	EndIf
	; Check the parent
	_GUICtrlTreeView_SetChecked($hTV, $hParent)
	; And look for the grandparent and so on
	_Check_Parents($hParent)

EndFunc   ;==>_Check_Parents

Func _Check_Standard_Programs()
;~ Load Standard values ~~;
	FileOpen($iniNinite)
	For $i = 0 To UBound($aTVItems) - 1 Step 1
		If (IniRead($iniNinite, $i, "standard", 0) == 1) Then
			_GUICtrlTreeView_SetChecked($hTV, $aTVItems[$i][0])
		EndIf
	Next
	FileClose($iniNinite)
EndFunc   ;==>_Get_Standard_Programs

Func _Apply_Changes()
	_Install_Programs()
	_Set_Settings()
EndFunc   ;==>_Apply_Changes

Func _Install_Programs()
	_Install_Adobe_Reader()
	_Install_BGP_Killer()
	_Install_Unchecky()
	_Install_Datoraffaren_Support()
	_Install_Ninite()
EndFunc   ;==>_Install_Programs

Func _Install_Ninite()
	Local $urlNinite = "https://ninite.com/"

	FileOpen($iniNinite)
	For $i = 0 To UBound($aTVItems) - 1 Step 1
		If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[$i][0])) Then
			$urlNinite = $urlNinite & "/" & IniRead($iniNinite, $i, "url", "")
		EndIf
	Next

	;--------- REMOVE -------;

	$urlNinite = $urlNinite & "ninite.exe"
	ConsoleWrite($urlNinite)
	InetGet($urlNinite, $dir & "/Ninite.exe")
	FileClose($iniNinite)

;~~~ Install Ninite ~~~;
	If FileExists($dir & "/Ninite.exe") Then
		Run($dir & "ninite.exe")
		WinWait("Ninite", "Finished.")
		ControlClick("Ninite", "", 2)
	EndIf


EndFunc   ;==>_Install_Ninite

Func _Install_Adobe_Reader()

;~~~ Download Adobe Reader ~~~;
	If _GUICtrlTreeView_GetChecked($hTV, $aTVItems[85][0]) Then
		;Get Adobe reader changelog
		InetGet("https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html", $dir & "/readerChangeLog")
		Local $hFileOpen = FileOpen($dir & "/readerChangeLog")
		Local $sFileRead = FileRead($hFileOpen)
		FileClose($hFileOpen)

		;Find the current version number in the changelog
		Local $versionNrArray = StringRegExp($sFileRead, "\d{2}.\d{3}.\d{5}", $STR_REGEXPARRAYGLOBALMATCH)
		Local $versionNr = StringReplace($versionNrArray[0], ".", "")

		;Download the latest version of Adobe reader
		Local $versionNr = ""
		Local $readerUrl = ""
		Local $readerDownloadSucess = 0
		For $i = 0 To UBound($versionNrArray) Step 1
			$versionNr = StringReplace($versionNrArray[$i], ".", "")
			$readerUrl = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/" & $versionNr & "/AcroRdrDC" & $versionNr & "_sv_SE.exe"
			$readerDownloadSucess = InetGet($readerUrl, $dir & "/reader.exe")
			If $readerDownloadSucess <> 0 Then ExitLoop
		Next

;~~~ Install Adobe Reader ~~~;
		If FileExists($dir & "/reader.exe") Then
			Run($dir & "/reader.exe")
			WinWait("Adobe Acrobat Reader DC (Continuous) - inställning", "Klart att installera Adobe Acrobat Reader DC")
			ControlClick("Adobe Acrobat Reader DC (Continuous) - inställning", "", "[CLASS:Button; INSTANCE:4]")
			WinWait("Adobe Acrobat Reader DC (Continuous) - inställning", "Installationen är klar")
			ControlClick("Adobe Acrobat Reader DC (Continuous) - inställning", "", "[CLASS:Button; INSTANCE:1]")
		EndIf
	EndIf
EndFunc   ;==>_Install_Adobe_Reader

Func _Install_BGP_Killer()
;~~~ Download BGP Killer ~~~;
	If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[86][0])) Then
		InetGet($BGPKillerUrl, $dir & "/BGP_Killer.exe")
;~~~ Install BGP Killer ~~~;
		If FileExists($dir & "/BGP_Killer.exe") Then
			Run($dir & "/BGP_Killer.exe")
			WinWait("Setup - BGPKiller", "Welcome to the BGPKiller Setup Wizard")
			ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:1]")
			WinWait("Setup - BGPKiller", "License Agreement")
			ControlClick("Setup - BGPKiller", "", "[CLASSNN:TNewRadioButton1]")
			ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:2]")
			WinWait("Setup - BGPKiller", "Select Destination Location")
			ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:3]")
			WinWait("Setup - BGPKiller", "Select Start Menu Folder")
			ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
			WinWait("Setup - BGPKiller", "Select Additional Tasks")
			ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
			WinWait("Setup - BGPKiller", "Ready to Install")
			ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
			WinWait("Setup - BGPKiller", "&Finish")
			ControlClick("Setup - BGPKiller", "", "[CLASS:TNewButton; INSTANCE:4]")
		EndIf
	EndIf
EndFunc   ;==>_Install_BGP_Killer

Func _Install_Unchecky()
;~~~ Download Unchecky ~~~;
	If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[87][0])) Then
		InetGet($uncheckyUrl, $dir & "/unchecky.exe")
;~~~ Install Unchecky ~~~;
		If FileExists($dir & "/unchecky.exe") Then
			Run($dir & "/unchecky.exe")
			WinWait("Unchecky v1.0.2 Installation", "Välkommen till installationen av Unchecky")
			ControlClick("Unchecky v1.0.2 Installation", "", "[CLASS:Button; INSTANCE:2]")
			WinWait("Unchecky v1.0.2 Installation", "Gratulerar!")
			ControlClick("Unchecky v1.0.2 Installation", "", "[CLASS:Button; INSTANCE:2]")
		EndIf
	EndIf
EndFunc   ;==>_Install_Unchecky

Func _Install_Datoraffaren_Support()
	If (_GUICtrlTreeView_GetChecked($hTV, $aTVItems[88][0])) Then
		InetGet("http://www.datoraffaren.se/datoraffarensupport.exe", @DesktopDir & "/Datoraffärensupport.exe")
	EndIf
EndFunc   ;==>_Install_Datoraffaren_Support

Func _Set_Settings()
EndFunc   ;==>_Set_Settings

Func _Cleanup()
	DirRemove($dir, 1)
EndFunc   ;==>_Cleanup
