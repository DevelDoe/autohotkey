; Configurable delay times
DelayAfterClick := 250
DelayAfterFirstEnter := 500

; Middle Mouse Button Functionality
MButton::
{
    Click
    Sleep, DelayAfterClick
    Send, ^v
    Send, {Enter}
    Sleep, DelayAfterFirstEnter
    Send, {Enter}
}
return

; Press Ctrl+Alt+S to toggle suspend with visual feedback
^!s::
Suspend, Toggle
Tooltip % "Script " (A_IsSuspended ? "Suspended" : "Active")
Sleep 1000  ; Display the tooltip briefly
Tooltip  ; Remove the tooltip
return