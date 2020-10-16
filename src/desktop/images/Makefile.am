thisdir   = desktop/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	app-dashboard-view.png       \
	example-app-architecture.png \
	image-details.png            \
	mac-application-view.png     \
	mac-browser-view.png         \
	mac-container-view.png       \
	mac-dashboard.png            \
	mac-redis-container.png      \
	redis-image.png

srcs = $(images)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}

.PHONY: tgtdir
tgtdir:
	$(MKDIR_P) $(publishdir)

-include copyimages.sub
copyimages.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyimages $(publishdir) $(srcs)

.PHONY: rewriteurls
rewriteurls:

.PHONY: publishclean
publishclean: