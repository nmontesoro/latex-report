function [res, N, m] = CalcResiduos()
    % Calculo los residuos
    %
    % Params: nada
    %
    % Returns:
    %   res: matriz de residuos [x, y]
    %   N: cantidad de periodos medidos para cada longitud
    %   m: cantidad de longitudes utilizadas

    [data, N, m] = GetData(true);
    
    f = GetFuncionMC();

    X = data(:, 1);
    Y = data(:, 3);

    res = [X, (Y .- f(X))];
end
