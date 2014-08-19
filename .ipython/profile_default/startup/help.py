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
print """
Use Cython See http://nbviewer.ipython.org/github/ipython/ipython/blob/3607712653c66d63e0d7f13f073bde8c0f209ba8/docs/examples/notebooks/cython_extension.ipynb
%load_ext cythonmagic

edit moudle use
%%cython_pyximport foo

%%cython
cimport cython
from libc.math cimport exp, sqrt, pow, log, erf

use clib see http://docs.cython.org/src/tutorial/clibraries.html

import pyximport
pyximport.install(reload_support=True)
reload(foo1)

#import foo.pyx
uee
import foo as f
reload(f)
import pyx file

plot see "http://stanford.edu/~mwaskom/software/seaborn/linear_models.html"
cd ~/Dropbox/ipythonscripts/
"""
import pyximport
pyximport.install(reload_support=True)
