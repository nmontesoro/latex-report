data = csvread("data/mediciones.csv");

[m, n] = size(data);

file = fopen("src/apendice/datos.tex", "wt");

fprintf(file, "$i$");

for i = 1:m
    fprintf(file, ...
            " & $T$ (\\si{\\second}) ($L = \\qty{%3.1f}{\\cm}$)", ...
            data(i, 1));
end

fprintf(file, " \\\\ \\midrule\n");

for j = 3:n
    fprintf(file, "%2i", j - 2);

    for i = 1:m
        fprintf(file, " & \\num{%3.2f}", data(i, j));
    end

    if j != n
        fprintf(file, " \\\\ \n");
    else
        fprintf(file, " \\\\ \\bottomrule");
    end
end

fclose(file);
