.PHONY: clean
PARTE1 = parte1.tex parte1-teorica.tex

all: main.pdf

main.pdf: main.tex title.tex references.bib intro.tex metodos.tex $(PARTE1)
	pdflatex main.tex
	biber main
	pdflatex main.tex

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
