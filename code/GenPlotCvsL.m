data = csvread("data/longitudes.csv");

X = data(:, 1);
DX = data(:, 2);
Y = data(:, 7);
DY = data(:, 8);

errorbar(X, Y, DX, DY, "~>.");
grid on;
xlabel("$L$ (\\si{\\cm})");
ylabel("$C$ (\\si{\\pico\\farad})");

MyPrint("img/cvsl.tikz");
