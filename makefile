.PHONY: clean

OCTAVE = octave -p code

DATOS = data/densidad.csv data/mediciones-densidad.csv data/mediciones-diametros.csv data/diametros.csv data/mediciones-pendientes.csv

PRES-DATOS = src/datos.tex $(DATOS)
EJ1 = src/res1.tex
EJ2 = src/res2.tex data/caudales.csv img/caudales.tikz
EJ3 = src/res3.tex data/regresion.csv img/regresion.tikz

RESOLUCION = src/resolucion.tex $(EJ1) $(EJ2) $(EJ3)

all: main.pdf

main.pdf: main.tex title.tex references.bib $(PRES-DATOS) $(RESOLUCION)
	pdflatex main.tex
	biber main
	pdflatex main.tex

img/caudales.tikz: data/caudales.csv data/diametros.csv code/CaudalesBase.m code/PlotCaudales.m
	$(OCTAVE) code/PlotCaudales.m

img/regresion.tikz: data/regresion.csv data/caudales.csv data/diametros.csv code/CaudalesBase.m code/PlotRegresion.m
	$(OCTAVE) code/PlotRegresion.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
