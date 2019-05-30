import math
import time
num =0.0;
save = 0;
count=0;
found=0;
start_time=time.time();

for i in range(990000,20000000):
    num = i/math.log(i);
    if (num<=990000.0):
        save=i;
    
    
print "Answer to Prime Number Theorem:",save;

count=save;
while(found==0):
    for i in range(2,count):
        if count%i==0:
            break;
    else:
        found=1;
        print "990 000th Prime:",count;
    count=count-1;

print "Time to run (seconds):", (time.time()-start_time);
