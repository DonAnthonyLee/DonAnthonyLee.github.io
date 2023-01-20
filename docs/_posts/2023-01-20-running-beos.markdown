---
layout: post
title:  "实机运行 BeOS (一）"
date:   2023-01-20 17:20:00 +0800
categories: BeOS
---

现在的机器大多数无法运行 BeOS 系统；受限于驱动程序等，即使是 HaikuOS 系统也不一定能运行在现在的机器上；
而厌倦了在虚拟机运行 BeOS 的各种不便，前段时间分别以低廉的价格收了一台 Mac Mini G4 和一台 ASUS Eee PC 900，期望能实机运行 BeOS x86 或 ppc 版。

一直到前几天，我几乎放弃了在这两台小机器上运行 BeOS 的想法，机缘巧合下 x86 版本终于可以运行了，而 ppc 版本只能待 MacOS 8.6 for Mini G4 跑通后再作探究了。


# ASUS Eee PC 900 安装 BeOS Pro R5 x86 版

这台小机器大概是 2008 年时的产品，至今 15 年的 “老古董”，CPU 为 Intel Celeron M 900MHz，内存 1GB 400MHz DDR2，原机运行 Windows XP，其速度堪比龟速；原机除了键盘和鼠标键外，其他部件基本良好；这台机器的键盘设计有缺陷，其下兼当 CPU 散热只用，所以变形严重，很多按键都已经无法使用，干脆将其排线拔掉，权当主板的挡灰板了，另外再接 USB 键盘使用。


## 安装准备（硬件）

为了安装 BeOS，这台机器还需要再调整一下硬件方面。

+ 首先，1GB 内存将导致 BeOS 运行出错，因此将其内存条置换为 512MB 533MHz DDR2；

+ 其次，原机 BIOS 导致安装光盘在访问 SCSI 设备时死机，需要更新为最后版本的 [BIOS](https://www.asus.com.cn/supportonly/eee%20pc%20900xp/helpdesk_bios/)；

+ 最后，更新完 BIOS 后进入 BIOS 设置界面，将 Onboard Devices 中 USB Ports 先禁用（后重启），然后再启用。


## 安装准备（软件）

+ BeOS Pro 5.0 的安装光盘

我用的是 GoBe 版本的安装光盘，然而这张光盘却无法通过外置 USB 光驱直接安装，因为引导程序无法识别外置光驱，所以需要作特别处理。
在 Linux 下读出各个分轨的内容（如果你所取得光盘映像已然是分轨数据，可略过这一步）：

```

$ sudo cdrdao read-cd --source-device /dev/sr0 1.toc
Cdrdao version 1.2.4 - (C) Andreas Mueller <andreas@daneb.de>
WARNING: SCSI device is currently in use. Only read commands are supported.
WARNING: SCSI device is currently in use. Only read commands are supported.
/dev/sr0: TSSTcorp CDDVDW SE-218BB	Rev: TS01
Using driver: Generic SCSI-3/MMC - Version 2.0 (options 0x0000)

Reading toc and track data...

Track   Mode    Flags  Start                Length
------------------------------------------------------------
 1      DATA    4      00:00:00(     0)     09:42:47( 43697)
 2      DATA    4      09:42:47( 43697)     33:05:11(148886)
 3      DATA    4      42:47:58(192583)     26:53:03(120978)
Leadout DATA    4      69:40:61(313561)

^C（按 CTRL+C 中断）

$ sudo dd if=/dev/sr0 of=./GoBe_CD_Tools.iso bs=2048 count=43697
$ sudo dd if=/dev/sr0 of=./GoBe_CD_x86.img bs=2048 skip=43697 count=148886

$ file ./GoBe_CD_x86.img
GoBe_CD_Track2.iso: DOS/MBR boot sector; partition 1 : ID=0x8a, active 0xc3, start-CHS (0x1ad,81,38), end-CHS (0x12,14,12), startsector 1726010214, 3224462993 sectors; partition 2 : ID=0x59, active 0xad, start-CHS (0xc8,102,1), end-CHS (0x172,195,5), startsector 544370546, 1684107116 sectors

```

上述 dd 命令中 skip 参数对应其分轨数据偏移量（在 cdrdao 输出列表中有对应数据）；第三轨适用于 ppc，无需抓取。

+ 划分新分区

将以上所抓取 GoBe_CD_Tools.iso 用 7zip 解压后，可安装其中的分区魔术师进行分区，新分区设定为 BeOS 文件系统。

+ 安装 BeOS 个人版并替换

将以上所抓取 GoBe_CD_Tools.iso 用 7zip 解压后，安装其中的个人版，提示制作启动盘之类均可跳过。

由于 BeOS 个人版不支持多轨 CD，因而无法使用 BeOS 个人版直接安装 Pro 版，需要另寻出路；
将以上所抓取 GoBe_CD_x86.img 改名为 image.be，并替换已安装 BeOS 个人版文件（C:\BeOS\image.be）。

+ 启动 BeOS Pro 硬盘版

通过光盘启动机器（没有光驱的话可以用以上所抓取 GoBe_CD_Tools.iso 文件直接制作 USB 启动盘），启动时按住空格键。

出现选项菜单后，先选择启动目标为 BeOS Pro5 Edition（其实是硬盘上已替换的个人版），再选择 Failsafe video mode 为 800x600x16，同时选中 Use failsafe video mode，继续启动进入系统后就可以开始安装了。

+ 安装 BeOS Pro 5.0 或 Dano Exp/Exp2 至独立分区

进入系统后，此时已支持多轨 CD，即可直接使用光盘进行安装，或者直接安装此时的硬盘版至独立分区（点击 Deskbar -> Application -> Installer 启动安装程序）。



注意：格式化硬盘分区请谨慎。

+ 其他

安装完系统后你可以再安装 Pro 5.0.3 的升级文件，可能还需要装一些和硬件相关的补丁，比如 cpufix、apm-1.0 等（这些目前在网络上都可以找到）。
而图形驱动（i915）目前未能找到，只能暂时用系统的 vesa 模式（可参考 /boot/home/config/settings/kernel/samples/vesa ），以后有时间看看能否从 HaikuOS 直接编译一个出来用；
至于网卡、声卡等驱动暂时未探究，RTL 之类也许有现成的驱动可供使用。

最后，不要尝试安装 OpenTracker 或 LocaleTracker 之类，因为其与硬盘所使用总线驱动存在冲突将造成死机！

