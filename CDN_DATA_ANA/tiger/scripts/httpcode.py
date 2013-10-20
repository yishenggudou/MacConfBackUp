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
NAME_FILE = os.path.relpath(__file__)

sys.path.append(os.path.join(DIR_PATH,'../pages'))

import db
import costing_detail_fix
import jdata
from urllib2 import urlopen
import json


def main():
    yesterday = jdata.DateQuick.quickdate.tostr(jdata.DateQuick.quickdate.daysago(1))[:8]
    yewus = json.loads(urlopen('http://10.182.63.61:28889/api/yewulist/').read())
    day = yesterday
    for yewu in yewus: 
        o = jdata.Jdata.Jdata('base_bw')
        o.filter(business=yewu)
        o.start(day[:8]+'2000')
        o.dataclean(0)
        o.end(day[:8]+'2359')
        o.get('request')
        o.pageby('httpcode')
        vv = o.all()
        rst = {}
        for i in vv:
            if rst.get(i[1]):
                rst[i[1]] = (rst[i[1]] + i[2])
            else:
                rst[i[1]] = i[2]

        key = '_'.join(['httpcode', yesterday, yewu])
        with db.Mdb() as db_:
            _ = {
                '_id': key,
                'data': rst,
                'day': jdata.DateQuick.quickdate.now,
                }
            db_['httpcode'].save(_)
    

if __name__ == "__main__":
   main() 
