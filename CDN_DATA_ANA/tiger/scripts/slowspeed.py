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
import datetime
import urllib
import json
import os
from jdata.Jdata import Jdata
DIR_PATH = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
import sys
sys.path.append(os.path.split(DIR_PATH)[0])
import settings

def get_slowspeed(day=None):
    now = datetime.datetime.now() 
    yesterday = now - datetime.timedelta(1)
    day = day or yesterday.strftime('%Y%m%d')
    f = open(os.path.join(settings.PROJECT_DIR,
                          'maxslowspeed',
                          'max_slowspeed.' + day ),
             'w')
    print f.name
    uri = settings.TIGER_API + 'page/maxslowspeed/{area}/{day}/{yewu}?_refresh=1'  
    areas = json.loads(urllib.urlopen(settings.TIGER_API + 'api/arealist' ).read())
    #areas = []
    #areas.append('guangdong_shenzhen')
    #areas.append('guangdong_guangzhou')
    data = []
    yewu_names = [('1.101','web'),('3.302','mobile'),('5.500','tv')]
    for area in areas:
        data_line = {'area': area}
        for yewu, name in yewu_names:
            url = uri.format(area=area,
                             day=day,
                             yewu=yewu)
            print "[jdata]", url
            _  = json.loads(urllib.urlopen(url).read())   
            print _
            data_line[name] = _[1]
            _ = ','.join([(day + '00000')[:12], area,yewu,str(_[1]),_[0],str(_[2]),str(_[3])])
            f.write(_.strip(',')+'\n')
        data.append(data_line)
    ###添加 CNC  CT ALL
    for isp in ['ct', 'cnc', 'allisp']:
        for yewu, name in yewu_names:
            o = Jdata('maliu_user')
            o.start(day[:8] + '0000')
            o.end(day[:8] + '2359')
            if isp == 'allisp':
                o.filter(business=yewu)
            else:
                o.filter(isp=isp, business=yewu)
            o.get('slowrate','slowusers','users')
            v = o.all()
            max_line = [day[:8], 0, 0, 0]
            for line in v:
                if float(line[1]) > max_line[1]:
                    max_line = line
            max_line[0] = max_line[0].replace(':','').replace('/','').replace(' ','')
            _ = ','.join([(day + '000000')[:12],
                          isp, yewu,
                          str(max_line[1]),
                          str(max_line[0]),
                          str(max_line[2]),
                          str(max_line[3]),
                          ])
            print '>>[FIX]', _
            f.write(_.strip(',')+'\n')
    ### end ###
    f.close()
    cmd = "curl  -F file=@{file} -F _o={o} -F _s={day} -F '_t=,'  -F data_exists_action=replace   {jdata}api/uploadresultfile"
    cmd = cmd.format(o='maxslowspeed_by_area',
                     file=os.path.abspath(f.name),
                     day=day,
                     jdata=settings.JDATA_API)
    print '[cmd]', cmd
    os.system(cmd)
    return True

if __name__ == "__main__":
    import sys
    day = sys.argv[1]
    day = day[:8]
    get_slowspeed(day)
