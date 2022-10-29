.PHONY: clean
DATA = data/1/mediciones-parsed.csv
RMHEADERS = tail -n +2
ANALISIS1 = img/1/ganancia.tikz
PARTE1 = src/1/teoria.tex src/1/datos.tex presentacion-datos-1 $(ANALISIS1)

OCTAVE = octave -Wq -p code/shared
OCTAVE1 = $(OCTAVE) -p code/1

all: $(DATA) main.pdf

main.pdf: main.tex title.tex references.bib src/intro.tex src/metodos.tex $(PARTE1)
	pdflatex main.tex
	biber main
	pdflatex main.tex

data/1/mediciones-parsed.csv: data/1/mediciones.csv
	$(RMHEADERS) $< > $@

presentacion-datos-1: code/1/GenTablasDatos.m data/1/mediciones-parsed.csv code/1/CalcGananciaAnalitica.m code/1/GenSnippetGananciaAnalitica.m code/1/GenSnippetResistencias.m
	$(OCTAVE1) code/1/GenSnippetGananciaAnalitica.m
	$(OCTAVE1) code/1/GenTablasDatos.m
	$(OCTAVE1) code/1/GenSnippetResistencias.m
	touch presentacion-datos-1

img/1/ganancia.tikz: code/1/PlotGanancia.m data/1/mediciones-parsed.csv
	$(OCTAVE1) code/1/PlotGanancia.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out $(DATA)
