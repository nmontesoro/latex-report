function PlotMC()
    % Creo el grafico de minimos cuadrados
    % 
    % Params: nada
    %
    % Returns: nada

    leg = PlotPeriodos(true);
    [f, coefs] = GetFuncionMC();
    fplot(f, [6.5, 9.5]);

    % legend(leg(1, :), leg(2, :), leg(3, :), leg(4, :), ...
    %   sprintf("$y_i = %5.4f \\, x_i %+5.4f$", coefs(1), coefs(2)));
    legend("hide");
end

