.PHONY: build check format lint pyflakes pylint test yapf

MODULES_AND_PACKAGES := setup.py rubber bin

build:
	python3 ./setup.py build

check: lint test

format:
	yapf --in-place --recursive --parallel .

lint: pyflakes pylint yapf

pyflakes:
	pyflakes $(MODULES_AND_PACKAGES)

pylint:
	pylint --errors-only $(MODULES_AND_PACKAGES)

yapf:
	yapf --diff --recursive --parallel .

test:
	(cd tests && ./run.sh *)
