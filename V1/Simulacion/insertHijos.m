function pob = insertHijos(pobIn,hijos,fitPrev,prob)
    % Para la insreccion de los hijos se va ha hacer por el fitness
    % se van a elimniar los de menor fitness si un numero random es mayor
    % que una probabilidad -> esto se hace para evitar que hay casos en los
    % que haya individuos mas antigus y que puedan estar compometiendo a la
    % evolucion del algortimo
    pob = pobIn;
    
    numHi = size(hijos,1);
    indx = [];
    
    % Calculo de indices de las
    indFit = 1:size(fitPrev,2);
    for i=1:numHi
        if (rand() < prob)
            % Seleccionamos el de mayor fitness
            [vmax,imax] = max(fitPrev);
        else
            % Seleccionamos uno random
            imax = randi(size(fitPrev,2));
        end
        
        indx(i) = imax;
        fitPrev(imax) = [];
        indFit(imax) = [];
    end
    
    % Asignamos a los hijos
    for i=1:numHi
        pob(indx(i),:) = hijos(i,:);
    end
end