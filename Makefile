.DEFAULT_GOAL := help

.PHONY: help
help:
	@echo "see `Makefile`"

.PHONY: build
build:
	@vim -c 'source src/sorairo.vim' -c 'qa'
	@echo "build completed"
