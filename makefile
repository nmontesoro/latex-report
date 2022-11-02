.PHONY: clean

OCTAVE = octave -p code

COMMON = data/mediciones.csv code/GetData.m code/MyPrint.m
RESUMEN = src/resumen.tex
INTRODUCCION = src/introduccion.tex
PROCEDIMIENTO = src/procedimiento.tex img/esquema-pendulo.tikz
DATOS = src/datos.tex img/periodos.tikz img/cuadrados.tikz img/residuos.tikz img/histograma.tikz

all: main.pdf

main.pdf: main.tex title.tex references.bib $(RESUMEN) $(INTRODUCCION) $(PROCEDIMIENTO) $(DATOS)
	pdflatex main.tex
	biber main
	pdflatex main.tex

img/periodos.tikz: $(COMMON) code/MakeBasePlot.m code/PlotPeriodos.m
	$(OCTAVE) code/PlotPeriodos.m

img/cuadrados.tikz: $(COMMON) code/GetCuadradosFn.m code/MakeBasePlot.m code/PlotCuadrados.m
	$(OCTAVE) code/PlotCuadrados.m

img/residuos.tikz: $(COMMON) code/GetResiduos.m code/PlotResiduos.m
	$(OCTAVE) code/PlotResiduos.m

img/histograma.tikz: $(COMMON) code/GetResiduos.m code/PlotHistogramaResiduos.m
	$(OCTAVE) code/PlotHistogramaResiduos.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
	rm img/periodos.tikz
	rm img/cuadrados.tikz
	rm img/residuos.tikz
	rm img/histograma.tikz
