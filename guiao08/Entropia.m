function H = Entropia(Texto)

% H = Somatorio(k=1 até K) = Pk * log(2) * (1/Pk) bps --> onde Pk é a prob de ocorrência do simbolo k

[~,Frequencias] = Alfabeto2(Texto);         % chamar o Alfabeto2 para tirar as frequencias  [Simbolos,Frequencias] = Alfabeto2(Texto);
Pk = Frequencias/100;       % prob de ocorrer o simbolo em %

H = Pk'*log2(1./Pk);        % formula da entropia

end

