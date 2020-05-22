function poblacion = generaPob(nCiu,nPob,ciuIni)
    % Se genera la pobalcion con tamaño nPob
    % que emieza en la ciuIni, con nCiu genes
    arryCiu = 1:nCiu;
    arryCiu = arryCiu(arryCiu ~= ciuIni);
    
    poblacion = zeros(nPob,nCiu-1);
    for i=1:nPob
        poblacion(i,:) = arryCiu(randperm(nCiu-1));
    end
end