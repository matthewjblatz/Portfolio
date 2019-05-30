import math
import time
found=0;
num=15000088;
count=899999;
start_time=time.time();


while (found==0):
    
    for i in range(2,num):
        if count%i==0:
            break;
    else:
        if(count==990000):
            print "The 990000th Prime:",num;
            found=1;
        count=count+1;
    num=num+2;
print "Time to run (seconds):", (time.time()-start_time);
