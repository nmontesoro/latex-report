.PHONY: clean

OCTAVE = octave -Wq -p code
C1 = src/cuestionario/1.tex img/histograma.tikz
C2 = src/cuestionario/2.tex img/media.tikz
C3 = src/cuestionario/3.tex img/desviacion.tikz
C4 = src/cuestionario/4.tex
C5 = src/cuestionario/5.tex
CUESTIONARIO = src/cuestionario.tex $(C1) $(C2) $(C3) $(C4) $(C5)

all: main.pdf

main.pdf: main.tex title.tex references.bib src/intro.tex src/procedimiento.tex $(CUESTIONARIO)
	pdflatex main.tex
	biber main
	pdflatex main.tex

img/histograma.tikz: code/histograma.m
	$(OCTAVE) code/histograma.m

img/media.tikz: code/media.m
	$(OCTAVE) code/media.m

img/desviacion.tikz: code/desviacion.m
	$(OCTAVE) code/desviacion.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
	rm img/histograma.tikz
