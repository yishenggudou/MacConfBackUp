def tt(char* str_):
    cdef char c
    cdef char* good = ''
    cdef char* p
    for c in str_:
        print chr(c)
        p = good + c
        print good
        print str_
    print <type*>p
