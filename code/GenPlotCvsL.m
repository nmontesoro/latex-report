data = csvread("data/longitudes.csv");

X = data(:, 1);
DX = data(:, 2);
Y = data(:, 7);
DY = data(:, 8);

h = errorbar(X, Y, DX, DY, "~>.");
set(h, "color", [239 35 60] ./ 255);
grid on;
xlabel("$L$ (\\si{\\cm})");
ylabel("$C$ (\\si{\\pico\\farad})");

MyPrint("img/cvsl.tikz");
