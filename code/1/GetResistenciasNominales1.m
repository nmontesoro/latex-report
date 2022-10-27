function [R, DR] = GetResistenciasNominales1()
    [data, m, n] = ImportData("data/1/mediciones-parsed.csv");

    R = [data(:, 1), data(:, 3), data(:, 5), data(:, 7)];
    DR = [data(:, 2), data(:, 4), data(:, 6), data(:, 8)];
end
