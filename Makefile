# Lab_meeting
## https://github.com/mac-theobio/Lab_meeting

### Hooks for the editor to set the default target
current: target
-include target.mk

##################################################################

# make files

Sources = Makefile .ignore README.md sub.mk LICENSE.md
include sub.mk
# include $(ms)/perl.def

##################################################################

# Meeting notes, etc.

# https://github.com/mac-theobio/Lab_meeting/blob/master/README.md
Ignore += README.html
README.html: README.md
Sources += 2017.md

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk
-include $(ms)/pandoc.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
