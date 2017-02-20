file=main

src= $(file).tex hvf_def.tex macros.tex herab.sty title.tex axodraw.sty background.tex strategy.tex theory.tex lhc.tex reconstruction.tex conclusion.tex
figs=


all: ps/$(file).ps


ps/$(file).ps: out/$(file).dvi
#	dvips -O0.6,1.7cm out/$(file).dvi -ops/$(file).ps
	dvips -ta4 -D1270 out/$(file).dvi -ops/$(file).ps
#	dvips out/$(file).dvi -ops/$(file).ps
	psnup -2 ps/$(file).ps > ps/$(file)2.psmak


out/$(file).dvi: $(src)  $(figs)
	cd out;	latex ../$(file); bibtex $(file) ; latex ../$(file); latex ../$(file); cd ..;

view:	
#	gv ps/$(file).ps            &
	gv -magstep -2 ps/$(file).ps &

dopdf:	
	ps2pdf13 -r1270 -dPDFSETTINGS=/printer ps/$(file).ps pdf/$(file).pdf
	evince pdf/$(file).pdf &
start:
	mkdir -p out
	mkdir -p ps
	mkdir -p pdf
	rm -f out/*
	ln -s ../time.sty out/time.sty
	ln -s ../herab.sty out/herab.sty
	ln -s ../hvf_def.tex out/hvf_def.tex
	ln -s ../macros.tex out/macros.tex


clean:
	rm -f out/*.dvi
	rm -f out/*.log
	rm -f out/*.aux
	rm -f out/*.bbl
	rm -f out/*.blg
	rm -f ps/*.ps
	rm -f pdf/*.pdf

help:
	@echo " "
	@echo " Makefile Hernan Wahlberg Thesis writing.  "
	@echo " Master file: "$(file).tex
	@echo " "
	@echo " use:   make  start       to create the needed directories (only once)"
	@echo "    :   make  all         to create the ps file in ps/"$(file)".ps"
	@echo "    :   make  view        to view the ps file"
	@echo "    :   make  tar         to create a tar file (for backups!)"
	@echo "    :   make  help        to view this help"
	@echo " "
	@echo " source files: "$(src)
	@echo " figures : " $(figs)
	@echo " "
