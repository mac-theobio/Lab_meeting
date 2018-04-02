ms = makestuff
-include local.mk
-include $(ms)/os.mk

Sources += $(ms)

Makefile: $(ms)
$(ms):
	git submodule add -b master https://github.com/dushoff/$@.git

$(ms)/%.mk: $(ms)/Makefile
	touch $@

$(ms)/Makefile:
	git submodule init $(ms) 
	git submodule update $(ms) 
	touch $@
