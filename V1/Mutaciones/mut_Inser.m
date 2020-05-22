function cromOu = mut_Inser(cromo)
    cromOu = cromo;
    dim = size(cromo,2);
    
    % Orden de los indices
    indx = sort([randi(dim),randi(dim)]);
    ind1 = indx(1);
    ind2 = indx(2);
    
    %Bucll en el el segmento para realizar las insecciones
    for i=ind1+1:ind2-1
        aux = cromOu(i);
        cromOu(i) = cromOu(ind2);
        cromOu(ind2) = aux;
    end
end

