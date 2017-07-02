PANDOC = pandoc
PFLAGS = --toc --number-sections --smart --listings --latex-engine=xelatex --epub-stylesheet=$(STYLESHEET)
PVARS  = -V fontsize=12pt -V geometry="a4paper" -V documentclass=book

SRC = src
PREAMBLE = $(SRC)/preamble.tex
STYLESHEET = $(SRC)/styles.css
CHAPTERS = $(wildcard $(SRC)/part*/*.md)
export CHAPTERS

SOURCES = $(wildcard $(SRC)/*.md) $(CHAPTERS)

#
all: ctfp.epub ctfp.pdf

epub: ctfp.epub
pdf: ctfp.pdf

%.epub: $(PREAMBLE) $(STYLESHEET) $(SOURCES)
	$(PANDOC) $(PFLAGS) $(PVARS) -H $(PREAMBLE) -o $@ $(SOURCES)

%.pdf: $(PREAMBLE) $(STYLESHEET) $(SOURCES)
	$(PANDOC) $(PFLAGS) $(PVARS) -H $(PREAMBLE) -o $@ $(SOURCES)

clear:
	rm *.epub *.pdf

.PHONY: all clear
