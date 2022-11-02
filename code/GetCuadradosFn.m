function [f, coefs] = GetCuadradosFn(data)
    coefs = polyfit(data(:, 1), data(:, 3), 1);
    f = @(X) coefs(1) .* X .+ coefs(2);
end
