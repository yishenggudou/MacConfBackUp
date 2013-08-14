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
.. module:: useful_1
   :platform: Unix, Windows
      :synopsis: A useful module indeed.

      .. moduleauthor:: @timger <yishenggudou@gmail.com>


"""

import os
import sys
import logging
import itertools
import shelve
#http://pythonhosted.org/an_example_pypi_project/sphinx.html#full-code-example
#http://pythonhosted.org/an_example_pypi_project/pkgcode.html

DIR_PATH = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
NAME_FILE = os.path.relpath(__file__)

db = shelve.open(os.path.join(DIR_PATH,NAME_FILE.split('/')[-1].split('.')[0]+'.db'))

logger = logging.getLogger('octopus.libs.%s' %NAME_FILE)
logger.setLevel(logging.DEBUG)



__author__ = 'timger & yishenggudou@gmail.com'
__license__ = 'MIT'
__version__ = (0, 0, 0)

__all__ = ['xx','xxx']

"""
.. module:: useful_1
   :platform: Unix, Windows
   :synopsis: A useful module indeed.

.. moduleauthor:: Andrew Carter <andrew@invalid.com>


"""

def public_fn_with_googley_docstring(name, state=None):
    """This function does something.

    Args:
       name (str):  The name to use.

    Kwargs:
       state (bool): Current state to be in.

    Returns:
       int.  The return code::

          0 -- Success!
          1 -- No good.
          2 -- Try again.

    Raises:
       AttributeError, KeyError

    A really great idea.  A way you might use me is

    >>> print public_fn_with_googley_docstring(name='foo', state=None)
    0

    BTW, this always returns 0.  **NEVER** use with :class:`MyPublicClass`.

    """
    return 0

def public_fn_with_sphinxy_docstring(name, state=None):
    """This function does something.

    :param name: The name to use.
    :type name: str.
    :param state: Current state to be in.
    :type state: bool.
    :returns:  int -- the return code.
    :raises: AttributeError, KeyError

    """
    return 0

def public_fn_without_docstring():
    return True

def _private_fn_with_docstring(foo, bar='baz', foobarbas=None):
    """I have a docstring, but won't be imported if you just use ``:members:``.
    """
    return None


class MyPublicClass(object):
    """We use this as a public class example class.

    You never call this class before calling :func:`public_fn_with_sphinxy_docstring`.

    .. note::

       An example of intersphinx is this: you **cannot** use :mod:`pickle` on this class.

    """

    def __init__(self, foo, bar='baz'):
        """A really simple class.

        Args:
           foo (str): We all know what foo does.

        Kwargs:
           bar (str): Really, same as foo.

        """
        self._foo = foo
        self._bar = bar

    def get_foobar(self, foo, bar=True):
        """This gets the foobar

        This really should have a full function definition, but I am too lazy.

        >>> print get_foobar(10, 20)
        30
        >>> print get_foobar('a', 'b')
        ab

        Isn't that what you want?

        """
        return foo + bar

    def _get_baz(self, baz=None):
        """A private function to get baz.

        This really should have a full function definition, but I am too lazy.

        """
        return baz

#assert Expression[, Arguments]
assert (Temperature >= 0),"Colder than absolute zero!"


class MyError(Exception):
    def __init__(self, value):
        self.value = value
    def __str__(self):
        return repr(self.value)


def Print(func):
    def new_func(*args, **argkw):
        sys.stdout = STDOUT_FILE
        return func(*args, **argkw) #调用原函数继续进行处理
    return new_func
@A
def f(args):pass


class xx:
    """
    Returns a SystemStat describing memory usage, expressed in bytes.

    The returned object has the following accessors:

    - current(): memory currently used by this instance
    - average1m(): average memory use, over the last minute
    - average10m(): average memory use, over the last ten minutes
    - average1h(): average memory use, over the last hour
    
    write some doctest like this
    >>> from StringIO import StringIO
    >>> list(network_segment(StringIO(_sample_whois)))
    ['202.96.63.0/24', '203.93.123.0/24', '221.4.140.0/24', '221.5.250.0/24']
    """
    def __init__(self,**args):
        pass

    def __getitem__(self, key): 
        return self.data[key]

    def __setitem__(self, key, item): 
        self.data[key] = item

    def __repr__(self):
        return '<Class %s>' %'xx'

    def __str__(self):
        return 'some print content'

    def __del__(self):
        print 'leave the class'


def cube(x):
    """
    >>> cube(10)
    1000
    """
    return x * x







if __name__ == '__main__':
    import doctest
    doctest.testmod()
    main()


