SHELL = bash

# FORMAT=.print to get the print version.

all: tex

tex:
	@pdflatex \
		-output-directory dist \
		-output-format pdf \
		-interaction errorstopmode \
		-halt-on-error \
		-shell-escape cours$(FORMAT).tex;

bib: tex
	@bibtex dist/cours$(FORMAT).aux;

open:
	@open -g -F dist/cours$(FORMAT).pdf;

open-new:
	@open -g -F -n dist/cours$(FORMAT).pdf;

clean:
	@find dist -type f -not -name '.*' | xargs rm -f

reload: tex open

c: clean
o: open
O: open-new
r: reload
