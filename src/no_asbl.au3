;no_asbl.au3 by kbjunky
;To work this script requires ControlMyMonitor.exe by Nirsoft (https://www.nirsoft.net/utils/control_my_monitor.html)
;How to use at https://github.com/kbjunky/no_asbl
;Author takes no responsibility for any damage caused directly or indirectly by using this script

#include <TrayConstants.au3>
#include <MsgBoxConstants.au3>

$change_delay = 2000   ;delay between contrast increment/decrement in ms
$cycle_delay = 60000    ;cycle delay in ms
$monitor_string = "\\.\DISPLAY1\Monitor0"
$command = "ControlMyMonitor.exe /ChangeValue"
$change_value = 2
$contrast_code = 12

$response = MsgBox($MB_OKCANCEL + $MB_ICONWARNING, "Warning - no_asbl.au3 by kbjunky", "Using this program can damage your monitor! Proceed at your own responsibility.", 10)
if $response == $IDOK Then
    TrayTip("NO_ASBL", "Running", 3, $TIP_ICONASTERISK)

    While True       
        RunWait($command & " """ & $monitor_string & """ " & $contrast_code & " " & (-$change_value))
        Sleep($change_delay) 
        RunWait($command & " """ & $monitor_string & """ " & $contrast_code & " " & $change_value)  
        Sleep($cycle_delay)
    WEnd
EndIf
