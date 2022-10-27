function [RL, DRL, I, DI] = CalcCorrientes()
    filename = "data/1/mediciones-parsed.csv";
    R = GetDataColumns(filename, [31, 33, 35, 29]); % R1, R2, R3, RL
    DR = GetDataColumns(filename, [32, 34, 36, 30]); % Idem
    V = GetDataColumns(filename, [21, 23, 25, 27]); % VR1, VR2, VR3, VRL
    DV = GetDataColumns(filename, [22, 24, 26, 28]); % Idem

    I = V ./ R;
    DI = abs(R.^(-1)) .* DV + abs(-V .* R.^(-2)) .* DR;
    RL = R(:, 4);
    DRL = DR(:, 4);
end
