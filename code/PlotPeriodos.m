[~, leg] = MakeBasePlot(false);
legend(leg, "location", "northwest");
xlabel("$L$ (\\si{\\centi\\meter})");
ylabel("$T$ (\\si{\\second})");
MyPrint("img/periodos.tikz");
