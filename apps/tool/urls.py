# -*- coding: utf-8 -*-
from django.urls import path
from .views import (Toolview, BD_pushview, bd_api_view, BD_pushview_site, bd_api_site, Link_testview,
                    Link_test_api, regexview, regex_api, useragent_view, useragent_api, html_characters,
                    )

app_name= 'tools'

urlpatterns = [
    path('', Toolview, name='total'),  # 工具汇总页
    path('baidu-linksubmit/', BD_pushview, name='baidu_push'),  # 百度主动推送
    path('baidu-linksubmit/ajax/', bd_api_view, name='baidu_push_api'),  # 百度推送ajax
    path('baidu-linksubmit-for-sitemap/', BD_pushview_site, name='baidu_push_site'),  # 百度主动推送sitemap
    path('baidu-linksubmit-for-sitemap/ajax/', bd_api_site, name='baidu_push_api_site'),
    path('link-test/', Link_testview, name='link_test'),  # 友链检测
    path('link-test/ajax/', Link_test_api, name='link_test_api'),
    path('regex/', regexview, name='regex'),  # 正则表达式在线
    path('regex/ajax/', regex_api, name='regex_api'),
    path('user-agent/', useragent_view, name='useragent'),  # user-agent生成器
    path('user-agent/ajax/', useragent_api, name='useragent_api'),
    path('html-special-characters/', html_characters, name='html_characters'),  # HTML特殊字符查询
]
