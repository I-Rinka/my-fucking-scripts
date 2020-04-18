#计算传入参数的个数
function sayHello {
    if ($args.Count -eq 0) {
        "No argument!"
    }
    else {
        $args | ForEach-Object { "Hello,$($_)" }
    }
}