#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
#    Copyright 2011 timger
#    +Author timger
#    +Gtalk&Email yishenggudou@gmail.com
#    +Msn yishenggudou@msn.cn
#    +Weibo @timger http://t.sina.com/zhanghaibo
#    +twitter @yishenggudou http://twitter.com/yishenggudou
#    Licensed under the MIT License, Version 2.0 (the "License");
import os
import sys
DIR_PATH = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
sys.path.append(os.path.split(DIR_PATH)[0])
from jdata.Jdata import Jdata
import jdata
from filecache import cache, Cache
import numpy as np

@cache(30 * 40)
def slowrate_detail(day1, day2):
    cache_day1_str = 'yewu_detail_by_day_' + day1[:8]
    cache_day2_str = 'yewu_detail_by_day_' + day2[:8]
    o = Jdata('maliu_user')
    o.pageby('idc', 'business')
    o.start(day1[:8]+ '2000')
    o.end(day1[:8]+ '2359')
    o.get('users','slowrate')
    if Cache.get(cache_day1_str):
        data_day1 = Cache.get(cache_day1_str)
    else:
        data_day1 = list(o.all())
        Cache.set(cache_day1_str, data_day1)
    o.start(day2[:8]+ '2000')
    o.end(day2[:8]+ '2359')
    o.get('users','slowrate')
    if Cache.get(cache_day2_str):
        data_day2 = Cache.get(cache_day2_str)
    else:
        data_day2 = list(o.all())
        Cache.set(cache_day2_str, data_day2)
    npday1 = np.array(data_day1)
    npday2 = np.array(data_day2)
    day1_keys = set([','.join(i[1:3]) for i in data_day1])
    day2_keys = set([','.join(i[1:3]) for i in data_day2])
    day1_idcs = set([i[1] for i in data_day1])
    day2_idcs = set([i[1] for i in data_day2])
    cache_day1_rst_str = 'cache_day_rst_str_' + day1[:8]
    cache_day2_rst_str = 'cache_day_rst_str_' + day2[:8]
    cache_day1_rst = Cache.get(cache_day1_rst_str)
    cache_day2_rst = Cache.get(cache_day2_rst_str)
    #print '[cache_day1_rst]', cache_day1_rst
    #print '[cache_day2_rst]', cache_day2_rst
    user_step = 0
    if cache_day1_rst:
        day1_rst = cache_day1_rst
    else:
        print '-'*100
        day1_rst = {}
        for key in day1_keys:
            key_ = key.split(',')
            key_data = filter(lambda x:x[1]==key_[0] and x[2] == key_[1], data_day1)
            key_max = max(key_data, key=lambda x:x[-1])
            if key_max[-2] < user_step:
                day1_rst[key] = ['null', 'null', 'null', 0]
            else:
                day1_rst[key] = key_max
        Cache.set(cache_day1_rst_str, day1_rst)
    if cache_day2_rst:
        day2_rst = cache_day2_rst
    else:
        print '-'*100
        day2_rst = {}
        for key in day2_keys:
            key_ = key.split(',')
            key_data = filter(lambda x:x[1]==key_[0] and x[2] == key_[1], data_day2)
            key_max = max(key_data, key=lambda x:x[-1])
            if key_max[-2] < user_step:
                day2_rst[key] = ['null', 'null', 'null', 0]
            else:
                day2_rst[key] = key_max
        Cache.set(cache_day2_rst_str, day2_rst)
    idcs = day1_idcs | day2_idcs
    rst = []
    for idc in idcs:
        _ = {}
        _['idc'] = idc
        day1_sum = []
        day2_sum = []
        for yewu in ['1.101', '3.302', '5.500', '3.304']:
            key = idc + ',' + yewu
            day1_yewu = day1_rst.get(key,['null',0])
            _['day1_' + yewu] = day1_yewu[-1]
            day1_sum.append(day1_yewu)
            day2_yewu = day2_rst.get(key,['null',0])
            print '[DAY_YEWU]', idc, day2_yewu 
            _['day2_' + yewu] = day2_yewu[-1]
            day2_sum.append(day2_yewu)
        _['day1_top_avg'] = sum([i[-1] for i in day1_sum])/len(day1_sum) 
        _['day2_top_avg'] = sum([i[-1] for i in day2_sum])/len(day2_sum) 
        o = Jdata('maliu_user')
        o.pageby('idc')
        o.filter(idc=idc)
        o.start(day1[:8]+ '2000')
        o.end(day1[:8]+ '2359')
        o.get('slowrate')
        o.pageby('idc')
        try:
            _['day1_top'] = max(o.all(), key=lambda x:x[-1])[-1]
        except ValueError:
            _['day1_top'] = 0
        o.start(day2[:8]+ '2000')
        o.end(day2[:8]+ '2359')
        o.get('slowrate')
        o.pageby('idc')
        try:
            _['day2_top'] = max(o.all(), key=lambda x:x[-1])[-1]
        except ValueError:
            _['day2_top'] = 0
        _['up'] = _['day2_top'] - _['day1_top']
        rst.append(_.copy())
        
    return rst


if  __name__ == "__main__":
    if len(sys.argv) == 3:
        day1 = sys.argv[1][:8]
        day2 = sys.argv[2][:8]
    else:
        day1 = jdata.DateQuick.quickdate.tostr(jdata.DateQuick.quickdate.daysago(2))[:8] 
        day2 = jdata.DateQuick.quickdate.tostr(jdata.DateQuick.quickdate.daysago(1))[:8] 
    print slowrate_detail(day1, day2)

