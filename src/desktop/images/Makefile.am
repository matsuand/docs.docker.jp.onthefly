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
	dev-env-compose.png          \
	dev-env-container.png        \
	dev-env-create.png           \
	dev-env-gitbash.png          \
	dev-env-localhost.png        \
	dev-env-share.png            \
	dev-env-shared.png           \
	example-app-architecture.png \
	extensions-image.PNG         \
	image-details.png            \
	kube-context.png             \
	kube-enable.png              \
	mac-application-view.png     \
	mac-browser-view.png         \
	mac-container-view.png       \
	mac-dashboard.png            \
	mac-redis-container.png      \
	redis-image.png              \
	volumes-list.png

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
