.PHONY: clean
PARTE1 = parte1.tex parte1-teorica.tex data/tables/1-ganancia.tex data/tables/1-ganancia-medida.tex parte1-datos.tex parte1-analisis.tex img/1-analisis-ganancia.eps data/tables/1-tensiones-1.tex data/tables/1-tensiones-2.tex
OCTAVE = octave -Wq -p code

all: main.pdf

main.pdf: main.tex title.tex references.bib intro.tex metodos.tex $(PARTE1)
	pdflatex main.tex
	biber main
	pdflatex main.tex

data/tables/1-ganancia.tex: code/ganancia.m code/CalcGanancia.m data/1-res.csv code/ImportData.m
	$(OCTAVE) code/ganancia.m

data/tables/1-ganancia-medida.tex: code/CalcGananciaExperimental.m code/gananciaexperimental.m data/1-mediciones.csv code/ImportData.m
	$(OCTAVE) code/gananciaexperimental.m

img/1-analisis-ganancia.eps: code/analisisganancia.m code/ImportData.m
	$(OCTAVE) code/analisisganancia.m
	
data/tables/1-tensiones-1.tex data/tables/1-tensiones-2.tex: code/GenTablaTensiones1.m
	$(OCTAVE) code/GenTablaTensiones1.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out
