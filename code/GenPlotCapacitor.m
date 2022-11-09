data = csvread("data/longitudes.csv");

X = data(:, 1);
DX = data(:, 2);
Y = data(:, 5);
DY = data(:, 6);

data = csvread("data/calculos-2.csv");

m = data(6);
b = data(7);
dm =data(8);
db = data(9);

f1 = @(X) (m+dm) .* X .+ (b+db);
f2 = @(X) (m-dm) .* X .+ (b-db);

x = [0 30 30 0];
y = [f2(0) f2(30) f1(30) f1(0)];
fill(x, y, 'cyan', "FaceAlpha", 0.3);
hold on;

f = @(X) m .* X .+ b;
errorbar(X, Y, DX, DY, "~>.");
fplot(f, [0, 30]);

legend("Región", "Datos", "Recta");
grid on;

xlabel("$L$ (\\si{\\cm})");
ylabel("$f^{-1}$ (\\si{\\per\\kilo\\hertz})");

MyPrint("img/capacitor.tikz");
