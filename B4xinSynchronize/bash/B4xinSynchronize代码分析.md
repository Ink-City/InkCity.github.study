# <a name="B4xinSynchronize代码分析笔记">B4xinSynchronize代码分析笔记</a> 

## <a name="目录">目录</a> 

### <a name="自动目录">自动目录</a> 

[TOC]

### <a name="手动目录">手动目录</a> 

<update 2022/1/16 21:49>

<a href="#B4xinSynchronize代码分析笔记">B4xinSynchronize代码分析笔记</a> </br> 
├────&nbsp;&nbsp;<a href="#目录">目录</a> </br> 
├────────&nbsp;&nbsp;<a href="#自动目录">自动目录</a> </br> 
├────────&nbsp;&nbsp;<a href="#手动目录">手动目录</a> </br> 
├────&nbsp;&nbsp;<a href="#Sclient.sh">Sclient.sh</a> </br> 
├────────&nbsp;&nbsp;<a href="#Sclient.sh-源码">源码</a> </br> 
├────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析">基础代码分析</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 2">Code Line 2</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 3-5">Code Line 3-5</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 7">Code Line 7</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Code Line 17-32 `run_Main()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 35-47 `Remember_Me_Fun()`">Code Line 35-47 `Remember_Me_Fun()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`">Code Line 50-61 `Ask_From_Me()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 62-76 `differentWorkspace_mode_fun()`">Code Line 62-76 `differentWorkspace_mode_fun()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 78-87 `sameWorkspace_mode_fun()`">Code Line 78-87 `sameWorkspace_mode_fun()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 89-97 `git_valid_check()`">Code Line 89-97 `git_valid_check()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 99-116 `Synchronize_update_fun()`">Code Line 99-116 `Synchronize_update_fun()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sclient.sh-基础代码分析-Code Line 120-145">Code Line 120-145</a> </br> 
├────&nbsp;&nbsp;<a href="#Sserver.sh">Sserver.sh</a> </br> 
├────────&nbsp;&nbsp;<a href="#Sserver.sh-源码">源码</a> </br> 
├────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析">基础代码分析</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析-Code Line 3">Code Line 3</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析-Code Line 5-36 `Loading_Percent_Show()`">Code Line 5-36 `Loading_Percent_Show()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析-Code Line 38-57 `CrontabPlan_Main()`">Code Line 38-57 `CrontabPlan_Main()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析-Code Line 59-64 `Print_Auto_Show()`">Code Line 59-64 `Print_Auto_Show()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析-Code Line 65-69 `Check_Crontab_list()`">Code Line 65-69 `Check_Crontab_list()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析-Code Line 70-77 `Run_Main()`">Code Line 70-77 `Run_Main()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#Sserver.sh-基础代码分析-Code Line 79-85">Code Line 79-85</a> </br> 
├────&nbsp;&nbsp;<a href="#functions \ banners.sh">functions \ banners.sh</a></br> 
├────────&nbsp;&nbsp;<a href="#functions \ banners.sh-源码">源码</a> </br> 
├────────&nbsp;&nbsp;<a href="#functions \ banners.sh-基础代码分析">基础代码分析</a> </br> 
├────────────&nbsp;&nbsp;<a href="#functions \ banners.sh-基础代码分析-Code Line 3-11 `banners_show()`">Code Line 3-11 `banners_show()`</a> </br> 
├────&nbsp;&nbsp;<a href="#functions \ color_print_fun.sh">functions \ color_print_fun.sh</a> </br> 
├────────&nbsp;&nbsp;<a href="#functions \ color_print_fun.sh-源码">源码</a> </br> 
├────────&nbsp;&nbsp;<a href="#functions \ color_print_fun.sh-基础代码分析">基础代码分析</a> </br> 
├────&nbsp;&nbsp;<a href="#functions \ proxy.sh">functions \ proxy.sh</a> </br> 
├────────&nbsp;&nbsp;<a href="#functions \ proxy.sh-源码">源码</a> </br> 
├────────&nbsp;&nbsp;<a href="#functions \ proxy.sh-基础代码分析">基础代码分析</a> </br> 
├────────────&nbsp;&nbsp;<a href="#functions \ proxy.sh-基础代码分析-Code Line 3-16 `proxy_set()`">Code Line 3-16 `proxy_set()`</a> </br> 
├────────────&nbsp;&nbsp;<a href="#functions \ proxy.sh-基础代码分析-Code Line 18-33 `proxy_unset()`">Code Line 18-33 `proxy_unset()`</a> </br> 
├────&nbsp;&nbsp;<a href="#Note">Note</a> </br> 
└────&nbsp;&nbsp;<a href="#TODO">TODO</a> </br> 

***

***

## <a name="Sclient.sh">Sclient.sh</a> 

### <a name="Sclient.sh-源码">源码</a> 

<details><summary>代码</summary>

```bash
#!/bin/bash
whereAmI=$(pwd)
source ./functions/color_print_fun.sh
source ./functions/banners.sh
source ./functions/proxy.sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

##
#use if statement to judge detection working mode
#set type to dw==diferent workspace: your blog (jekyll server) work space different from git workspace;
#such as your jekyll build '_site' dir equals to ~/blog/jekyll/www/_site/ , git(master) dir equals to ~/blog/git/{yourname}.github.io/
#so use {dw}.
##

run_Main() {
  proxy_main
  ##Determine the operating mode of the incoming parameters
  ##mode dw to run.
  if [ $run_mode = "dw" ]; then
    info_show "[`date +%Y/%m/%d/%T`] [Info] Running mode is: $run_mode mode now"
    differentWorkspace_mode_fun
  ##mode sw to run.
  elif [ $run_mode = "sw" ]; then
    info_show "[`date +%Y/%m/%d/%T`] [Info] Running mode is: $run_mode mode now"
    sameWorkspace_mode_fun
  ##
  elif [ $run_mode = "config" ]; then
    Remember_Me_Fun
  fi
}
##~in beta~ Wed, 19 May 2021 10:38:03 +0800
# It looks running good
Remember_Me_Fun() {
  if [ ! -s "./config/user_config.sh" ]; then
    touch config/user_config.sh
    echo testPra=$testPra >>config/user_config.sh
    echo testPra1=$testPra >>config/user_config.sh
    echo testPra2=$testPra >>config/user_config.sh

  elif [ -s "./config/user_config.sh" ]; then
    #statements
    echo "user_config存在."
  fi
  Ask_From_Me
}
##~in beta~ Wed, 19 May 2021 10:38:17 +0800
##ask_from_me() : to detected user config info. detected user's config quickly.
Ask_From_Me() {
  source ./config/user_config.sh
  # shellcheck disable=SC2154
  common_show "Detected user's conf files in ./config/user_config.sh"
  array=($(cat ./config/user_config.sh | grep options_project | awk -F'"' '{i = 1; while (i <= NF) {if ($i ~/=$/) print $(i+1);i++}}'))
  info_show "[`date +%Y/%m/%d/%T`] [Info] Detected :"
  for i in "${!array[@]}"; do
    common_show "[Repo $i] : ${array[$i]}"
    sleep 0.1
  done

}
differentWorkspace_mode_fun() {
  Ask_From_Me
  optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")
  read -p "$optional_msg" user_option_input
  optional_projects_gitPath=_dw_${array[user_option_input]}_gitPath
  optional_projects_buildPath=_dw_${array[user_option_input]}_buildPath
  eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
  eval optional_repo_buildPath=$(echo \$$optional_projects_buildPath)
  ##start to use rsync(update & delete) all dir excpet '--exclude0-from'
  ##bash func test mode.
  git_valid_check
  info_show "[`date +%Y/%m/%d/%T`] [Info] running Synchronize update from $optional_repo_buildPath to $optional_repo_gitPath"
  rsync -avpz --delete-before --exclude-from functions/exclue_delete_files.txt $optional_repo_buildPath/ $optional_repo_gitPath/
  cd $optional_repo_gitPath && Synchronize_update_fun
}

sameWorkspace_mode_fun() {
  Ask_From_Me
  optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")
  read -p "$optional_msg" user_option_input
  optional_projects_gitPath=_sw_${array[user_option_input]}_gitPath
  eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
  git_valid_check
  info_show "[`date +%Y/%m/%d/%T`] [Info] Directly jumping to Synchronize update..."
  cd $optional_repo_gitPath && Synchronize_update_fun
}

git_valid_check() {
  check_vaild_gitRepo=$(cd $optional_repo_gitPath && git rev-parse --is-inside-work-tree)
  if [ "$check_vaild_gitRepo" == "true" ]; then
    common_show "[`date +%Y/%m/%d/%T`] $optional_repo_gitPath is a valid git repository. \n But the current working directory may not be the top level. Check the output of the git rev-parse command if you care)"
  else
    critical "[`date +%Y/%m/%d/%T`] [CRITICAL] Invalid git repository!!"
    exit
  fi
}

Synchronize_update_fun() {
  #if git,then
  info_show "[`date +%Y/%m/%d/%T`] [Info] Synchronize update is running in $optional_repo_gitPath"
  # i want to add commit names Distinguish by every different files (git files name) here
  # such as :
  # README.MD  README.MD file Mon, 31 May 2021 22:54:09 +0800 commit by B4xinSynchronize.
  # but exactly: This feature has not yet been implemented
  #
  # git_commit_filename=`git log --pretty=format:"" --name-only  -1`
  commit_author=`git config --global --list|grep user.name|awk -F"=" '{print $2}'`
  echo -e "\033[32m[`date +%Y/%m/%d/%T`] [Info] Synchronize update is running. \033[0m"
  git add .
  git commit -m "[`date +%Y/%m/%d/%T`] B4xinSync: commit by $commit_author."
  git push
  sleep 1
  proxy_unset
  exit
}

##Define Incoming running mode parameters exchange to galbol para.
##firstly to run this program. Read user input to ensure.
run_mode="$1"
read_msg=$(echo -e "\033[32m[`date +%Y/%m/%d/%T`] [Info] Are you sure?(y/n): \033[0m")
warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")


if [ "$run_mode" != 'dw' ] && [ "$run_mode" != 'sw' ] && [ "$run_mode" != 'config' ]; then
  critical "[`date +%Y/%m/%d/%T`] [CRITICAL] ERROR INPUT! \nType in parameter error Usage: bash Sclient.sh <config|dw|sw>"
  exit
fi

read -p "$read_msg" go
while [ "$go" != 'y' ] && [ "$go" != 'n' ] && [ "$go" != '' ]; do
  read -p "$warn_msg" go
done

if [ "$go" == 'n' ]; then
  underline_warn_show "[`date +%Y/%m/%d/%T`] [Warn] Detected user input [no]. \nQuit!"
  sleep 0.9
  exit
fi
##Determine whether the incoming parameters are recognized by the program
##otherwise the program will exit abnormally, let the program judge by itself.

##so,what i want to show you exactly is:
##Clear program framework and running status, good code style will make work easier
run_Main
##redirect to main func , and main func defined what program will do next one by one or run Concurrently.
```
</details>

***

### <a name="Sclient.sh-基础代码分析">基础代码分析</a> 

#### <a name="Sclient.sh-基础代码分析-Code Line 2">Code Line 2</a> 

* ```bash
  whereAmI=$(pwd)
  ```

  当前目录的绝对路径

  `$(pwd)` 等价于 `$PWD ` 

#### <a name="Sclient.sh-基础代码分析-Code Line 3-5">Code Line 3-5</a> 

* ```bash
  source ./functions/color_print_fun.sh
  source ./functions/banners.sh
  source ./functions/proxy.sh
  ```

  执行脚本，结合后续的代码实现更像是导入文件，调用其中的函数

  除此之外还有三种脚本执行方法 `sh` 、 `bash` 、 `./` 。

  1.  `source` 

     ```bash
     source [filename]
     ```

     作用：在当前bash环境下读取并执行FileName中的命令。该filename文件可以无"执行权限"  注：该命令通常用命令“.”来替代。

     `source [filename]` 和 `. [filename]` 两者等效。

     source(或点)命令通常用于重新执行刚修改的初始化文档。

     source命令(从 C Shell 而来)是bash shell的内置命令。

     点命令，就是个点符号，(从Bourne Shell而来)。

  2.  `sh` 和 `bash` 

     ```bash
     sh [filename]
     bash [filename]
     ```

     作用：在当前bash环境下读取并执行 [filename] 中的命令。该 [filename] 文件可以无"执行权限"

     注：两者在执行文件时的不同，是分别用自己的shell来跑文件。

     sh使用“-n”选项进行shell脚本的语法检查，使用“-x”选项实现shell脚本逐条语句的跟踪，可以巧妙地利用shell的内置变量增强“-x”选项的输出信息等。

     *  `sh -x` 

       调试脚本，在脚本中从 `set -x` 开始，直到 `set +x` 结束，终端中输出每条语句的信息。

       ![image-20220112172112261](D:\Typora\Images\image-20220112172112261.png) 

  3.  `./` 

     ```bash
     ./[filename]
     ```

     作用：打开一个子shell来读取并执行 [filename] 中命令

     注：运行一个shell脚本时会启动另一个命令解释器

     每个 shell 脚本有效地运行在父 shell ( parent shell ) 的一个子进程里

     这个父 shell 是指在一个控制终端或在一个 xterm 窗口中给你命令指示符的进程

     shell 脚本也可以启动他自已的子进程

     这些子 shell ( 即子进程 ) 使脚本并行地，有效率地地同时运行脚本内的多个子任务

#### <a name="Sclient.sh-基础代码分析-Code Line 7">Code Line 7</a> 

* ```bash
  export PATH
  export [-frp][variablename]=[value]
  ```

  修改变量

  **参数说明：** 

  * -f 　代表[变量名称]中为函数名称。
  * -n 　删除指定的变量。变量实际上并未删除，只是不会输出到后续指令的执行环境中。
  * -p 　列出所有的shell赋予程序的环境变量。

#### <a name="Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Code Line 17-32 `run_Main()`</a> 

* ```bash
  run_Main() {
    proxy_main
    ##Determine the operating mode of the incoming parameters
    ##mode dw to run.
    if [ $run_mode = "dw" ]; then
      info_show "[`date +%Y/%m/%d/%T`] [Info] Running mode is: $run_mode mode now"
      differentWorkspace_mode_fun
    ##mode sw to run.
    elif [ $run_mode = "sw" ]; then
      info_show "[`date +%Y/%m/%d/%T`] [Info] Running mode is: $run_mode mode now"
      sameWorkspace_mode_fun
    ##
    elif [ $run_mode = "config" ]; then
      Remember_Me_Fun
    fi
  }
  ```

* Code Line 1

  ```bash
  run_Main() {
  	...
  }
  ```

  定义函数

  **基本语法：** 
  
  * ```bash
    [ function ] funname [()]
    {
        action;
        [return int;]
    }
    ```
  
  **注意：** 
  
  * 可以带 `function fun()` 定义，也可以直接 `fun()` 定义,不带任何参数。
  
  * 参数返回，可以显示加： `return` 返回，如果不加，将以最后一条命令运行结果，作为返回值。  `return` 后跟数值 `n` ( 0-255 ) 
  
  * 在 Shell 中，调用函数时可以向其传递参数。在函数体内部，通过 `$n` 的形式来获取参数的值，例如， `$1` 表示第一个参数， `$2` 表示第二个参数
  
  *  `$10` 不能获取第十个参数，获取第十个参数需要 `${10}` 。当 `n` >=10时，需要使用 `${n}` 来获取参数
  
  * | 参数 | 含义                                                         |
    | :--: | ------------------------------------------------------------ |
    |  $#  | 传递到脚本或函数的参数个数                                   |
    |  $*  | 以一个单字符串显示所有向脚本传递的参数                       |
    |  $$  | 脚本运行的当前进程ID号                                       |
    |  $!  | 后台运行的最后一个进程的ID号                                 |
    |  $@  | 与$*相同，但是使用时加引号，并在引号中返回每个参数。         |
    |  $-  | 显示Shell使用的当前选项，与set命令功能相同。                 |
    |  $?  | 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误。 |
  
  **示例：** 
  
  * ```bash
    demoFun(){
        echo "这是我的第一个 shell 函数!"
    }
    echo "-----函数开始执行-----"
    demoFun
    echo "-----函数执行完毕-----"
    ```
  
    结果：
  
    ```bash
    -----函数开始执行-----
    这是我的第一个 shell 函数!
    -----函数执行完毕-----
    ```
  
  * ```bash
    funWithReturn(){
        echo "这个函数会对输入的两个数字进行相加运算..."
        echo "输入第一个数字: "
        read aNum
        echo "输入第二个数字: "
        read anotherNum
        echo "两个数字分别为 $aNum 和 $anotherNum !"
        return $(($aNum+$anotherNum))
    }
    funWithReturn
    echo "输入的两个数字之和为 $? !"
    ```
  
    结果：
  
    ```bash
    这个函数会对输入的两个数字进行相加运算...
    输入第一个数字: 
    1
    输入第二个数字: 
    2
    两个数字分别为 1 和 2 !
    输入的两个数字之和为 3 !
    ```
  
     `$?` 表示上一条指令的返回值
  
  * ```bash
    funWithParam(){
        echo "第一个参数为 $1 !"
        echo "第二个参数为 $2 !"
        echo "第十个参数为 $10 !"
        echo "第十个参数为 ${10} !"
        echo "第十一个参数为 ${11} !"
        echo "参数总数有 $# 个!"
        echo "作为一个字符串输出所有参数 $* !"
    }
    funWithParam 1 2 3 4 5 6 7 8 9 34 73
    ```
  
    结果：
  
    ```bash
    第一个参数为 1 !
    第二个参数为 2 !
    第十个参数为 10 !
    第十个参数为 34 !
    第十一个参数为 73 !
    参数总数有 11 个!
    作为一个字符串输出所有参数 1 2 3 4 5 6 7 8 9 34 73 !
    ```
  
  * 
  
* Code Line 5

  ```bash
  if [ $run_mode = "dw" ]; then
  	...
  fi
  ```

  `if` 判断语句

  当参数 `run_mode` 的值等于 `"dw"` 时进入第一个分支。
  
  当参数 `run_mode` 的值等于 `"sw"` 时进入第二个分支。
  
  当参数 `run_mode` 的值等于 `"config"` 时进入第三个分支。
  
  **参数说明：** 

  * **用法：** 
    
    ```bash
    if [ value -eq value ]
    ```
  
    表达式为真即为真
    
    | 参数 | 含义   | 参数 | 含义     | 参数 | 含义     |
    | :--: | :----- | :--: | :------- | ---- | :------- |
    | -eq  | 等于   | -gt  | 大于     | -lt  | 小于     |
    | -ne  | 不等于 | -ge  | 大于等于 | -le  | 小于等于 |
    |  -a  | and    |  -r  | or       | !    | 非       |
    |  &&  | 逻辑与 | \|\| | 逻辑或   | ==   | 等于     |
    |  !=  | 不等   |  >   | 大于     | <    | 小于     |
    
  * **用法：** 
    
    ```bash
    if [ -a filename]
    if [ ! -a filename]
    ```
  
    以下含义均为真
    
    
    | 参数 | 含义                                                    | 参数 | 含义                                                         | 参数 | 含义                                             |
    | :--: | :------------------------------------------------------ | :--: | :----------------------------------------------------------- | :--: | ------------------------------------------------ |
    |  -a  | <font color = "red">存在</font>                         |  -b  | <font color = "red">存在</font> ，是块特殊文件               |  -c  | <font color = "red">存在</font> ，是字符特殊文件 |
    |  -d  | <font color = "red">存在</font> ，是一个目录            |  -e  | <font color = "red">存在</font> ，与 `-a` 相同               |  -f  | <font color = "red">存在</font> ，是正规文件     |
    |  -g  | <font color = "red">存在</font> ，已设置 `setgid(2)` 位 |  -G  | <font color = "red">存在</font> ，组ID与此进程相同           |  -k  | <font color = "red">存在</font> ，设置了其粘滞位 |
    |  -L  | <font color = "red">存在</font> ，是符号链接            |  -n  | 字符串长度不是零                                             |  -o  | 已在上设置命名选项                               |
    |  -O  | <font color = "red">存在</font> ，由此进程的用户ID拥有  |  -p  | <font color = "red">存在</font> ，是先进先出、特殊文件或命名管道 |  -r  | <font color = "red">存在</font> ，用户可读       |
    |  -s  | <font color = "red">存在</font> ，大小大于零            |  -S  | <font color = "red">存在</font> ，是套接字                   |  -t  | 文件描述符(默认为1)指定的设备为终端时            |
    |  -u  | <font color = "red">存在</font> ，已设置 `setuid(2)` 位 |  -w  | <font color = "red">存在</font> ，用户可写                   |  -x  | <font color = "red">存在</font> ，用户可执行     |
    |  -z  | 字符串长度为零                                          |      |                                                              |      |                                                  |
    
  
  **单分支：** 
  
  1. ```bash
     #if单分支第一中形式：if []
     if [ 1 -eq 1 ] #[]里面的数据和中括号必须一个空格 
     then
     	echo "first if:真"
     fi
     ```
     
  2. ```bash
     #if单分支第二中形式：if []; then
     if [ 1 -eq 1 ]; then #then和if写在同一行必须要用; 
     	echo "second if:真"
     fi
     ```
  
  3. ```bash
     #if单分支第三中形式：if (())
     if ((1==1))
     then
     	echo "third if:真"
     fi
     ```
  
  **多分支：** 
  
  1. ```bash
     if ((1==0)) #判断1和o是不是相等
     then
     	echo "1=0；是真的"
     elif ((1>0))
     then
     	echo "1>0;是真的"
     else
     	echo "1>0;是假的"
     fi
     ```
     
  2. ```bash
     if [ 1 -eq 0 ] #判断1和o是不是相等
     then
     	echo "1=0；是真的"
     elif [ 1 -gt 0 ]
     then
     	echo "1>0;是真的"
     else
     	echo "1>0;是假的"
     fi
     ```
  
  **多重判断： **
  
  `if` 和 `then` 任然可以写在一行。
  
  1. ```bash
     if (( a > b )) && (( a < c ))
     ...
     ```
     
  2. ```bash
     if [[ $a > $b ]] && [[ $a < $c ]]
     ...
     ```
     
  3. ```bash
     if [ $a -gt $b -a $a -lt $c ]
     ...
     ```
  
* Code Line 14

  ```bash
  Remember_Me_Fun
  ```
  
  调用函数

  如果需要传入参数，像调用脚本一样传参即可

  ```bash
  Function value1 value2 ...
  ```

***

#### <a name="Sclient.sh-基础代码分析-Code Line 35-47 `Remember_Me_Fun()`">Code Line 35-47 `Remember_Me_Fun()`</a> 

* ```bash
  Remember_Me_Fun() {
    if [ ! -s "./config/user_config.sh" ]; then
      touch config/user_config.sh
      echo testPra=$testPra >>config/user_config.sh
      echo testPra1=$testPra >>config/user_config.sh
      echo testPra2=$testPra >>config/user_config.sh
  
    elif [ -s "./config/user_config.sh" ]; then
      #statements
      echo "user_config存在."
    fi
    Ask_From_Me
  }
  ```

* Code Line 2-11

  ```bash
  if [ ! -s "./config/user_config.sh" ]; then
  	...
  fi
  ```

  `if` 语句，见 <a href="#Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`</a> 中 `if` 语句

* Code Line 3

  ```bash
  touch config/user_config.sh
  ```

  创建文件，可带上后缀

  ```bash
  touch [filename]
  ```

* Code Line 4-6

  ```bash
  echo testPra=$testPra >>config/user_config.sh
  echo testPra1=$testPra >>config/user_config.sh
  echo testPra2=$testPra >>config/user_config.sh
  ```
  
  输出语句
  
  *  `>>` 表示将内容追加输出到某个文件内
  
    ```bash
    echo [value] >> [filename]
    ```
  
  *  `>` 表示将内容覆盖输出到某个文件内
  
    ```bash
    echo [value] >> [filename]
    ```
  
  * 显示普通字符串
  
    ```bash
    echo "It is a test"
    echo It is a test
    ```
  
  * 显示转义字符
  
    ```bash
    echo "\"It is a test\""
    ```
  
    输出
  
    ```bash
    "It is a test"
    ```
  
  * 显示变量
  
    ```bash
    echo $name
    ```
  
  * 显示换行 / 不换行
  
    ```bash
    echo -e "\n"
    echo -e "\c"
    ```
  
    *  `-e` 开启转义可以转移换行（ `\n` ）、不换行（ `\c` ）等
  
  * 执行语句
  
    ```bash
    echo `date`
    ```
  
    输出
  
    ```bash
    Sun Jan 16 18:11:29 2022
    ```

***

#### <a name="Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`">Code Line 50-61 `Ask_From_Me()`</a> 

* ```bash
  Ask_From_Me() {
    source ./config/user_config.sh
    # shellcheck disable=SC2154
    common_show "Detected user's conf files in ./config/user_config.sh"
    array=($(cat ./config/user_config.sh | grep options_project | awk -F'"' '{i = 1; while (i <= NF) {if ($i ~/=$/) print $(i+1);i++}}'))
    info_show "[`date +%Y/%m/%d/%T`] [Info] Detected :"
    for i in "${!array[@]}"; do
      common_show "[Repo $i] : ${array[$i]}"
      sleep 0.1
    done
  
  }
  ```

* Code Line 2

  ```bash
  source ./config/user_config.sh
  ```

  导入文件，见 <a href="#Sclient.sh-基础代码分析-Code Line 3-5">Sclient.sh-基础代码分析-Code Line 3-5</a> 

* Code Line 4

  ```bash
  common_show "Detected user's conf files in ./config/user_config.sh"
  ```

   `common_show` 函数，见 <a href="#functions \ color_print_fun.sh">functions \ color_print_fun.sh</a> 

* Code Line 5

  ```bash
  array=($(cat ./config/user_config.sh | grep options_project | awk -F'"' '{i = 1; while (i <= NF) {if ($i ~/=$/) print $(i+1);i++}}'))
  ```

  将文件中符合要求的字符串作为参数传入 `array` 数组

  * **逐命令分析：** 

    1. ```bash
       cat ./config/user_config.sh
       ```

       读取文件内容，参数传入下一条语句

       **基本语法：** 
       
       * ```bash
         cat [-AbeEnstTuv] [--help] [--version] fileName
         ```
       
       * 将 `...` 覆盖写入 1.txt 文件中
       
         结束符 `EOF` 前不能有空格或者制表符
       
         ```bash
         cat > 1.txt <<EOF
         ...
         EOF
         ```
       
         如果在结束符前加一个 `-` 就可以无视结束符前面的制表符
       
         ``` bash
         cat > 1.txt <<-EOF
         ...
         	EOF
       
       * 将 `...` 追加写入 1.txt 文件中
       
         结束符 `EOF` 前不能有空格或者制表符
       
         ````bash
         cat >> 1.txt <<EOF
         ...
         EOF
         ````
       
         如果在结束符前加一个 `-` 就可以无视结束符前面的制表符
       
         ``` bash
         cat >> 1.txt <<-EOF
         ...
         	EOF
       
       **注意：** 
       
       *  `EOF` 是可更换的结束符标志
       
       **参数说明：** 
       
       *  `-n` 或 `--number` 由 1 开始对所有输出的行数编号
       *  `-b` 或 `--number-nonblank` 和 `-n` 相似，只不过对于空白行不编号
       *  `-s` 或 `--squeeze-blank` 当遇到有连续两行以上的空白行，就代换为一行的空白行
       *  `-v` 或 `--show-nonprinting` 使用 `^` 和 `M-` 符号，除了 `LFD` 和 `TAB` 之外
       *  `-E` 或 `--show-ends` 在每行结束处显示 `$` 
       *  `-T` 或 `--show-tabs` 将 `TAB` 字符显示为 `^I` 
       *  `-A` 或 `--show-all` 等价于 `-vET` 
       *  `-e` 等价于 -`vE` 选项
       *  `-t` 等价于 `-vT` 选项
       
       **实例：** 
       
       * 把 textfile1 的文档内容加上行号后输入 textfile2 这个文档里：
       
         ```bash
         cat -n textfile1 > textfile2
         ```
       
       * 把 textfile1 和 textfile2 的文档内容加上行号（空白行不加）之后将内容附加到 textfile3 文档里：
       
         ```bash
         cat -b textfile1 textfile2 >> textfile3
         ```
       
       * 清空 /etc/test.txt 文档内容：
       
         ```bash
         cat /dev/null > /etc/test.txt
         ```
       
       * cat 也可以用来制作镜像文件。例如要制作软盘的镜像文件，将软盘放好后输入：
       
         ```bash
         cat /dev/fd0 > OUTFILE
         ```
       
       * 相反的，如果想把 image file 写到软盘，输入：
       
         ```bash
         cat IMG_FILE > /dev/fd0
         ```
       
       **注意：** 
       
       * OUTFILE 指输出的镜像文件名。
       * IMG_FILE 指镜像文件。
       * 若从镜像文件写回 device 时，device 容量需与相当。
       * 通常用制作开机磁片。
       
    2. ```bash
       grep options_project
       ```

       筛选出带有字符串 "options_project" 的每一行作为参数传入下一条语句

    3. ```bash
       awk -F'"' '{i = 1; while (i <= NF) {if ($i ~/=$/) print $(i+1);i++}}'
       ```

       截取字符串并输出

        `-F` 见下方 **`awk` 指令参数** 

        `'"'` 自定义分隔符 `"` 

        `i <= NF` awk语句中， `$0` 表示所有参数， `$1` 表示第一个， `$NF` 表示最后一个，具体内置变量见下方 **`awk` 内置变量** 

        `if ($i ~/=$/) print $(i+1);i++` 如果 `$i` 变量中含有 `“=”` 打印 `$(i+1)` 变量， `i++` 

  *  `|` 管道符，管道左边表达式的输出作为右边表达式的输入，也可以多个管道

    **示例：** 

    ```bash
    rpm -qa | grep licq
    ```

    这条命令使用一个管道符“|”建立了一个管道。管道将rpm -qa命令的输出（包括系统中所有安装的RPM包）作为grep命令的输入，从而列出带有licq字符的RPM包来

    ```bash
    cat /etc/passwd | grep /bin/bash | wc -l
    ```

    这条命令使用了两个管道，利用第一个管道将cat命令（显示passwd文件的内容）的输出送给grep命令，grep命令找出含有“/bin /bash”的所有行；第二个管道将grep的输出送给wc命令，wc命令统计出输入中的行数。这个命令的功能在于找出系统中有多少个用户使用bash

  *  `grep` 文本搜索工具

    ```bash
    grep [options]
    ```

    **主要参数：** 

    |     参数      | 含义                                   |     参数      | 含义               |  参数   | 含义                               |
    | :-----------: | -------------------------------------- | :-----------: | ------------------ | :-----: | ---------------------------------- |
    |      -c       | 只输出匹配行的计数                     | -I ( 大写 i ) | 不区分单字符大小写 |   -h    | 查询多文件时不显示文件名           |
    | -l ( 小写 L ) | 查询多文件时只输出包含匹配字符的文件名 |      -n       | 显示匹配行及行号   |   -s    | 不显示不存在或无匹配文本的错误信息 |
    |      -v       | 显示不包含匹配文本的所有行             |      -r       | 搜索子目录         | -d skip | 忽略子目录                         |

    **正则参数：** 

    | 参数  | 含义                                      | 参数 | 含义                     | 参数 | 含义                       |
    | :---: | ----------------------------------------- | :--: | ------------------------ | :--: | :------------------------- |
    |   \   | 忽略正则表达式中特殊字符的原有含义        |  ^   | 匹配正则表达式的开始行   |  $   | 匹配正则表达式的结束行     |
    |  \\<  | 从匹配正则表达式的行开始                  | \\>  | 到匹配正则表达式的行结束 | [  ] | 单个字符，如[A]即A符合要求 |
    | [ - ] | 范围，如[A-Z]，即A、B、C一直到Z都符合要求 |  .   | 所有的单个字符           |  *   | 有字符，长度可以为0        |

    **实例：** 

    ```bash
    grep ‘test’ d*
    ```

    显示所有以d开头的文件中包含 test的行

    ```bash
    grep ‘test’ aa bb cc
    ```

    显示在aa，bb，cc文件中匹配test的行

    ```bash
    grep ‘[a-z]\{5\}’ aa
    ```

    显示所有包含每个字符串至少有5个连续小写字符的字符串的行

    ```bash
    grep ‘w\(es\)t.*\1′ aa
    ```

    如果west被匹配，则es就被存储到内存中，并标记为1，然后搜索任意个字符(.\*)，这些字符后面紧跟着 另外一个es(\1)，找到就显示该行。如果用egrep或grep -E，就不用”\”号进行转义，直接写成’w(es)t.\*\1′就可以了

  *  `awk` 语句

    **语法：** 

    ```bash
    awk [options] 'script' var=value file(s) 
    awk [options] -f scriptfile var=value file(s) 
    ```

    **常用参数：** 

    |         参数          | 作用                                       |
    | :-------------------: | ------------------------------------------ |
    |     -f [filename]     | 从脚本文件中读取awk命令                    |
    |  -F [value] [value]   | 指定输入分隔符，fs可以时字符串或正则表达式 |
    | -v [variable]=[value] | 赋值一个用户定义变量，将外部变量传递给awk  |

    **内置变量：** 

    * **$n** : 当前记录的第n个字段，比如n为1表示第一个字段，n为2表示第二个字段
    * **$0** : 这个变量包含执行过程中当前行的文本内容
    * **ARGC** : 命令行参数的数目
    * **ARGIND** : 命令行中当前文件的位置（从0开始算）
    * **ARGV** : 包含命令行参数的数组
    * **CONVFMT** : 数字转换格式（默认值为%.6g）
    * **ENVIRON** : 环境变量关联数组
    * **ERRNO** : 最后一个系统错误的描述
    * **FIELDWIDTHS** : 字段宽度列表（用空格键分隔）
    * **FILENAME** : 当前输入文件的名
    * **NR** : 表示记录数，在执行过程中对应于当前的行号
    * **FNR** : 同NR :，但相对于当前文件
    * **FS** : 字段分隔符（默认是任何空格）
    * **IGNORECASE** : 如果为真，则进行忽略大小写的匹配
    * **NF** : 表示字段数，在执行过程中对应于当前的字段数。 print $NF答应一行中最后一个字段
    * **OFMT** : 数字的输出格式（默认值是%.6g）
    * **OFS** : 输出字段分隔符（默认值是一个空格）
    * **ORS** : 输出记录分隔符（默认值是一个换行符）
    * **RS** : 记录分隔符（默认是一个换行符）
    * **RSTART** : 由match函数所匹配的字符串的第一个位置
    * **RLENGTH** : 由match函数所匹配的字符串的长度
    * **SUBSEP** : 数组下标分隔符（默认值是34）

* Code Line 7-10

  ```bash
  for i in "${!array[@]}"; do
  	...
  done
  ```

   `for` 循环语句

  * 数字型循环：

    ```bash
    for((i=1;i<=10;i++));
    do
    	echo $(expr $i \* 3 + 1);
    done
    ```

    ```bash
    for i in $(seq 1 10)
    do
    	echo $(expr $i \* 3 + 1);
    done
    ```

    ```bash
    for i in {1..10}
    do
    	echo $(expr $i \* 3 + 1);
    done
    ```

    ```bash
    awk 'BEGIN{for(i=1; i<=10; i++) print i}'
    ```

  * 字符型循环

    ```bash
    for i in `ls`;
    do
    	echo $i is file name\!;
    done
    ```

    ```bash
    for i in $* ;
    do
    	echo $i is input chart\!;
    done
    ```

    ```bash
    for i in f1 f2 f3 ;
    do
    	echo $i is appoint;
    done
    ```

    ```bash
    list="rootfs usr data data2"
    for i in $list;
    do
    	echo $i is appoint;
    done
    ```

  * 路径查找

    ```bash
    for file in /proc/*;
    do
    	echo $file is file path \!;
    done
    ```

    ```bash
    for file in $(ls *.sh)
    do
    	echo $file is file path \!;
    done
    ```

  * 现在一般都使用 `for in` 结构， `for in` 结构后面可以使用函数来构造范围，比如 $() 、 \`\` 这些，里面写一些查找的语法，比如 `ls test*` ，那么遍历之后就是输出文件名了

* Code Line 9

  ```bash
  sleep 0.1
  ```

  shell 睡眠 0.1s

#### <a name="Sclient.sh-基础代码分析-Code Line 62-76 `differentWorkspace_mode_fun()`">Code Line 62-76 `differentWorkspace_mode_fun()`</a> 

* ```bash
  differentWorkspace_mode_fun() {
    Ask_From_Me
    optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")
    read -p "$optional_msg" user_option_input
    optional_projects_gitPath=_dw_${array[user_option_input]}_gitPath
    optional_projects_buildPath=_dw_${array[user_option_input]}_buildPath
    eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
    eval optional_repo_buildPath=$(echo \$$optional_projects_buildPath)
    ##start to use rsync(update & delete) all dir excpet '--exclude0-from'
    ##bash func test mode.
    git_valid_check
    info_show "[`date +%Y/%m/%d/%T`] [Info] running Synchronize update from $optional_repo_buildPath to $optional_repo_gitPath"
    rsync -avpz --delete-before --exclude-from functions/exclue_delete_files.txt $optional_repo_buildPath/ $optional_repo_gitPath/
    cd $optional_repo_gitPath && Synchronize_update_fun
  }
  ```

* Code Line 4

  ```bash
  read -p "$optional_msg" user_option_input
  ```

  读取用户输入

  * **基本语法：** 

    ```bash
    read [options] [info] [valuable]
    ```

  * **基本参数：** 

    | 参数 | 含义                                                         |
    | :--: | ------------------------------------------------------------ |
    |  -a  | 后跟一个变量，该变量会被认为是个数组，然后给其赋值，默认是以空格为分割符 |
    |  -d  | 后面跟一个标志符，其实只有其后的第一个字符有用，作为结束的标志 |
    |  -p  | 后面跟提示信息，即在输入前打印提示信息                       |
    |  -e  | 在输入的时候可以使用命令补全功能                             |
    |  -n  | 后跟一个数字，定义输入文本的长度，很实用                     |
    |  -r  | 屏蔽\，如果没有该选项，则\作为一个转义字符，有的话 \就是个正常的字符了 |
    |  -s  | 安静模式，在输入字符时不再屏幕上显示，例如login时输入密码    |
    |  -t  | 后面跟秒数，定义输入字符的等待时间                           |
    |  -u  | 后面跟fd，从文件描述符中读入，该文件描述符可以是exec新开启的 |

* Code Line 7-8

  ```bash
  eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
  ```

  拼接字符串并且执行，命令的输出作为参数传入变量

* Code Line 13

  ```bash
  rsync -avpz --delete-before --exclude-from functions/exclue_delete_files.txt $optional_repo_buildPath/ $optional_repo_gitPath/
  ```

  用于从一个位置到另外一个位置同步文件和文件夹。备份的地址可以是本地也可以是远程

  rsync服务软件是一款开源，高速的，数据同步（拷贝）工具

  * **基本参数：** 

    | 参数 | 作用                                                         | 参数 | 作用                              |
    | :--: | ------------------------------------------------------------ | :--: | --------------------------------- |
    |  -a  | –archive 归档模式，表示以递归方式传输文件，并保持所有文件属性，等于-rlptgoD |  -q  | –quiet 精简输出模式               |
    |  -c  | –checksum 打开校验开关，强制对文件传输进行校验               |  -r  | –recursive 对子目录以递归模式处理 |
    |  -v  | --verbose 详细模式输出                                       |  -z  | 压缩                              |
    |  -t  | --times，保持修改时间属性                                    |  -o  | --owner 保持属主不变              |
    |  -p  | --perms 保持权限不变                                         |  -g  | --group 保持用户组不变            |
    |  -l  | --links 保证用户组不变                                       |      |                                   |

* Code Line 14

  ```bash
  cd $optional_repo_gitPath && Synchronize_update_fun
  ```

  进入目录

  1. 切换当前目录,如果不带参数,会进入到$HOME 所在目录

     ```bash
     # 下面三个命令效果一样的
     cd 
     cd ~
     cd $HOME
     
     # 返回上一次目录
     cd ~- # = cd - 或者 cd $OLDPWD
     # 当前目录
     cd ~+ # = cd . 或者 cd $PWD
     ```

  2. 注意如果有$CDPATH这个自带变量有值的话,会优先从CDPATH的值的目录下寻找目录,CDPATH支持设置多个目录,使用:分隔,不过一般也不会用这个,结果太奇怪了

     ```bash
     # 最后进入了/tmp/test1/test2而不是当前目录(/tmp)下的test2
     mkdir -p /tmp/test1/test2
     mkdir -p /tmp/test2
     cd /tmp
     CDPATH=/tmp/test1
     pwd
     #/tmp
     cd  test2
     pwd
     #/tmp/test1/test2
     ```

  3.  `-L` 和 `-P` 是相对于符号链接路径时会有所区别,默认或者加上 `-L` 参数,会进入到符号链接的路径,加上 `-P` 进入的就是真实路径

     ```bash
     # cd -P /root/test3 显示的是真实的路径
     mkdir -p /tmp/test1/test2
     ln -s /tmp/test1/test2 /root/test3
     cd  /root/test3
     pwd
     cd -L /root/test3
     pwd
     cd -P /root/test3
     pwd
     ```

  4.  `..` 代表上一级目录,如果是在根目录,返回的还是根目录

     ```bash
     # 最后返回的还是根目录/
     mkdir -p /tmp/test1/test2
     cd /tmp/test1/test2
     pwd
     cd ..
     pwd
     cd ../../../../../
     pwd
     ```

  5.  ` cd -` 返回上一个工作目录,也就是 `$OLDPWD` 中保持的路径， `cd -- -d` ，进入 `-d` 目录,两个 `-` 使后面的 `-` 当做参数而非选项

     ```bash
     [root@master tmp]# pwd
     /tmp
     [root@master tmp]# mkdir -p /tmp/test1
     [root@master tmp]# cd test1
     [root@master test1]# pwd
     /tmp/test1
     [root@master test1]# cd -
     /tmp
     [root@master tmp]# mkdir -- -d
     [root@master tmp]# cd -- -d
     [root@master -d]# pwd
     /tmp/-d
     ```

#### <a name="Sclient.sh-基础代码分析-Code Line 78-87 `sameWorkspace_mode_fun()`">Code Line 78-87 `sameWorkspace_mode_fun()`</a> 

* ```bash
  sameWorkspace_mode_fun() {
    Ask_From_Me
    optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")
    read -p "$optional_msg" user_option_input
    optional_projects_gitPath=_sw_${array[user_option_input]}_gitPath
    eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
    git_valid_check
    info_show "[`date +%Y/%m/%d/%T`] [Info] Directly jumping to Synchronize update..."
    cd $optional_repo_gitPath && Synchronize_update_fun
  }
  ```

* Code Line 2

  ```bash
  Ask_From_Me
  ```

  调用函数

* Code Line 3

  ```bash
  optional_msg=$(common_show "Choose your Repos option (default option: 0)[0/1/..] : ")
  ```

  赋值

  * ```bash
    common_show "Choose your Repos option (default option: 0)[0/1/..] : "
    ```

    调用函数 `common_show` 传入参数

  * ```bash
    optional_msg=$(...)
    ```

    将括号内语句执行并且将输出作为参数赋值给变量 `optional_msg` 

* Code Line 4

  ```bash
  read -p "$optional_msg" user_option_input
  ```

  读取用户输入，详情见 [Code Line 62-76 `differentWorkspace_mode_fun()` ](####Code Line 62-76 `differentWorkspace_mode_fun()` ) 

* Code Line 6

  ```bash
  eval optional_repo_gitPath=$(echo \$$optional_projects_gitPath)
  ```

  拼接字符串并且执行，命令的输出作为参数传入变量

* Code Line 9

  ```bash
  cd $optional_repo_gitPath && Synchronize_update_fun
  ```

  切换目录，详情见 [Code Line 62-76 `differentWorkspace_mode_fun()`  ](####Code Line 62-76 `differentWorkspace_mode_fun()`) 

#### <a name="Sclient.sh-基础代码分析-Code Line 89-97 `git_valid_check()`">Code Line 89-97 `git_valid_check()`</a> 

* ```bash
  git_valid_check() {
    check_vaild_gitRepo=$(cd $optional_repo_gitPath && git rev-parse --is-inside-work-tree)
    if [ "$check_vaild_gitRepo" == "true" ]; then
      common_show "[`date +%Y/%m/%d/%T`] $optional_repo_gitPath is a valid git repository. \n But the current working directory may not be the top level. Check the output of the git rev-parse command if you care)"
    else
      critical "[`date +%Y/%m/%d/%T`] [CRITICAL] Invalid git repository!!"
      exit
    fi
  }
  ```

* Code Line 2

  ```bash
  check_vaild_gitRepo=$(cd $optional_repo_gitPath && git rev-parse --is-inside-work-tree)
  ```

  将命令的返回值作为参数赋值给变量

* Code Line 3-8

  ```bash
  if [ "$check_vaild_gitRepo" == "true" ]; then
  	...
  fi
  ```

   `if` 语句，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`</a> 

* Code Line 4

  ```bash
  common_show "[`date +%Y/%m/%d/%T`] $optional_repo_gitPath is a valid git repository. \n But the current working directory may not be the top level. Check the output of the git rev-parse command if you care)"
  ```

  调用函数并传入参数

  * ```bash
    [`date +%Y/%m/%d/%T`]
    ```

    Linux时间戳

#### <a name="Sclient.sh-基础代码分析-Code Line 99-116 `Synchronize_update_fun()`">Code Line 99-116 `Synchronize_update_fun()`</a> 

* ```bash
  Synchronize_update_fun() {
    #if git,then
    info_show "[`date +%Y/%m/%d/%T`] [Info] Synchronize update is running in $optional_repo_gitPath"
    # i want to add commit names Distinguish by every different files (git files name) here
    # such as :
    # README.MD  README.MD file Mon, 31 May 2021 22:54:09 +0800 commit by B4xinSynchronize.
    # but exactly: This feature has not yet been implemented
    #
    # git_commit_filename=`git log --pretty=format:"" --name-only  -1`
    commit_author=`git config --global --list|grep user.name|awk -F"=" '{print $2}'`
    echo -e "\033[32m[`date +%Y/%m/%d/%T`] [Info] Synchronize update is running. \033[0m"
    git add .
    git commit -m "[`date +%Y/%m/%d/%T`] B4xinSync: commit by $commit_author."
    git push
    sleep 1
    proxy_unset
    exit
  }
  ```

* Code Line 3

  ```bash
  info_show "[`date +%Y/%m/%d/%T`] [Info] Synchronize update is running in $optional_repo_gitPath"
  ```

  调用函数并传入参数

* Code Line 10

  ```bash
  commit_author=`git config --global --list|grep user.name|awk -F"=" '{print $2}'`
  ```

  赋值

  * ```bash
    git config --global --list | grep user.name | awk -F"=" '{print $2}'
    ```

    修改全局变量

     `|` 管道符

     `grep` 文本搜索，详见 <a href="#Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`">Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`</a> 

     `awk` 命令，详见 <a href="#Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`">Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`</a> 

* Code Line 15

  ```bash
  sleep 1
  ```

  睡眠 1s 

#### <a name="Sclient.sh-基础代码分析-Code Line 120-145">Code Line 120-145</a> 

* ```bash
  run_mode="$1"
  read_msg=$(echo -e "\033[32m[`date +%Y/%m/%d/%T`] [Info] Are you sure?(y/n): \033[0m")
  warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")
  
  
  if [ "$run_mode" != 'dw' ] && [ "$run_mode" != 'sw' ] && [ "$run_mode" != 'config' ]; then
    critical "[`date +%Y/%m/%d/%T`] [CRITICAL] ERROR INPUT! \nType in parameter error Usage: bash Sclient.sh <config|dw|sw>"
    exit
  fi
  
  read -p "$read_msg" go
  while [ "$go" != 'y' ] && [ "$go" != 'n' ] && [ "$go" != '' ]; do
    read -p "$warn_msg" go
  done
  
  if [ "$go" == 'n' ]; then
    underline_warn_show "[`date +%Y/%m/%d/%T`] [Warn] Detected user input [no]. \nQuit!"
    sleep 0.9
    exit
  fi
  ##Determine whether the incoming parameters are recognized by the program
  ##otherwise the program will exit abnormally, let the program judge by itself.
  
  ##so,what i want to show you exactly is:
  ##Clear program framework and running status, good code style will make work easier
  run_Main
  ```

* Code Line 1

  ```bash
  run_mode="$1"
  ```

  执行程序时传入的第一个参数赋值给变量 `run_mode` 

* Code Line 2-3

  ```bash
  read_msg=$(echo -e "\033[32m[`date +%Y/%m/%d/%T`] [Info] Are you sure?(y/n): \033[0m")
  warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")
  ```

  代码执行的输出作为参数赋值给变量

* Code Line 6-9

  ```bash
  if [ "$run_mode" != 'dw' ] && [ "$run_mode" != 'sw' ] && [ "$run_mode" != 'config' ]; then
    critical "[`date +%Y/%m/%d/%T`] [CRITICAL] ERROR INPUT! \nType in parameter error Usage: bash Sclient.sh <config|dw|sw>"
    exit
  fi
  ```

   `if` 语句，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`</a> 

* Code Line 11

  ```bash
  read -p "$read_msg" go
  ```

  读取用户输入，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 62-76 `differentWorkspace_mode_fun()`">Sclient.sh-基础代码分析-Code Line 62-76 `differentWorkspace_mode_fun()`</a> 

* Code Line 12-14

  ```bash
  while [ "$go" != 'y' ] && [ "$go" != 'n' ] && [ "$go" != '' ]; do
    read -p "$warn_msg" go
  done
  ```

   `while` 循环

  * **基本语法：** 

    1. ```bash
       while [ expressions ];
       do
       	commands;
       	multiple commands;
       done
       ```

       表达式 `expressions` 可包含多个参数

    2. ```bash
       while [ condition ]; do commands; done
       while control-command; do Commands; done
       ```

        `while` 单循环语句

  * **要点：** 

    1. 在执行命令之前检查条件
    2. 可以使用 `while` 循环来执行 `for` 循环的所有工作
    3. 只要条件评估为真， `do` 和 `done` 之间的命令就会重复执行
    4.  `while` 循环的参数可以是布尔表达式

* Code Line 26

  ```bash
  run_Main
  ```

  调用函数

***

***

## <a name="Sserver.sh">Sserver.sh</a> 

### <a name="Sserver.sh-源码">源码</a> 

<details><summary>代码</summary>

```bash
#!/bin/bash
##import color_print_func. use print func to echo to console.
source ./functions/color_print_fun.sh

Loading_Percent_Show(){
i=0
str=""
while [ $i -le 50 ]
do
    let index=i%4
    if [ $i -le 5 ]; then
        let bg=34
    elif [ $i -le 30 ]; then
        let bg=33
    elif [ $i -le 45 ]; then
        let bg=31
    else
        let bg=32
    fi
    printf "[\033[${bg}m%-s\033[0m %3c %c\r" "$str>]"
    sleep 0.01
    let i=i+1
    str+="="
done
sleep 0.3
printf "\n"
echo  "[备份计划] >> [crontab -l > config/golbal_var.sh.]..."
info_show "● [Info]任务1: $Crontab_task_show_bakUP ----------> DONE....."
sleep 0.9
echo "[写入计划] >> [config/golbal_var.sh]..."
info_show "● [Info]任务2: $Crontab_task_show_addPlan ----------> DONE....."
sleep 0.9
echo "[执行计划] << [config/golbal_var.sh]..."
info_show "● [Info]任务3: $Crontab_task_show_runCron ----------> DONE....."
sleep 0.9
}

CrontabPlan_Main(){
	#bakup crontab plan to files(in this progarm:config/golbal_var.sh)
	printf "\033[49;33m备份您的当前的Crontab计划\033[0m\n"
	crontab -l >> config/golbal_var.sh && crontab -l >> config/golbal_var.bak
	##
  cat >$work_path/.git/hooks/HOOK_B4xinSynchronize<<EOF
#!/bin/bash
PATH=$PATH:/usr/bin
cd $work_path && git checkout -f
EOF

	##
	#add new plan >> config/golbal_var.sh
	cat >>config/golbal_var.sh<<EOF
* * * * * bash $work_path/.git/hooks/HOOK_B4xinSynchronize
EOF
  #exec newest cron plan
  printf "\033[49;33m执行添加最新的Crontab计划\033[0m\n"
  crontab config/golbal_var.sh
}

Print_Auto_Show(){
  Crontab_task_show_bakUP="[Crontab定时计划备份]"
  Crontab_task_show_addPlan="[写入Crontab定时计划]"
  Crontab_task_show_runCron="[执行Crontab定时计划]"
  printf "%-5s %-20s %-20s %-20s\n" 任务进行中: $Crontab_task_show_bakUP $Crontab_task_show_addPlan $Crontab_task_show_runCron
}
Check_Crontab_list(){
  info_show "[`date +%Y/%m/%d/%T`] [Info] 当前最新Crontab计划表为："
 # printf "\033[49;33m当前最新Crontab计划表为：\033[0m\n"
  crontab -l |bash functions/draw_table.sh -4
}
Run_Main(){
  info_show "[`date +%Y/%m/%d/%T`] [Info] 运行中..." && Print_Auto_Show
  CrontabPlan_Main && Loading_Percent_Show
  printf "\n"
  Check_Crontab_list
  info_show "[`date +%Y/%m/%d/%T`] [Info] ALL DONE..."
  echo
}

work_path="$1"
if [ ! -n "$work_path" ];then
  info_show "[`date +%Y/%m/%d/%T`] [Info] Usage: bash Sserver.sh <path/to/git_workSpace/>"
  critical "[`date +%Y/%m/%d/%T`] [CRITICAL] ERROR: parameter error"
  exit;
fi
Run_Main
```

### <a name="Sserver.sh-基础代码分析">基础代码分析</a> 

#### <a name="Sserver.sh-基础代码分析-Code Line 3">Code Line 3</a> 

* ```bash
  source ./functions/color_print_fun.sh
  ```

  导入文件，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 3-5">Sclient.sh-基础代码分析-Code Line 3-5</a> 

#### <a name="Sserver.sh-基础代码分析-Code Line 5-36 `Loading_Percent_Show()`">Code Line 5-36 `Loading_Percent_Show()`</a> 

* ```bash
  Loading_Percent_Show(){
  i=0
  str=""
  while [ $i -le 50 ]
  do
      let index=i%4
      if [ $i -le 5 ]; then
          let bg=34
      elif [ $i -le 30 ]; then
          let bg=33
      elif [ $i -le 45 ]; then
          let bg=31
      else
          let bg=32
      fi
      printf "[\033[${bg}m%-s\033[0m %3c %c\r" "$str>]"
      sleep 0.01
      let i=i+1
      str+="="
  done
  sleep 0.3
  printf "\n"
  echo  "[备份计划] >> [crontab -l > config/golbal_var.sh.]..."
  info_show "● [Info]任务1: $Crontab_task_show_bakUP ----------> DONE....."
  sleep 0.9
  echo "[写入计划] >> [config/golbal_var.sh]..."
  info_show "● [Info]任务2: $Crontab_task_show_addPlan ----------> DONE....."
  sleep 0.9
  echo "[执行计划] << [config/golbal_var.sh]..."
  info_show "● [Info]任务3: $Crontab_task_show_runCron ----------> DONE....."
  sleep 0.9
  }
  ```

  </details>

* Code Line 4-20

  ```bash
  while [ $i -le 50 ]
  do
  	...
  done
  ```

   `while` 循环，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 120-145">Sclient.sh-基础代码分析-Code Line 120-145</a> 

* Code Line 6

  ```bash
  let index=i%4
  ```

   `let` 命令是 BASH 中用于计算的工具，用于执行一个或多个表达式，变量计算中不需要加上 `$` 来表示变量。如果表达式中包含了空格或其他特殊字符，则必须引起来

  **基本语法：** 

  * ```bash
    let arg [arg ...]
    ```

* Code Line 7-15

  ```bash
  if [...]; then
  	...
  fi
  ```

   `if` 语句，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`</a> 

* Code Line 17

  ```bash
  sleep 0.01
  ```

  睡眠 0.01s 

* Code Line 24

  ```bash
  info_show "● [Info]任务1: $Crontab_task_show_bakUP ----------> DONE....."
  ```

  调用函数并传入参数

#### <a name="Sserver.sh-基础代码分析-Code Line 38-57 `CrontabPlan_Main()`">Code Line 38-57 `CrontabPlan_Main()`</a> 

* ```bash
  CrontabPlan_Main(){
  	#bakup crontab plan to files(in this progarm:config/golbal_var.sh)
  	printf "\033[49;33m备份您的当前的Crontab计划\033[0m\n"
  	crontab -l >> config/golbal_var.sh && crontab -l >> config/golbal_var.bak
  	##
    cat >$work_path/.git/hooks/HOOK_B4xinSynchronize<<EOF
  #!/bin/bash
  PATH=$PATH:/usr/bin
  cd $work_path && git checkout -f
  EOF
  
  	##
  	#add new plan >> config/golbal_var.sh
  	cat >>config/golbal_var.sh<<EOF
  * * * * * bash $work_path/.git/hooks/HOOK_B4xinSynchronize
  EOF
    #exec newest cron plan
    printf "\033[49;33m执行添加最新的Crontab计划\033[0m\n"
    crontab config/golbal_var.sh
  }
  ```

* Code Line 4

  ```bash
  crontab -l >> config/golbal_var.sh && crontab -l >> config/golbal_var.bak
  ```

   `crontab` 是用来定期执行程序的命令

  当安装完成操作系统之后，默认便会启动此任务调度命令

   `crond` 命令每分钟会定期检查是否有要执行的工作，如果有要执行的工作便会自动执行该工作

  **基本语法：** 

  * ```bash
    crontab [ -u user ] file
    ```

  **参数说明：** 

  *  `-e` ：执行文字编辑器来设定时程表，内定的文字编辑器是 VI，如果你想用别的文字编辑器，则请先设定 VISUAL 环境变数来指定使用那个文字编辑器(比如说 setenv VISUAL joe)
  *  `-r` ：删除目前的时程表
  *  `-l` ：列出目前的时程表

  **时间格式：** 

  * ```bash
    f1 f2 f3 f4 f5 program
    ```

    - 其中 `f1` 是表示分钟，`f2` 表示小时，`f3` 表示一个月份中的第几日，`f4` 表示月份，`f5` 表示一个星期中的第几天。 `program` 表示要执行的程序

    - 当 `f1` 为 `*` 时表示每分钟都要执行 `program` ， `f2` 为 `*` 时表示每小时都要执行程序，以此类推

    - 当 `f1` 为 `a-b` 时表示从第 `a` 分钟到第 `b` 分钟这段时间内要执行， `f2` 为 `a-b` 时表示从第 `a` 到第 `b` 小时都要执行，以此类推

    - 当 `f1` 为 `*/n` 时表示每 `n` 分钟时间间隔执行一次， `f2` 为 `*/n` 表示每 `n` 小时时间间隔执行一次，以此类推

    - 当 `f1` 为 `a, b, c,...` 时表示第 `a, b, c,...` 分钟要执行， `f2 为 a, b, c,...` 时表示第 `a, b, c...`个小时要执行，以此类推

    - ```
      f1   f2   f3   f4   f5
      -    -    -    -    -
      |    |    |    |    |
      |    |    |    |    +----- 星期中星期几 (0 - 6) (星期天 为0)
      |    |    |    +---------- 月份 (1 - 12) 
      |    |    +--------------- 一个月中的第几天 (1 - 31)
      |    +-------------------- 小时 (0 - 23)
      +------------------------- 分钟 (0 - 59)
      ```

    - 使用者也可以将所有的设定先存放在文件中，用 crontab file 的方式来设定执行时间。

  **示例：** 

  * 每一分钟执行一次 `/bin/ls` 

    ```bash
    * * * * * /bin/ls
    ```

  * 在 12 月内, 每天的早上 6 点到 12 点，每隔 3 个小时 0 分钟执行一次 `/usr/bin/backup` 

    ```bash
    0 6-12/3 * 12 * /usr/bin/backup
    ```

  * 周一到周五每天下午 5:00 寄一封信给 `alex@domain.name` 

    ```bash
    0 17 * * 1-5 mail -s "hi" alex@domain.name < /tmp/maildata
    ```

  * 每月每天的午夜 0 点 20 分, 2 点 20 分, 4 点 20 分....执行 `echo "haha"` 

    ```bash
    20 0-23/2 * * * echo "haha"
    ```

  * ```bash
    0 */2 * * * /sbin/service httpd restart  意思是每两个小时重启一次apache 
    
    50 7 * * * /sbin/service sshd start  意思是每天7：50开启ssh服务 
    
    50 22 * * * /sbin/service sshd stop  意思是每天22：50关闭ssh服务 
    
    0 0 1,15 * * fsck /home  每月1号和15号检查/home 磁盘 
    
    1 * * * * /home/bruce/backup  每小时的第一分执行 /home/bruce/backup这个文件 
    
    00 03 * * 1-5 find /home "*.xxx" -mtime +4 -exec rm {} \;  每周一至周五3点钟，在目录/home中，查找文件名为*.xxx的文件，并删除4天前的文件
    
    30 6 */10 * * ls  意思是每月的1、11、21、31日是的6：30执行一次ls命令
    ```

    

  **注意：** 

  * 新创建的 `cron` 任务，不会马上执行，至少要过 2 分钟后才可以，当然你可以重启 `cron` 来马上执行。而 linux 任务调度的工作主要分为以下两类：

    - 1、系统执行的工作：系统周期性所要执行的工作，如备份系统数据、清理缓存
    - 2、个人执行的工作：某个用户定期要做的工作，例如每隔10分钟检查邮件服务器是否有新信，这些工作可由每个用户自行设置

  * 当程序在你所指定的时间执行后，系统会发一封邮件给当前的用户，显示该程序执行的内容，若是你不希望收到这样的邮件，请在每一行空一格之后加上  `> /dev/null 2>&1` 即可

    ```bash
    20 03 * * * . /etc/profile;/bin/sh /var/www/runoob/test.sh > /dev/null 2>&1
    ```

  * 如果我们使用 `crontab` 来定时执行脚本，无法执行，但是如果直接通过命令（如： `./test.sh` )又可以正常执行，这主要是因为无法读取环境变量的原因

    解决方法：

    1. 所有命令需要写成绝对路径形式，如： `/usr/local/bin/docker` 

    2. 在 shell 脚本开头使用以下代码：

       ```bash
       #!/bin/sh
       . /etc/profile
       . ~/.bash_profile
       ```

    3. 在 `/etc/crontab` 中添加环境变量，在可执行命令之前添加命令 `. /etc/profile;/bin/sh` ，使得环境变量生效，例如：

       ```bash
       20 03 * * * . /etc/profile;/bin/sh /var/www/runoob/test.sh
       ```

* Code Line 6

  ```bash
  cat >$work_path/.git/hooks/HOOK_B4xinSynchronize<<EOF
  ```

   `cat` 命令，查看文件，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`">Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`</a> 

#### <a name="Sserver.sh-基础代码分析-Code Line 59-64 `Print_Auto_Show()`">Code Line 59-64 `Print_Auto_Show()`</a> 

* ``` bash
  Print_Auto_Show(){
    Crontab_task_show_bakUP="[Crontab定时计划备份]"
    Crontab_task_show_addPlan="[写入Crontab定时计划]"
    Crontab_task_show_runCron="[执行Crontab定时计划]"
    printf "%-5s %-20s %-20s %-20s\n" 任务进行中: $Crontab_task_show_bakUP $Crontab_task_show_addPlan $Crontab_task_show_runCron
  }
  ```

* Code Line 5

  ```bash
  printf "%-5s %-20s %-20s %-20s\n" 任务进行中: $Crontab_task_show_bakUP $Crontab_task_show_addPlan $Crontab_task_show_runCron
  ```

   `printf` 输出语句

   `%-5s %-20s %-20s %-20s` 格式化字符串

  **格式化操作符：** 

  * |  符号  | 含义                                                         |  符号  | 含义                                             |
    | :----: | ------------------------------------------------------------ | :----: | ------------------------------------------------ |
    |   %c   | 转换成字符（ASCII 码值，或者长度为一的字符串）               |   %r   | 优先用 `repr()` 函数进行字符串转换               |
    |   %s   | 优先用 `str()` 函数进行字符串转换                            | %d  %i | 转成有符号十进制数                               |
    |   %u   | 转成无符号十进制数                                           |   %o   | 转成无符号八进制数                               |
    | %x  %X | 转成无符号十六进制数（ `x` / `X` 代表转换后的十六进制字符的大小写） | %e  %E | 转成科学计数法（ `e` / `E` 控制输出 `e` / `E` ） |
    | %f  %F | 转成浮点数（小数部分自然截断）                               | %g  %G | `%e` 和 `%f` / `%E` 和 `%F` 的简写               |
    |   %%   | 输出% （格式化字符串里面包括百分号，那么必须使用 `%%` ）     |        |                                                  |

  **内部参数：** 

  *   `*` 定义宽度或者小数点精度
  *   `-` 左对齐
  *   `+` 右对齐 或 在正数前面显示 `+` 
  *   `#` 在八进制数前面显示零 `0` ，在十六进制前面显示 `0x` 或者 `0X` （取决于用的是 `x` 还是 `X` ）
  *   `0` 显示的数字前面填充 `0` 而不是默认的空格
  *   `(var)` 映射变量（通常用来处理字段类型的参数）
  *   `m.n`  `m` 是显示的最小总宽度， `n` 是小数点后的位数（如果可用的话）

  **注意：** 

  * 有的参数可以用在 `%s` 上，有的可以用在其它格式化操作符上。

#### <a name="Sserver.sh-基础代码分析-Code Line 65-69 `Check_Crontab_list()`">Code Line 65-69 `Check_Crontab_list()`</a> 

* ```bash
  Check_Crontab_list(){
    info_show "[`date +%Y/%m/%d/%T`] [Info] 当前最新Crontab计划表为："
   # printf "\033[49;33m当前最新Crontab计划表为：\033[0m\n"
    crontab -l |bash functions/draw_table.sh -4
  }
  ```

* Code Line 4

  定期执行命令，详情见 <a href="#Sserver.sh-基础代码分析-Code Line 38-57 `CrontabPlan_Main()`">Sserver.sh-基础代码分析-Code Line 38-57 `CrontabPlan_Main()`</a> 

#### <a name="Sserver.sh-基础代码分析-Code Line 70-77 `Run_Main()`">Code Line 70-77 `Run_Main()`</a> 

* ```bash
  Run_Main(){
    info_show "[`date +%Y/%m/%d/%T`] [Info] 运行中..." && Print_Auto_Show
    CrontabPlan_Main && Loading_Percent_Show
    printf "\n"
    Check_Crontab_list
    info_show "[`date +%Y/%m/%d/%T`] [Info] ALL DONE..."
    echo
  }
  ```

* Code Line 3

  ``` bash
  CrontabPlan_Main && Loading_Percent_Show
  ```

  **基础语法：** 

  * ```bash
    command1 && command2 && ...
    ```

    实现逻辑与

     `command1` 执行返回真后执行 `command2` ，否则不执行

    从左向右执行命令，直到命令返回假或者执行完

  * ```bash
    command1 || command2 || ...
    ```

    实现逻辑或

     `command1` 执行返回假后执行 `command2` ，否则不执行

    从左向右执行命令，直到命令返回真或者执行完

  * ```bash
    command1 ; command2 ; ...
    ```

    顺序执行

  * ```bash
    ( command1 ; command2 ; ...)
    ```

    等同于多条命令单独执行

    即使命令中有切换目录的行为后续的命令也是在当前目录执行的

  * ```bash
    { command1 ; command2 ; ...}
    ```

    如果使用 `{}` 来代替 `()` ，那么相应的命令将在子 shell 而不是当前 shell 中作为一个整体被执行，只有在 `{}` 中所有命令的输出作为一个整体被重定向时，其中的命令才被放到子 shell 中执行，否则在当前 shell 执行

  *  `||` 优先级小于 `&&` 

  *  `$()` 和 ` `` ` 

    重组命令，将内部命令执行完后输出作为新成分与外部命令组成新命令

#### <a name="Sserver.sh-基础代码分析-Code Line 79-85">Code Line 79-85</a> 

* ```bash
  work_path="$1"
  if [ ! -n "$work_path" ];then
    info_show "[`date +%Y/%m/%d/%T`] [Info] Usage: bash Sserver.sh <path/to/git_workSpace/>"
    critical "[`date +%Y/%m/%d/%T`] [CRITICAL] ERROR: parameter error"
    exit;
  fi
  Run_Main
  ```

* Code Line 4

   `critical` 函数，见 <a href="#functions \ color_print_fun.sh">functions \ color_print_fun.sh</a> 

* Code Line 5

  ```bash
  exit
  ```

  退出 shell 

***

***

## <a name="functions \ banners.sh">functions \ banners.sh</a> 

### <a name="functions \ banners.sh-源码">源码</a> 

<details><summary>代码</summary>

```bash
#!/bin/bash

banners_show(){
arr=(1 2 3 4)
rand=$[$RANDOM % ${#arr[@]}]
IFS=$'\n'
for line in `cat ./functions/banner${arr[$rand]}.txt`
do
    echo $line
done
}
banners_show
```

</details>

### <a name="functions \ banners.sh-基础代码分析">基础代码分析</a> 

#### <a name="functions \ banners.sh-基础代码分析-Code Line 3-11 `banners_show()`">Code Line 3-11 `banners_show()`</a> 

* ```bash
  banners_show(){
  arr=(1 2 3 4)
  rand=$[$RANDOM % ${#arr[@]}]
  IFS=$'\n'
  for line in `cat ./functions/banner${arr[$rand]}.txt`
  do
      echo $line
  done
  }
  ```

* Code Line 3

  ```bash
  rand=$[$RANDOM % ${#arr[@]}]
  ```

  一般而言，A="a b c def" 这样的变量只是将 $A 替换为一个单一的字符串，

  但是改为 A=(a b c def) ，则是将 $A 定义为组数…

  bash 的组数替换方法可参考如下方法：

  ${A[@]} 或 ${A[*]} 可得到 a b c def (全部组数)

  ${A[0]} 可得到 a (第一个组数)，${A[1]} 则为第二个组数…

  ${#A[@]} 或 ${#A[*]} 可得到 4 (全部组数数量)

  ${#A[0]} 可得到 1 (即第一个组数(a)的长度)，${#A[3]} 可得到 3 (第四个组数(def)的长度)

  A[3]=xyz 则是将第四个组数重新定义为 xyz …

  ${#var} 可计算出变量值的长度

* Code Line 5-8

  ```bash
  for line in `cat ./functions/banner${arr[$rand]}.txt`
  do
      echo $line
  done
  ```

   `for` 循环，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`">Sclient.sh-基础代码分析-Code Line 50-61 `Ask_From_Me()`</a> 

***

***

## <a name="functions \ color_print_fun.sh">functions \ color_print_fun.sh</a> 

### <a name="functions \ color_print_fun.sh-源码">源码</a> 

<details><summary>代码</summary>

```bash
#!/bin/bash
#\033[05m -> 33 red color
#\033[01m more wide
####################################
##############common show###########
#####print message to info color####
####################################
function common_show() {
    printf "\033[01m$*\033[0m"
    echo
}
function underline_common_show() {
    printf "\033[4\37m\033[01m$*\033[0m"
    echo
}
####################################
##############info show#############
#####print message to info color####
####################################
## print message to info color
function info_show() {
  # shellcheck disable=SC2059
  printf "\033[32m$*\033[0m"
  echo
}
function underline_info_show() {
  # shellcheck disable=SC2059
  printf "\033[4;32m\033[01m$*\033[0m"
  #printf "\033[4;32m\033[01m\033[05m $* \033[0m"
  echo
}
function outstand_info_show() {
  # shellcheck disable=SC2059
  # choose $5 to show red color
  printf "\033[32m\033$*\033[0m"
  echo
}
####################################
############warning show############
## print message to warning color###
####################################
## print message to warn color
function warn_show() {
  # shellcheck disable=SC2059
  printf "\033[33m$*\033[0m"
  echo
}
function underline_warn_show() {
  # shellcheck disable=SC2059
  printf "\033[4;33m\033[01m$*\033[0m"
  #printf "\033[4;33m\033[01m\033[05m $* \033[0m"
  echo
}
function tips_warn_show() {
  # shellcheck disable=SC2059
  printf "\033[33m$*\033[0m \n"
  echo
}
####################################
############critical show###########
## print message to critical color##
####################################
function critical() {
  # shellcheck disable=SC2059
  printf "\033[31m$*\033[0m"
  echo
}
## print message to critical_flashing background color
function critical_flashing() {
  # shellcheck disable=SC2059
  printf "\033[31m\033[01m\033[05m$*\033[4m"
  echo
}
function underline_critical_show() {
  # shellcheck disable=SC2059
  printf "\033[4;31m\033[01m$*\033[0m"
  #printf "\033[4;31m\033[01m\033[05m $* \033[0m"
  #underline and flashing!
  echo
}
```

</details>

### <a name="functions \ color_print_fun.sh-基础代码分析">基础代码分析</a> 

* 输出不同颜色的字

* 用法：

  * ```bash
    echo -e “\033[41;36m something here \033[0m”
    ```

    其中 `41` 的位置代表底色， `36` 的位置是代表字的颜色， `\033[0m` 是ANSI控制码

  * 

* | 背景色参数 | 背景色 | 字色参数 | 字色 |
  | :--------: | :----: | :------: | :--: |
  |     40     |   黑   |    30    |  黑  |
  |     41     |  深红  |    31    |  红  |
  |     42     |   绿   |    32    |  绿  |
  |     43     |   黄   |    33    |  黄  |
  |     44     |   蓝   |    34    |  蓝  |
  |     45     |   紫   |    35    |  紫  |
  |     46     |  深绿  |    36    | 深绿 |
  |     47     |   白   |    37    |  白  |

  |    ANSI控制码     | 说明               |    ANSI控制码    | 说明         | ANSI控制码 | 说明                   |
  | :---------------: | ------------------ | :--------------: | ------------ | :--------: | ---------------------- |
  |      \33[0m       | 关闭所有属性       |      \33[1m      | 设置高亮度   |   \33[4m   | 下划线                 |
  |      \33[5m       | 闪烁               |      \33[7m      | 反显         |   \33[8m   | 消隐                   |
  | \33[30m – \33[37m | 设置前景色（字色） | 33[40m – \33[47m | 设置背景色   |   \33[nA   | 光标上移n行            |
  |      \33[nB       | 光标下移n行        |      \33[nC      | 光标右移n行  |   \33[nD   | 光标左移n行            |
  |     \33[y;xH      | 设置光标位置       |      \33[2J      | 清屏         |   \33[K    | 清除从光标到行尾的内容 |
  |       \33[s       | 保存光标位置       |      \33[u       | 恢复光标位置 |  \33[?25l  | 隐藏光标               |
  |     \33[?25h      | 显示光标           |                  |              |            |                        |

***

***

## <a name="functions \ proxy.sh">functions \ proxy.sh</a> 

### <a name="functions \ proxy.sh-源码">源码</a> 

<details><summary>代码</summary>

```bash
#!/bin/bash

proxy_set(){
  read_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] set proxy ?default:127.0.0.1:8082 (y/n): \033[0m")
  warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")
  read -p "$read_msg" ready
  while [ "$ready" != 'y' ] && [ "$ready" != 'n' ] && [ "$ready" != '' ]; do
    read -p "$warn_msg" ready
  done
  if [ "$ready" == 'n' ]; then
    underline_warn_show "● [Warn] Detected user input [no]. \nQuit!"
    sleep 0.9
    exit
  fi
  export http_proxy='http://127.0.0.1:8082'; export HTTP_PROXY='http://127.0.0.1:8082'; export https_proxy='http://127.0.0.1:8082'; export HTTPS_PROXY='http://127.0.0.1:8082'
}

proxy_unset(){
#  warn_show "● [Warn] ready to unset Http Proxy Shell. "
#  unset_command=$(unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY)
  read_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] ready to unset Http Proxy Shell? (y/n): \033[0m")
  warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")
  read -p "$read_msg" ready
  while [ "$ready" != 'y' ] && [ "$ready" != 'n' ] && [ "$ready" != '' ]; do
    read -p "$warn_msg" ready
  done
  if [ "$ready" == 'n' ]; then
    underline_warn_show "[`date +%Y/%m/%d/%T`] [Warn] Detected user input [no]. \nQuit!"
    sleep 0.9
    exit
  fi
  unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY
}


detected_proxy="export |grep proxy"
proxy_content=$(echo ${detected_proxy}|awk '{run=$0;system(run)}')
proxy_main(){
  if [ ! -n "$proxy_content" ]; then
    info_show "[`date +%Y/%m/%d/%T`] [Info] Detected no proxy export this shell. setting Http Proxy Shell Export Line..."
    proxy_set
  else
    info_show "[`date +%Y/%m/%d/%T`] [Info] Detected proxy export this shell"
  fi
}
```

</details>

### <a name="functions \ proxy.sh-基础代码分析">基础代码分析</a> 

#### <a name="functions \ proxy.sh-基础代码分析-Code Line 3-16 `proxy_set()`">Code Line 3-16 `proxy_set()`</a> 

* ```bash
  proxy_set(){
    read_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] set proxy ?default:127.0.0.1:8082 (y/n): \033[0m")
    warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")
    read -p "$read_msg" ready
    while [ "$ready" != 'y' ] && [ "$ready" != 'n' ] && [ "$ready" != '' ]; do
      read -p "$warn_msg" ready
    done
    if [ "$ready" == 'n' ]; then
      underline_warn_show "● [Warn] Detected user input [no]. \nQuit!"
      sleep 0.9
      exit
    fi
    export http_proxy='http://127.0.0.1:8082'; export HTTP_PROXY='http://127.0.0.1:8082'; export https_proxy='http://127.0.0.1:8082'; export HTTPS_PROXY='http://127.0.0.1:8082'
  }
  ```

* Code Line 2-3

  ```bash
  read_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] set proxy ?default:127.0.0.1:8082 (y/n): \033[0m")
  warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")
  ```

  复合语句

  * ```bash
    echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] set proxy ?default:127.0.0.1:8082 (y/n): \033[0m"
    ```

    输出语句，详情见 <a href="#functions \ color_print_fun.sh-基础代码分析">functions \ color_print_fun.sh-基础代码分析</a> 

  * ```bash
    \033[33m
    ```

     `ANSI` 控制符，详情见 <a href="#functions \ color_print_fun.sh-基础代码分析">functions \ color_print_fun.sh-基础代码分析</a> 

* Code Line 4

  ````bash
  read -p "$read_msg" ready
  ````

  用户输入，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 62-76 `differentWorkspace_mode_fun()`">Sclient.sh-基础代码分析-Code Line 62-76 `differentWorkspace_mode_fun()`</a> 

* Code Line 5-7

  ```bash
  while [ "$ready" != 'y' ] && [ "$ready" != 'n' ] && [ "$ready" != '' ]; do
  	read -p "$warn_msg" ready
  done
  ```

   `while` 语句，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 120-145">Sclient.sh-基础代码分析-Code Line 120-145</a> 

* Code Line 8-12

  ```bash
  if [ "$ready" == 'n' ]; then
  	underline_warn_show "● [Warn] Detected user input [no]. \nQuit!"
  	sleep 0.9
  	exit
  fi
  ```

   `if` 语句，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`</a> 

* Code Line 13

  ```bash
  export http_proxy='http://127.0.0.1:8082'; export HTTP_PROXY='http://127.0.0.1:8082'; export https_proxy='http://127.0.0.1:8082'; export HTTPS_PROXY='http://127.0.0.1:8082'
  ```

   `ecport` 详情见 <a href="#Sclient.sh-基础代码分析-Code Line 7">Sclient.sh-基础代码分析-Code Line 7</a> 

   `command1 ; command2 ; ...` 详情见 <a href="#Sserver.sh-基础代码分析-Code Line 70-77 `Run_Main()`">Sserver.sh-基础代码分析-Code Line 70-77 `Run_Main()`</a> 

#### <a name="functions \ proxy.sh-基础代码分析-Code Line 18-33 `proxy_unset()`">Code Line 18-33 `proxy_unset()`</a> 

* ```bash
  proxy_unset(){
  #  warn_show "● [Warn] ready to unset Http Proxy Shell. "
  #  unset_command=$(unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY)
    read_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] ready to unset Http Proxy Shell? (y/n): \033[0m")
    warn_msg=$(echo -e "\033[33m[`date +%Y/%m/%d/%T`] [Warn] PLZ type in (y/n): \033[0m")
    read -p "$read_msg" ready
    while [ "$ready" != 'y' ] && [ "$ready" != 'n' ] && [ "$ready" != '' ]; do
      read -p "$warn_msg" ready
    done
    if [ "$ready" == 'n' ]; then
      underline_warn_show "[`date +%Y/%m/%d/%T`] [Warn] Detected user input [no]. \nQuit!"
      sleep 0.9
      exit
    fi
    unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY
  }
  ```

  具体分析与 <a href="#functions \ proxy.sh-基础代码分析-Code Line 3-16 `proxy_set()`">functions \ proxy.sh-基础代码分析-Code Line 3-16 `proxy_set()`</a> 类似

* Code Line 12

  ```bash
  sleep 0.9
  ```

  shell 睡眠 0.9 秒

* Code Line 15

  ```bash
  unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY
  ```

   `unset` 命令用于删除变量或函数

  **基本语法：** 

  * ```bash
    unset [-fv][变量或函数名称]

  **基础参数：** 

  *  `-f` 仅删除函数
  *  `-v ` 仅删除变量

* Code Line 38-45

  ```bash
  proxy_main(){
    if [ ! -n "$proxy_content" ]; then
      info_show "[`date +%Y/%m/%d/%T`] [Info] Detected no proxy export this shell. setting Http Proxy Shell Export Line..."
      proxy_set
    else
      info_show "[`date +%Y/%m/%d/%T`] [Info] Detected proxy export this shell"
    fi
  }
  ```

   `if` 语句，详情见 <a href="#Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`">Sclient.sh-基础代码分析-Code Line 17-32 `run_Main()`</a> 

***

***

# <a name="Note">Note</a> 

* 2022年1月15日15点05分：
  * 基本完成 `Sclient.sh` 脚本的详细分析
* 2022年1月15日20点00分：
  * 基本完成 `Sserver.sh` 和 `functions \ banners.sh` 脚本的详细分析
* 2022年1月16日21点50分：
  * 基本完成 `functions \ color_print_fun.sh` 和 `functions \ proxy.sh` 脚本的详细分析
  * 目录更新
  *  <a href="#TODO">TODO</a> 清空
* 

***

***

# <a name="TODO">TODO</a> 

1.  
