file=thesis

src= $(file).tex commands.tex sections/title.tex sections/background.tex sections/strategy.tex sections/theory.tex sections/lhc.tex sections/reconstruction.tex sections/conclusion.tex
figs=


all: $(file).pdf


$(file).pdf: $(src)
	pdflatex $(file); bibtex $(file) ; pdflatex $(file) ; pdflatex $(file) 

view:	
	evince $(file).pdf &


clean:
	rm -f *.toc
	rm -f *.out
	rm -f *.log
	rm -f *.aux
	rm -f *.blg
	rm -f *.bbl
	rm -f *.pdf

