thisdir   = images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	404-docs.png \
	Cloud_icon.png \
	Compose.png \
	Compose_icon.png \
	Container@2x.png \
	Engine_icon.png \
	Engine_icon_0.png \
	Hub_icon.png \
	Hub_icon_0.png \
	Kitematic_icon.png \
	Machine_icon.png \
	Swarm_icon.png \
	VM@2x.png \
	angles.png \
	apple_48.svg \
	applen_48.svg \
	arrow.svg \
	banner_image_24512.png \
	chat.png \
	cloud_48.svg \
	cloudn_48.svg \
	compose_48.svg \
	composen_48.svg \
	docker-docs-logo.svg \
	docker-friends.png \
	docker_icon.png \
	docker-icon.svg \
	dockercon21.png \
	docs.png \
	docs@2x.png \
	down.png \
	download-docker.svg \
	engine.svg \
	engine_48.svg \
	enginen_48.svg \
	fan.svg \
	favicon.png \
	footer_moby_icon.png \
	green-check.svg \
	guides.svg \
	hub.svg \
	icon-apple@2X.png \
	icon-cloud@2X.png \
	icon-compose@2X.png \
	icon-engine@2X.png \
	icon-hub@2X.png \
	icon-linux@2X.png \
	icon-machine@2X.png \
	icon-registry@2X.png \
	icon-ucp@2X.png \
	icon-windows@2X.png \
	important-admonition-example.png \
	language-guides.svg \
	laptop.svg \
	linux_48.svg \
	linuxn_48.svg \
	logo-docker-main.png \
	logo-docker-main.svg \
	logo-docker-main2.png \
	logo-docker-main2.svg \
	machine_48.svg \
	machinen_48.svg \
	manuals.svg \
	note-admonition-example.png \
	placeholder_24517_13.png \
	reference.svg \
	resources_file_icon.svg \
	resources_lap_icon.svg \
	rocket.svg \
	seach.png \
	search-icon.png \
	search.png \
	slack-icon.svg \
	small-linux.png \
	small-mac.png \
	small-windows.png \
	social_icons_24518.png \
	up.png \
	video.svg \
	warning-admonition-example.png \
	whale-x.png \
	whats-new.svg \
	windows_48.svg \
	windowsn_48.svg

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
