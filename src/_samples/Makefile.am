SUBDIRS = library

thisdir    = _samples
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/_layouts
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

#.PHONY: publishinstall
#publishinstall:
#	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

.PHONY: rewriteurls
rewriteurls:
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir $@; done

.PHONY: publishclean
publishclean:
