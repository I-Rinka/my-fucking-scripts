function Stop-FolderHandle {
    param($name = 0)
    if ($name -eq 0) {
        "请输入目前无法被删除的文件夹的名字
        如：
        Stop-FolderHandle C:\Users\I_Rin\Desktop\try
        "
    }
    else {
        $pattern = "^(?<name>.*)\s*pid:(?<pid>.*)\s*type"
        handle64.exe $name -nobanner | Where-Object { $_ -match $pattern } | 
        ForEach-Object {
            if ($Matches.name -ne "explorer.exe       ") {
                Stop-Process $Matches.pid
            } 
        }
        do { $myInput = (Read-Host 'Remove Folder? (Y/N)').ToLower() } while ($myInput -notin @('y', 'n'))
        if ($myInput -eq 'y') {
            # 'branch for yes'
            Remove-Item $name -Force -Recurse
        }
        else {
            # 'branch for no'
        }
    }
}
function Get-FolderHandle {
    param($name = 0)
    if ($name -eq 0) {
        "请输入目前无法被删除的文件夹的名字
        如：
        Get-FolderHandle C:\Users\I_Rin\Desktop\try
        "
    }
    else {
        handle64.exe $name -nobann
    }
}