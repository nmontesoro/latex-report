.PHONY: clean

OCTAVE = octave -Wq -p code
C1 = src/cuestionario/1.tex img/histograma.tikz
C2 = src/cuestionario/2.tex img/media.tikz
C3 = src/cuestionario/3.tex img/desviacion.tikz
C4 = src/cuestionario/4.tex
C5 = src/cuestionario/5.tex
C6 = src/cuestionario/6.tex src/cuestionario/6/longitud.tex src/cuestionario/6/periodo.tex src/cuestionario/6/gravedad.tex
C7 = src/cuestionario/7.tex src/cuestionario/7/longitud.tex src/cuestionario/7/periodo.tex src/cuestionario/7/gravedad.tex
C8 = src/cuestionario/8.tex img/gauss.tikz
CUESTIONARIO = src/cuestionario.tex $(C1) $(C2) $(C3) $(C4) $(C5) $(C6) $(C7) $(C8)

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

src/cuestionario/6/%.tex: code/gravedad-6.m code/gravedad.m
	$(OCTAVE) code/gravedad-6.m

src/cuestionario/7/%.tex: code/gravedad-7.m code/gravedad.m
	$(OCTAVE) code/gravedad-7.m

img/gauss.tikz: code/fgaussian.m code/PlotGaussian.m
	$(OCTAVE) code/PlotGaussian.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
	rm img/histograma.tikz
