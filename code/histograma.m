% Leo los datos
periodos = csvread("data/periodos.csv");

% Cantidad de barras
c = 9;

% Construyo el histograma
hist(periodos, c);
colormap(summer());
xlabel("$T$ (\\si{\\second})");
ylabel("$f_a$");
grid on;

% Escribo en archivo
print -dtikz "-S900,600" "-F:5.5" "img/histograma.tikz"
