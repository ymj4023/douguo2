from django import template
from django.utils import timezone
import math
import re

register = template.Library()

# 获取相对时间
@register.filter(name='timesince_zh')
def time_since_zh(value):
    now = timezone.now()
    diff = now - value

    if diff.days == 0 and diff.seconds >= 0 and diff.seconds < 60:
        # return str(diff.seconds) + "秒钟前"
        return '刚刚'

    if diff.days == 0 and diff.seconds >= 60 and diff.seconds < 3600:
        return str(math.floor(diff.seconds / 60)) + "分钟前"

    if diff.days == 0 and diff.seconds >= 3600 and diff.seconds < 86400:
        return str(math.floor(diff.seconds / 3600)) + "小时前"

    if diff.days >= 1 and diff.days < 30:
        return str(diff.days) + "天前"

    if diff.days >= 30 and diff.days < 365:
        return str(math.floor(diff.days / 30)) + "个月前"

    if diff.days >= 365:
        return str(math.floor(diff.days / 365)) + "年前"


# 获取 ckeditor plain text
@register.filter(name='plain_text')
def from_ckeditor_data_get_plain_text(value):
    return re.sub(r'(<[^>]+>)|&nbsp;', '', value)

# 单位换算: 分 -> 元
@register.filter(name='unit_conversion')
def unit_conversion(value):
    new_value_str = '{:.2f}'.format(int(value) / 100)
    return new_value_str