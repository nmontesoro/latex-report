filename = "data/1/mediciones-parsed.csv";

function WriteToFile(filename, data)
    [m, n] = size(data);
    if mod(n, 2) == 0
        n = n - 1;
    end

    sep = "\\\\\n";

    file = fopen(filename, "wt");

    for i = 1:m
        % Escribo RL en kOhm
        fprintf(file, "\\num{%i}", data(i, 1) / 1000);
        
        % Escribo el resto de los datos
        for j = 2:2:n
            fprintf(file, " & \\num{%f \\pm %f}", data(i, j), data(i, j+1));
        end

        if i == m
            sep = "\n";
        end
        fprintf(file, " %s", sep);
    end

    fclose(file);
end

% Rl, vi, dvi, vo, dvo, v+, dv+, v-, dv-, D, dD
data = GetDataColumns(filename, [9, 13, 14, 11, 12, 17, 18, 15, 16, 19, 20]);
% Paso a mV
data(:, 6:11) = 1000 .* data(:, 6:11);
WriteToFile("src/1/tables/tensiones-1.tex", data);

% Rl, VR1, DVR1, VR2, DVR2, VR3, DVR3, VRL, DVRL
data = GetDataColumns(filename, [9, 21:29]);
data(:, 6:7) = data(:, 6:7) * 1000;
WriteToFile("src/1/tables/tensiones-2.tex", data);

% Corrientes
[RL, DRL, I, DI] = CalcCorrientes();
data = [data(:, 1), reshape([I;DI], size(I,1), [])];
% Paso a mA
data(:, 2:end) = data(:, 2:end) .* 1000;
WriteToFile("src/1/tables/corrientes.tex", data);

% Ganancia experimental
[R, A, DA] = CalcGananciaExperimental();
data = [R, A, DA];
WriteToFile("src/1/tables/ganancia-experimental.tex", data);
