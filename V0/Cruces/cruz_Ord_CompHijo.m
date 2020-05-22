function hi = cruz_Ord_CompHijo(hiIn,pro,ind1,ind2)
    hi = hiIn;
    dim = size(hi,2);
    
    % Bandera para finaliar el bucle si se vuelve al mismo indice
    flag = 1;
    
    % Se guardara los nuemro a insertar
    res = [];
    
    % Iteradores
    j = 1;
    i = ind2 + 1;
    while flag
        % Comprobamos que no sobrepase la dimension del cromosoma
        if i > dim
            i = 1;
        end
        
        % Comprobamos que no este repetido en el array
        % y si es correcto se guarda
        if ~any(hi == pro(i))
            res(j) = pro(i);
            j = j + 1;
        end
        
        i = i + 1;
        
        % Si llegamos al indice2 otra vez se finaliza el bucle
        flag = ~(i == ind2 +1);
    end
    
    % Insertamos los resultado en el cromosoma
    hi(ind2+1:end) = res(1:dim-ind2);
    hi(1:ind1-1) = res(dim-ind2+1:end);
end