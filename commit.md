### 半自动化脚本

#### 作用

在commit的时候每次都要复制代码，太麻烦了，填写相应参数直接执行。

#### 代码实现

```bash
#!/bin/bash
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
```

#### 使用示例

在git-bash中调用即可

***

```bash
$ ./commit.sh 1 commit.sh 日常更新
```

参数说明：

* 1
  选择方式1，逐个文件添加
* commit.sh
  文件名
* 日常更新
  "<>"中的内容

***

```bash
$ ./commit.sh 2 修改::错误语法
```

参数说明：

* 2
  选择方式2，添加所有文件
* 修改::错误语法
  "<>"中的内容

***