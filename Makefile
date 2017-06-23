# Lab_meeting
## https://github.com/mac-theobio/Lab_meeting

### Hooks for the editor to set the default target
current: target
-include target.mk

##################################################################

# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

# https://github.com/mac-theobio/Lab_meeting/blob/master/README.md
README.html: README.md

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

##################################################################

## Content

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/pandoc.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
