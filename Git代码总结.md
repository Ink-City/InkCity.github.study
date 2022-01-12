### Git

#### 配置文件

Git 自带一个 `git config` 的工具来帮助设置控制 Git 外观和行为的配置变量。 这些变量存储在三个不同的位置：

1. `/etc/gitconfig` 文件: 包含系统上每一个用户及他们仓库的通用配置。 如果在执行 `git config` 时带上 `--system` 选项，那么它就会读写该文件中的配置变量。 （由于它是系统配置文件，因此你需要管理员或超级用户权限来修改它。）
2. `~/.gitconfig` 或 `~/.config/git/config` 文件：只针对当前用户。 你可以传递 `--global` 选项让 Git 读写此文件，这会对你系统上 **所有** 的仓库生效。
3. 当前使用仓库的 Git 目录中的 `config` 文件（即 `.git/config`）：针对该仓库。 你可以传递 `--local` 选项让 Git 强制读写此文件，虽然默认情况下用的就是它。。 （当然，你需要进入某个 Git 仓库中才能让该选项生效。）

#### 代码大全

<table>
	<tr align="center">
		<th>查看帮助</th>
		<th></th>
		<th>git help <font color = "red">命令</font></th>
	</tr>
	<tr align="center">
		<th rowspan = "4">配置信息</th>
		<th>修改配置信息</th>
		<th>git config <font color = "red">--system</font>/<font color = "red">--global</font>/<font color = "red">--local</font> <font color = "red">XXX</font> = <font color = "red">XXX</font></th>
	</tr>
	<tr align="center">
		<th>检查配置信息</th>
		<th>git config --list</th>
	</tr>
	<tr align="center">
		<th>查看某一项配置信息</th>
		<th>git config <font color = "red">Key</font></th>
	</tr>
	<tr align="center">
		<th>哪一个配置文件最后设置了该值</th>
		<th>git config --show-origin  <font color = "red">Key</font></th>
	</tr>
	<tr align="center">
		<th rowspan = "2">设置用户签名[<font color = "red">必要</font>]</th>
		<th>设置用户名</th>
		<th>git config --global user.name</th>
	</tr>
	<tr align="center">
		<th>设置邮箱</th>
		<th>git config --global user.emal</th>
	</tr>
	<tr align="center">
		<th rowspan = "3">基础操作</th>
		<th>初始化本地库</th>
		<th>git init</th>
	</tr>
	<tr align="center">
		<th>新键文件</th>
		<th>git touch <font color = "red">文件名</font></th>
	</tr>
	<tr align="center">
		<th>删除文件</th>
		<th>git rm <font color = "red">文件名</font></th>
	</tr>
	<tr align="center">
		<th rowspan = "2">暂存区</th>
		<th>添加暂存区</th>
		<th>git add <font color = "red">文件名</font></th>
	</tr>
	<tr align="center">
		<th>删除暂存区文件</th>
		<th>git rm --cached <font color = "red">文件名</font></th>
	</tr>
	<tr align="center">
		<th rowspan = "2">本地库</th>
		<th>查看本地库状态</th>
		<th>git status</th>
	</tr>
	<tr align="center">
		<th>提交本地库</th>
		<th>git commit -m "<font color = "red">日志</font>" <font color = "red">文件名</font></th>
	</tr>
	</tr>
	<tr align="center">
		<th rowspan = "3">版本</th>
		<th>版本信息</th>
		<th>git reflog</th>
	</tr>
	<tr align="center">
		<th>详细信息</th>
		<th>git log</th>
	</tr>
	<tr align="center">
		<th>版本穿梭</th>
		<th>git reset --hard <font color = "red">版本号</font></th>
	</tr>
	<tr align="center">
		<th rowspan = "5">分支</th>
		<th>创建分支</th>
		<th>git branch <font color = "red">分支名</font></th>
	</tr>
	<tr align="center">
		<th>查看分支</th>
		<th>git branch -v</th>
	</tr>
	<tr align="center">
		<th>查看所有远程分支分支</th>
		<th>git branch -r</th>
	</tr>
	<tr align="center">
		<th>切换分支</th>
		<th>git checkout <font color = "red">分支名</font></th>
	</tr>
	<tr align="center">
		<th>把目标分支合并过来</th>
		<th>git merge <font color = "red">分支名</font></th>
	</tr>
	<tr align="center">
		<th rowspan = "5">远程仓库操作</th>
		<th>查看当前所有远程库地址别名</th>
		<th>git remote -v</th>
	</tr>
	<tr align="center">
		<th>远程库地址起别名</th>
		<th>git remote add <font color = "red">地址别名</font> <font color = "red">远程地址</font></th>
	</tr>
	<tr align="center">
		<th>推送本地分支上的内容到远程仓库</th>
		<th>git push <font color = "red">地址别名</font> <font color = "red">本地分支</font></th>
	</tr>
	<tr align="center">
		<th>将远程仓库的内容克隆到本地</th>
		<th>git clone <font color = "red">远程地址</font></th>
	</tr>
	<tr align="center">
		<th>将远程仓库分支拉下来与当前本地分支合并</th>
		<th>git pull <font color = "red">地址别名</font> <font color = "red">远程分支</font></th>
	</tr>
</table>


