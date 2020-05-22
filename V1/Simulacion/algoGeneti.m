function [path,dis] = algoGeneti(pob,MatCiu,probMut,ciuIni,nEpoch,tipoCru,tipoMut,proIns,numCruce)
    % Contador Genraciones
    nowGen = 0;
    
    % Se desactiva si hay, mas de nRep genracion es iguales
    flagRep = 1;
    nRep = 100;
    rep = 0;
    
    nPob= size(pob,1);
    prevMin = inf;
    
    % Asignacion de valores fitness Iniciales
    fitness = fitnessPob(pob,MatCiu,ciuIni);
    
    while flagRep && (nowGen < nEpoch)
        % Cruces y creacion de los nuevos hijos
        hijos = realizaCruce(fitness,pob,numCruce,tipoCru);
        
        % Asigmanos los nuevos Descendientes cambiandolos por los
        % de pero fitness
        pob = insertHijos(pob,hijos,fitness,proIns);
        
        % Aplicamos mutacion si exite probabilidad
        pob = realizaMut(pob,tipoMut,probMut);
        
        % Calculo del nuevo fitness
        fitness = fitnessPob(pob,MatCiu,ciuIni);
        
        [vmin,imin] = min(fitness);
        if vmin < prevMin
            prevMin = vmin;
            minPath = pob(imin,:);
        elseif vmin == prevMin
            % Si se repita mas de nRep veces la misma mejor solucion
            % se puede decir que no mejora y se termina el experimento
            rep = rep + 1;
            flagRep = rep < nRep;
        end

        nowGen = nowGen +1;
    end
    path = minPath;
    dis = prevMin;
end