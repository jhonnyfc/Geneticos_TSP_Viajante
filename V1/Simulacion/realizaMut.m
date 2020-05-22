function pob = realizaMut(pobIn,tipoMut,probMut)
    pob = pobIn;
    for i=1:size(pob,1)
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
end