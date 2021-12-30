function [x,t] = funct (Ta,f,Np,a,b)
  Ttotal = Np * (1/f);    % Numero de periodos * periodo ( T=1/f )
  t = [0 : Ta : Ttotal-Ta];
  
  x = zeros(size(t));
  
  for k=1 : length(a)                           % executar o somatorio
    x = x + a(k) * cos(2*pi*k*f*t) + b(k) * sin(2*pi*k*f*t);
  end
end


