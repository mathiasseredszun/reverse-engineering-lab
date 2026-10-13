CC = gcc
PYTHON ?= python3
CFLAGS = -std=c11 -O1 -g -Wall -Wextra -Werror -fPIE -fstack-protector-strong '-ffile-prefix-map=$(CURDIR)=.' '-fdebug-prefix-map=$(CURDIR)=.'
LDFLAGS = -pie -Wl,-z,relro,-z,now -Wl,--build-id=none
TARGETS = build/token_gate build/record_count

.PHONY: all test evidence check-reproducible sanitize ghidra
all: $(TARGETS) $(TARGETS:%=%.stripped)

build:
	mkdir -p build

build/%: labs/%.c Makefile | build
	$(CC) $(CFLAGS) $< $(LDFLAGS) -o $@

build/%.stripped: build/%
	strip --strip-all -o $@ $<

test: all
	$(PYTHON) -m unittest discover -s tests -v

evidence: test
	$(PYTHON) analysis/capture.py

check-reproducible: evidence
	cp evidence/SHA256SUMS build/first.sha256
	$(CC) $(CFLAGS) labs/token_gate.c $(LDFLAGS) -o build/token_gate
	$(CC) $(CFLAGS) labs/record_count.c $(LDFLAGS) -o build/record_count
	strip --strip-all -o build/token_gate.stripped build/token_gate
	strip --strip-all -o build/record_count.stripped build/record_count
	$(PYTHON) analysis/capture.py
	cmp build/first.sha256 evidence/SHA256SUMS

sanitize:
	mkdir -p build
	$(CC) -std=c11 -O1 -g -Wall -Wextra -Werror -fsanitize=undefined -fno-sanitize-recover=all labs/record_count.c -o build/record_count.ubsan
	build/record_count.ubsan 65536
	build/record_count.ubsan 4294967295

ghidra: all
	bash scripts/ghidra.sh
