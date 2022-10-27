function [vi, dvi] = GetViNominal()
    filename = "data/1/mediciones-parsed.csv"
    data = GetDataColumns(filename, [1, 2]);
    vi = data(:, 1);
    dvi = data(:, 2);
end
