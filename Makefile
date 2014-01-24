PDFNAME=juhasz_peter_CV_2014
GRAPH=experience

all: $(PDFNAME).pdf

$(PDFNAME).pdf: $(PDFNAME).tex $(GRAPH).pdf
	xelatex $(PDFNAME).tex

$(GRAPH).pdf: $(GRAPH).plt $(GRAPH).dat
	gnuplot $(GRAPH).plt

clean: 
	rm -f $(GRAPH).pdf $(PDFNAME).pdf *~ *.aux *.log
