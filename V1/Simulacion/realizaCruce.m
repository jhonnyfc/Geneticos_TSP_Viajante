function hijos = realizaCruce(fitness,pob,nCruces,tipoCru)
    hijos = [];
    for i=1:nCruces
       % Aplicamos la seleccion de progenitiores
        indPro = selcTorneo(fitness,2);
        prog1 = pob(indPro(1),:);
        prog2 = pob(indPro(2),:);

        % Aplicamos el cruzameinto
        switch tipoCru
            case 1
                hijos = [hijos; cruz_Map(prog1,prog2)];
            case 2
                hijos = [hijos; cruz_Orden(prog1,prog2)];
            case 3
                hijos = [hijos; cruz_Ciclo(prog1,prog2)];
        end
    end
end