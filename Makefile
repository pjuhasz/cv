PDFNAME=juhasz_peter_CV_2014
GRAPH=experience

all: $(PDFNAME).pdf

$(PDFNAME).pdf: $(PDFNAME).tex $(GRAPH).pdf
	xelatex $(PDFNAME).tex

$(GRAPH).pdf: $(GRAPH).plt $(GRAPH).dat
	gnuplot $(GRAPH).plt

clean_pdf: clean
	rm  $(PDFNAME).pdf

clean: 
	rm -f $(GRAPH).pdf *~ *.aux *.log

