# -*- coding: utf-8 -*-
from django.urls import re_path
from .views import (Toolview, BD_pushview, bd_api_view, BD_pushview_site, bd_api_site, Link_testview,
                    Link_test_api, regexview, regex_api, useragent_view, useragent_api, html_characters,
                    )

app_name= 'tools'

urlpatterns = [
    re_path(r'^$', Toolview, name='total'),  # 工具汇总页
    re_path(r'^baidu-linksubmit/$', BD_pushview, name='baidu_push'),  # 百度主动推送
    re_path(r'^baidu-linksubmit/ajax/$', bd_api_view, name='baidu_push_api'),  # 百度推送ajax
    re_path(r'^baidu-linksubmit-for-sitemap/$', BD_pushview_site, name='baidu_push_site'),  # 百度主动推送sitemap
    re_path(r'^baidu-linksubmit-for-sitemap/ajax/$', bd_api_site, name='baidu_push_api_site'),
    re_path(r'^link-test/$', Link_testview, name='link_test'),  # 友链检测
    re_path(r'^link-test/ajax/$', Link_test_api, name='link_test_api'),
    re_path(r'^regex/$', regexview, name='regex'),  # 正则表达式在线
    re_path(r'^regex/ajax/$', regex_api, name='regex_api'),
    re_path(r'^user-agent/$', useragent_view, name='useragent'),  # user-agent生成器
    re_path(r'^user-agent/ajax/$', useragent_api, name='useragent_api'),
    re_path(r'^html-special-characters/$', html_characters, name='html_characters'),  # HTML特殊字符查询
]
