opamp_teorico = [47, 2.5, 0.2;
                 10, 2.5, 0.2;
                  1, 2.5, 0.2];

opamp_spice = [47, 2.304, 0;
               10, 2.304, 0;
                1, 2.304, 0];

opamp_exp = csvread("data/2/mediciones.csv");
opamp_exp = opamp_exp(2:end, [1 9 10]);

function MyPlot(data)
    errorbar(data(:, 1), data(:, 2), data(:, 3), ".");
end

hold on;
MyPlot(opamp_teorico);
MyPlot(opamp_spice);
MyPlot(opamp_exp);
legend("Teórico", "Simulación", "Experimental", "location", "north");
xlabel("$R_L$ (\\si{\\kilo\\ohm})");
ylabel("$A$");
grid on;

print -dtikz "-S900,600" "-F:5.5" "img/2/ganancia.tikz"

clf;
seguidor_teorico = [47, 1, 0;
                    10, 1, 0;
                     1, 1, 0];
seguidor_spice = [47, 0.998, 0;
                  10, 0.998, 0;
                   1, 0.998, 0];
seguidor_exp = csvread("data/2/mediciones-seguidor.csv");
seguidor_exp = seguidor_exp(2:end, [1 9 10]);

hold on;
MyPlot(seguidor_teorico);
MyPlot(seguidor_spice);
MyPlot(seguidor_exp);
legend("Teórico", "Simulación", "Experimental", "location", "north");
xlabel("$R_L$ (\\si{\\kilo\\ohm})");
ylabel("$A$");
grid on;

print -dtikz "-S900,600" "-F:5.5" "img/2/ganancia-seguidor.tikz"

clf;
data = csvread("data/2/mediciones-seguidor.csv");
V = data(2:end, 7);
DV = data(2:end, 8);
I = data(2:end, 11);
DI = data(2:end, 12);

errorbar(V, I, DV, DI, "~>.")
xlabel("$v_o$ (\\si{\\volt})");
ylabel("$I_{R_L}$ (\\si{\\milli\\ampere})");

coefs = polyfit(V, I, 1);
f = @(X) coefs(1) .* X .+ coefs(2);
hold on;
fplot(f, [9.5 9.8])
xlim([9.5 9.8])
ylim([-0.5 10.5])

legend("Datos experimentales", sprintf("$%4.0f\\,v_o + %4.0f$", coefs(1), coefs(2)) ...
    , "location", "west");
grid on;

print -dtikz "-S900,600" "-F:5.5" "img/2/recta-carga.tikz"
