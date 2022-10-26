g = CalcGananciaExperimental();

file = fopen("data/tables/1-ganancia-medida.tex", "wt");
n = size(g, 1);
sep = "\\\\\n";
for i = 1:size(g, 1)
    if i == n
        sep = "\\\\\\bottomrule\n"
    end
    fprintf(file, "$%i$ & \\num{%f \\pm %f} %s", g(i, 1) / 1000, g(i, 2), g(i, 3), sep);
end

fclose(file);
