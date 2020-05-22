function [MatAdya,ciuSel,cordCiu] = csvToAdya(ciu,nCiu)
    switch ciu
        case 1
            cordCiu = csvread('canada.csv');
        case 2
            cordCiu = csvread('italia.csv');
        case 3
            cordCiu = csvread('china.csv');
    end

    % Seleccionamos nCiudades para realizar
    % Matriz de adyacencia 
    ciuPer = randperm(size(cordCiu,1),nCiu);
    ciuSel = cordCiu(ciuPer,:);
    
    % Calculo de la matriz de adyacencia, se calcula
    % la distacnia de cada ciudad a las demas -> Euclidea
    MatAdya = zeros(nCiu);
    for i=1:nCiu
        for j=i+1:nCiu
            MatAdya(i,j) = 100*sqrt((ciuSel(i,1) - ciuSel(j,1)).^2 + (ciuSel(i,2) - ciuSel(j,2)).^2);
        end
    end
    MatAdya = MatAdya + MatAdya';
end