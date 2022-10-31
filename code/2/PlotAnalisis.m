opamp_teorico = [47, 2.5, 0.6;
                 10, 2.5, 0.6;
                  1, 2.5, 0.6];

opamp_spice = [47, 2.304, 0;
               10, 2.304, 0;
                1, 2.304, 0];

opamp_exp = [47, 2.175, 0.003;
             10, 2.175, 0.003;
              1, 2.175, 0.003];

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
seguidor_teorico = [47, 1, 0.3;
                    10, 1, 0.3;
                     1, 1, 0.3];
seguidor_spice = [47, 0.998, 0;
                  10, 0.998, 0;
                   1, 0.998, 0];
seguidor_exp = [47, 0.998, 0.002;
                10, 0.998, 0.002;
                 1, 0.998, 0.002];

hold on;
MyPlot(seguidor_teorico);
MyPlot(seguidor_spice);
MyPlot(seguidor_exp);
legend("Teórico", "Simulación", "Experimental", "location", "north");
xlabel("$R_L$ (\\si{\\kilo\\ohm})");
ylabel("$A$");
grid on;

print -dtikz "-S900,600" "-F:5.5" "img/2/ganancia-seguidor.tikz"
