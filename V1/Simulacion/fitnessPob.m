function fit = fitnessPob(pob,MatAdyaCiu,ciuIni)
    nGens = size(pob,2);
    nPob = size(pob,1);
    fit = zeros(1,nPob);
    
    %Calculamos para cada poblacion la distancia del camino
    for i=1:nPob
        fit(i) = fit(i) + MatAdyaCiu(ciuIni,pob(i,1));
        fit(i) = fit(i) + MatAdyaCiu(ciuIni,pob(i,nGens));
        for j=1:nGens-1
            fit(i) = fit(i) + MatAdyaCiu(pob(i,j),pob(i,j+1));
        end
    end
end