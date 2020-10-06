SUBDIRS = cli

thisdir   = datacenter/dtr/2.5/reference
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

#.PHONY: install
#install:
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

#.PHONY: publishinstall
#publishinstall:
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

.PHONY: rewriteurls
rewriteurls:
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

.PHONY: publishclean
publishclean:
