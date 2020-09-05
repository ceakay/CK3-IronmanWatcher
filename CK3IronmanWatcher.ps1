#Creates a copy of new autosave to backup folder with timestamp.
# Unabashedly stolen from:
# https://community.idera.com/database-tools/powershell/powertips/b/tips/posts/using-filesystemwatcher-correctly-part-2

#Options - generally don't need to touch this. 
$CK3SavePath = Join-Path $env:USERPROFILE -ChildPath 'Documents/Paradox Interactive/Crusader Kings III/save games/'
$CK3BackupPath = Join-Path $env:USERPROFILE -ChildPath 'Documents/Paradox Interactive/Crusader Kings III/save games/Backups/'
$CK3SaveFileType = '.ck3'
#End Options

#Prompt and specify save file to watch to prevent recursion in case of same backup path
$CK3SaveFile = $null
do {
    #if looped back, file was not found.
    if (-not !$CK3SaveFile) {
        Write-Host "'$CK3SaveFile' is not a valid save name."
    }
    #prompt for name
    $CK3SaveFile = Read-Host -Prompt "Save Name"
    #glue the filetype 
    $CK3SaveFile += $CK3SaveFileType
} until (Get-ChildItem $CK3SavePath -Filter $CK3SaveFile)

#Confirm
"Save file '$CK3SaveFile' found. Watcher Started. Press Ctrl+C to stop."

#Create watcher
$CK3SaveWatcher = New-Object IO.FileSystemWatcher
#Filter for exact file
$CK3SaveWatcher.Filter = $CK3SaveFile
#Monitor only CK3's save path
$CK3SaveWatcher.Path = $CK3SavePath 
#work only in directory
$CK3SaveWatcher.IncludeSubdirectories = $false
#Make events workable
$CK3SaveWatcher.EnableRaisingEvents = $true

#scriptblock for handler
$Action = {
    #Get Path and Name of changed file
    $Path = $Event.SourceEventArgs.FullPath
    $Name = $Event.SourceEventArgs.Name
    Write-Host "Detected autosave on $Name. Backup created."
    #touch the backup file location to create any required folders and files.
    New-Item -ItemType File -Path $(Join-Path $CK3BackupPath -ChildPath $("$Name.$(Get-Date -Format yyMMdd)_$(Get-Date -Format HHmmss)")) -Force
    #copy autosave and overwrite
    Copy-Item $Path -Destination $(Join-Path $CK3BackupPath -ChildPath $("$Name.$(Get-Date -Format yyMMdd)_$(Get-Date -Format HHmmss)")) -Force
}

#job handler
$Handler = . {
    #Paradox creates a temp file somewhere before overwriting save, need to use Renamed instead of Changed.
    Register-ObjectEvent -InputObject $CK3SaveWatcher -EventName Renamed $Action -SourceIdentifier CK3Watcher
}

try {
    #Monitoring. Ctrl+C breaks this loop
    do {
        Wait-Event -Timeout 1
    } while ($true)
} finally {
    #cleanup
    Unregister-Event -SourceIdentifier CK3Watcher
    $Handler | Remove-Job
    $CK3SaveWatcher.EnableRaisingEvents = $false
    $CK3SaveWatcher.Dispose()
    "Backups Stopped."
}

