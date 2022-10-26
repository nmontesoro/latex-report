% Calculo la ganancia del operacional a partir de los valores en un archivo
% data/1-res.csv

function A = CalcGanancia()
    R = csvread("data/1-res.csv");
    m = size(R, 1);
    
    % Reservo memoria
    % En esta matriz guardo ganancia e incertidumbre
    A = zeros(m, 4);

    A(:, 1) = - R(:, 2) ./ R(:, 1);
    A(:, 2) = 0.2 .* R(:, 2) ./ R(:, 1) + R(:, 1) .^ (-2) .* R(:, 2) .* 0.2 .* R(:, 1);
    A(:, 3) = R(:, 1);
    A(:, 4) = R(:, 2);
end
