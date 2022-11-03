function c = PlotHistograma()
    % Hago el grafico del histograma
    %
    % Params: nada
    %
    % Returns: 
    %   c: Cantidad de barras utilizadas

    [res, N, m] = CalcResiduos();
    c = round(1 + log10(N * m) / log10(2));

    hold on;
    grid on;
    hist(res(:, 2), c);
end
