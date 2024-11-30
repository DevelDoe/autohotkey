; Define the delay time in milliseconds
cancelDelay := 100  ; Adjust this value as needed

; A: Close Position (with Cancel Orders first)
*a::  ; The * modifier suppresses the original A key action
    Send, s  ; Presses S to cancel orders
    Sleep, cancelDelay  ; Uses the variable for delay
    Send, a  ; Presses A to close position
    return

; D: Sell at Ask (with Cancel Orders first)
*d::  ; The * modifier suppresses the original D key action
    Send, s  ; Presses S to cancel orders
    Sleep, cancelDelay  ; Uses the variable for delay
    Send, d  ; Presses D to sell at ask
    return
