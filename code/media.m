% Leo los datos
data = csvread("data/periodos.csv");

function [n, media, desv] = calcMedia(data)
    m = size(data, 1);
    n = 1:m;
    media = zeros(m, 1);
    desv = zeros(m, 1);

    for i = n
        media(i) = mean(data(1:i));
        desv(i) = 3 * std(data(1:i)) * i ^ (-1/2);
    end
end

% Calculo la media con su desviacion
[n, media, desv] = calcMedia(data);

% Grafico
errorbar(n, media, desv, ".");
xlabel("$N$");
ylabel("$\\bar{T}$ (\\si{\\second})");
xlim([1, 200])
xticks([1 50:50:200]);
grid on;

% Escribo en archivo
print -dtikz "-S900,600" "-F:5.5" "img/media.tikz"
