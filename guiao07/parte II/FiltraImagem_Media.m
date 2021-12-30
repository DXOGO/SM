function [X] = FiltraImagem_Media(Imagem,Np)
   
    X = uint8(zeros(size(Imagem)));
    
    % se np = 3
    
    % |----  |
    % |  x  |
    % |----  |
    % x tem coordenadas (5, 6)
    % os pontos no quadrado estão entre 4 e 6 (5-1 e 5+1, em que 1 = (np-1)/2) horizontalmente 
    % e entre 5 e 7 verticalmente
    
    aux = (Np - 1) / 2;
    
    for linha = 1 : height(Imagem)
        y1 = max(1, linha - aux);
        y2 = min(height(Imagem), linha+aux);
        
        for coluna = 1 : length(Imagem)
            x1 = max(1, coluna-aux);
            x2 = min(length(Imagem), coluna+aux);
            
            avg_r = sum(sum(Imagem(y1:y2, x1:x2, 1))) / (Np*Np);
            avg_g = sum(sum(Imagem(y1:y2, x1:x2, 2))) / (Np*Np);
            avg_b = sum(sum(Imagem(y1:y2, x1:x2, 3))) / (Np*Np);
            
            X(linha, coluna, 1) = round(avg_r);
            X(linha, coluna, 2) = round(avg_g);
            X(linha, coluna, 3) = round(avg_b);
        end
        
    end
end

