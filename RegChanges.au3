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
$CMD = "REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /v FavoritesResolve /t REG_BINARY /d 1f0300004c0000000114020000000000c0000000000000468300800020000000f985c0d2ae1cd301f985c0d2ae1cd301cd3fdb612aa0d2019701000000000000010000000000000000000000000000008e013a001f80c827341f105c1042aa032ee45287d668260001002600efbe12000000fbf346b31a1bd301417fe6b51a1bd301417fe6b51a1bd30114005600310000000000184b5a3f11005461736b42617200400009000400efbe164bc33d184b5a3f2e000000b9a60100000003000000000000000000000000000000c6579c005400610073006b0042006100720000001600fc00320097010000724a4ca7200046494c4545587e312e4c4e4b00007c0009000400efbe184b5a3f184b5a3f2e0000009fae010000000200000000000000000052000000000033981e00460069006c00650020004500780070006c006f007200650072002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f0072006500720000001c0000009a0000001c000000010000001c0000002d000000000000009900000011000000030000005e837d9a1000000000433a5c55736572735c4465765c417070446174615c526f616d696e675c4d6963726f736f66745c496e7465726e6574204578706c6f7265725c517569636b204c61756e63685c557365722050696e6e65645c5461736b4261725c46696c65204578706c6f7265722e6c6e6b000060000000030000a058000000000000006465736b746f702d3675616c6c706e00b25853ac0725ed4686f82637559bdf50c6d5029ba088e711b3a2080027070a61b25853ac0725ed4686f82637559bdf50c6d5029ba088e711b3a2080027070a6145000000090000a03900000031535053b1166d44ad8d7048a748402ea43d788c1d0000006800000000480000009592a68c000000000000501f00000000000000000000000000000000 /f"
Run('"' & @ComSpec & '" /c' & $CMD, @SystemDir)
$CMD = "REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband /v Favorites /t REG_BINARY /d 008e0100003a001f80c827341f105c1042aa032ee45287d668260001002600efbe12000000fbf346b31a1bd301417fe6b51a1bd301417fe6b51a1bd30114005600310000000000184b5a3f11005461736b42617200400009000400efbe164bc33d184b5a3f2e000000b9a60100000003000000000000000000000000000000c6579c005400610073006b0042006100720000001600fc00320097010000724a4ca7200046494c4545587e312e4c4e4b00007c0009000400efbe184b5a3f184b5a3f2e0000009fae010000000200000000000000000052000000000033981e00460069006c00650020004500780070006c006f007200650072002e006c006e006b00000040007300680065006c006c00330032002e0064006c006c002c002d003200320030003600370000001c00220000001e00efbe02005500730065007200500069006e006e006500640000001c00420000001d00efbe02004d006900630072006f0073006f00660074002e00570069006e0064006f00770073002e004500780070006c006f0072006500720000001c000000ff /f"
Run('"' & @ComSpec & '" /c' & $CMD, @SystemDir)

EndFunc

Func _disable_taskbar_contacts()
	RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People", "PeopleBand", "REG_DWORD", "00000000")
EndFunc