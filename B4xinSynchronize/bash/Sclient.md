### 学习笔记

#### 源码

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

#### 学习内容

##### Code Line: 2

当前目录的绝对路径

```bash
$(pwd)
```

`$(pwd)` 等价于 `$PWD ` 

##### Code Line: 3-5

执行脚本

```bash
source [filename]
```

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

   作用：打开一个子shell来读取并执行 [filename] 中命令。

   注：运行一个shell脚本时会启动另一个命令解释器。

   每个 shell 脚本有效地运行在父 shell ( parent shell ) 的一个子进程里。

   这个父 shell 是指在一个控制终端或在一个 xterm 窗口中给你命令指示符的进程。

   shell 脚本也可以启动他自已的子进程.

   这些子 shell ( 即子进程 ) 使脚本并行地，有效率地地同时运行脚本内的多个子任务。
