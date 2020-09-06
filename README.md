# CK3-IronmanWatcher

For Crusader Kings 3 Ironman save scumming. Default configuration needs save file to not be a cloud save. 

Simple Powershell script to watch for when an autosave happens and creates a backup. 

# Download

https://github.com/ceakay/CK3-IronmanWatcher/releases/download/1.0/CK3IronmanWatcher.exe

Default settings in EXE (Cloud Save Disabled):
- Save Path: $env:USERPROFILE/Documents/Paradox Interactive/Crusader Kings III/save games/
- Backup Path: $env:USERPROFILE/Documents/Paradox Interactive/Crusader Kings III/save games/Backups/
- FileType: .ck3

If these settings don't work for you, grab the source and change it. 

# FAQ

No one writes their own code. Where'd you steal it from?
- https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/using-filesystemwatcher-correctly-part-2

EXE from powershell??? 
- Not required. Can be run as a powershell script. Haven't tested on PS2.0 (Windows 7 default), but works fineon PS5.1
- Compile the source yourself if you want. https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5

Why not just monitor the whole folder and backup every save that happens? 
- CK3 Ironman creates a temporary save file first before deleting the old one and renaming the temporary file. This prevents saving those temporary files.

# 1.0 
- Release
