# Git

```
https://github.com/Ink-City/InkCity.github.study.git
https://github.com/Ink-City/InkCity.github.sokoban.git
```



## 常用命令

### 设置用户签名

```bash
git config --global user.name
git config --global user.emal
```

### 初始化本地库

```bash
git init
```

### 查看本地库状态

```bash
git status
```

### 添加暂存区

```bash
git add 文件名
```

删除暂存区文件

```bash
git rm --cached 文件名
```

### 提交本地库

```bash
git commit -m "日志" 文件名
```

### 查看版本信息

```bash
git reflog
```

详细信息

```bash
git log
```

### 版本穿梭

```bash
git reset --hard version
```

### 分支

创建分支

```bash
git branch 分支名
```

查看分支

```bash
git branch -v
```

切换分支

```bash
git checkout 分支名
```

把目标分支合并过来

```bash
git merge 分支名
```

### 团队内协作

推送代码

```bash
push
```

下载代码

```bash
clone
```

更新

```bash
pull
```

### 跨团队协作

远程库A拷贝到远程库B

```bash
fork
```

远程库B发送请求给远程库A让远程库A拉取

```bash
pull request
```

拉取合并

```
merge
```

### 远程仓库操作

查看当前所有远程库地址别名

```bash
git remote -v
```

起别名

```bash
git remote add 别名 远程地址
```

推送本地分支上的内容到远程仓库

```bash
git push 别名 分支
```

将远程仓库的内容克隆到本地

```bash
git clone 远程地址
```

将远程仓库对于分支最新内容拉下来与当前本地分支直接合并

```bash
git pull 远程库地址别名 远程分支名
```

