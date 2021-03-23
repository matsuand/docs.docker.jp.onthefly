thisdir   = docker-hub/images
origdir   = @abs_origdir@/$(thisdir)
srcdir    = @srcdir@
mysrcdir  = $(shell cd $(srcdir) && pwd)
targetdir = @abs_targetdir@/$(thisdir)
publishdir = @abs_publishdir@/$(thisdir)
uploaddir  = @UPLOADDIR@/$(thisdir)

.PHONY: all
all: tgtdir $(srcs_with_prefix)

images = \
	2fa-disable-2fa.png            \
	2fa-enter-2fa-code.png         \
	2fa-enter-code.png             \
	2fa-enter-pw-disable-2fa.png   \
	2fa-enter-recover-code.png     \
	2fa-have-recovery-code.png     \
	2fa-pw-new-code.png            \
	2fa-recovery-code.png          \
	2fa-security-home.png          \
	activity-list.png              \
	dashboard-delete-image.png     \
	hub-copy-token.png             \
	hub-create-token.png           \
	hub-edit-token.png             \
	image-management-dashboard.png \
	index-create-repo.png          \
	index-repo-created.png         \
	index-tag.png                  \
	index-terminal.png             \
	org-activity-tab.png           \
	org-all-actions.png            \
	orgs-repo-perms2019.png        \
	orgs-teams-perms2019.png       \
	repo-create-details.png        \
	repo-create-private.png        \
	repo-image-layers.png          \
	repo-make-private.png          \
	repo-overview.png              \
	repo-tags-list.png             \
	repos-create.png               \
	repos-list2019.png             \
	slack-notification-updates.png \
	vuln-scan-details.png          \
	vuln-scan-report.png           \
	webhooks-create.png            \
	webhooks-empty.png             \
	webhooks-history.png           \
	webhooks-submenu.png

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
