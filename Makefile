.SUFFIXES:
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
BUILD_DIR:=$(ROOT_DIR)/.build

## TOOLS
SILENT = @
MSG      = echo
HASRUBBER:=$(shell which rubber)

## COLORS 
RESET       = tput sgr0
YELLOW      = tput setaf 3; tput bold

TEXFILES=$(shell find -name "*.tex")
# Use all documents/*.tex files
SOURCES=$(wildcard documents/*.tex)
_S0 := $(subst .tex,,$(SOURCES))
TEXRULES := $(subst documents/,, $(_S0))

#################################################
# Rules
#################################################
.PHONY: all clean ${TEXRULES} lint
all: $(TEXRULES)
clean:
	rm -rf .build

.build: 
	mkdir -p .build

# Same as github lint action
lint:
	$(SILENT) ${YELLOW}; $(MSG)  "Running chktex"; $(RESET)
	$(SILENT) chktex ${TEXFILES}


#################################################
# Generate rules for sources
#################################################
define latex_rules
main_file := $(1)

## documents/foo.tex -> foo
_SCARP0 := $$(subst .tex,,$$(main_file))
RULENAME := $$(subst documents/,, $$(_SCARP0))

## Generates rules for pdfs
$$(RULENAME): $$(main_file) | .build 
	$(SILENT) ${YELLOW}; $(MSG)  "Building $$<"; $(RESET)
ifdef HASRUBBER
	$(SILENT) rubber --unsafe --pdf --force $$<
else
	$(SILENT) latexmk -shell-escape -silent -pdf -interaction=nonstopmode -outdir=$${BUILD_DIR} $$<
endif

## Generate Summary Rule
$$(RULENAME)_summary: | $$(RULENAME)
	$(SILENT) tail -n1 .build/$$(|).log
endef

$(foreach source, $(SOURCES), $(eval $(call latex_rules, $(source))))