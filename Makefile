# Lab_meeting
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: README.html 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
# include $(ms)/perl.def


# https://github.com/mac-theobio/Lab_meeting/blob/master/README.md
README.html: README.md

##################################################################

## Content

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/pandoc.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
