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
"""
机房异常扫描
"""
import os
DIR_PATH = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
NAME_FILE = os.path.relpath(__file__)
buff_dir = os.path.join(DIR_PATH, '../cachebuff')


def scan(day):
    import requests
    import json
    from jdata.Jdata import Jdata
    import pickle
    api = "http://10.182.63.61:28889/api/idclist/"
    html = requests.get(api).content
    idcs = json.loads(html)
    rst = {}
    s = day + '2000'
    e = day + '2359'
    key = "unusual_idc_" + day + '.cache'
    p = os.path.join(buff_dir, key)
    if os.path.isfile(p):
        v = pickle.load(open(p))
        print '[cache]'
        return v
    else:
        for idc in idcs:
            o = Jdata('maliu_user')
            o.get('slowrate')
            o.filter(idc=idc)
            o.start(s)
            o.end(e)
            _ = []
            for line in o.all():
                _.append(line[-1])
            if len(_):
                avg = sum(_) / len(_)
                rst[idc] = avg
        f = open(p, 'w')
        pickle.dump(rst, f)
        f.close()
        return rst


def compare(day1, day2, step):
    data1 = scan(day1)
    data2 = scan(day2)
    print '[compare]', day1, day2, step
    print data1
    print '-'*100
    print data2
    rst = []
    for key, avg1 in data1.items():
        avg2 = data2.get(str(key), 0)
        if abs(avg2 - avg1) >= int(step):
            rst.append([key, [day1, avg1], [day2, avg2]])
    return rst
if __name__ == "__main__":
    scan('20130806')
    print compare('20130806', '20130807', 2)
