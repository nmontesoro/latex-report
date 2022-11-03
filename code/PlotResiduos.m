function PlotResiduos()
    % Hago el grafico de residuos
    %
    % Params: nada
    %
    % Returns: nada

    [data, N, m] = CalcResiduos();
    
    hold on;
    grid on;
    for i = 1:m
        j = N * (i - 1) + 1;
        k = j + N - 1;
        scatter(data(j:k, 1), data(j:k, 2), "filled");
    end
end
