---
layout: page
title: PUJ
permalink: /puj/
tag: headline
---

<h2 class="PUJ">Pe̍h-uē-jī</h2>

<section class="PUJ">
Pe̍h-uē-jī sĭ kū-tsá i--nâng thuân-kà-sṳ̆--hué mue̍h lâi siá Tiê-chiu-uē kâi che̍k-thàu bûn-jī.<br>
<br>
<i>注：<br>本专栏所有潮州白话字（或称潮州罗马字）正字规则，是在《卓威廉词典》（1883 年出版）的基础上，结合 <a href="https://www.ispeakmin.com/bbs/thread-2784-1.html" target="_blank">海墘闽语论坛相关帖</a> 中个别倡议而成；因前变调无法分清本调或独立于传统八调外的调符标识，为参考与同县某不具名人士讨论时其提出建议而拟；在此对所有相关人士表示衷心感谢。</i>
<br>
</section>

<br>
<br>
<h2>Bô-sṳ̄-siâng, iáu-suà bô-ia-liâ</h2>
<section class="PUJ container posts-content">
<ol class="posts-list">
{% assign sorted_pages = site.pages | sort: "date" | reverse %}
{% for post in sorted_pages %}
  {% if post.tag == "PUJ_essay" %}
      <li class="posts-list-item">
        <span class="posts-list-meta">{{ post.date | date:"%Y-%m-%d" }}</span>
        <a class="posts-list-name" href="{{ site.url }}{{ post.url }}">{{ post.title }}</a>
      </li>
  {% endif %}
{% endfor %}
</ol>
</section>

<br>
<br>
<h2>Huan-e̍k</h2>
<section class="PUJ container posts-content">
<ol class="posts-list">
{% assign sorted_pages = site.pages | sort: "date" | reverse %}
{% for post in sorted_pages %}
  {% if post.tag == "PUJ_translation" %}
      <li class="posts-list-item">
        <span class="posts-list-meta">{{ post.date | date:"%Y-%m-%d" }}</span>
        <a class="posts-list-name" href="{{ site.url }}{{ post.url }}">{{ post.title }}</a>
      </li>
  {% endif %}
{% endfor %}
</ol>
</section>
