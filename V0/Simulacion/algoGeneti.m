function [path,dis] = algoGeneti(pob,MatCiu,probMut,ciuIni,nEpoch,tipoCru,tipoMut)
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
        % Aplicamos la seleccion de progenitiores
        indPro = selcTorneo(fitness,2);
        prog1 = pob(indPro(1),:);
        prog2 = pob(indPro(2),:);

        % Aplicamos el cruzameinto
        switch tipoCru
            case 1
                [h1,h2] = cruz_Map(prog1,prog2);
            case 2
                [h1,h2] = cruz_Orden(prog1,prog2);
            case 3
                [h1,h2] = cruz_Ciclo(prog1,prog2);
        end
        
        % Asigmanos los nuevos Descendientes
        pob(indPro(1),:) = h1;
        pob(indPro(2),:) = h2;
        
        % Aplicamos mutacion si exite probabilidad
        for i=1:nPob
            if rand() < probMut
                switch tipoMut
                    case 1
                        pob(i,:) = mut_Inter(pob(i,:));
                    case 2
                        pob(i,:) = mut_Inver(pob(i,:));
                    case 3
                        pob(i,:) = mut_Sacu(pob(i,:));
                    case 4
                        pob(i,:) = mut_Inser(pob(i,:));
                end
            end
        end
        
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