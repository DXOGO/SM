Ta = 0.001;
t = [0 : Ta : 3];

% criar todas as funcoes
x = 2*sin(4*pi*t);
y = sin(10*pi*t + pi/2);
z = sin(6*pi*t) + sin(8*pi*t);
w = sin(6*pi*t) + sin(8*pi*t + 0.1);
q = sin(6*pi*t) + sin(7*pi*t) + sin(8*pi*t);

% mostrar todas funcoes
plot(t,x,'--g'  ,'LineWidth',1.5);
hold on
plot(t,y,'-r');
plot(t,z,'-b','LineWidth',2);
plot(t,w,'-y','LineWidth',1.5);
plot(t,q,'-k','LineWidth',2);

% labeling the functions
xlabel("Time(s)");
ylabel("Function");
title("Function x/y/z/w/q");
legend('x','y','z','w','q');
grid;

a = 2 + cos(2*pi*t- pi/3) + sin(4*pi*t+pi/2);

disp("Potência de x: " + Power(x,t));
disp("Potência de y: " + Power(y,t));
disp("Potência de z: " + Power(z,t));
disp("Potência de w: " + Power(w,t));
disp("Potência de q: " + Power(q,t));
disp(Power(a,t));

function p = Power(x,t)
    p = sum(x.^2)/length(t);
end

