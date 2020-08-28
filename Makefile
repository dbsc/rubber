.PHONY: build check format lint test yapf

build:
	python3 ./setup.py build

check: lint test

format:
	yapf --in-place --recursive --parallel .

lint: yapf

yapf:
	yapf --diff --recursive --parallel .

test:
	(cd tests && ./run.sh *)
