function cromoOut = mut_Sacu(cromo)
    cromoOut = cromo;
    dim = size(cromo,2);

    % Orden de los indices
    indx = sort([randi(dim),randi(dim)]);
    ind1 = indx(1);
    ind2 = indx(2);
    
    % Realizamos la inversion
    cromoOut(ind1:ind2) = cromo(ind2:-1:ind1);
end