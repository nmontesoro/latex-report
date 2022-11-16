function CaudalesBase()
    diametros = csvread("data/diametros.csv");
    diametros = diametros(2:end, 2:end);
    
    caudales = csvread("data/caudales.csv");
    caudales = caudales(2:end, 2:end);
    
    errorbar(diametros(:, 1), caudales(:, 1), diametros(:, 2), caudales(:, 2), ...
        "~>.");
    
    set(gca, "xscale", "log");
    set(gca, "yscale", "log");
    xlabel("$d$ (\\si{\\mm})");
    ylabel("Caudal (\\si{\\kg\\meter\\per\\second\\cubed})");
    grid on;
end
