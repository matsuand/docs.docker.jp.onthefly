thisdir   = desktop/enterprise/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	app-design-choose.png \
	app-design-custom.png \
	app-design-custom2.png \
	app-design-run.png \
	app-design-start.png \
	app-design-test.png \
	console.png \
	diagnose-mac.png \
	diagnose-windows.png \
	docker-app-search.png \
	docker-app-welcome.png \
	docker-menu-context-switch.png \
	docker-menu-settings.png \
	docker-menu-switch.png \
	fatal-error.png \
	hello-world-nginx.png \
	install-version.png \
	kube-context.png \
	kubernetes-install-complete.png \
	nginx-homepage.png \
	prefs-advanced.png \
	prefs-daemon-adv.png \
	prefs-daemon-basic.png \
	prefs-disk.png \
	prefs-fileshare.png \
	prefs-general.png \
	prefs-kubernetes.png \
	prefs-proxies.png \
	prefs-reset-mac.png \
	prefs-reset.png \
	prefs.png \
	proxy-settings.png \
	settings-advanced.png \
	settings-daemon-advanced.png \
	settings-daemon-basic.png \
	settings-general.png \
	settings-kubernetes.png \
	settings-network.png \
	settings-proxies.png \
	settings-reset.png \
	settings-shared-drives.png \
	shared-drive-firewall-blocked.png \
	shared-drive-on-demand.png \
	sign-in.png \
	version-select.png \
	whale-icon-systray-hidden.png \
	whale-icon-systray.png \
	whale-x.png \
	win-ver-select.PNG \
	win-vp-list.PNG \
	windows-prereq.png

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
