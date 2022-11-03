coefs = CalcCoefsMC();

file = fopen("src/datos/datos-mc.tex", "wt");

function CustomOutput(file, varname, value, delta, units)
    fprintf(file,
        "\\item $%s = \\qty[round-mode = none]{%f \\pm %f}{%s} = \\qty{%f \\pm %f}{%s}$ \n", ...
        varname, value, delta, units, value, delta, units);
end

function CustomOutput2(file, varname, value, units)
    fprintf(file, "\\item $%s = \\qty{%f}{%s}$ \n", varname, value, units);
end

CustomOutput2(file, "\\sigma_y", coefs(5), "\\second");
CustomOutput2(file, "\\sigma_B", coefs(2), "\\second\\cm\\tothe{-1/2}");
CustomOutput2(file, "\\sigma_A", coefs(4), "\\second");
CustomOutput(file, "B", coefs(1), coefs(6), "\\second\\cm\\tothe{-1/2}");
CustomOutput(file, "A", coefs(2), coefs(7), "\\second");

fclose(file);
