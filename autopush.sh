#!/bin/bash

starttime=$(date "+%Y-%m-%d %H：%M：%S")
fileName=$(date "+%Y-%m-%d")

cd ~/Desktop/git日志文件
touch ${fileName}.txt
infoPath=~/Desktop/git日志文件/${fileName}.txt
echo "===================================" >>$infoPath
echo "开始时间 : $starttime" >> $infoPath
cd /Users/pcsd/LNProject/ios/RetailerHomeIOS

commitInfo=(修复bug 优化代码 更改业务提的需求)

i=$((RANDOM %3))
commit="${commitInfo[$i]}"
echo "修改了分支:" >> $infoPath
git branch >> $infoPath
echo "git status : " >> $infoPath
git status >> $infoPath
git add .
echo "git commit -m" >> $infoPath
echo $commit >> $infoPath
git commit -m $commit
echo "pull 结果:" >>$infoPath
git pull >> $infoPath
echo "git push 结果:" >>$infoPath
git push >> $infoPath

endtime=$(date "+%Y-%m-%d %H：%M：%S")
echo "结束时间 : $endtime" >> $infoPath
echo "---------------------------------" >>$infoPath

