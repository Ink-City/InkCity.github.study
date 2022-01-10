### Git

#### 仓库路径

|  InkCity.github.study  |  https://github.com/Ink-City/InkCity.github.study.git  |
| :--------------------: | :----------------------------------------------------: |
| InkCity.github.sokoban | https://github.com/Ink-City/InkCity.github.sokoban.git |
|   bin4xin.github.io    |    https://github.com/Bin4xin/bin4xin.github.io.git    |

#### 代码大全

<table>
	<tr align="center">
		<th rowspan = "2">设置用户签名</th>
		<th>设置用户名</th>
		<th>git config --global user.name</th>
	</tr>
	<tr align="center">
		<th>设置邮箱</th>
		<th>git config --global user.emal</th>
	</tr>
	<tr align="center">
		<th>初始化本地库</th>
		<th></th>
		<th>git init</th>
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
