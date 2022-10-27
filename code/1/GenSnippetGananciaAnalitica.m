[R, A, DA] = CalcGananciaAnalitica();

file = fopen("src/1/snippets/ganancia-analitica.tex", "wt");

fprintf(file, "A = \\num{%f \\pm %f}", A(1), DA(1));

fclose(file);
