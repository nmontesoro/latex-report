.PHONY: clean

all: main.pdf

main.pdf: main.tex title.tex references.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
