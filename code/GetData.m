function [d, N, m, n] = GetData(root)
    % Devuelvo los datos del experimento
    % Params:
    %   root: boolean que indica si aplicar sqrt a las longitudes
    % Returns:
    %   d: datos [L, DL, T, DT]
    %   N: cantidad de periodos medidos para cada longitud
    %   m: cantidad de longitudes utilizadas
    %   n: cantidad de columnas del archivo csv

    data = csvread("data/mediciones.csv");
    [m, n] = size(data);
    N = n - 2;

    d = zeros(m * N, 4);
    for i = 1:m
        j = N * i - (N - 1);
        d(j:j+N-1, 1) = data(i, 1);     % L
        d(j:j+N-1, 2) = data(i, 2);     % DL
        d(j:j+N-1, 3) = data(i, 3:n).'; % T
        d(j:j+N-1, 4) = 0.2;            % DT
    end

    if root
        % Calculo primero DL porque depende del valor de L
        d(:, 2) = 0.5 .* d(:, 1) .^ (-0.5) .* d(:, 2); % DL
        d(:, 1) = sqrt(d(:, 1)); % L
    end
end 
