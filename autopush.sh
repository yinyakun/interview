#!/bin/bash -l
echo "hello" >> ~/Desktop/time.txt
time=$(date "+%Y-%m-%d %H：%M：%S")
echo "$time" >> ~/Desktop/time.txt
