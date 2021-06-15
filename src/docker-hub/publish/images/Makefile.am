thisdir   = docker-hub/publish/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	Docker-Hub-tags-system-info.png \
	Docker-Hub-tags-vulnerabilities.png \
	Docker-hub-tags-vulnerability-details.png \
	FAQ-certified-content.png \
	FAQ-types-of-certified-content.png \
	VerifiedPublisherBadge.png \
	certified_container.png \
	certified_infrastructure.png \
	certified_plugins.png \
	gforghetti-apache-latest_inspection_report.html-1.png \
	gforghetti-apache-latest_inspection_report.html-2.png \
	gforghetti-apache-latest_inspection_report.html-3.png \
	gforghetti-log-driver-latest_inspection_report.html.png \
	image_0.png \
	image-tags.png \
	node-tags-system-info.png \
	node-tags-vulnerabilities.png \
	node-tags-vulnerability-details.png \
	publish-diagram.png \
	publish_byol.png \
	scan-full-details.png \
	scan-single.png \
	scan-tags.png \
	scan-view.png \
	store-browse.png \
	store-get.png \
	store-product-id.png \
	store-pullcmd.png \
	store-search.png \
	subscribed.png

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
