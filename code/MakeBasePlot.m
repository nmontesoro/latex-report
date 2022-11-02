function [data, leg] = MakeBasePlot(root)
    [data, N, m, n] = GetData();

    L = data(:, 1);
    DL = data(:, 2);

    if root
        data(:, 1) = sqrt(data(:, 1));
        data(:, 2) = 0.5 .* (data(:, 1) .^ (-1/2)) .* data(:, 2);
    end
    
    hold on;
    for i = 1:m
        j = N * i - (N - 1);
        k = j + N - 1;
        errorbar(data(j:k, 1), data(j:k, 3), data(j:k, 2), data(j:k, 4), "~>.");
        leg(i, :) = sprintf("$L = \\SI{%f \\pm %f}{\\centi\\meter}$", L(j), DL(j));
    end
    grid on;
end
