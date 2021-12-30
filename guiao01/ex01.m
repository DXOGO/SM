%% a) 

Ta = 0.01;

t = [0 : Ta : 5];      % de 0 a 5 em intervalos de 0.01 segundos (Ta) 
x = 2*sin(4*pi*t);
subplot(2,2,1);
figure(1);
plot(t,x);
xlabel('Time(s)');
ylabel('x(t)');
title('Signal: x(t)');
grid;

%% b) 

t = [0 : Ta : 5];
y = cos(10*pi*t);
subplot(2,2,2);
plot(t,y);
xlabel('Time(s)');
ylabel('y(t)');
title('Signal: y(t)');
grid;

%% c)

t = [0 : Ta : 5];
z = x.*y;
subplot(2,2,3);
plot(t,z);
xlabel('Time(s)');
ylabel('z(t)');
title('Signal: z(t)');
grid;


%% d)

tt = [0 : Ta : 10];
w = 3*sin(pi*tt)+2*sin(6*pi*tt);
subplot(2,2,4);
plot(tt,w);
xlabel('Time(s)');
ylabel('w(t)');
title('Signal: w(t)');
grid;


%% e)

t1 = [0 : Ta : 5];
t2 = [0 : Ta : 5];
q = zeros(length(t1),length(t2));
for n=1: length(t2)
    q(:,n)=2*sin(2*pi*(2*t1+t2(n)));
end
xlabel('t1');
ylabel('t2');
zlabel('q(t1,t2)');
title('Signal: q(t1,t2)');
figure(2);
mesh(t1,t2,q);
