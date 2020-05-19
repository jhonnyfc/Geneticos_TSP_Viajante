function mutacion = mut_Inter(cromosoma)
    % Seleccion de dos punto para intercambio
    pto1 = randi(size(cromosoma,2));
    pto2 = randi(size(cromosoma,2));
    
    % Intercambio de los valores
    mutacion = cromosoma;
    mutacion(pto1) = cromosoma(pto2);
    mutacion(pto2) = cromosoma(pto1);
end