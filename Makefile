targets=thymio-vpl-tutorial-en.zip thymio-vpl-tutorial-de.zip
deps=$(wildcard */*/*.tex) $(wildcard images/*.png) $(wildcard programs/*.aesl) vpl.sty authors.txt

thymio-vpl-tutorial-%.pdf: docs/%/vpl.tex $(deps) Makefile build/%
	cd build/$* && TEXINPUTS=../../docs/$*:${TEXINPUTS} pdflatex ../../$<
	cd build/$* && TEXINPUTS=../../docs/$*:${TEXINPUTS} pdflatex ../../$<
	cp build/$*/vpl.pdf $@

thymio-vpl-tutorial-answers-%.pdf: answers/%/vpl-answers.tex $(deps) Makefile build/%
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	cp build/$*/vpl-answers.pdf $@

thymio-vpl-ref-card-child-%.pdf: ref-card-child/%/vpl-ref-card-child.tex $(deps) Makefile build/%
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	cd build/$* && TEXINPUTS=../../answers/$*:${TEXINPUTS} pdflatex ../../$<
	cp build/$*/vpl-ref-card-child.pdf $@

thymio-vpl-tutorial-%.zip: thymio-vpl-tutorial-%.pdf thymio-vpl-tutorial-answers-%.pdf
	rm -f thymio-vpl-tutorial-$*.zip
	zip $@ $^ programs/*.aesl answers/*.aesl authors.txt
	cd readmes/$* && zip ../../$@ *

build/%:
	mkdir -p build/$*

all:	$(targets)

clean: buildclean

buildclean:
	rm -rf build *~ */*~ 

distclean: clean
	rm -f *.pdf $(targets)

.PHONY: clean buildclean distclean all dist
.PRECIOUS: build/
