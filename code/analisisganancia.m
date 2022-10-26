experimental = CalcGananciaExperimental();
experimental(:, 1) = experimental(:, 1) / 1000;

teorica = experimental;
g = CalcGanancia();
teorica(:, 2) = g(1, 1);
teorica(:, 3) = g(1, 2);

errorbar(teorica(:, 1), teorica(:, 2), teorica(:, 3), ".");
hold on
errorbar(experimental(:, 1), experimental(:, 2), experimental(:, 3), ".");
legend("Teórico", "Experimental", "location", "north");
xlabel("R (kOhm)");
ylabel("A");

print -deps -color "img/1-analisis-ganancia.eps"
