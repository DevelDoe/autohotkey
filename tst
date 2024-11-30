; Configurable delay times for middle mouse button actions
DelayAfterClick := 250
DelayAfterFirstEnter := 500
DelayAfterDoubleClick := 250  ; Delay after double-click before copying
DelayBeforeDoubleClick := 100  ; New delay before the double-click

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

; Sanitize clipboard content by removing unwanted text (e.g., "HOD")
SanitizeClipboard() {
    ClipWait, 1  ; Wait for clipboard to contain data
    if (!ErrorLevel) {
        clipboard := RegExReplace(clipboard, "\s*\(HOD\)\s*$")  ; Remove "(HOD)" at the end
        clipboard := RegExReplace(clipboard, "Copy$")           ; Remove "Copy" if it's at the end
        ; Add more patterns if needed
    }
}

; Override the Tab key to single-click, delay, single-click, delay, double-click, and then copy
Tab::
{
    Click             ; First single click
    Sleep, DelayAfterClick
    Click             ; Second single click
    Sleep, DelayBeforeDoubleClick
    Click 2           ; Double-click to select the text
    Sleep, DelayAfterDoubleClick
    Send, ^c          ; Copy the selected text
    Sleep, 100        ; Small delay to ensure copy action is complete
    SanitizeClipboard()  ; Call function to clean up the clipboard content
}
return

; Make Q key act as Delete
q:: Send, {Delete}

; Make E key act as Alt+H
e:: Send, !h  ; Sends Alt+H

; Press Ctrl+Alt+S to toggle suspend for the entire script with feedback
^!s::
Suspend, Toggle
Tooltip, "Script " . (A_IsSuspended ? "Suspended" : "Active")
Sleep 1000  ; Display the tooltip briefly
Tooltip  ; Remove the tooltip
return


SanitizeClipboard() Function:

