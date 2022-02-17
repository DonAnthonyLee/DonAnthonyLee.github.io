---
layout: post
title:  "EIME 阶段改进"
date:   2022-02-17 23:30:00 +0800
categories: EIME
---

EIME 基本完成 C/S 结构改写，即可兼容更多场景，比如用于 TSF 平台可规避 COM 载入方式的弊端及适应多虚拟容器之间通讯。

暂时在 Mac OS 上调试的场景（图形端暂时借用 Xquartz，其他是好久以前用于纯 Darwin 的代码，基本无改动）：
<video id="video" controls="" preload="none" poster="Anthony Lee">
<source id="mp4" src="https://media.githubusercontent.com/media/DonAnthonyLee/DonAnthonyLee.github.io/main/images/eime-server-client.mp4" type="video/mp4">
</video>

