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
http://ipython.org/ipython-doc/stable/config/overview.html
"""

c = get_config()

c.TerminalIPythonApp.extensions = [
    'line_profiler_ext',
    'memory_profiler_ext',
]
c.InteractiveShellApp.extensions = [
    'line_profiler_ext',
    'memory_profiler_ext',
]
