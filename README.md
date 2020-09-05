# CK3-IronmanWatcher

Simple Powershell script to watch for when an autosave happens and creates a backup.

# Download

https://github.com/ceakay/CK3-IronmanWatcher/releases/tag/1.0

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
- Sure, why not? I slapped the prompt in to ensure if Backup and Save path were changed to be identical, it won't go crazy with recursion. Comment out lines 10-26 to remove prompt and nothing bad will happen. 

# 1.0 
- Release
