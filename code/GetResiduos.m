function [X, Y] = GetResiduos()
    data = GetData();
    data(:, 1) = sqrt(data(:, 1));
    data(:, 2) = 0.5 .* (data(:, 1) .^ (-1/2)) .* data(:, 2);
    [f, coefs] = GetCuadradosFn(data);
    
    X = data(:, 1);
    Y = data(:, 3) .- f(data(:, 1));
end
