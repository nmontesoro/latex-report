% Calculo la gravedad
L = 32.8 / 100;
DL = 0.1 / 100;
T = 0.87;
DT = 0.2;

[g, dg] = gravedad(L, DL, T, DT);

% Escribo los resultados en formato LaTeX
% Longitud de la varilla
file = fopen("src/cuestionario/7/longitud.tex", "wt");
fprintf(file, "\\SI{%f \\pm %f}{\\meter}", L, DL);
fclose(file);
% Periodo
file = fopen("src/cuestionario/7/periodo.tex", "wt");
fprintf(file, "\\SI{%f \\pm %f}{\\second}", T, DT);
fclose(file);
% Gravedad
file = fopen("src/cuestionario/7/gravedad.tex", "wt");
fprintf(file, "\\SI{%f \\pm %f}{\\meter\\per\\second^2}", g, dg);
fclose(file);
