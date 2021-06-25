---
layout: post
title:  "EIME-TSF 测试版"
date:   2021-06-26 01:00:00 +0800
categories: EIME
---

先放个 [EIME-TSF 测试版](https://github.com/DonAnthonyLee/DonAnthonyLee.github.io/blob/main/stuff/eime-tsf-0.1-test.7z "EIME-TSF 0.1 测试版下载")，只能运行在 64 位 Win8.1 以上，在管理员命令行窗口输入以下命令注册或反注册接口，目前不是很完善，部分功能未齐全，所以仅附带“潮州白话字输入法”在其中。

# 注册接口
```
regsvr32 eime-tsf.dll
```

# 反注册接口
```
regsvr32 /u eime-tsf.dll
```

# 已知问题

+ 在记事本等原生不支持 TSF 的程序输入时，有时会导致程序崩溃
+ Win10 系统上无法调出输入设置（可在“高级键盘设置”中调出语言栏，或者运行 eime.exe）
+ Word 等程序使用时，编辑区文字顶对齐

