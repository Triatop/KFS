#cs ----------------------------------------------------------------------------

	AutoIt Version: 3.3.14.2
	Author:         myName

	Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here


;
;~ $regname_disable_sound = "reg_files/no_sound.reg"
;~ $regname_disable_app_notifications = "reg_files/disable_app_notifications.reg"
;~ $regname_disable_recent_used_list = "reg_files/disable_recent_used_list.reg"
;~ $regname_disabe_start_suggestion = "reg_files/disable_start_suggestions.reg"
;~ $regname_disable_taskview_icon = "reg_files/disable_task_view_icon.reg"
;~ $regname_disable_taskbar_search = "reg_files/disable_taskbar_search.reg"
;~ $regname_disable_taskbar_favorites = "reg_files/remove_taskbar_favorites.reg"
;~ $regname_disable_taskbar_contacts = "reg_files/disable_taskbar_contacts.reg"
;
Func _disable_printer_manager()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows", "LegacyDefaultPrinterMode", "REG_DWORD", "00000001")
EndFunc   ;==>_disable_printer_manager

Func _disable_theme_sound()
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\.Default\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\AppGPFault\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\CCSelect\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\ChangeTheme\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Close\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\CriticalBatteryAlarm\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceConnect\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceDisconnect\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\DeviceFail\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\FaxBeep\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\LowBatteryAlarm\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MailBeep\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Maximize\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MenuCommand\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MenuPopup\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\MessageNudge\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Default\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.IM\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm2\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm3\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm4\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm5\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm6\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm7\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm8\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm9\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Alarm10\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call2\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call3\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call4\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call5\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call6\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call7\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call8\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call9\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Looping.Call10\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Mail\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Proximity\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.Reminder\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Notification.SMS\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\Open\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\PrintComplete\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\ProximityConnection\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\RestoreDown\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\RestoreUp\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\ShowBand\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemAsterisk\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemExclamation\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemExit\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemHand\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemNotification\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\SystemQuestion\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\WindowsLogoff\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\WindowsLogon\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\WindowsUAC\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default\WindowsUnlock\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\ActivatingDocument\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\BlockedPopup\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\EmptyRecycleBin\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\FeedDiscovered\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\MoveMenuItem\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\Navigating\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\Explorer\SecurityBand\.Current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\sapisvr\DisNumbersSound\.current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\sapisvr\HubOffSound\.current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\sapisvr\HubOnSound\.current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\sapisvr\HubSleepSound\.current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\sapisvr\MisrecoSound\.current", "", "REG_SZ", "")
	RegWrite("HKEY_CURRENT_USER\AppEvents\Schemes\Apps\sapisvr\PanelSound\.current", "", "REG_SZ", "")
EndFunc   ;==>_disable_theme_sound

Func _disable_app_notifications()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PushNotifications", "ToastEnabled", "REG_DWORD", "00000000")
EndFunc

Func _disable_recent_used_list()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Start_TrackDocs", "REG_DWORD", "00000000")
EndFunc

Func _disable_start_suggestion()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "FeatureManagementEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "OemPreInstalledAppsEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "PreInstalledAppsEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "RotatingLockScreenEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "RotatingLockScreenOverlayEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SilentInstalledAppsEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SoftLandingEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SystemPaneSuggestionsEnabled", "REG_DWORD", "00000000")
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager", "SubscribedContent-310093Enabled", "REG_DWORD", "00000000")
EndFunc

Func _disable_taskview_icon()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "ShowTaskViewButton", "REG_DWORD", "00000000")
EndFunc

Func _disable_taskbar_search()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search", "SearchboxTaskbarMode", "REG_DWORD", "00000000")
EndFunc

Func _disable_taskbar_favorites()
RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband", "Favorites", "REG_SZ", "00,8e,01,00,00,3a,00,1f,80,c8,27,34,1f,10,5c,10,42,aa,03,2e,e4,52,87,d6,68,26,00,01,00,26,00,ef,be,12,00,00,00,fb,f3,46,b3,1a,1b,d3,01,41,7f,e6,b5,1a,1b,d3,01,41,7f,e6,b5,1a,1b,d3,01,14,00,56,00,31,00,00,00,00,00,18,4b,5a,3f,11,00,54,61,73,6b,42,61,72,00,40,00,09,00,04,00,ef,be,16,4b,c3,3d,18,4b,5a,3f,2e,00,00,00,b9,a6,01,00,00,00,03,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,c6,57,9c,00,54,00,61,00,73,00,6b,00,42,00,61,00,72,00,00,00,16,00,fc,00,32,00,97,01,00,00,72,4a,4c,a7,20,00,46,49,4c,45,45,58,7e,31,2e,4c,4e,4b,00,00,7c,00,09,00,04,00,ef,be,18,4b,5a,3f,18,4b,5a,3f,2e,00,00,00,9f,ae,01,00,00,00,02,00,00,00,00,00,00,00,00,00,52,00,00,00,00,00,33,98,1e,00,46,00,69,00,6c,00,65,00,20,00,45,00,78,00,70,00,6c,00,6f,00,72,00,65,00,72,00,2e,00,6c,00,6e,00,6b,00,00,00,40,00,73,00,68,00,65,00,6c,00,6c,00,33,00,32,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,32,00,32,00,30,00,36,00,37,00,00,00,1c,00,22,00,00,00,1e,00,ef,be,02,00,55,00,73,00,65,00,72,00,50,00,69,00,6e,00,6e,00,65,00,64,00,00,00,1c,00,42,00,00,00,1d,00,ef,be,02,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,2e,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,2e,00,45,00,78,00,70,00,6c,00,6f,00,72,00,65,00,72,00,00,00,1c,00,00,00,ff")
RegWrite("HKEY_CURRENT_USER\SoftwareMicrosoft\Windows\CurrentVersion\Explorer\Taskband", "FavoritesResolve", "REG_SZ", "1f,03,00,00,4c,00,00,00,01,14,02,00,00,00,00,00,c0,00,00,00,00,00,00,46,83,00,80,00,20,00,00,00,f9,85,c0,d2,ae,1c,d3,01,f9,85,c0,d2,ae,1c,d3,01,cd,3f,db,61,2a,a0,d2,01,97,01,00,00,00,00,00,00,01,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,8e,01,3a,00,1f,80,c8,27,34,1f,10,5c,10,42,aa,03,2e,e4,52,87,d6,68,26,00,01,00,26,00,ef,be,12,00,00,00,fb,f3,46,b3,1a,1b,d3,01,41,7f,e6,b5,1a,1b,d3,01,41,7f,e6,b5,1a,1b,d3,01,14,00,56,00,31,00,00,00,00,00,18,4b,5a,3f,11,00,54,61,73,6b,42,61,72,00,40,00,09,00,04,00,ef,be,16,4b,c3,3d,18,4b,5a,3f,2e,00,00,00,b9,a6,01,00,00,00,03,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,c6,57,9c,00,54,00,61,00,73,00,6b,00,42,00,61,00,72,00,00,00,16,00,fc,00,32,00,97,01,00,00,72,4a,4c,a7,20,00,46,49,4c,45,45,58,7e,31,2e,4c,4e,4b,00,00,7c,00,09,00,04,00,ef,be,18,4b,5a,3f,18,4b,5a,3f,2e,00,00,00,9f,ae,01,00,00,00,02,00,00,00,00,00,00,00,00,00,52,00,00,00,00,00,33,98,1e,00,46,00,69,00,6c,00,65,00,20,00,45,00,78,00,70,00,6c,00,6f,00,72,00,65,00,72,00,2e,00,6c,00,6e,00,6b,00,00,00,40,00,73,00,68,00,65,00,6c,00,6c,00,33,00,32,00,2e,00,64,00,6c,00,6c,00,2c,00,2d,00,32,00,32,00,30,00,36,00,37,00,00,00,1c,00,22,00,00,00,1e,00,ef,be,02,00,55,00,73,00,65,00,72,00,50,00,69,00,6e,00,6e,00,65,00,64,00,00,00,1c,00,42,00,00,00,1d,00,ef,be,02,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,00,74,00,2e,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,2e,00,45,00,78,00,70,00,6c,00,6f,00,72,00,65,00,72,00,00,00,1c,00,00,00,9a,00,00,00,1c,00,00,00,01,00,00,00,1c,00,00,00,2d,00,00,00,00,00,00,00,99,00,00,00,11,00,00,00,03,00,00,00,5e,83,7d,9a,10,00,00,00,00,43,3a,5c,55,73,65,72,73,5c,44,65,76,5c,41,70,70,44,61,74,61,5c,52,6f,61,6d,69,6e,67,5c,4d,69,63,72,6f,73,6f,66,74,5c,49,6e,74,65,72,6e,65,74,20,45,78,70,6c,6f,72,65,72,5c,51,75,69,63,6b,20,4c,61,75,6e,63,68,5c,55,73,65,72,20,50,69,6e,6e,65,64,5c,54,61,73,6b,42,61,72,5c,46,69,6c,65,20,45,78,70,6c,6f,72,65,72,2e,6c,6e,6b,00,00,60,00,00,00,03,00,00,a0,58,00,00,00,00,00,00,00,64,65,73,6b,74,6f,70,2d,36,75,61,6c,6c,70,6e,00,b2,58,53,ac,07,25,ed,46,86,f8,26,37,55,9b,df,50,c6,d5,02,9b,a0,88,e7,11,b3,a2,08,00,27,07,0a,61,b2,58,53,ac,07,25,ed,46,86,f8,26,37,55,9b,df,50,c6,d5,02,9b,a0,88,e7,11,b3,a2,08,00,27,07,0a,61,45,00,00,00,09,00,00,a0,39,00,00,00,31,53,50,53,b1,16,6d,44,ad,8d,70,48,a7,48,40,2e,a4,3d,78,8c,1d,00,00,00,68,00,00,00,00,48,00,00,00,95,92,a6,8c,00,00,00,00,00,00,50,1f,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00")
EndFunc

Func _disable_taskbar_contacts()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People", "PeopleBand", "REG_DWORD", "00000000")
EndFunc