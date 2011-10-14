all: sheet.pdf

sheet.pdf: sheet.tex
	pdflatex sheet.tex

run: sheet.pdf
	cp sheet.pdf ${HOME}/dropbox/public/

clean:
	$(RM) sheet.pdf sheet.out sheet.log sheet.aux

.PHONY: clean
