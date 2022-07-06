---
layout: page
title: PUJ
permalink: /puj/
tag: headline
---

{% include puj-style.html %}

# Pe̍h-uē-jī

<h4><i>白话字</i></h4>

Pe̍h-uē-jī sĭ kū-tsá i&#x002D;&#x002D;nâng thuân-kà-sṳ̆&#x002D;&#x002D;hué mue̍h lâi siá Tiê-chiu-uē kâi che̍k-thàu bûn-jī.

**注：**
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
</ruby>，未注明授权协议时均可在遵守 <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.zh" target="_blank">知识共享许可协议 CC BY-SA 4.0</a> 协议前提下使用与传播；</b>
4. <a href="https://github.com/DonAnthonyLee/DonAnthonyLee.github.io/discussions/10" target="_blank">有空且是 github 用户者可在讨论区留言</a>。
<br>


<br>
**关于白话字用字规则补充（缺省作者按）：**
1. 此专栏中所写白话字文除 -n/-t 韵尾采用半复古方式外，所有（译文除外）均为个人平日腔调；所不同者为其中部分 -n/-t 韵尾读为 -ng/-k； <br>
2. 译文之类为综合原作及部分他处说法有选择性地采用词音；<br>
3. -n/-t 韵尾标注规则，主要以《卓威廉词典》、《菲尔德词典》两部白话字词典及《潮汕十五音》为准，其次为个人在故乡所听到者，最后为参考同源的闽南语漳泉腔或其他资料等；对于与词典等存在出入者，极个别在源文件中采用就近注写进行说明；当然，个别词语出错在所难免，若有保留此等韵尾稍为完善之地（凤凰、三饶等地）乡亲愿提供资料，可直接<a href="mailto:don.anthony.lee@gmail.com">联系本人</a>；<br>
4. 转换规则列举：府城口音者，-io/-ioⁿ 变 -ie/ieⁿ；-iau- 变 -iou-；-ian 变 -ieng（极个别除外）；-iat 变 -iek；-uan 变 -ueng（极个别除外）；-uat 变 -uek；无 -uam/-uap/-om/-op 者相应变为 -uang/-uak/-am/-ap 等；其他 -n/-t 韵尾均改为 -ng/-k 韵尾；极个别 -iang 可能对应 -ieng（比如表示倔强的 kiăng）之类不在前述之列。至于其他地方口音者，请参考前述自行转换，不便于此赘述。
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
