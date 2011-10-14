all: sheet.pdf

sheet.pdf: sheet.tex
	pdflatex sheet.tex

run: sheet.pdf
	cp sheet.pdf ${HOME}/dropbox/public/
