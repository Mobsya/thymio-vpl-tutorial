langs=en fr de it
targets=$(patsubst %,thymio-vpl-tutorial-%.zip,$(langs)) $(patsubst %,thymio-vpl-folding-ref-card-%.pdf,$(langs))
zipdeps=authors.txt $(wildcard programs/*.aesl) $(wildcard programs/*/*.aesl) $(wildcard answers/*.aesl)
texdeps=$(wildcard images/*.png) $(wildcard images/*.jpg) $(wildcard images/*.pdf) vpl.sty Makefile

# TODO: fix $(wildcard docs/*/*.tex), find why $(wildcard docs/%/*.tex) does not work

thymio-vpl-tutorial-%.pdf: docs/%/vpl.tex $(wildcard docs/*/*.tex) $(texdeps) | build/%
	cd build/$* && TEXINPUTS=../../docs/$*:${TEXINPUTS} pdflatex ../../$<
	cd build/$* && TEXINPUTS=../../docs/$*:${TEXINPUTS} pdflatex ../../$<
	mv build/$*/vpl.pdf $@

thymio-vpl-tutorial-answers-%.pdf: answers/%/vpl-answers.tex $(texdeps) | build/%
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	mv build/$*/vpl-answers.pdf $@

thymio-vpl-ref-card-%.pdf: ref-card/%/vpl-ref-card.tex $(texdeps) | build/%
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	mv build/$*/vpl-ref-card.pdf $@
	
thymio-vpl-folding-ref-card-%.pdf: ref-card/%/vpl-folding-ref-card.tex $(texdeps) | build/%
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	mv build/$*/vpl-folding-ref-card.pdf $@

thymio-vpl-tutorial-%.zip: thymio-vpl-tutorial-%.pdf thymio-vpl-tutorial-answers-%.pdf thymio-vpl-ref-card-%.pdf thymio-vpl-folding-ref-card-%.pdf readmes/%/readme.txt $(zipdeps) Makefile
	rm -f thymio-vpl-tutorial-$*.zip
	touch thymio-vpl-tutorial-$*.pdf thymio-vpl-tutorial-answers-$*.pdf
	zip $@ thymio-vpl-tutorial-$*.pdf thymio-vpl-tutorial-answers-$*.pdf thymio-vpl-ref-card-$*.pdf thymio-vpl-folding-ref-card-$*.pdf $(zipdeps)
	cd readmes/$* && zip ../../$@ *.txt

build/%:
	mkdir -p build/$*

all:	$(targets)

clean: buildclean

buildclean:
	rm -rf build *~ */*~ 

distclean: clean
	rm -f *.pdf $(targets)

.PHONY: clean buildclean distclean all dist
.PRECIOUS: thymio-vpl-tutorial-%.pdf thymio-vpl-tutorial-answers-%.pdf thymio-vpl-ref-card-%.pdf thymio-vpl-folding-ref-card-%.pdf build/%
