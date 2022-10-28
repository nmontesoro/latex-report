function [g, dg] = gravedad(L, DL, T, DT)
    g = (8 * pi^2 * L) / (3 * T^2);
    dg = 8/3 * pi^2 * (DL*T^(-2) + 2*L*T^(-3)*DT);
end
