data = csvread("data/regresion.csv");
data = data(2, :);

B = data(3);
A = data(4);

f = @(X) 10 .^ (B.*log10(X) .+ A);

hold on;

CaudalesBase();

fplot(f, [1 10]);
ylim([10^(-4) 10^(-1)]);

legend("Datos", "Recta de ajuste");

MyPrint("img/regresion.tikz");
