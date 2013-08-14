def tt(char* str_):
    cdef char c
    cdef char* good = ''
    for c in str_:
        print char(c)
        print good+c
