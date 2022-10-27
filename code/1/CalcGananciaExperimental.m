function [R, A, DA] = CalcGananciaExperimental()
    filename = "data/1/mediciones-parsed.csv"

    data = GetDataColumns(filename, [9, 13, 14, 11, 12]); % rln, vi, dvi, vo, dvo
    
    R = data(:, 1);

    A = data(:, 4) ./ data(:, 2);
    DA = abs(data(:, 2) .^ (-1)) .* data(:, 5) + ...
         abs(-data(:, 4) .* data(:, 2) .^ (-2)) .* data(:, 3);
end

