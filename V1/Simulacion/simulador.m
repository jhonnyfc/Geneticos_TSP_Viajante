function simulador()
    % Para las ciudades sin conexin se les da el valor inf
    %             1   2   3   4   5   6   7   8   9   10
    MatAdyaCiu = [0   71  inf 151 165 inf inf inf inf inf; % 1 Oradea
              71  0   75  inf inf inf inf inf inf inf; % 2 Zerind
              inf 75  0   140 inf inf 118 inf inf inf; % 3 Arad
              151 inf 140 0   99  80  120 inf inf inf; % 4 Sibiu
              165 inf inf 99  0   inf inf 120 211 inf; % 5 Fagaras
              inf inf inf 80  inf 0   inf 97  inf 146; % 6 Rimnnicu
              inf inf 118 120 inf inf 0   inf inf 218; % 7 Timisoara
              inf inf inf inf 120 97  inf 0   101 105; % 8 Pitesi
              inf inf inf inf 211 inf inf 101 0   140; % 9 Bucarest
              inf inf inf inf inf 146 218 105 140 0];  % 10 Craiova

    fprintf('Que tipo de problema quiere resolver\n');
    opcion = input('Trivial 1, Un Pais 2: ');
    
    if opcion == 1
        MatAdyaCiu(MatAdyaCiu == inf) = 5000;
        nCiu = size(MatAdyaCiu,1);
    elseif opcion == 2
        fprintf('\nQue Pais quiere Explorar \n');
        ciu = input('Canada 1, Italia 2, China 3: ');
        if ciu ~= 1 && ciu ~= 2 && ciu ~= 3
        	fprintf('\n\n$ - Ciudad erronea\n');
            return
        end
        nCiu = input('Número de ciudades: ');
        if nCiu < 3
            fprintf('\n\n$ - Numero de ciudades muy pequeño\n');
            return
        end
        [MatAdyaCiu,ciuSel,allCiu] = csvToAdya(ciu,nCiu);
    else
        fprintf('\n\n$ - Tipo de Problema no valido ejecute de nuevo\n');
        return
    end

    % Ciudad de la que parte el viajante
    ciuIni = input('\nSeleccione la ciduad Inicial: ');
    if ciuIni > nCiu || ciuIni < 0
        fprintf('\n\n$ - Ciudad Inicial fuera de Rango\n');
        return
    end
    
    % Recopilacion de datos
    fprintf('\nSeleccion de los parametros.\n');
    nPob = input('Tamaño de la Poblacion: ');
    if nPob < 2
        fprintf('\n\n$ - Tamaño de Pobalcion Muy pequeño\n');
        return
    end
    
    nEpoch = input('Número de generaciones: ');
    if nEpoch < 1
        fprintf('\n\n$ - Numero de de generaciones Muy pequeño\n');
        return
    end


    % Se realizaran varios experimentos con los mismos datos para
    % verificar una buena solucion
    NumeroExperi = input('Seleccione el numero de experimentos: ');
    if NumeroExperi < 1
        fprintf('\n\n$ - Numero de experimetnosmu pequeño\n');
        return
    end
    
    
    % Tipo Cruce
    fprintf('\nSeleccion del tipo de Cruzamiento.\n');
    tipoCruz = input('Mapeado 1, Orden 2, Ciclo 3:   ');
    if tipoCruz ~= 1 && tipoCruz ~= 2 && tipoCruz ~= 3
        fprintf('\n\n$ - Tipo Cruce Erroneo\n');
        return
    end
    numCruces =  input('Seleccion el numero de creuces: ');
    if numCruces < 0 || (numCruces*2) > nPob
        fprintf('\n\n$ - Numero de cruces fura de rango -> (numCruces*2) < dimPoblacion y > 0\n');
        return
    end
    proIns = input('Probabilidad para la inserccion de hijos (0.7 recomendado): ');
    if proIns < 0 || proIns > 1
        fprintf('\n\n$ - Probabilidad de inserccion erroneo\n');
        return
    end
    
    % Tipo Mutaci
    fprintf('\nSeleccion del tipo de Mutacion.\n');
    fprintf('Intercambio 1, Inversion 2\n');
    tipoMut = input('Sacudida 3, Inserccion 4:   ');
    if tipoMut ~= 1 && tipoMut ~= 2 && tipoMut ~= 3 && tipoMut ~= 4
        fprintf('\n\n$ - Tipo Mutacion Erroneo\n');
        return
    end
    probMutacion = input('Probabilidad de Mutacion (0.2 recomendado): ');
    if probMutacion < 0 || probMutacion > 1
        fprintf('\n\n$ - Probabilidad de Mutacion erroneo\n');
        return
    end
    
    minDis = inf;
    mediaIter = 0;
    
    fprintf('\nEjecutando...\n');
    fprintf('Experimento ');
    for i=1:NumeroExperi
        if mod(i,28) == 0
            fprintf('%d \n',i);
        else
            fprintf('%d ',i);
        end
        % Se pone a cada experimento una seed aleatoria para
        % obtener distintas soluciones al mismo problema
        rng('shuffle')
        
        % Inicializacion de la poblacion
        poblacion = generaPob(nCiu,nPob,ciuIni);

        [path,dis,nIter] = algoGeneti(poblacion,MatAdyaCiu,probMutacion,ciuIni,nEpoch,tipoCruz,tipoMut,proIns,numCruces);
        
        mediaIter = mediaIter + nIter/150;
        if dis < minDis
            minDis = round(dis,3);
            pathSol = path;
            itBest = i;
        end
    end
   
    fprintf('\n\n*****************************************************************************\n');
     fprintf('\nMedia de iteraciones  %.1f, best iter: %d\n',mediaIter,itBest);
    if opcion == 2
        paises = ["Canada","Italia","China"];
        
        fprintf('La distancia minima encontrada para el\n');
        fprintf('reccorrido en %s es: %.3f Km\n',paises(ciu),minDis);
        fprintf('La ruta es: ');
        disp(pathSol);
        plotCaminoSol(pathSol,ciuSel,allCiu,ciuIni,minDis,paises(ciu));
    else
        fprintf('La distancia minima encontrada para el problema trivial es: %d\n',minDis);
        fprintf('La ruta es: ');
        disp(pathSol);
    end
    fprintf('\n*****************************************************************************\n');
end











