.PHONY: clean

OCTAVE = octave -p code --gui
DATOS-CALIBRACION = data/calibracion.csv data/calculos-1.csv
DATOS-CAPACITOR = data/longitudes.csv data/calculos-2.csv
RESOLUCION = src/resolucion.tex $(DATOS-CALIBRACION) src/calibracion.tex img/calibracion.tikz $(DATOS-CAPACITOR) src/capacitor.tex img/capacitor.tikz data/calculos-3.csv

all: main.pdf

main.pdf: main.tex title.tex references.bib $(RESOLUCION)
	pdflatex main.tex
	biber main
	pdflatex main.tex

img/calibracion.tikz: $(DATOS-CALIBRACION) code/GenPlotCalibracion.m
	$(OCTAVE) code/GenPlotCalibracion.m

img/capacitor.tikz: $(DATOS-CAPACITOR) code/GenPlotCapacitor.m
	$(OCTAVE) code/GenPlotCapacitor.m

clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out img/*.tikz
