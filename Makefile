targets=docs/vpl.pdf answers/vpl-answers.pdf
deps=$(wildcard */*.tex) $(wildcard images/*.png) $(wildcard programs/*.aesl) Makefile build

%.pdf: %.tex $(deps)
	cd build && TEXINPUTS=../docs:../answers:${TEXINPUTS} pdflatex ../$<
	cd build && TEXINPUTS=../docs:../answers:${TEXINPUTS} pdflatex ../$<
	mv build/$(@F) $@

vpl-tutorial.zip: $(targets) Makefile
	rm -f vpl-tutorial.zip
	zip vpl-tutorial.zip $(targets) programs/*.aesl answers/*.aesl

clean: buildclean

build:
	mkdir -p build

buildclean:
	rm -rf build *~ */*~ 

distclean: clean
	rm -f $(targets)

.PHONY: clean buildclean distclean all dist