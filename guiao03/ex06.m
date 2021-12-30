f0 = 1;
Ta = 0.001;
T0 = 1/f0;
t = 0 : Ta :5-Ta;

z = 2*sin(2*pi*f0*t);
figure(4)
plot(t,z);
title("2sin(2pi*f*t)")

[ak,bk] = ex05(Ta,T0,z,10);

w = funct(Ta,f0,5,ak,bk);
t = 0 : Ta : (5*T0)-Ta;
figure(5)
plot(t,w);  
title("2sin(2pi*f*t) transformada")
