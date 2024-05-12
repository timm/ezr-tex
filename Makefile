 ezr.pdf : ezr.tex
	@-pdflatex -interaction=nonstopmode $^
	@-bibtex ezr
	@-pdflatex -interaction=nonstopmode $^
	@-pdflatex -interaction=nonstopmode $^
	@-open $@

clean:
	rm -rf *.aux *.toc *.log *.out *.bbl *.blg

saved         : ## save and push to main branch 
	read -p "commit msg> " x; y=$${x:-saved}; git commit -am "$$y}"; git push;  git status; echo "$$y, saved!"
 
name:
	read -p "word> " w; figlet -f mini -W $$w  | gawk '$$0 {print "#        "$$0}' |pbcopy
