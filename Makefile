.PHONY: clean

all: notes.pdf notes_cn.pdf

notes.pdf: build/ build/notes.pdf
	cp build/notes.pdf notes.pdf

build/:
	mkdir -p build/

build/notes.pdf: build/notes.tex
	cd build/ && xelatex notes.tex

build/notes.tex: notes.lytex
	lilypond-book --pdf --format=latex --output=build notes.lytex

notes_cn.pdf: build/ build/notes_cn.pdf
	cp build/notes_cn.pdf notes_cn.pdf

build/notes_cn.pdf: build/notes_cn.tex
	cd build/ && xelatex notes_cn.tex

build/notes_cn.tex: build/notes_cn.lytex
	lilypond-book --pdf --format=latex --output=build build/notes_cn.lytex

build/notes_cn.lytex: notes.lytex
	opencc -c tw2sp.json -i notes.lytex | \
	sed 's/Source Han Serif TC/Source Han Serif SC/' > build/notes_cn.lytex

clean:
	rm -rf build/ notes.pdf notes_cn.pdf
