thisdir   = docker-for-windows/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	desktop-win-2fa.png \
	diagnose-support.png \
	docker-app-search.png \
	docker-app-welcome.png \
	docker-menu-context-switch.png \
	docker-menu-settings.png \
	docker-menu-switch.png \
	docker-tutorial-win.png \
	hyperv-enabled.png \
	hyperv-manager.png \
	issue-template.png \
	nginx-homepage.png \
	redis-container.png \
	settings-advanced.png \
	settings-daemon-advanced.png \
	settings-daemon-basic.png \
	settings-general.png \
	settings-kubernetes.png \
	settings-network.png \
	settings-proxies.png \
	settings-reset.png \
	settings-resources.png \
	settings-shared-drives.png \
	shared-drive-firewall-blocked.png \
	shared-folder-on-demand.png \
	troubleshoot.png \
	virtualization-enabled.png \
	whale-icon-systray-hidden.png \
	whale-icon-systray.png \
	whale-x.png \
	wsl2-choose-distro.png \
	wsl2-context.png \
	wsl2-enable.png \
	wsl2-ui.png

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
