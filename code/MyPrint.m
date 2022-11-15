function MyPrint(filename)
    figure(1, "position", [0, 0, 600, 450]);
    print(filename, "-dtikz");
end
