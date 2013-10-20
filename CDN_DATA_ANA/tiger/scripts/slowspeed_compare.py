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
from collections import defaultdict


def scan(day):
    import requests
    import json
    from jdata.Jdata import Jdata
    import pickle
    api = "http://10.182.63.61:28889/api/idclist/"
    html = requests.get(api).content
    idcs = json.loads(html)
    rst = defaultdict(dict)
    s = day + '2000'
    e = day + '2359'
    key = "slowrate_idc_" + day + '.cache'
    p = os.path.join(buff_dir, key)
    users_rst = {}
    if os.path.isfile(p):
        v = pickle.load(open(p))
        print '[fromcache]'
        return v
    else:
        o = Jdata('maliu_user')
        o.get('users', 'slowrate')
        o.pageby('area', 'isp', 'idc')
        o.start(s)
        o.end(e)
        vs = {}
        _s = {}
        for line in o.all():
            key = ','.join(line[1:-2])
            _ = _s.get(key, []) #slowrates
            v = vs.get(key, []) #users
            _.append(line[-1])
            v.append(line[-2])
            vs[key] = v[:]
            _s[key] = _[:]
        for key in vs.keys():
            area, isp, idc = key.strip().split(',')
            o = Jdata('maliu_user')
            o.get('users', 'slowrate')
            o.filter(idc=idc)
            o.filter(isp=isp)
            o.filter(area=area)
            o.pageby('business')
            o.dataclean(0)
            o.start(s)
            o.end(e)
            print key
            v = vs[key]
            _ = _s[key]
            if len(v):
                avg = sum(v) / len(v)
                users_rst[key] = avg
            if len(_):
                avg = sum(_) / len(_)
                if users_rst.get(key, 0) > 100:
                    rst[key] = {'slowrate':avg,
                                'users':users_rst.get(key)
                                }
                #yewu展开
                #del _s
                #del vs
                #del html
                #del idcs
                """
                kk_ = list(o.expand('business'))
                kk_e = o.expands
                tt_v = kk_[0]
                kk = [dict([(kk_i, i[1]) for kk_i in kk_e]) for i in kk_]
                len_kk = len(kk)
                for yewu in o.expands:
                    kk_slowrate = [i[yewu][0] for i in kk if i != 'null']
                    kk_slowuser = [i[yewu][1] for i in kk if i != 'null']
                    rst[key][yewu+'_slowrate'] = sum(kk_slowrate)/len(kk_slowrate)
                    rst[key][yewu+'_users'] = sum(kk_slowuser)/len(kk_slowuser)
                """
        with open(p, 'w') as f:
            pickle.dump(rst, f)
        return rst


def compare(day1, day2, step):
    from collections import defaultdict
    data1 = scan(day1)
    data2 = scan(day2)
    print '[compare]', day1, day2, step
    #print data1
    print '-' * 100
    #print data2
    rst = []
    for key, obj1 in data1.items():
        obj2 = data2.get(str(key), defaultdict(int))
        step_u = abs(obj2['slowrate'] - obj1['slowrate'])
        if step_u >= int(step):
            rst.append({'idc':key,
                        'day1':day1,
                        day1: obj1,
                        'day2': day2,
                        day2: obj2,
                        'step': step_u })
    return rst


if __name__ == "__main__":
    #scan('20130806')
    print compare('20130806', '20130807', 0)
