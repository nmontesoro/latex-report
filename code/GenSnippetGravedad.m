[g, dg] = CalcG();

file = fopen("src/datos/gravedad.tex", "wt");

fprintf(file, "$g = \\qty{%f \\pm %f}{\\meter\\per\\second\\squared}$", ...
    g, dg);

fclose(file);
