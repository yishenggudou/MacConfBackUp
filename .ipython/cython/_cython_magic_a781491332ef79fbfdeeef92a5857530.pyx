def tt(char* str_):
    for i in len(str_):
        cdef Py_ssize_t byte_length = i
        print str_[byte_length]
