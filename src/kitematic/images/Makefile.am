thisdir   = kitematic/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	browse-images.png \
	change-folder.png \
	cli-access-button.png \
	cli-redis-container.png \
	cli-redis-general.png \
	cli-terminal.png \
	containers.png \
	installing.png \
	kitematic-login.png \
	minecraft-add-server.png \
	minecraft-create.png \
	minecraft-data-volume.png \
	minecraft-login.png \
	minecraft-map.png \
	minecraft-port.png \
	minecraft-restart.png \
	minecraft-server-address.png \
	nginx-2048-files.png \
	nginx-2048.png \
	nginx-create.png \
	nginx-data-folder.png \
	nginx-data-volume.png \
	nginx-hello-world.png \
	nginx-preview.png \
	nginx-serving-2048.png \
	rethink-container.png \
	rethink-create.png \
	rethink-ports.png \
	rethinkdb-preview.png \
	volumes-dir.png

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
