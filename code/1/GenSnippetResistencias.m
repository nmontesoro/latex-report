filename = "data/1/mediciones-parsed.csv"

data = GetDataColumns(filename, [31:36, 9, 10, 29, 30]);
% Paso a kOhm
data = data ./ 1000;

file = fopen("src/1/snippets/resistencias.tex", "wt");

for i = 1:3
    j = 2*i - 1;
    fprintf(file, ...
            "\\item $R_%i = \\SI{%f \\pm %f}{\\kilo\\ohm}$ \n",
            i, data(1, j), data(1, j + 1));
end

fclose(file);

file = fopen("src/1/tables/resistencias-l.tex", "wt");

sep = "\\\\\n";
for i = 1:3
    fprintf(file, "\\num{%f \\pm %f} & \\num{%f \\pm %f}", ...
            data(i, 7), data(i, 8), data(i, 9), data(i, 10));
    if i == 3
        sep = "\n";
    end
    fprintf(file, " %s", sep);
end
    
fclose(file);

