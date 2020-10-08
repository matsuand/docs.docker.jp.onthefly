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
	2fa-disable-2fa.png \
	2fa-enter-2fa-code.png \
	2fa-enter-code.png \
	2fa-enter-pw-disable-2fa.png \
	2fa-enter-recover-code.png \
	2fa-have-recovery-code.png \
	2fa-pw-new-code.png \
	2fa-recovery-code.png \
	2fa-security-home.png \
	bitbucket-hook.png \
	bitbucket_creds.png \
	convert-account.png \
	deploy_key.png \
	docker-integration.png \
	getting-started.png \
	gh-check-admin-org-dh-app-access.png \
	gh-check-user-org-dh-app-access.png \
	gh_add_ssh_user_key.png \
	gh_docker-service.png \
	gh_menu.png \
	gh_org_members.png \
	gh_repo_deploy_key.png \
	gh_service_hook.png \
	gh_settings.png \
	gh_team_members.png \
	github-side-hook.png \
	github-webhook-add.png \
	github-webhook.png \
	hub-copy-token.png \
	hub-create-token.png \
	hub-edit-token.png \
	index-create-repo.png \
	index-repo-created.png \
	index-tag.png \
	index-terminal-2019.png \
	index-terminal.png \
	index-upgrade-plan.png \
	index-upgrade-plan2019.png \
	index-welcome.png \
	official_images-tags-2019.png \
	official_images-tags-home.png \
	official_images-tags.png \
	org-members2019.png \
	orgs-add-member2019.png \
	orgs-add-team-permissions.png \
	orgs-audit-permissions.png \
	orgs-list-repos.png \
	orgs-new-team2019.png \
	orgs-repo-perms2019.png \
	orgs-repos2019.png \
	orgs-team-add-to-repo.png \
	orgs-team-add-user.png \
	orgs-team-create-submit.png \
	orgs-team-create.png \
	orgs-team-members2019.png \
	orgs-team-remove-user.png \
	orgs-teams-perms2019.png \
	orgs-teams2019.png \
	repo-create-private.png \
	repo-create-details.png \
	repo-image-layers.png \
	repo-make-private.png \
	repo-single-tag-view-2019.png \
	repo-view-2019.png \
	repos-create.png \
	repos-list2019.png \
	repo-overview.png \
	repo-tags-list.png \
	repos-tags-manage-2019.png \
	repos-tags-manage.png \
	repos-tags-view-2019.png \
	repos-tags-view.png \
	slack-notification-updates.png \
	teams-add-member2019.png \
	upgrade-change-account.png \
	upgrade-change-plan.png \
	vid-create-org.png \
	vid-org-overview.png \
	vid-teams-manage.png \
	vid-teams-overview.png \
	vuln-scan-details.png \
	vuln-scan-report.png \
	webhooks-create.png \
	webhooks-empty.png \
	webhooks-history.png \
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
