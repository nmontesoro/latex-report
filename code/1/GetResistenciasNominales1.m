function [R, DR] = GetResistenciasNominales1()
    filename = "data/1/mediciones-parsed.csv";

    R = GetDataColumns(filename, [3, 5, 7, 9]);
    DR = GetDataColumns(filename, [4, 6, 8, 10]);
end
