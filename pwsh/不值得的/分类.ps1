#加载文件，并过滤空行
$fullText = Get-Content '.\try.txt' | where { !([string]::IsNullOrWhiteSpace($_)) }
#寻找文件头开始标志
$startFlagIndex = -1
For ($i = 0; $i -lt $fullText.Length; $i++) {
    if ($fullText[$i].Contains("~")) {
        $startFlagIndex = $i
        break
    }
 
}
#去掉文件头
$fullText = $fullText | Select-Object -Skip ($startFlagIndex + 1)
 
<#
 #将文件转换成CSV格式，然后再从CSV转换成对象
 #几经周折后，再要深入进行数据处理，将会变得非常方便
#>
$objs = $fullText | foreach {
    $tokens = $_.Split(' ', [StringSplitOptions]::RemoveEmptyEntries)
    '"{0}"' -f [string]::Join('","', $tokens)
} | ConvertFrom-Csv
 
#统计放射性值不为空的对象
Write-Host "统计放射性值为空的对象"
$objs | where { $_.放射性值 -ne $null } | Format-Table -AutoSize
 
#求所有电阻值的个数，平均值，总和，最大值，最小值
Write-Host "求所有电阻值的个数，平均值，总和，最大值，最小值:"
$objs | Measure-Object -Property 'shit' -Average -Sum -Maximum -Minimum