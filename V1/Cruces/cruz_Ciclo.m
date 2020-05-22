function hijos = cruz_Ciclo(p1,p2)
    % Inicializacion
    nCrom = size(p1,2);
	h1 = zeros(1,nCrom);
    h2 = zeros(1,nCrom);
    
    i = 1;
    j = 1;
    indx = 0;
    
    % Calculo de ciclos
    while sum(h1 == 0)
        % Busqueda del indice i em p1
        while indx ~= i
            % Se guardan los hijos corepondientes
            h1(j) = p1(j);
            h2(j) = p2(j);
            
            % Guaradmos el indice de p2(j) en p1
            indx = find(p1 == p2(j));
            j = indx;
        end
        i = find(h1 == 0,1,'first');
        j = i;
        
        % Intercabion de los padres para el siguiente ciclo
        aup = p1;
        p1 = p2;
        p2 = aup;
    end
    
    hijos = zeros(2,nCrom);
    hijos(1,:) = h1;
    hijos(2,:) = h2;
end