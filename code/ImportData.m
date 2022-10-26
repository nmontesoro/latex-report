function [data, m, n] = ImportData(filename)
    data = csvread(filename);
    [m, n] = size(data);
end
