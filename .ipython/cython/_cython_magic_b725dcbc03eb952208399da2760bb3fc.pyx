cdef int a=1
cdef char* line="/Users/timger/Library/Caches/cython/inline/_cython_inline_620cbd3e2037c39c37c87a1306ff0ba7.pyx"
%%cython_pyximport foo
def f(x):
    return 4.0*x
