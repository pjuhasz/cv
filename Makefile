PDFNAME=juhasz_peter_CV_2014
GRAPH=experience
TIMELINE=timeline

all: $(PDFNAME).pdf

$(PDFNAME).pdf: $(PDFNAME).tex $(GRAPH).pdf $(TIMELINE).pdf
	xelatex $(PDFNAME).tex

$(GRAPH).pdf: $(GRAPH).plt $(GRAPH).dat
	gnuplot $(GRAPH).plt

$(TIMELINE).pdf: $(TIMELINE).plt $(TIMELINE).dat
	gnuplot $(TIMELINE).plt

clean_pdf: clean
	rm  $(PDFNAME).pdf

clean: 
	rm -f $(GRAPH).pdf $(TIMELINE).pdf *~ *.aux *.log

