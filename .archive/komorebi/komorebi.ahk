#SingleInstance Force

; https://github.com/LGUG2Z/komorebi/#generating-common-application-specific-configurations
#Include %A_ScriptDir%\komorebi.generated.ahk
; Manual application-specific settings
#Include %A_ScriptDir%\komorebi_apps.ahk

init() {
    ; Minimize windows when switching worksapces
    Run "komorebic window-hiding-behavior minimize", , "Hide"
    ; Insert instead of swap cross-monitor
    Run "komorebic cross-monitor-move-behavior insert", , "Hide"
    ; Hot reload
    Run "komorebic watch-configuration enable", , "Hide"
    ; Create 9 workspaces on monitor 0
    Run "komorebic ensure-workspaces 0 9", , "Hide"
    ; Remove gaps
    Run "komorebic container-padding 0 0 0", , "Hide"
    Run "komorebic workspace-padding 0 0 0", , "Hide"
    ; Disable mouse following focus
    Run "komorebic toggle-mouse-follow-focus", , "Hide"
}

init()

; TODO: stacking

!f::{
    Run "komorebic toggle-maximize", , "Hide"
}

Loop, 9 {
    Hotkey, !%A_Index%, () => FocusWorkspace(%A_Index% - 1))
}

; Change focus
!h::{
    Run "komorebic focus left", , "Hide"
}
!j::{
    Run "komorebic focus down", , "Hide"
}
!k::{
    Run "komorebic focus up", , "Hide"
}
!l::{
    Run "komorebic focus right", , "Hide"
}

; Move focus
!+h::{
    Run "komorebic move left", , "Hide"
}
!+j::{
    Run "komorebic move down", , "Hide"
}
!+k::{
    Run "komorebic move up", , "Hide"
}
!+l::{
    Run "komorebic move right", , "Hide"
}
