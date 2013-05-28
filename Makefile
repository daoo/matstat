outdir   = build
pdflatex = pdflatex -file-line-error -halt-on-error -output-directory=build

all: build/sheet.pdf

run: ${HOME}/dropbox/public/sheet.pdf

${HOME}/dropbox/public/sheet.pdf: build/dist.pdf
	cp build/dist.pdf ${HOME}/dropbox/public/sheet.pdf

build/sheet.pdf: sheet.tex
	$(pdflatex) sheet.tex
	$(pdflatex) sheet.tex

build/dist.pdf: build/dist.tex
	$(pdflatex) build/dist.tex
	$(pdflatex) build/dist.tex

build/dist.tex: sheet.tex
	cp sheet.tex build/dist.tex
	./update-revision.sh

clean:
	rm -rf build/*.*

.PHONY: clean
