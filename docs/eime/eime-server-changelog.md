---
layout: essay
title:  "EIME 服务端历史变更"
date:   2022-06-13 14:00:00 +0800
permalink: /eime/eime-server-changelog
---

# 0.1.12
+ EIME 服务端：
	+ 修正多窗口输入切换时偶尔出现无法输入的问题。
+ 潮州白话字输入法：
	+ 修正动态标调时全大写输出错误；
	+ 增加 tua/tuaⁿ 单独输出 toa/toaⁿ 选项（卓威廉词典方式）；
	+ 增加临时输出方案选择（用于卓威廉词典录入等）；
	+ 修正附加连词符输出错误，增加 “_” 键直接切换成附加连词符；
	+ 增加 “x/r” 或 “x/w” 快捷键选项用于分别代替阳平、阳上数字标调，以期减少键盘输入时误触率。
+ EIME-TSF 0.1.10 (Windows): 
	+ 修正多窗口输入切换时偶尔出现无法输入的问题（需配合 EIME 服务端 0.1.12 及以上）；
	+ 修正勾选 “使用系统切换键” 选项时问题，即：通过系统切换键临时切换为英文输入状态后聚焦其他窗口，此时无法通过系统切换键再次回复输入状态。

# 0.1.11
+ ETK++ 运行时库 (Windows)：剪贴板功能改进；IPC 改进等。
+ EIME-TSF 0.1.9 (Windows): 增加任务栏深色模式检测; 修正使用辅助窗口时光标定位问题；增加“使用系统切换键”选项。





