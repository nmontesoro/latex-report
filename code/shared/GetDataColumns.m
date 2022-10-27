function [datacols] = GetDataColumns(filename, cols)
    [data, m, n] = ImportData(filename);
    ncols = size(cols, 2);

    datacols = zeros(m, ncols);

    for i = 1:ncols
        datacols(:, i) = data(:, cols(i));
    end
end
