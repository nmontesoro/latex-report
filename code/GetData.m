function [d, N, m, n] = GetData()
    data = csvread("data/mediciones.csv");
    [m, n] = size(data);
    N = n - 2;

    d = zeros(m * N, 4);
    for i = 1:m
        j = N * i - (N - 1);
        d(j:j+N-1, 1) = data(i, 1);
        d(j:j+N-1, 2) = data(i, 2);
        d(j:j+N-1, 3) = data(i, 3:n).';
        d(j:j+N-1, 4) = 0.2;
    end
end 
