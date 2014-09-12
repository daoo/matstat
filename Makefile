options = -file-line-error -halt-on-error
headref  = $(shell git rev-parse --short HEAD)

all: build/sheet.pdf

run: ${HOME}/dropbox/public/sheet.pdf

${HOME}/dropbox/public/sheet.pdf: build/dist.pdf
	cp build/dist.pdf ${HOME}/dropbox/public/sheet.pdf

build/sheet.pdf: sheet.tex
	pdflatex $(options) -output-directory=build sheet.tex
	pdflatex $(options) -output-directory=build sheet.tex

build/dist.pdf: build/dist.tex
	pdflatex $(options) -output-directory=build build/dist.tex
	pdflatex $(options) -output-directory=build build/dist.tex

build/dist.tex: sheet.tex
	cp sheet.tex build/dist.tex
	sed -i "s/rev DEVELOPMENT/rev $(headref)/" build/dist.tex

clean:
	rm -rf build/*.*

.PHONY: clean
