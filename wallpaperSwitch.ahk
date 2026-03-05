#Requires AutoHotkey v2.0
#NoTrayIcon
#SingleInstance Force

; --- CONFIG ---
folder := "C:\Users\mdlan\OneDrive\Pictures\Wallpapers"
stateFile := A_Temp "\wallcycle_index.txt"

files := LoadWallpapers(folder)

if (files.Length = 0) {
    MsgBox "No wallpapers found in:`n" folder
    ExitApp
}

; --- Hotkey: Win+Shift+W ---
#+w:: {
    global files, stateFile

    index := FileExist(stateFile) ? Integer(Trim(FileRead(stateFile))) : 1
    if (index < 1 || index > files.Length)
        index := 1

    SetWallpaper(files[index])

    next := index + 1
    if (next > files.Length)
        next := 1

    try FileDelete(stateFile)
    FileAppend(next, stateFile)
}

; --- FUNCTIONS ---

LoadWallpapers(folder) {
    arr := []

    Loop Files folder "\*.*" {
        if (A_LoopFileExt ~= "i)jpg|jpeg|png|bmp|webp")
            arr.Push(A_LoopFileFullPath)
    }

    return arr
}

SetWallpaper(path) {
    SPI_SETDESKWALLPAPER := 0x0014
    SPIF_UPDATEINIFILE := 0x01
    SPIF_SENDWININICHANGE := 0x02

    RegWrite(path, "REG_SZ", "HKEY_CURRENT_USER\Control Panel\Desktop", "Wallpaper")

    DllCall("User32.dll\SystemParametersInfoW"
        , "UInt", SPI_SETDESKWALLPAPER
        , "UInt", 0
        , "Str", path
        , "UInt", SPIF_UPDATEINIFILE | SPIF_SENDWININICHANGE)
}