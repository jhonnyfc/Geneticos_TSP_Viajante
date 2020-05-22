function plotCaminoSol(path,ciuSel,ciuAll,ciuIni,dis,Pais)
    % Se printean los puntos con la solucion y las ciduades
    % selecionadas al inicio
    figure()
    hold on
    plot(ciuAll(:,1),ciuAll(:,2),'oG')
    plot(ciuSel(path,1),ciuSel(path,2))
    dim = size(path,2);
    plot(ciuSel(path,1),ciuSel(path,2),'.B','MarkerSize',15)
    
    plot(ciuSel(path(1),1),ciuSel(path(1),2),'.R','MarkerSize',20)
    plot(ciuSel(path(dim),1),ciuSel(path(dim),2),'.R','MarkerSize',20)
    
    % Printemaos las raya inical y final y el punto Inical
    path = [ciuIni,path,ciuIni];
    plot(ciuSel(path(1:2),1),ciuSel(path(1:2),2),'k','MarkerSize',12)
    plot(ciuSel(path(end-1:end),1),ciuSel(path(end-1:end),2),'k','MarkerSize',12)
    plot(ciuSel(ciuIni,1),ciuSel(ciuIni,2),'.k','MarkerSize',25)
    title([Pais,': La dist para ',num2str(dim+1),' citys es: ',num2str(dis),' km'])
    hold off
end