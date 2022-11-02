[X, Y] = GetResiduos();
scatter(X, Y, "filled");
grid on;
xlabel("$\\sqrt{L}$ (\\si{\\centi\\meter\\tothe{1/2}})");
ylabel("$T - \\hat{T}$ (\\si{\\second})");
MyPrint("img/residuos.tikz");
