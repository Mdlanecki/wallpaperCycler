# Wallpaper Cycle

A lightweight Windows utility that cycles through wallpapers from a folder using a hotkey.

Press **Win + Shift + W** to switch to the next wallpaper in the folder. The program remembers the last wallpaper used so it continues the cycle each time.

---

## Features

- Cycle wallpapers with a hotkey  
- Remembers last position between uses  
- Runs silently in the background  
- No UI or tray icon  
- Supports common image formats (`jpg`, `jpeg`, `png`, `bmp`, `webp`)

---

## Usage

After the program is running, press:
Win + Shift + W

Each press changes the wallpaper to the next image in the folder.

---

## Wallpaper Folder

The script loads wallpapers from a "Wallpaper" folder (which the user needs to make) within the "Pictures" folder native to windows.

---

## Installation

1. Download **WallpaperCycle.exe** from the repository.

2. Open the Windows startup folder:
   Win + R
   shell:startup

3. Move **WallpaperCycle.exe** into that folder.

This ensures the program runs automatically when Windows starts so the hotkey is always available.

---

## Requirements

If using the provided executable:
- No additional software required

If running the script directly:
- AutoHotkey v2
