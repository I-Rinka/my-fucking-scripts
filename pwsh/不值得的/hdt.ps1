# 定义模式: 由Tab分割的两个字符串
$name = 'C:\Users\I_Rin\Desktop\try'
$pattern = "^(?<process>.*)\s*pid:(?<pid>.*)\s*type"#尖括号的变量前面加一个问号表明是新的对象，同时由于原来是分为两个字符串用的是(.*)所以就还保留着
# 生成一个由Tab分割的字符串
# 使用正则表达式匹配:
handle.exe $name -nobanner | where { $_ -match $pattern } | foreach { if ($Matches.process -ne 'explorer.exe       ') { Stop-Process $Matches.pid } }
# Stop-Process  $Matches.pid;}
#可以非常成功的运行，接下来是把他改成函数的形式

#最后还要加个提示：是否删除此文件夹？


