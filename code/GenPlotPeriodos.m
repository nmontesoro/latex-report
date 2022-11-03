leg = PlotPeriodos(false);

legend(leg(1, :), leg(2, :), leg(3, :), leg(4, :));
xlabel("$L$ (\\si{\\cm})");
ylabel("$T$ (\\si{\\second})");
MyPrint("img/periodos.tikz");
