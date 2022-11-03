.PHONY: clean

OCTAVE = octave -p code

COMMON = data/mediciones.csv code/GetData.m code/MyPrint.m
RESUMEN = src/resumen.tex
INTRODUCCION = src/introduccion.tex
PROCEDIMIENTO = src/procedimiento.tex img/esquema-pendulo.tikz
DATOS = src/datos.tex img/periodos.tikz img/cuadrados.tikz img/residuos.tikz img/histograma.tikz src/datos/pendiente.tex src/datos/ordenada.tex

all: main.pdf

main.pdf: main.tex title.tex references.bib $(RESUMEN) $(INTRODUCCION) $(PROCEDIMIENTO) $(DATOS)
	pdflatex main.tex
	biber main
	pdflatex main.tex

img/periodos.tikz: $(COMMON) code/PlotPeriodos.m code/GenPlotPeriodos.m
	$(OCTAVE) code/GenPlotPeriodos.m

img/cuadrados.tikz: $(COMMON) code/GenPlotMC.m code/PlotMC.m code/CalcCoefsMC.m code/PlotPeriodos.m
	$(OCTAVE) code/GenPlotMC.m

img/residuos.tikz: $(COMMON) code/CalcResiduos.m code/PlotResiduos.m code/GenPlotResiduos.m
	$(OCTAVE) code/GenPlotResiduos.m

img/histograma.tikz: $(COMMON) code/CalcResiduos.m code/PlotHistograma.m code/GenPlotHistograma.m
	$(OCTAVE) code/GenPlotHistograma.m

src/datos/pendiente.tex: $(COMMON) code/GenSnippetsMC.m code/CalcCoefsMC.m
	$(OCTAVE) code/GenSnippetsMC.m

src/datos/ordenada.tex: $(COMMON) code/GenSnippetsMC.m code/CalcCoefsMC.m
	$(OCTAVE) code/GenSnippetsMC.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
	rm img/periodos.tikz
	rm img/cuadrados.tikz
	rm img/residuos.tikz
	rm img/histograma.tikz
