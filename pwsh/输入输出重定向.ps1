Get-Content input.txt | ./program > output.txt
# pwsh的和unix的shell类似
# | 管道：把当前对象的输出重新定向到下一个程序的输入
# 如： type .\intput.txt|.\helloWorld.exe|.\helloWorld2.exe

# > 把输出重新定向到另一个文本文件，方法是完全覆盖当前内容
# >> 把输出重新定向到另一个文本文件，方法是在行后追加
