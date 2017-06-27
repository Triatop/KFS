#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.14.2
	Author:         myName

	Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#RequireAdmin


#include <GUIConstantsEx.au3>
#include <IE.au3>
#include <GUI.au3>
#include <ProgressBar.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

;~ Set Primary Window Height and Width variables ~;
Local $pwWidth = IniRead("Resources/config.ini", "PrimaryWindow", "width", "800")
Local $pwHeight = IniRead("Resources/config.ini", "PrimaryWindow", "height", "600")
;~
Static Global $tabButton[9]
Static Global $GUI0InstallCheckbox[100]
Global $installBtn

;~
$caption = "Klart För Start"
$adobeReaderUrl = "https://get.adobe.com/se/reader/"
$BGPKillerUrl = "http://bgpkiller.weebly.com/uploads/4/1/2/2/41220059/bgpkiller_setup_v0.9.6.0.exe"
$uncheckyUrl = "https://unchecky.com/files/unchecky_setup.exe"
$niniteURL = "https://ninite.com/"


;~ Check if Primary Window Height and Width is less than 800x600, if so sets to 800x600 ~;
If $pwWidth < 800 Then
	$pwWidth = 800
EndIf
If $pwHeight < 600 Then
	$pwWidth = 600
EndIf

;~ Calls Main function to run program ~;
main()

Func main()
	CreateGUI()
	WinMove($gui0, "", ((@DesktopWidth / 2) - ($pwWidth / 2)), ((@DesktopHeight / 2) - ($pwHeight / 2)))
	GUISetState(@SW_SHOW, $gui0)
	DirCreate(@DesktopDir & "/KFS")

	ProgressBarInit()

	ProgramLoop()
EndFunc   ;==>main


Func ProgramLoop()
	While 1
		Sleep(10)
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				CleanUp()
				ExitLoop
			Case $tabButton[0]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui0)
				WinMove($gui0, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui0)
			Case $tabButton[1]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui0)
				WinMove($gui1, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui1)
			Case $tabButton[2]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui0)
				WinMove($gui2, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui2)
			Case $tabButton[3]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui1)
				WinMove($gui0, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui0)
			Case $tabButton[4]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui1)
				WinMove($gui1, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui1)
			Case $tabButton[5]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui1)
				WinMove($gui2, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui2)
			Case $tabButton[6]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui2)
				WinMove($gui0, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui0)
			Case $tabButton[7]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui2)
				WinMove($gui1, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui1)
			Case $tabButton[8]
				GUISetState(@SW_HIDE)
				Local $guiPos = WinGetPos($gui2)
				WinMove($gui2, "", $guiPos[0], $guiPos[1])
				GUISetState(@SW_SHOW, $gui2)

;~~ Pressed install button ~~;
			Case $installBtn
				GUISetState(@SW_SHOW, $guiProgressBar)
				InstallPrograms()

			Case $menu2button1
				For $i = 0 To UBound($GUI0InstallCheckbox) - 1
					IniWrite("Resources/Ninite.ini", $i, "standard", "0")
					If GUICtrlRead($GUI0InstallCheckbox[$i]) = $GUI_CHECKED Then
						IniWrite("Resources/Ninite.ini", $i, "standard", "1")
					EndIf
				Next
			Case $menu2button2
				For $i = 0 To UBound($GUI0InstallCheckbox) - 1
					IniWrite("Resources/Ninite.ini", $i, "standard", "0")
					If IniRead("Resources/Ninite.ini", $i, "default", 0) = 1 Then
						IniWrite("Resources/Ninite.ini", $i, "standard", "1")
					EndIf
				Next

		EndSwitch
	WEnd ;End of While Loop
EndFunc   ;==>ProgramLoop

Func InstallPrograms()
	GUISetState(@SW_HIDE, $gui0)
	GUISetState(@SW_HIDE, $gui1)
	GUISetState(@SW_HIDE, $gui2)

	ProgressBarClear()
	ProgressBarCheckGoal()

;~~~ Download Adobe Reader ~~~;
	If GUICtrlRead($GUI0InstallCheckbox[85]) = $GUI_CHECKED Then
		;Get Adobe reader changelog
		InetGet("https://helpx.adobe.com/acrobat/release-note/release-notes-acrobat-reader.html", @DesktopDir & "/KFS/readerChangeLog")
		Local $hFileOpen = FileOpen(@DesktopDir & "/KFS/readerChangeLog")
		Local $sFileRead = FileRead($hFileOpen)
		FileClose($hFileOpen)

		;Find the current version number in the changelog
		Local $versionNrArray = StringRegExp($sFileRead, "\d{2}.\d{3}.\d{5}", $STR_REGEXPARRAYMATCH)
		Local $versionNr = StringReplace($versionNrArray[0], ".", "")

		;Download the latest version of Adobe reader
		Local $readerUrl = "http://ardownload.adobe.com/pub/adobe/reader/win/AcrobatDC/" & $versionNr & "/AcroRdrDC" & $versionNr & "_sv_SE.exe"
		InetGet($readerUrl, @DesktopDir & "/KFS/reader.exe")

;~~~ Install Adobe Reader ~~~;
		If FileExists(@DesktopDir & "/KFS/reader.exe") Then
			Run(@DesktopDir & "/KFS/reader.exe")
			WinWait("Adobe Acrobat Reader DC (Continuous) - inställning", "Klart att installera Adobe Acrobat Reader DC")
			ControlClick("Adobe Acrobat Reader DC (Continuous) - inställning", "", "[CLASS:Button; INSTANCE:4]")
			WinWait("Adobe Acrobat Reader DC (Continuous) - inställning", "Installationen är klar")
			ControlClick("Adobe Acrobat Reader DC (Continuous) - inställning", "", "[CLASS:Button; INSTANCE:1]")
			ProgressBarIncrease()
		EndIf
	EndIf

;~~~ Download BGP Killer ~~~;
	If GUICtrlRead($GUI0InstallCheckbox[86]) = $GUI_CHECKED Then
		InetGet($BGPKillerUrl, @DesktopDir & "/KFS/BGP_Killer.exe")
;~~~ Install BGP Killer ~~~;
		If FileExists(@DesktopDir & "/KFS/BGP_Killer.exe") Then
			Run(@DesktopDir & "/KFS/BGP_Killer.exe")
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

			ProgressBarIncrease()
		EndIf
	EndIf

;~~~ Download Unchecky ~~~;
	If GUICtrlRead($GUI0InstallCheckbox[87]) = $GUI_CHECKED Then
		InetGet($uncheckyUrl, @DesktopDir & "/KFS/unchecky.exe")
;~~~ Install Unchecky ~~~;
		If FileExists(@DesktopDir & "/KFS/unchecky.exe") Then
			Run(@DesktopDir & "/KFS/unchecky.exe")
			WinWait("Unchecky v1.0.2 Installation", "Välkommen till installationen av Unchecky")
			ControlClick("Unchecky v1.0.2 Installation", "", "[CLASS:Button; INSTANCE:2]")
			WinWait("Unchecky v1.0.2 Installation", "Gratulerar!")
			ControlClick("Unchecky v1.0.2 Installation", "", "[CLASS:Button; INSTANCE:2]")

			ProgressBarIncrease()
		EndIf
	EndIf

	If GUICtrlRead($GUI0InstallCheckbox[88]) = $GUI_CHECKED Then
		InetGet("http://www.datoraffaren.se/datoraffarensupport.exe", @DesktopDir & "/Datoraffärensupport.exe")
		ProgressBarIncrease()
	EndIf
	InstallNinite()

	GUISetState(@SW_SHOW, $gui0)

EndFunc   ;==>InstallPrograms

Func InstallNinite()
;~~~ Download Ninite ~~~;
	For $i = 0 To 84
		If GUICtrlRead($GUI0InstallCheckbox[$i]) = $GUI_CHECKED Then
			$niniteURL = $niniteURL & IniRead("Resources/Ninite.ini", $i, "url", "")
			$niniteURL = $niniteURL & "-"
		EndIf
	Next
	If ($niniteURL <> "https://ninite.com/") Then
		$niniteURL = $niniteURL & "/ninite.exe"
		InetGet($niniteURL, @DesktopDir & "/KFS/ninite.exe")
	EndIf

;~~~ Install Ninite ~~~;
	If FileExists(@DesktopDir & "/KFS/ninite.exe") Then
		Run(@DesktopDir & "/KFS/ninite.exe")
		WinWait("Ninite", "Finished.")
		ControlClick("Ninite", "", 2)
		ProgressBarIncrease()
	EndIf
EndFunc   ;==>InstallNinite

Func CleanUp()
	DirRemove(@DesktopDir & "/KFS", 1)
EndFunc   ;==>CleanUp
