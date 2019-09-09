# Lab_meeting
## https://github.com/mac-theobio/Lab_meeting

### Hooks for the editor to set the default target
current: target
-include target.mk

vim_session:
	bash -cl "vm README.md"

##################################################################

Sources += Makefile README.md LICENSE.md 
Ignore += .gitignore

msrepo = https://github.com/dushoff
ms = makestuff
-include $(ms)/os.mk

Ignore += $(ms)
Makefile: $(ms) $(ms)/Makefile
$(ms):
	git clone $(msrepo)/$(ms)

##################################################################

# Meeting notes, etc.

# https://github.com/mac-theobio/Lab_meeting/blob/master/README.md
Ignore += README.html
README.html: README.md
Sources += 2017.md

######################################################################

## Scheduling

Sources += $(wildcard *.R)
sched.Rout.csv: sched.R

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk
# -include $(ms)/pandoc.mk
-include $(ms)/render.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
