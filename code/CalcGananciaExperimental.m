function g = CalcGananciaExperimental()
    [data, m] = ImportData("data/1-mediciones.csv");

    g = zeros(m, 3);

    for i = 1:m
        vi = data(i, 4);
        dvi = data(i, 5);
        vo = data(i, 2);
        dvo = data(i, 3);

        g(i, 1) = data(i, 1);
        g(i, 2) = vo / vi;
        g(i, 3) = abs(1/vi) * dvo + abs(-vo/(vi)^2) * dvi;
    end
end
