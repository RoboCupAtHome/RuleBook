# ############################################################################
#     www.  //        //''                         //    '' //''//''
#    //''' //' //'// //' '''// ////   //''' //''' //'// // //' //' //'// //''
#   ///// //  ///// //  ///// // //  ///// //    // // // //  //  ///// //
#  ,,,// /// //,,, //  //,// // //, ,,,// //,,, // // // //  //  //,,, // .de
# ############################################################################
#
#            $Id: Makefile 269 2012-06-03 23:41:12Z holz $
#         author: Stefan Schiffer
#        license: this work can be redistributed under the terms of the GPLv2
#    description: Generic Makefile for LaTeX files
#
# ############################################################################

## MAIN ###################

PREFIX = Rulebook

## #################################### ##
##  VARIABLES                           ##
## #################################### ##

## FILES ##################

TEXFILE = $(PREFIX).tex
#
DVIFILE = $(PREFIX).dvi
PSFILE  = $(PREFIX).ps
PDFFILE = $(PREFIX).pdf
#
AUXFILE = $(PREFIX).aux
IDXFILE = $(PREFIX).idx
ADXFILE = $(PREFIX).adx
ANDFILE = $(PREFIX).and
LOGFILE = $(PREFIX).log
BBLFILE = $(PREFIX).bbl
BLGFILE = $(PREFIX).blg
#
TARFILE = $(PREFIX).tar
TGZFILE = $(PREFIX).tgz
TBZFILE = $(PREFIX).tbz

RMSOME  = *~
RMFILES = *~ *.toc *.idx *.ilg *.ind *.bbl *.blg *.out *.aux *.synctex.gz \
	  *.tmp *.log *.lot *.lof *.adx *.and *.abb *.ldx $(PREFIX).pdf score_sheets*.pdf .temp* $(TARFILE)

## OPTIONS ################

SILENT = @

## COMMANDS ###############

MAKE        = make -s
LATEX       = latex
BIBTEX      = bibtex
MAKEIDX     = makeindex
DVIPS       = dvips
DVIPSFLAGS  = -Ppdf -G0
DVIPDF      = dvipdf
PS2PDF      = ps2pdf
PS2PDFFLAGS = -sPAPERSIZE=a4 -dCompatibilityLevel=1.3 -dEmbedAllFonts=true
PSNUP       = psnup
PDFLATEX    = pdflatex
#PDFLATEXFLAGS = --enable-write18
PDFLATEXFLAGS = --shell-escape
PDF2PS      = pdf2ps
PDF2PSFLAGS = #-paper "A4"
#
SPELL       = aspell
# use tex-mode, use custom wordlist, set personal word-list to extra word-list file
SPELL_OPT   = --lang=en --mode=tex --extra-dicts=./extra_dict.pws -p ./extra_dict.pws
SPELL_ADDITIONAL_OPT = --add-tex-command="nolinkurl p" --add-tex-command="refsec p"
## either check file, prompting for action
SPELL_CMD   = -c
## or just list mispelled words
#SPELL_CMD   = list <
SPELL_WARN  = list <


## VIEW ###################

VIEWDVI     = xdvi
VIEWDVI_OPT = -geometry 676x920-0+0
VIEWPS      = gv
VIEWPS_OPT  = -geometry 676x920-0+0
VIEWPDF     = xpdf
VIEWPDF_OPT = -geometry 676x920-0+0

## TOOLS ##################

TAR      = tar -cvf
UNTAR    = tar -xvf
TGZ      = tar -czvf
UNTGZ    = tar -xzvf
TBZ2     = tar -cjvf
UNTBZ2   = tar -xjvf
RM       = rm
RMF      = rm -f
RMRF     = rm -rf
DBG      = echo
MSG      = echo

## COLORS #################

RESET       = tput sgr0
#
BLACK       = tput setaf 0
BLACK_BG    = tput setab 0
DARKGREY    = tput setaf 0; tput bold
RED         = tput setaf 1
RED_BG      = tput setab 1
LIGHTRED    = tput setaf 1; tput bold
GREEN       = tput setaf 2
GREEN_BG    = tput setab 2
LIME        = tput setaf 2; tput bold
BROWN       = tput setaf 3
BROWN_BG    = tput setab 3
YELLOW      = tput setaf 3; tput bold
BLUE        = tput setaf 4
BLUE_BG     = tput setab 4
BRIGHTBLUE  = tput setaf 4; tput bold
PURPLE      = tput setaf 5
PURPLE_BG   = tput setab 5
PINK        = tput setaf 5; tput bold
CYAN        = tput setaf 6
CYAN_BG     = tput setab 6
BRIGHTCYAN  = tput setaf 6; tput bold
LIGHTGREY   = tput setaf 7
LIGHTGREYBG = tput setab 7
WHITE       = tput setaf 7; tput bold

## NAMED-HELPER ###########

MENU  = $(CYAN)
ITEM  = $(BRIGHTCYAN)
DONE  = $(CYAN)
CHECK = $(GREEN)
ERROR = $(RED)

## #################################### ##
##  R U L E S                           ##
## #################################### ##

all: dofullpdf wall mauClean
# all: mauCleanAll mauBuild mauClean

## ##################### ##
##  PDFLATEX (PDF)       ##
## ##################### ##

dofullpdf:
	$(SILENT) $(MAKE) dopdflatex
	$(SILENT) $(MAKE) domakeidx
	$(SILENT) $(MAKE) domakeadx
	$(SILENT) # $(MAKE) dobibtex
	$(SILENT) $(MAKE) dopdflatex
	$(SILENT) $(MAKE) dopdflatex

dopdflatex:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- Creating Score Sheets"; $(RESET)
	$(PDFLATEX) $(PDFLATEXFLAGS) -jobname='score_sheets_OPL' '\def\league{OPL}\input' score_sheets
	$(PDFLATEX) $(PDFLATEXFLAGS) -jobname='score_sheets_DSPL' '\def\league{DSPL}\input' score_sheets
	$(PDFLATEX) $(PDFLATEXFLAGS) -jobname='score_sheets_SSPL' '\def\league{SSPL}\input' score_sheets
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- Creating '$(PDFFILE)' via $(PDFLATEX)"; $(RESET)
	$(SILENT) $(PDFLATEX) $(PDFLATEXFLAGS) $(TEXFILE)
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

dopdf2ps:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- Running '$(PDF2PS)' on '$(PDFFILE)'"; $(RESET)
	$(SILENT) $(PDF2PS) $(PDF2PSFLAGS) $(PDFFILE)
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

## ##################### ##
##  GENERAL              ##
## ##################### ##

dobibtex:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- Running bibtex on '$(PREFIX)'"; $(RESET)
	$(SILENT) $(BIBTEX) $(PREFIX)
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

domakeidx:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- Running makeindex on '$(IDXFILE)'"; $(RESET)
	$(SILENT) $(MAKEIDX) $(IDXFILE)
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

domakeadx:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- Running makeindex on '$(ADXFILE)' (abbreviations)"; $(RESET)
	$(SILENT) $(MAKEIDX) $(ADXFILE) -o $(ANDFILE) -s ./setup/abbrevix.ist
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

## ##################### ##
##  WARNINGS             ##
## ##################### ##

#wall: warntex warn2do
wall: warn2do warnspell summary

warntex:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- grep LaTeX/pdfTeX Warnings in '$(TEXFILE)' ..."; $(RESET)
	$(SILENT) $(LATEX) $(TEXFILE) | grep -i -A 1 "tex warning" \
			&& ($(ERROR); $(MSG) "  -> please take care of the above TeX-warnings\n"; $(RESET)) \
			|| ($(CHECK); $(MSG) "  =) TeX generated NO warnings"; $(RESET))
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

warn2do:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(MSG) ""
	$(SILENT) $(ITEM); $(MSG) "  -- list todo/tbc/chk/..."; $(RESET)
	$(SILENT) grep -in '\\tbc\|\\todo\|\\chk\|\\rework' *.tex | grep -iv "newcommand\|def\|\:%" \
			&& ($(ERROR); $(MSG) -e "  -> please correct above todos"; $(RESET)) \
			|| ($(CHECK); $(MSG) "  =) no todo/check-thing found"; $(RESET))
	$(SILENT) $(MSG) ""
	$(SILENT) $(ITEM); $(MSG) "  -- ref, cite, etc.  without leading '~' ..."; $(RESET)
	$(SILENT) grep -in '\\ref{\|\\cite{\|\\refsec\|\\reffig' *.tex | grep -v '\~\|\:%\|refmark' \
			&& ($(ERROR); $(MSG) "  -> please insert missing '~' before each ref, cite, command listed above"; $(RESET)) \
			|| ($(CHECK); $(MSG) "  =) no missing '~' before ref, cite, reffig, or refsec command found"; $(RESET))
	$(SILENT) $(MSG) ""
	$(SILENT) $(ITEM); $(MSG) "  -- 'e.g.' without following '~' ..."; $(RESET)
	$(SILENT) grep -in 'e\.g\.' *.tex | grep -v '\~\|\:%\|e\.g\.\,' \
			&& ($(ERROR); $(MSG) -e "  -> please insert missing '~' after all 'e.g.' listed above"; $(RESET)) \
			|| ($(CHECK); $(MSG) "  =) no missing '~' after 'e.g.' found"; $(RESET))
	$(SILENT) $(MSG) ""
	$(SILENT) $(ITEM); $(MSG) "  -- 'i.e.' without following '~' ..."; $(RESET)
	$(SILENT) grep -in 'i\.e\.' *.tex | grep -v '\~\|\:%\|i\.e\.\,' \
			&& ($(ERROR); $(MSG) -e "  -> please insert missing '~' after all 'i.e.' listed above"; $(RESET)) \
			|| ($(CHECK); $(MSG) "  =) no missing '~' after 'i.e.' found"; $(RESET))
	$(SILENT) $(MSG) ""
	$(SILENT) $(ITEM); $(MSG) "  -- 'et al.' without following '~' ..."; $(RESET)
	$(SILENT) grep -in 'et al\.' *.tex | grep -v '\~\|\:%' \
			&& ($(ERROR); $(MSG) -e "  -> please insert missing '~' after all 'et al.' listed above"; $(RESET)) \
			|| ($(CHECK); $(MSG) "  =) no missing '~' after 'et al.' found"; $(RESET))
	$(SILENT) $(MSG) ""
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

warnspell:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) for texfile in *.tex ; \
	do  \
		if [ $$texfile != "$(TEXFILE)" ] && [ $$texfile != "macros.tex" ] && [ $$texfile != "abbrevix.tex" ] && [ $$texfile != "dummybox.tex" ]; then  \
			$(ITEM); $(MSG) "  -- spell check result on '$$texfile'"; $(RESET) ; \
			$(SPELL) $(SPELL_OPT) $(SPELL_ADDITIONAL_OPT) $(SPELL_WARN) $$texfile ; \
		fi ; \
	done
	#$(SILENT) for texfile in tests/*.tex ; \
	#do  \
	#	$(ITEM); $(MSG) "  -- spell check result on '$$texfile'"; $(RESET) ; \
	#	$(SPELL) $(SPELL_OPT) $(SPELL_ADDITIONAL_OPT) $(SPELL_WARN) $$texfile ; \
	#done
	#$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

summary:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- SUMMARY"; $(RESET)
	$(SILENT) tail -n1 $(PREFIX).log
	$(SILENT) $(DONE); $(MSG) " -----------------------------------------------------------------------"; $(RESET)


## ##################### ##
##  CLEANING             ##
## ##################### ##

clean:
	$(SILENT) $(MENU); $(MSG) " -----------------------------------------------------------------------"; $(RESET)
	$(SILENT) $(ITEM); $(MSG) "  -- CLEANING UP ..."; $(RESET)
	$(SILENT) $(RMF) $(RMFILES)
	$(SILENT) $(DONE); $(MSG) " ------------------------------------------------------------- done. ---"; $(RESET)

# ############################################################################
#                                                                  END OF FILE
# ############################################################################


# ############################################################################
# @Kyordhel: Not really, I'm fixing this mess.
# ############################################################################

dirk:	mauBuild
mauBuild:
	$(SILENT) rubber --pdf --force Rulebook.tex
	$(SILENT) for league in OPL DSPL SSPL ; do \
	    (echo "\def\league{$$league}" ; cat score_sheets.tex ) > "score_sheets_$$league.tex" ; \
		rubber --pdf --force "score_sheets_$$league.tex" ; \
		rm -f  "score_sheets_$$league.tex" "score_sheets_$$league.out" "score_sheets_$$league.log" "score_sheets_$$league.aux"; \
	done


mauClean:
	$(SILENT) rm -f *.aux *.bbl *.blg *.log *.lof *.log *.lot *.out *.synctex.gz *.toc *~

mauCleanAll:
	$(SILENT) rm -f *.pdf *.dvi *.aux *.bbl *.blg *.log *.lof *.log *.lot *.out *.synctex.gz *.toc *~

# ############################################################################
#                                              NOW THIS IS THE END OF THE FILE
# ############################################################################
