data = csvread("data/mediciones.csv");
[m, n] = size(data);

hold on;
X = zeros(n - 2, 1);
for i = 1:m
   X(:) = data(i, 1);
   leg(i, :) = sprintf("$L = \\SI{%f \\pm %f}{\\centi\\meter}$", X(1), data(i, 2));
   scatter(X, data(i, 3:n), "filled");
end
xlabel("$L$ (\\si{\\centi\\meter})");
ylabel("$T$ (\\si{\\second})");
grid on;
legend(leg, "location", "northwest");

print -dtikz "img/periodos.tikz"
