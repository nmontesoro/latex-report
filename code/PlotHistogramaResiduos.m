[~, Y] = GetResiduos();

c = 9;

grid on;
hold on;
hist(Y, c);
xlabel("$T - \\hat{T}$ (\\si{\\second})");
ylabel("$f_a$");
MyPrint("img/histograma.tikz");
