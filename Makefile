# **********************************************************************************
# Makefile for LaTeX document.
#
# AUTHOR:   Asier Pabolleta Martorell <apabolleta@gmail.com>
# LICENSE:  See LICENSE
# **********************************************************************************

LATEX2PDF=pdflatex
LATEX2HTML=htlatex
MAIN=maincv.tex
BUILD_DIR=build

.PHONY: help pdf html clean

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "help	Print help message"
	@echo "pdf	Compile to PDF"
	@echo "html	Compile to HTML"
	@echo "clean	Clean output files"

pdf:
	@echo "Creating build directory..."
	@mkdir -p $(BUILD_DIR)/pdf
	@echo "Generating PDF..."
	$(LATEX2PDF) -output-directory=$(BUILD_DIR)/pdf $(MAIN)
	$(LATEX2PDF) -output-directory=$(BUILD_DIR)/pdf $(MAIN)

html:
	@echo "Creating build directory..."
	@mkdir -p $(BUILD_DIR)/html
	@echo "Generating HTML..."

clean:
	@echo "Cleaning build files..."
	rm -rf $(BUILD_DIR)/