## This is the dataviz subdirectory of the lab meeting repo

current: target
-include target.mk

######################################################################

Sources += $(wildcard *.R)

######################################################################

## Youtube contest

## This is made in Chyun's youtube repo
Sources += theme_code.Rout.csv

theme_count.Rout: theme_count.R theme_code.Rout.csv
	$(makeR)

theme_smooth.Rout: theme_smooth.R theme_count.rda
	$(makeR)

######################################################################

### Makestuff

Sources += Makefile

## Sources += content.mk
## include content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk

-include makestuff/makeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk
