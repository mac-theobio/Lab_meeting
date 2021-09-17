# Lab_meeting
## https://github.com/mac-theobio/Lab_meeting/blob/master/README.md

current: target
-include target.mk

vim_session:
	bash -cl "vmt README.md"

######################################################################

# Meeting notes, etc.
Sources += Makefile README.md LICENSE

Sources += $(wildcard notes/*.md)

## Archive files; named after the year in which they were archived
## Aim to archive in Sept
Sources += archive.md

# https://github.com/mac-theobio/Lab_meeting/blob/master/README.md
Ignore += README.html
README.html: README.md

######################################################################

## Scheduling

Sources += $(wildcard *.R)
sched.Rout.csv: sched.R

######################################################################

alldirs += dataviz

######################################################################

## Makestuff setup (automatically get makestuff if you clone this repo somewhere else)
msrepo = https://github.com/dushoff

Ignore += makestuff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/perl.def
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/render.mk
-include makestuff/wrapR.mk
