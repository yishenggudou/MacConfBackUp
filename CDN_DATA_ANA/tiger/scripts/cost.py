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
import costing_chart
import jdata
from urllib2 import urlopen
import json


def main():
    yesterday = jdata.DateQuick.quickdate.tostr(jdata.DateQuick.quickdate.daysago(1))[:8]
    yewus = json.loads(urlopen('http://10.182.63.61:28889/api/yewulist/').read())
    for yewu in yewus: 
        rst = costing_detail_fix.main(yewu, yesterday)
        key = '_'.join(['cost', yesterday, yewu])
        with db.Mdb() as db_:
            _ = {
                '_id':key,
                'data': rst,
                'day': jdata.DateQuick.quickdate.tostr(jdata.DateQuick.quickdate.now)[:8],
                }
            db_['cost'].save(_)
    

def cache():
    yesterday = jdata.DateQuick.quickdate.tostr(jdata.DateQuick.quickdate.daysago(1))[:8]
    yewus = json.loads(urlopen('http://10.182.63.61:28889/api/yewulist/').read())
    p = os.path.join(DIR_PATH, '../cachebuff/page/chart_costs/', yesterday[:8])
    print p
    os.makedirs(p)
    for yewu in yewus: 
        costing_chart.v_area_cost(yesterday[:8], yewu)

if __name__ == "__main__":
   cache()
   main() 
