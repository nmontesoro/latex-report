function [g, dg] = CalcG()
    % Calculo la constante de la gravedad con su error
    %
    % Params: nada
    %
    % Returns:
    %   g: Constante de la gravedad
    %   dg: error (incertidumbre)

    coefs = CalcCoefsMC();

    B = coefs(1);
    DB = coefs(3);

    a = 8 * pi^2 / 3;

    g = a * B^(-2);
    dg = 3 * 2*a * B^(-3) * DB;

    % Paso a m/s^2
    g = g / 100;
    dg = dg / 100;
end
