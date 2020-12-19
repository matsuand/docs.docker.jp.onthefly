thisdir   = get-started/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	app-in-browser-redis.png \
	app-in-browser-swarm.png \
	app-in-browser.png \
	app80-in-browser.png \
	cloud-app-in-browser.png \
	cloud-aws-running-instances-x.png \
	cloud-aws-running-instances.png \
	cloud-aws-web-and-visualizer-ports.png \
	cloud-aws-web-port-open.png \
	cloud-swarm-connect-desktop.png \
	cloud-swarm-connect.png \
	cloud-visualizer.png \
	dashboard-app-project-collapsed.png \
	dashboard-app-project-expanded.png  \
	dashboard-multi-container-app.png   \
	dashboard-open-cli-ubuntu.png       \
	dashboard-removing-container.png    \
	dashboard-two-containers.png        \
	get-started-visualizer1.png \
	hvs.png \
	ide-screenshot.png \
	items-added.png \
	laurel-docker-containers.png \
	laurel-docker-containers2019.png \
	multi-app-architecture.png \
	newrepo.png \
	push-command.png \
	pwd-add-new-instance.png \
	todo-list-empty.png \
	todo-list-sample.png \
	todo-list-updated-empty-text.png \
	tutorial-in-dashboard.png \
	updated-add-button.png \
	vid-get-started-pmckee.png \
	visualizer-with-redis.png

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
