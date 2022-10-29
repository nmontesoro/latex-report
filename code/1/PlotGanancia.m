[R, A, DA] = CalcGananciaAnalitica();
R = R ./ 1000;

errorbar(R(:, 4), A, DA, ".");
hold on;

[~, A, DA] = CalcGananciaExperimental();
errorbar(R(:, 4), A, DA, ".");

legend("Teórico", "Experimental", "location", "north");
xlabel("$R_L$ (\\si{\\kilo\\ohm})");
ylabel("A");
grid on;

print -dtikz "-S900,600" "-F:5.5" "img/1/ganancia.tikz"
