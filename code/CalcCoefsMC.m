function coefs = CalcCoefsMC()
    % Calculo los coeficientes de minimos cuadrados con su desviacion
    %   yi = Bxi + A
    %
    % Params: nada
    %
    % Returns:
    %   coefs: vector de coeficientes [B, A, oB, oA, oY, dB, dA, dY]

    [data, n, m] = GetData(true);
    
    N = m * n; % Cantidad de períodos total
    X = data(:, 1);
    Y = data(:, 3);

    sumxy = sum(X.*Y); % Sumatoria de los (x.y)
    sumx2 = sum(X.^2); % Sumatoria de los x^2
    sumx = sum(X);
    sumy = sum(Y);
    denom = N * sumx2 - sumx^2;

    B = (N * sumxy - sumx * sumy) / denom;
    A = (sumx2 * sumy - sumx*sumxy) / denom;
    oY = sqrt(sum((Y .- A .- B.*X) .^ 2) / (N - 2));
    oB = oY * sqrt(N / denom);
    oA = oY * sqrt(sumx2 / denom);
    dB = 3 * oB / sqrt(N);
    dA = 3 * oA / sqrt(N);
    dY = 3 * oY / sqrt(N);

    coefs = [B, A, oB, oA, oY, dB, dA, dY];
end
