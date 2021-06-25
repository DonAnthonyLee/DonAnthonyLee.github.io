---
layout: post
title:  "见鬼的 Wayland"
date:   2021-06-24 22:18:00 +0800
categories: Wayland
---
# Wayland 是什么
Wayland 自称微型显示合成管理系统，源于 X.org，近年大有代替 X Window 之势。

# XWayland 使用后感
在 Ubuntu Linux 上尝试了 XWayland 一段时间，死机现象频发。特别是当 gnome-shell 挂了一堆垃圾插件（JavaScript 写的居多，当然还有 python 等写的）时，一段时间后（特别机器休眠唤醒时），gnome-shell 的合成器（听说是 mutter）居然可以陷入疯狂甚至崩溃。。。这感觉，马上让以前大脚丫的形象直接跌到地上摩擦。。。用回 Xorg 后，各种流畅。。。

# Wayland 开发有感
这段时间，把自用工具集移植到 UWP ，顺道想着干脆连同 Wayland 的 graphics add-on 也做了，于是乎，各种草。。。

在 wayland-client 中，窗口边框需要程序自己绘制还算问题不大，却非要把普通窗口的布局都交给合成器（号称原设计初衷即是如此），程序连得知窗口当前位置都难比登天，难道要程序自己和各种 shell 私有协议（或称 interface，比如 weston/plasma 等等）打交道？不给程序访问窗口当前位置，试问菜单等如何决定自己的位置？别告诉我你有 wl_subsurface，xdg_popup 。。。那些局限性太多了。。。

看来，当前的 "Wayland"，还有一大段路要走。。。这段时间给我的感觉是，每个程序都自己挎个值钱的包包（连续内存），里面自备各种乱七八糟的物品（绘图自理）。。。给我的感觉怎么和 Android 用 EGL 那么像呢？还好现在机器内存和白菜一样，想要多少都行。。。

