thisdir   = notary/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	key-hierarchy.svg \
	metadata-sequence.svg \
	service-architecture.svg \
	service-deployment.svg \
	trust-pinning-flow.png

srcs = $(images)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include copyimages.sub
copyimages.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyimages $(publishdir) $(srcs)

#.PHONY: install
#install: all install.sub $(addprefix $(targetdir)/,$(srcs))

#-include install.sub
#install.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh install $(targetdir) $(srcs)

#.PHONY: publishinstall
#publishinstall: all publishinstall.sub $(addprefix $(publishdir)/,$(srcs))

#-include publishinstall.sub
#publishinstall.sub: $(top_srcdir)/bin/copyinstall.sh $(top_builddir)/config.log
#	@$(top_srcdir)/bin/copyinstall.sh publishinstall $(publishdir) $(srcs)

.PHONY: rewriteurls
rewriteurls:

.PHONY: publishclean
publishclean:
