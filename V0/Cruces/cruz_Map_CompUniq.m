function hi = cruz_Map_CompUniq(hIn,ind1,ind2,seg1,seg2)
    hi = hIn;
    dim = size(seg1,2);
    while size(hi,2) ~= size(unique(hi),2)
        for i=1:dim
            % Seleccionamos el indice del dato que es igual
            % al dato de la psocino i en el segmento 1
            % El indice del val rep fuera del rango ind1,ind2 -> seg1
            indx = find(hi([1:ind1-1, ind2+1:end]) == seg1(i));
            if indx
                % Insertamos en la posicion indx de h1 
                % el valor seg2(i)
                h = hi([1:ind1-1, ind2+1:end]);
                h(indx) = seg2(i);
                hi([1:ind1-1, ind2+1:end]) = h;
            end
        end
    end
end