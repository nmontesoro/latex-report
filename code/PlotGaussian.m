% Leo los datos
data = csvread("data/periodos.csv");
u = mean(data);
d = std(data);
X = [min(data):0.001:max(data)];

% Creo el grafico
plot(X, fgaussian(X, u, d));
hold on;
plot(X .+ 0.12, fgaussian(X, u, d));
xlabel("$T$ (\\si{\\second})");
ylabel("$f_a$");
legend("Original", "$+\\SI{0.12}{\\second}$")
grid on;

% Guardo en archivo
print -dtikz "-S900,600" "-F:5.5" "img/gauss.tikz"
