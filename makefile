.PHONY: clean

OCTAVE = octave -p code

RESUMEN = src/resumen.tex
INTRODUCCION = src/introduccion.tex
PROCEDIMIENTO = src/procedimiento.tex img/esquema-pendulo.tikz
DATOS = src/datos.tex img/periodos.tikz

all: main.pdf

main.pdf: main.tex title.tex references.bib $(RESUMEN) $(INTRODUCCION) $(PROCEDIMIENTO) $(DATOS)
	pdflatex main.tex
	biber main
	pdflatex main.tex

img/periodos.tikz: data/mediciones.csv code/PlotPeriodos.m
	$(OCTAVE) code/PlotPeriodos.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
	rm img/periodos.tikz
