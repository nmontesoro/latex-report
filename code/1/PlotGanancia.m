[R, A, DA] = CalcGananciaAnalitica();
R = R ./ 1000;

errorbar(R(:, 4), A, DA, ".");
hold on;

A = [-1.517; -1.517; -1.517];
DA = [0.001; 0.001; 0.001];
errorbar(R(:, 4), A, DA, ".");

[~, A, DA] = CalcGananciaExperimental();
errorbar(R(:, 4), A, DA, ".");

legend("Teórico", "Simulado", "Experimental", "location", "north");
xlabel("$R_L$ (\\si{\\kilo\\ohm})");
ylabel("$A$");
grid on;

print -dtikz "-S900,600" "-F:5.5" "img/1/ganancia.tikz"
