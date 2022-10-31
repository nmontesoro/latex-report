data = csvread("data/2/seguidor.csv");

plot(data(:, 2), data(:, 3) / 1e-3);
xlabel("$v_o$ (\\si{\\volt})");
ylabel("$I_{R_L}$ (\\si{\\milli\\ampere})");
grid on;

print -dtikz "-S900,600" "-F:5.5" "img/2/recta-spice.tikz"
