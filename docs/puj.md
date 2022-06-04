---
layout: page
title: PUJ
permalink: /puj/
tag: headline
---

<h2 class="PUJ">Pe̍h-uē-jī</h2>

<section class="PUJ">
Pe̍h-uē-jī sĭ kū-tsá i--nâng thuân-kà-sṳ̆--hué mue̍h lâi siá Tiê-chiu-uē kâi che̍k-thàu bûn-jī.
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

