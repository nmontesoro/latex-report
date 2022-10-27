data = csvread("data/1-mediciones.csv");

[m, n] = size(data);

file1 = fopen("data/tables/1-tensiones-1.tex", "wt");
file2 = fopen("data/tables/1-tensiones-2.tex", "wt");

J1 = [1 4 2 8 6 10];
n1 = size(J1, 2);
J2 = [1 12 14 16 18];
n2 = size(J2, 2);
sep = "\\\\\n";
for i = 1:m
    fprintf(file1, "\\num{%i}", data(i, J1(1)) / 1000);
    fprintf(file2, "\\num{%i}", data(i, J2(1)) / 1000);

    for ji = 2:n1
        fprintf(file1, " & \\num{%f \\pm %f}", data(i, J1(ji)), data(i, J1(ji) + 1));
    end

    for ji = 2:n2
        fprintf(file2, " & \\num{%f \\pm %f}", data(i, J2(ji)), data(i, J2(ji) + 1));
    end

    if i == m
        sep = "\\\\\\bottomrule\n"
    end

    fprintf(file1, " %s", sep);
    fprintf(file2, " %s", sep);
end


