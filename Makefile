# 
# makefile para a compilação do documento
#
# Sab Jun 23 21:13:37 BRT 2007
#

BASE_NAME = calculus

LATEX     = latex
PDFLATEX  = pdflatex
BIBTEX    = bibtex
MAKEINDEX = makeindex -s indexstyle.ist
DVIPS     = dvips
PS2PDF	  = ps2pdf

pdf: $(BASE_NAME).pdf
ps: $(BASE_NAME).ps

$(BASE_NAME).pdf: $(BASE_NAME).tex
	$(PDFLATEX) $<
# 	$(BIBTEX) $(BASE_NAME) 
	$(PDFLATEX) $< 
	$(MAKEINDEX) $(BASE_NAME) 
	$(PDFLATEX) $<

$(BASE_NAME).ps: $(BASE_NAME).tex 
	$(LATEX) $<
	$(BIBTEX) $(BASE_NAME) 
	$(MAKEINDEX) $(BASE_NAME) 
	$(LATEX) $< 
	echo Chegou aqui.
	$(LATEX) $<
	$(DVIPS) -Ppdf $(BASE_NAME)

#$(BASE_NAME).pdf: $(BASE_NAME).tex
#	$(LATEX) $<
#	$(BIBTEX) $(BASE_NAME) 
#	$(MAKEINDEX) $(BASE_NAME) 
#	$(LATEX) $< 
#	$(LATEX) $<
#	$(DVIPS) -Ppdf $(BASE_NAME)
#	$(PS2PDF) $(BASE_NAME).ps

clean:
	rm -f $(BASE_NAME)*.ps $(BASE_NAME)*.dvi *.log \
	      *.aux *.blg *.toc *.idx *.ilg *.ind\
	      missfont.log $(BASE_NAME)*.bbl $(BASE_NAME)*.pdf $(BASE_NAME)*.out \
		  $(BASE_NAME)*.lof $(BASE_NAME)*.lot 
