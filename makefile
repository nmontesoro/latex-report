.PHONY: clean
DATA = data/1/mediciones-parsed.csv
RMHEADERS = tail -n +2

all: $(DATA) main.pdf

main.pdf: main.tex title.tex references.bib
	pdflatex main.tex
	biber main
	pdflatex main.tex

data/1/mediciones-parsed.csv: data/1/mediciones.csv
	$(RMHEADERS) $< > $@
	
clean:
	rm *.aux *.bbl *.bcf *.blg *.log *.pdf *.run.xml *.toc *.out $(DATA)
