function [f, coefs] = GetFuncionMC()
    % Devuelvo la recta de minimos cuadrados
    % 
    % Params: nada
    %
    % Returns:
    %   f: funcion de recta de minimos cuadrados
    %   coefs: coeficientes (ver CalcCoefsMC.m)

    coefs = CalcCoefsMC();
    f = @(X) coefs(1) .* X + coefs(2);
end
