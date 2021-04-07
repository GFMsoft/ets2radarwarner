#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=radar.ico
#AutoIt3Wrapper_Outfile=Radarwarner.Exe
#AutoIt3Wrapper_Res_Fileversion=1.0.0.0
#AutoIt3Wrapper_Res_CompanyName=GFMSOFT - Ferdinand Marx
#AutoIt3Wrapper_Res_LegalCopyright=GFMSOFT - Ferdinand Marx
#AutoIt3Wrapper_Res_LegalTradeMarks=GFMSOFT - Ferdinand Marx
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****



;--------------------------------------------------
;~ INFO
;--------------------------------------------------
; See GITHUB readme for info.
; https://github.com/GFMsoft/ets2radarwarner
;--------------------------------------------------
asd

;--------------------------------------------------
; INCLUDES
;--------------------------------------------------
#include <Array.au3>
#include <file.au3>
#include <Misc.au3>
#include <WinAPI.au3>
#include <GDIPlus.au3>
#include <WinAPIGdi.au3>
#include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <AutoItConstants.au3>
#include <WindowsConstants.au3>
;--------------------------------------------------


;--------------------------------------------------
;~ VARS
;--------------------------------------------------
global $winhandle, $array, $warnstate, $warnradius, $checkarray, $checksplit, $failcount
global $hDLL, $x_coord, $z_coord, $version
$hDLL = DllOpen("user32.dll")
$warnstate=false
$warnradius=160
$prewarnradius=$warnradius+50
$failcount=0
$version="1.0.0.0"
;--------------------------------------------------


;--------------------------------------------------
;~ LOADING-SCREEN
;--------------------------------------------------
Global Const $AC_SRC_ALPHA = 1
Global $GUI, $hGraphic, $hGraphic2, $hImage, $hImageR
$GUI = GUICreate('IPMA', 500, 500, (@DesktopWidth - 500)/2, (@DesktopHeight - 500)/2, $WS_POPUP, $WS_EX_LAYERED + $WS_EX_TOOLWINDOW + $WS_EX_TOPMOST)

GUISetBkColor(0xABCDEF)
GUISetState(@SW_SHOW, $GUI)

_GDIPlus_Startup()
_WinAPI_SetLayeredWindowAttributes($GUI, 0xABCDEF, 220) ;0xABCDEF 0xFFFFFF 0x000000
_SetGraphics(0, 0)
GUICtrlSetPos($GUI,0,0)
Sleep(2000)
;--------------------------------------------------


;--------------------------------------------------
;~ INIT
;--------------------------------------------------
;Loading saved coords
_FileReadToArray("coords.txt",$checkarray)

;Check secondary systems
if FileExists(@ScriptDir&"\radarclient.exe") = True Then
	ShellExecute(@ScriptDir&"\radarclient.exe")
Else
	MsgBox(16,"Fehler - Programm wir beendet!","Radarclient.exe fehlt in "& @ScriptDir)
	Exit
EndIf

;wait until radarclient.exe is running
while ProcessExists("radarclient.exe") = False
	Sleep(1000)
WEnd

;wait another 2,5 sec - os needs that time - otherwise you wont get the handle
Sleep(2500)

;get the handle for futher actions
$winhandle = WinGetHandle("ETS2 - Radarwarner","")
if @error = true Then
	MsgBox(16,"Fehler","Please start ETS2 - RADARTWARNER")
	exit
Else
	ConsoleWrite("Winhandle: "&$winhandle&@CRLF)
EndIf

;not needed but better to put it to 300,300
;some users may use crazy Desktop environments
WinMove($winhandle,"",300,300)
;--------------------------------------------------


;Play feedback to user - System is loaded and ready
SoundPlay("logon.wav",0)

;Hide loadingscreen
GUISetState(@SW_HIDE, $GUI)




;Mainloop
while 1

	if ProcessExists("radarclient.exe") = False Then
		MsgBox(16,"Fehler - Radarwarner","Radarwarner-Client nicht aktiv! - Radarwarner wird beendet!")
		Exit
	EndIf

	$x_coord = ControlGetText($winhandle,"","[CLASS:WindowsForms10.EDIT.app.0.141b42a_r7_ad1; INSTANCE:2]")
	$z_coord = ControlGetText($winhandle,"","[CLASS:WindowsForms10.EDIT.app.0.141b42a_r7_ad1; INSTANCE:1]")

	ConsoleWrite("X: "&$x_coord&"Z: "&$z_coord&@CRLF)

	if _IsPressed("7A",$hDLL) = true Then
		logcoords()
		Sleep(10000)
	EndIf

	if _IsPressed("78",$hDLL) = true Then
		Sleep(60000)
	EndIf

	checkradar()

	Sleep(100)
WEnd






;This funktion checks for Radar-Cameras - It plays a warning sound when the player gettin closer to the camera
func checkradar()

	$x_coord = ControlGetText($winhandle,"","[CLASS:WindowsForms10.EDIT.app.0.141b42a_r7_ad1; INSTANCE:2]")
	$z_coord = ControlGetText($winhandle,"","[CLASS:WindowsForms10.EDIT.app.0.141b42a_r7_ad1; INSTANCE:1]")

	local $radari
	$radari=1

	for $radari = 1 to UBound($checkarray) -1 step 1

		$checksplit=StringSplit($checkarray[$radari],"#")

		if UBound($checksplit) >= 1 Then

			if $x_coord > $checksplit[1] - $warnradius and $x_coord < $checksplit[1] + $warnradius Then
				if $z_coord > $checksplit[2] - $warnradius and $z_coord < $checksplit[2] + $warnradius Then
					SoundPlay("alarm.wav",1)
					Sleep(1000)
					$warnstate = True
				EndIf
			EndIf

			if $x_coord > $checksplit[1] - $prewarnradius and $x_coord < $checksplit[1] + $prewarnradius Then
				if $z_coord > $checksplit[2] - $prewarnradius  and $z_coord < $checksplit[2] + $prewarnradius  Then
					ConsoleWrite("PRE-ALARM TRIGGER!"&@CRLF)
					if $warnstate = False Then
						SoundPlay("pre_alarm.wav",1)
						Sleep(1000)
					EndIf
				EndIf
			EndIf

		EndIf

		$warnstate = False

	Next

EndFunc


;This function logs the current coordinates when the player is near a radar camera
Func logcoords()

	local $filehandle
	$filehandle = FileOpen(@ScriptDir&"\coords.txt",1)
	$x_coord = ControlGetText($winhandle,"","[CLASS:WindowsForms10.EDIT.app.0.141b42a_r7_ad1; INSTANCE:2]")
	$z_coord = ControlGetText($winhandle,"","[CLASS:WindowsForms10.EDIT.app.0.141b42a_r7_ad1; INSTANCE:1]")
	FileWrite($filehandle,$x_coord&"#"&$z_coord&@CRLF)
	FileClose($filehandle)
	SoundPlay("log.wav",1)
	_FileReadToArray("coords.txt",$checkarray)

EndFunc

;This function is part of the loading screen
Func _SetGraphics($x, $y)
    $hImage = _GDIPlus_ImageLoadFromFile(@ScriptDir&'\radar.png')
    $hImageR = _GDIPlus_ImageResize($hImage, 500, 500, $GDIP_INTERPOLATIONMODE_HIGHQUALITYBICUBIC)
    $hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($GUI)
    _GDIPlus_GraphicsDrawImageRect($hGraphic2, $hImageR, $x, $y, 500, 400)
    _GDIPlus_ImageDispose($hImage)
    _GDIPlus_BitmapDispose($hImageR)
    _GDIPlus_GraphicsDispose($hGraphic2)
EndFunc   ;==>_SetGraphics