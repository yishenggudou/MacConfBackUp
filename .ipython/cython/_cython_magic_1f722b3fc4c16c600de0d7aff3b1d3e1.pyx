def tt(char* str_):
    cdef char c
    cdef char* good = ''
    for c in str_:
        print chr(c)
        print good+c
