# CK3-IronmanWatcher

Simple Powershell script to watch for when an autosave happens and creates a backup. For Crusader Kings 3 Ironman save scumming.

# Download

https://github.com/ceakay/CK3-IronmanWatcher/releases/download/1.0/CK3IronmanWatcher.exe

Default settings in EXE:
- Save Path: $env:USERPROFILE/Documents/Paradox Interactive/Crusader Kings III/save games/
- Backup Path: $env:USERPROFILE/Documents/Paradox Interactive/Crusader Kings III/save games/Backups/
- FileType: .ck3

If these settings don't work for you, grab the source and change it. 

# FAQ

No one writes their own code. Where'd you steal it from?
- https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/using-filesystemwatcher-correctly-part-2

EXE from powershell??? 
- Compile the source yourself if you want. https://gallery.technet.microsoft.com/scriptcenter/PS2EXE-GUI-Convert-e7cb69d5

Why not just monitor the whole folder and backup every save that happens? 
- CK3 Ironman creates a temporary save file first before deleting the old one and renaming the temporary file. This prevents saving those temporary files.

# 1.0 
- Release
