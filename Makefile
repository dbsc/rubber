.PHONY: build check

build:
	python3 ./setup.py build

check:
	(cd tests && ./run.sh *)
