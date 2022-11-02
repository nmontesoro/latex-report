[data, leg] = MakeBasePlot(true);
n = size(leg, 1);

[f, coefs] = GetCuadradosFn(data);
fplot(f, [6.5 9.5], "linewidth", 2);
legend(leg(1, :), leg(2, :), leg(3, :), leg(4, :), sprintf("$T = %5.4f \\, \\sqrt{L} %+5.4f$", coefs(1), coefs(2)), "location", "northwest")
xlabel("$\\sqrt{L}$ (\\si{\\centi\\meter\\tothe{1/2}})");
ylabel("$T$ (\\si{\\second})");
MyPrint("img/cuadrados.tikz");
