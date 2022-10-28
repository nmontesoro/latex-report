function Y = fgaussian(X, u, d)
    Y = 1 / (d*sqrt(2*pi)) .* exp(-1/2 * (X - u) .^ 2 / d^2);
end
