 ezr.pdf : ezr.tex
	@-pdflatex -interaction=nonstopmode $^ | egrep '(arning|rror)' 
	@-bibtex ezr
	@-pdflatex -interaction=nonstopmode $^ > /dev/null
	@-pdflatex -interaction=nonstopmode $^ > /dev/null
	@-open $@

clean:
	rm -rf *.aux *.toc *.log *.out *.bbl *.blg

saved         : ## save and push to main branch 
	@read -p "commit msg> " x; y=$${x:-saved}; git commit -am "$$y}"; git push;  git status; echo "$$y, saved!"
 
name:
	@read -p "word> " w; figlet -f mini -W $$w  | gawk '$$0 {print "#        "$$0}' |pbcopy

