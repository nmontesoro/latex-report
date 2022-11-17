data = csvread("data/densidad.csv");
d = data(2, 1);
dd = data(2, 2);

data = csvread("data/regresion2.csv");
epsilon = data(2, 5);
deps = data(2, 6);
k = data(2, 11);
dk = data(2, 12);
g = 9.80665; % Feo

f = @(X) k * d * g^(1/2) .* (X .- epsilon).^(5/2);
CaudalesBase();

set(gca, "xscale", "linear");
set(gca, "yscale", "linear");

hold on;

fplot(f, [2 8]);

legend("Datos", "Modelo matemático   ", "location", "northwest");

MyPrint("img/funcion.tikz");

