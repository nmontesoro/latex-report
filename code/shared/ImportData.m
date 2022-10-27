% Leo un archivo csv y devuelvo sus datos, junto con el tamano de filas y columnas
function [data, m, n] = ImportData(filename)
    data = csvread(filename);
    [m, n] = size(data);
end
