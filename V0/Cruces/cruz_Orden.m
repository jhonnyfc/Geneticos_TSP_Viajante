function [h1,h2] = cruz_Orden(p1,p2)
    % Inicializacion
    nCrom = size(p1,2);
	h1 = zeros(1,nCrom);
    h2 = zeros(1,nCrom);

    % Seleccionamos 2 puntos
    ind1 = randi(nCrom);
    ind2 = randi(nCrom);
    
    aux = sort([ind1,ind2]);
    ind1 = aux(1);
    ind2 = aux(2);

    % Creamos los Hijo
    h1(ind1:ind2) = p1(ind1:ind2);
    h2(ind1:ind2) = p2(ind1:ind2);

    % Completamos el hijo con las seccines necesarias
    % segun el algoritmo orden
    h1 = cruz_Ord_CompHijo(h1,p2,ind1,ind2);
    h2 = cruz_Ord_CompHijo(h2,p1,ind1,ind2);
end