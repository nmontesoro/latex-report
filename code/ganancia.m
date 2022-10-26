% Calculo la ganancia
A = CalcGanancia();

% Vuelco a una tabla formateada para LaTeX
file = fopen("data/tables/1-ganancia.tex", "wt");
sep = "\\\\\n";
n = size(A, 1);

% fprintf(file, "\\toprule $\\SI{R_1}{\\kilo\\ohm}$ & $\\SI{R_2}{\\kilo\\ohm}$ & $A$ \\\\ \\midrule\n");

for i = 1:n
    if i == n
        sep = "\n"
    end

    fprintf(file, "%2i & %2i & $%2.1f \\pm %2.1f$ %s", A(i, 3) / 1000, A(i, 4) / 1000, A(i, 1), A(i, 2), sep);
end

fclose(file);
  

