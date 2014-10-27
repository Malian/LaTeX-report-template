SHELL = bash

# FORMAT=.print to get the print version.

all: tex

tex:
	@pdflatex \
		-output-directory dist \
		-output-format pdf \
		-interaction errorstopmode \
		-halt-on-error \
		-shell-escape report$(FORMAT).tex;

bib: tex
	@bibtex dist/report$(FORMAT).aux;

open:
	@open -g -F dist/report$(FORMAT).pdf;

open-new:
	@open -g -F -n dist/report$(FORMAT).pdf;

clean:
	@find dist -type f -not -name '.*' | xargs rm -f

reload: tex open

c: clean
o: open
O: open-new
r: reload
