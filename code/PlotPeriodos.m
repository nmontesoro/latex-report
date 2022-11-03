function leg = PlotPeriodos(root)
    % Creo el gráfico de periodos
    % Params:
    %   root: boolean indicando si aplicar sqrt a las longitudes
    %
    % Returns:
    %   leg: matriz de leyendas del gráfico
    
    [data, N, m] = GetData(root);

    if root
        label = "\\sqrt";
    else
        label = "";
    end

    hold on;
    for i = 1:m
        j = N * (i - 1) + 1;
        k = j + N - 1;
        scatter(data(j:k, 1), data(j:k, 3), "filled");
        leg(i, :) = sprintf("$%s{L} = \\SI{%f \\pm %f}{\\centi\\meter}$", ...
            label, data(j, 1), data(j, 2));
    end
    grid on;
end
