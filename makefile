.PHONY: clean
DATA = data/1/mediciones-parsed.csv
RMHEADERS = tail -n +2
INTRO = src/intro.tex src/intro/opamp-inversor.tikz src/intro/opamp-noinversor.tikz
SIMULACION1 = src/1/simulacion.tex img/1/ltspice.png
ANALISIS1 = src/1/analisis.tex img/1/ganancia.tikz
PARTE1 = src/1/main.tex src/1/esquematico.tikz src/1/teoria.tex $(SIMULACION1) src/1/datos.tex presentacion-datos-1 img/1/osciloscopio-1.jpg $(ANALISIS1)

SIMULACION2 = src/2/simulacion.tex img/2/ltspice.png img/2/ltspice-seguidor.png img/2/recta-spice.tikz
ANALISIS2 = src/2/analisis.tex img/2/ganancia.tikz img/2/ganancia-seguidor.tikz img/2/recta-carga.tikz
PARTE2 = src/2/main.tex src/2/esquematico.tikz src/2/esquematico-seguidor.tikz src/2/teoria.tex $(SIMULACION2) src/2/datos.tex $(ANALISIS2)

OCTAVE = octave -Wq -p code/shared
OCTAVE1 = $(OCTAVE) -p code/1
OCTAVE2 = $(OCTAVE) -p code/2

all: $(DATA) main.pdf

main.pdf: main.tex title.tex references.bib src/resumen.tex src/objetivos.tex $(INTRO) src/metodos.tex $(PARTE1) $(PARTE2)
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

img/2/ganancia.tikz: code/2/PlotAnalisis.m
	$(OCTAVE2) code/2/PlotAnalisis.m

img/2/ganancia-seguidor.tikz: code/2/PlotAnalisis.m
	$(OCTAVE2) code/2/PlotAnalisis.m

img/2/recta-carga.tikz: code/2/PlotAnalisis.m
	$(OCTAVE2) code/2/PlotAnalisis.m

img/2/recta-spice.tikz: code/2/PlotRectaSpice.m
	$(OCTAVE2) code/2/PlotRectaSpice.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out $(DATA)
