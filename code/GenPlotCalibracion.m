data = csvread("data/calibracion.csv");

X = data(:, 2);
DX = data(:, 3);
Y = data(:, 6);
DY = data(:, 7);

data = csvread("data/calculos-1.csv");

m1 = data(2);
m2 = data(3);
b1 = data(4);
b2 = data(5);
m = data(6);
b = data(7);
dm =data(8);
db = data(9);

f1 = @(X) (m+dm) .* X .+ (b+db);
f2 = @(X) (m-dm) .* X .+ (b-db);

x = [0 250 250 0];
y = [f2(0) f2(250) f1(250) f1(0)];
fill(x, y, 'cyan', "FaceAlpha", 0.3);
hold on;

f = @(X) m .* X .+ b;
errorbar(X, Y, DX, DY, "~>.");
fplot(f, [0, 250]);

legend("Región", "Datos", "Recta");
grid on;

xlabel("$C$ (\\si{\\pico\\farad})");
ylabel("$f^{-1}$ (\\si{\\per\\hertz})");

MyPrint("img/calibracion.tikz");
