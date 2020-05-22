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
        nCiu = input('Número de ciudades: ');
        [MatAdyaCiu,ciuSel,allCiu] = csvToAdya(ciu,nCiu);
    else
        fprintf('\n\n Tipo de Problema no valido ejecute de nuevo\n');
        return
    end

    % Ciudad de la que parte el viajante 
    ciuIni = 4;
    
    % Recopilacion de datos
    fprintf('\nSeleccion de los parametros.\n');
    nPob = input('Tamaño de la Poblacion: ');
    nEpoch = input('Número de generaciones: ');
    
    % Se realizaran varios experimentos con los mismos datos para
    % verificar una buena solucion
    NumeroExperi = input('Seleccione el numero de experimentos: ');

    
    % Tipo Cruce
    fprintf('\nSeleccion del tipo de Cruzamiento.\n');
    tipoCruz = input('Mapeado 1, Orden 2, Ciclo 3: ');
    numCruces =  input('Seleccion el numero de creuces: ');
    proIns = input('Probabilidad para la inserccion de hijos (0.7 recomendado): ');
    
    
    % Tipo Mutaci
    fprintf('\nSeleccion del tipo de Mutacion.\n');
    fprintf('Intercambio 1, Inversion 2\n');
    tipoMut = input('Sacudida 3, Inserccion 4: ');
    probMutacion = input('Probabilidad de Mutacion (0.2 recomendado): ');
    
    minDis = inf;
    
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

        [path,dis] = algoGeneti(poblacion,MatAdyaCiu,probMutacion,ciuIni,nEpoch,tipoCruz,tipoMut,proIns,numCruces);
        
        if dis < minDis
            minDis = dis;
            pathSol = path;
        end
    end
   
    fprintf('\n\n*****************************************************************************\n');
    if opcion == 2
        paises = ["Canada","Italia","China"];
        
        fprintf('\nLa distancia minima encontrada para el\n');
        fprintf('reccorrido en %s es: %.3f Km\n',paises(ciu),minDis);
        fprintf('La ruta es: ');
        disp(pathSol);
        plotCaminoSol(pathSol,ciuSel,allCiu,ciuIni,minDis,paises(ciu));
    else
        fprintf('\nLa distancia minima encontrada para el problema trivial es: %d\n',minDis);
        fprintf('La ruta es: ');
        disp(pathSol);
    end
    fprintf('\n*****************************************************************************\n');
end











