.PHONY: clean

DATOS = data/densidad.csv data/mediciones-densidad.csv data/mediciones-diametros.csv data/diametros.csv data/mediciones-pendientes.csv

PRES-DATOS = src/datos.tex $(DATOS)
EJ1 = src/res1.tex

RESOLUCION = src/resolucion.tex $(EJ1)

all: main.pdf

main.pdf: main.tex title.tex references.bib $(PRES-DATOS) $(RESOLUCION)
	pdflatex main.tex
	biber main
	pdflatex main.tex

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
