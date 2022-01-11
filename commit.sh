#!/bin/bash
#半自动化git提交
#变量含义
#1:逐个add 2:全部add
choice=$1
if [ $1 -eq 1 ]; then
    #文件名
    filename=$2
    #备注
    notes=$3
    echo "git add $2"
    echo "git commit -m \"[`date +%Y/%m/%d/%T`]<$3>: commit by `git config --global --list|grep user.name|awk -F\"=\" '{print $2}'`\""
    
    read -p "Continue (y/n)?" choice
    case "$choice" in 
    y|Y ) ;;
    * ) $"exit";;
    esac

    git add $2
    git commit -m "[`date +%Y/%m/%d/%T`]<$3>: commit by `git config --global --list|grep user.name|awk -F\"=\" '{print $2}'`"
fi
if [ $1 -eq 2 ]; then
    #备注
    notes=$2
    echo "git add ."
    echo "git commit -m \"[`date +%Y/%m/%d/%T`]<$2>: commit by `git config --global --list|grep user.name|awk -F\"=\" '{print $2}'`\""
    
    read -p "Continue (y/n)?" choice
    case "$choice" in 
    y|Y ) ;;
    * ) $"exit";;
    esac
    
    git add .
    git commit -m "[`date +%Y/%m/%d/%T`]<$2>: commit by `git config --global --list|grep user.name|awk -F\"=\" '{print $2}'`"
fi