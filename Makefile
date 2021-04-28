.PHONY: build check check-license format lint pyflakes pylint test yapf

MODULES_AND_PACKAGES := setup.py rubber bin

build:
	python3 ./setup.py build

check: lint test

check-license:
	./tools/check-license

format:
	yapf --in-place --recursive --parallel .

lint: pyflakes pylint yapf check-license

pyflakes:
	pyflakes $(MODULES_AND_PACKAGES)

pylint:
	pylint --errors-only $(MODULES_AND_PACKAGES)

yapf:
	yapf --diff --recursive --parallel .

test:
	(cd tests && ./run.sh *)

.PHONY: gitlab-runner
gitlab-runner:
	gitlab-runner exec docker test
	gitlab-runner exec docker lint
