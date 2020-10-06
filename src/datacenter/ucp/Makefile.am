SUBDIRS = 3.0 3.1

thisdir    = datacenter/ucp
origdir    = @abs_origdir@/$(thisdir)
srcdir     = @srcdir@
mysrcdir   = $(shell cd $(srcdir) && pwd)
targetdir  = @abs_targetdir@/$(thisdir)
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
