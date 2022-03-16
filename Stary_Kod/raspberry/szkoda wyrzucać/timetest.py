import time

a = time.time()
for i in range(5):
    time.sleep(0.01)
    b = time.time()
    print(b - a)
