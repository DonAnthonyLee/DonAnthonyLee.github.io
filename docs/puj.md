---
layout: page
title: PUJ
permalink: /puj/
tag: headline
---

{% include puj-style.html %}

# Pe̍h-uē-jī

<h4><i>白话字</i></h4>

Pe̍h-uē-jī sĭ kū-tsá i--nâng thuân-kà-sṳ̆--hué mue̍h lâi siá Tiê-chiu-uē kâi che̍k-thàu bûn-jī.

***注：***
1. 本专栏所有潮州白话字用字规则，是在《卓威廉词典》（1883 年出版）的基础上，结合 <a href="https://www.ispeakmin.com/bbs/thread-2784-1.html" target="_blank">海墘闽语论坛相关帖</a> 中个别倡议，另增补零星内容而成；其中，因前变调无法分清本调或独立于传统八调之外的调符标识，为参考与同县某乡亲讨论内容而拟；在此向所有相关人士表示衷心感谢；
2. 本专栏白话字所指定字体为 GNU FreeSerif, 已附带于<a href="../css/FreeSerif.ttf" target="_blank">此处</a>，其授权协议为 <a href="https://www.gnu.org/software/freefont/license.html" target="_blank">GPLv3</a> ；
3. <b>本专栏所有文章未注明作者时均为
<ruby style="ruby-position:over">
		<rb class="markup_main">海山</rb>
		<rp>(</rp><rt class="markup_over">Hái-suaⁿ</rt><rp>)</rp>
</ruby>
<ruby style="ruby-position:over">
		<rb class="markup_main">老</rb>
		<rp>(</rp><rt class="markup_over">lău</rt><rp>)</rp>
</ruby>
<ruby style="ruby-position:over">
		<rb class="markup_main">李</rb>
		<rp>(</rp><rt class="markup_over">Lí</rt><rp>)</rp>
</ruby>，未注明授权协议时均可在遵守 <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.zh" target="_blank">知识共享许可协议 CC BY-SA 4.0</a> 协议前提下使用与传播。</b>
<br>
<hr>
<br>

# Bô-sṳ̄-siâng, iáu-suà bô-ia-liâ

<h4><i>片言只语</i></h4>

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

# Huan-e̍k

<h4><i>译文</i></h4>

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
<br>

# Liân-lo-khek

<h4><i>风语</i></h4>

<section class="PUJ container posts-content">
<ol class="posts-list">
{% assign sorted_pages = site.pages | sort: "date" | reverse %}
{% for post in sorted_pages %}
  {% if post.tag == "PUJ_article" %}
      <li class="posts-list-item">
        <span class="posts-list-meta">{{ post.date | date:"%Y-%m-%d" }}</span>
        <a class="posts-list-name" href="{{ site.url }}{{ post.url }}">{{ post.title }}</a>
      </li>
  {% endif %}
{% endfor %}
</ol>
</section>
<br>
