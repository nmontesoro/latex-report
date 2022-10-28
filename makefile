.PHONY: clean

OCTAVE = octave -Wq -p code
C1 = src/cuestionario/1.tex img/histograma.tikz
CUESTIONARIO = src/cuestionario.tex $(C1)

all: main.pdf

main.pdf: main.tex title.tex references.bib src/intro.tex src/procedimiento.tex $(CUESTIONARIO)
	pdflatex main.tex
	biber main
	pdflatex main.tex

img/histograma.tikz: code/histograma.m
	$(OCTAVE) code/histograma.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
	rm img/histograma.tikz
