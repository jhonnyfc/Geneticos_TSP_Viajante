function indx = selcTorneo(fitPob,nProg)
    % La seccion implentada es con repeticion
    % es decir podemos elegir dos veces a mismo padre
    indx = zeros(1,nProg);
    nPob = size(fitPob,2);
    
    % Realizamos Tantos torneos como porgenitores necesitemos
    for i=1:nProg
        k = 2;%randi(nPob);
        selTorn = randperm(nPob);
        [minV,imin] = min(fitPob(selTorn(1:k)));
        masc = minV == fitPob(selTorn(1:k));
        indx(i) = selTorn(find(masc, 1, 'first'));
    end
end