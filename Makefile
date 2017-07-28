PANDOC = pandoc
PFLAGS = --toc --toc-depth=2 --number-sections --smart --listings --latex-engine=xelatex --epub-stylesheet=$(STYLESHEET)
PVARS  = -V fontsize=12pt -V geometry="a4paper" -V documentclass=book

SRC = src
PREAMBLE = $(SRC)/preamble.tex
STYLESHEET = $(SRC)/styles.css
CHAPTERS = $(wildcard $(SRC)/chapter*.md)
export CHAPTERS

SOURCES = $(SRC)/headers.md $(CHAPTERS)

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
