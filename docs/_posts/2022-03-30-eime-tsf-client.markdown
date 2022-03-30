---
layout: post
title:  "EIME-TSF 客户端"
date:   2022-03-30 18:00:00 +0800
categories: EIME
---

提供 [EIME-TSF 客户端](https://github.com/DonAnthonyLee/DonAnthonyLee.github.io/blob/main/stuff/eime-tsf-client-0.1.4.zip "EIME-TSF 客户端 0.1.4 版下载")，适用于 Windows XP SP2 ~ Windows 11 系统，兼容 x86 架构及 x64 架构。


此客户端仅起翻译作用，既是将 TSF 接口翻译为 EIME 输入框架（类似 BeOS 的 input_server 协议），又将 EIME 的处理结果再翻译为 TSF 接口所需。


注：此客户端目前不适用于 Windows 10/11 S 模式，因为 S 模式只能运行 Microsoft 认证的程序，即使有正规的代码签名也无用。


# 安装

将文件解压到系统文件夹（比如 C:\Program Files 或 C:\Windows 等）下的任意子文件夹（建议采用 C:\Program Files\eime），右键选择 install.cmd 文件后以管理员身份运行。

注明：install.cmd 脚本为自动注册 eime-tsf.dll 及 eime-tsf-x86.dll 两个文件。


# 卸载

右键选择 uninstall.cmd 文件后以管理员身份运行。


# 已知问题

+ 用户登录后等待 EIME 服务端自动启动后才能使用。

目前 EIME 服务端（商店应用）若用户未曾在系统控制设置中禁止时，将在用户登录后自动启动（桌面出现几秒钟后完成）；此时，客户端将自动连接并进入可使用状态。
