function [R, DR] = GetResistenciasNominales1()
    filename = "data/1/mediciones-parsed.csv";

    R = GetDataColumns(filename, [1, 3, 5, 7]);
    DR = GetDataColumns(filename, [2, 4, 6, 8]);
end
