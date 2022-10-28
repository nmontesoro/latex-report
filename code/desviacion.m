% Leo los datos
data = csvread("data/periodos.csv");

function [n, desv, err] = calcDesviacion(data)
    m = size(data, 1);
    n = 1:m;
    desv = zeros(m, 1);
    err = zeros(m, 1);

    desv(1) = 0;
    for i = 2:m
        desv(i) = std(data(1:i));
        err(i) = 3 * desv(i) * (2*(i - 1))^(-1/2);
    end
end

% Calculo desviacion y error
[n, desv, err] = calcDesviacion(data);

% Grafico
errorbar(n, desv, err, ".");
xlim([1 200]);
xlabel("$N$");
ylabel("$\\sigma_{n-1}$ (\\si{\\second})");
xticks([1 50:50:200]);
grid on;

% Escribo en archivo
print -dtikz "-S900,600" "-F:5.5" "img/desviacion.tikz"
