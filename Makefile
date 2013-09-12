targets=docs/vpl.pdf answers/vpl-answers.pdf
deps=$(wildcard */*.tex) $(wildcard images/*.png) $(wildcard programs/*.aesl) Makefile build

%.pdf: %.tex $(deps)
	cd build && TEXINPUTS=../docs:../answers:${TEXINPUTS} pdflatex ../$<
	cd build && TEXINPUTS=../docs:../answers:${TEXINPUTS} pdflatex ../$<
	mv build/$(@F) $@

all: $(targets)

build:
	mkdir -p build

clean: buildclean

buildclean:
	rm -rf build *~ */*~ 

distclean: clean
	rm -f $(targets)

.PHONY: clean buildclean distclean all