#计算文件夹下的所有文件的行号
Get-ChildItem .\ -Recurse *.py | Get-Content | Measure-Object

#计算某一文件的行号
Get-Content .\WinPackage.txt | Measure-Object | Select-Object -Property Count