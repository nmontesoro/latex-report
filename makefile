.PHONY: clean

EJ1 = src/res1.tex

RESOLUCION = src/resolucion.tex $(EJ1)

all: main.pdf

main.pdf: main.tex title.tex references.bib $(RESOLUCION)
	pdflatex main.tex
	biber main
	pdflatex main.tex

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
