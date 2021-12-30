function [ak, bk] = ex05(Ta,T0,x,K)
    f0 = 1/T0;
    t = 0:Ta:T0-Ta;
    y = x(1:length(t));
    ak = zeros(1,K);
    bk = zeros(1,K);
    
    for k=1 : K
        ak(k) = 2*f0*sum(y.*cos(2*pi*f0*k*t))*Ta;
        bk(k) = 2*f0*sum(y.*sin(2*pi*f0*k*t))*Ta;
    end
end
