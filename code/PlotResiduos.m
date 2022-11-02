[X, Y] = GetResiduos();
scatter(X, Y, "filled");
grid on;
xlabel("$\\sqrt{L}$");
ylabel("$T$ (\\si{\\second})");
MyPrint("img/residuos.tikz");
