.PHONY: clean

all: notes.pdf

notes.pdf: build/ build/notes.pdf
	cp build/notes.pdf notes.pdf

build/:
	mkdir -p build/

build/notes.pdf: build/notes.tex
	cd build/ && xelatex notes.tex

build/notes.tex: notes.lytex
	lilypond-book --pdf --format=latex --output=build notes.lytex

clean:
	rm -rf build/ notes.pdf

