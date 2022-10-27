function [R, A, DA] = CalcGananciaAnalitica()
    filename = "data/1/mediciones-parsed.csv";
    [R, DR] = GetResistenciasNominales1();

    A = -R(:, 2)./R(:, 1);
    DA = abs(-R(:, 1).^(-1)) .* DR(:, 2) + abs(-R(:, 2) .* R(:, 1).^(-2)) .* DR(:, 1);
end
