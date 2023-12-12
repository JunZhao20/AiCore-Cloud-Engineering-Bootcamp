
def startEnd(func):
    def wrapper(*args, **kwargs):
        print('start')
        func(*args, **kwargs)
        print('end')
    return wrapper


@startEnd
def name(s):
    print(s)
    

name('jun')

import time

def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        func(*args, **kwargs)
        finish = time.time()
        print(f'Time: {finish-start}')
    return wrapper

@timer
def name(s):
    print(s)

name('zhao')