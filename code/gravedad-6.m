% Leo los datos
data = csvread("data/periodos.csv");

% Calculo la media y la desviacion estandar
N = size(data, 1);
T = mean(data);
DT = 3*std(data) * N^(-1/2);

% Calculo la gravedad
L = 32.7 / 100;
DL = 0.1 / 100;

[g, dg] = gravedad(L, DL, T, DT);

% Escribo los resultados en formato LaTeX
% Longitud de la varilla
file = fopen("src/cuestionario/6/longitud.tex", "wt");
fprintf(file, "\\SI{%f \\pm %f}{\\meter}", L, DL);
fclose(file);
% Periodo
file = fopen("src/cuestionario/6/periodo.tex", "wt");
fprintf(file, "\\SI{%f \\pm %f}{\\second}", T, DT);
fclose(file);
% Gravedad
file = fopen("src/cuestionario/6/gravedad.tex", "wt");
fprintf(file, "\\SI{%f \\pm %f}{\\meter\\per\\second^2}", g, dg);
fclose(file);
