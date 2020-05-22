function hijos = cruz_Map(p1,p2)
    nCrom = size(p1,2);

    % Seleccionamos 2 puntos
    ind1 = randi(nCrom);
    ind2 = randi(nCrom);
    
    aux = sort([ind1,ind2]);
    ind1 = aux(1);
    ind2 = aux(2);

    % Creamos los Hijos
    h1 = p2;
    h2 = p1;
    
    seg1 = p1(ind1:ind2);
    seg2 = p2(ind1:ind2);

    h1(ind1:ind2) = seg1;
    h2(ind1:ind2) = seg2;

    % Se hace que los elmetos sen unicos
    h1 = cruz_Map_CompUniq(h1,ind1,ind2,seg1,seg2);
    h2 = cruz_Map_CompUniq(h2,ind1,ind2,seg2,seg1);
    
    hijos = zeros(2,nCrom);
    hijos(1,:) = h1;
    hijos(2,:) = h2;
end