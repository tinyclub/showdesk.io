---
title: 更多
layout: page
tagline: Linux 各类资源合集
permalink: /resources/
group: navigation
plugin: tab
categories:
  - 关于我们
tags:
  - 资源
  - Linux
description: Linux Talents 提供的更多资源。
comments: false
order: 100
---

{% assign res_size = 0 %}
{% assign res = site.data.resources %}
<div id="tab" class="tab_mouseover">
  <div class="tab_header">
    <ul>
    {% for item in res %}

     {% assign size = 0 %}
     {% if site.data[item.data] != nil %}
       {% assign articles = site.data[item.data] %}
       {% assign condition = nil %}
       {% assign value = "" %}
       {% assign size = articles.size %}
     {% else %}
       {% assign articles = site[item.src] %}
       {% assign condition = item.condition %}
       {% assign value = item.value %}
     {% endif %}
     {% for article in articles %}
       {% if condition %}
         {% if article[condition] == value %}
           {% assign size = 1 %}
           {% break %}
         {% endif %}
         {% if condition == 'path' and article[condition] contains value %}
           {% assign size = 1 %}
           {% break %}
         {% endif %}
       {% endif %}
     {% endfor %}

     {% assign res_size = res_size | append:',' | append: size %}

     {% if size != 0 %}
       <li {% if item.title == res.first.title %}class="active"{% endif %}>{{ item.title }}</li>
     {% endif %}
    {% endfor %}
    </ul>
  </div>

  {% assign res_size = res_size | split:"," %}
  <div class="tab_content">
    {% for item in res %}
     {% assign size = res_size[forloop.index] %}
     {% if size == '0' %}
       {% continue %}
     {% endif %}

    <div class='tab_content_item {% if item.title == res.first.title %}active{% endif %}'>
     <ul>

     {% if site.data[item.data] != nil %}
       {% assign articles = site.data[item.data] %}
       {% assign condition = nil %}
       {% assign value = "" %}
     {% else %}
       {% assign articles = site[item.src] %}
       {% assign condition = item.condition %}
       {% assign value = item.value %}
     {% endif %}

     {% for article in articles %}

        {% if condition %}
          {% if condition != 'path' %}
            {% if article[{{condition}}] != {{value}} %}
              {% continue %}
            {% endif %}
          {% else %}
            {% unless article[{{condition}}] contains {{value}} %}
              {% continue %}
            {%endunless%}
          {% endif %}
        {% endif %}

       <li><a ref="bookmark" class="tooltip article" href="{{ article.permalink }}"><span>{% if article.description %}{{ article.description }}{% else %}{{ article.title }}{% endif %}</span>{{ article.title }}</a></li>
     {% endfor %}
     </ul>
    </div>
   {% endfor %}
  </div>
</div>
