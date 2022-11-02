.PHONY: clean

RESUMEN = src/resumen.tex
INTRODUCCION = src/introduccion.tex
PROCEDIMIENTO = src/procedimiento.tex img/esquema-pendulo.tikz

all: main.pdf

main.pdf: main.tex title.tex references.bib $(RESUMEN) $(INTRODUCCION) $(PROCEDIMIENTO)
	pdflatex main.tex
	biber main
	pdflatex main.tex

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
