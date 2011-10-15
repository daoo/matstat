PDFLATEX := pdflatex -output-directory build

test:
	echo $(cat build/revision)

all: sheet.pdf

run: dist
	cp build/dist.pdf ${HOME}/dropbox/public/sheet.pdf

dist: dist.pdf

dist.pdf: sheet.tex
	cp sheet.tex build/dist.tex
	./update-revision.sh
	$(PDFLATEX) build/dist.tex

sheet.pdf: sheet.tex
	$(PDFLATEX) sheet.tex

.PHONY: clean
