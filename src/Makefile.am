SUBDIRS = _data _includes _layouts _samples _scss buildx \
	ci-cd cloud compose compliance config css \
	datacenter desktop develop \
	docker-hub docker-id ee engine get-started \
	go images js language kitematic machine network \
	opensource reference registry release-notes samples storage \
	subscription toolbox

origdir     = @abs_origdir@
srcdir      = @srcdir@
mysrcdir    = $(shell cd $(srcdir) && pwd)
hosturl     = "@HOSTURL@"
publishdir  = @abs_publishdir@
publishurl  = @PUBLISHURL@
publishbase = @PUBLISHBASE@
uploaddir   = @UPLOADDIR@
uploadurl   = @UPLOADURL@
uploadbase  = @UPLOADBASE@
sitedestdir = @abs_sitedestdir@
sitedefined = @SITEDIR_DEFINED@

thisdate = `date +'%Y/%m/%d'`
commitdate = `(cd @abs_origdir@ && git log -1 --pretty=format:"%ad" --date=short) | sed "s|\-|/|g"`
commithash = `(cd @abs_origdir@ && git log -1 --pretty=format:"%h") | sed "s|\-|/|g"`
dockercommiturl = https://github.com/docker/docker.github.io/commit

.PHONY: all
all: ctie copyorigs tgtdir $(srcs_with_prefix) $(copies_with_prefix) _config.yml _config_production.yml

ctie:
	@$(MAKE) -C $(top_builddir)/$@ $@ >/dev/null

copyorigs:
	@if test ! -d ${publishdir}/_plugins; then cp -pR $(origdir)/_plugins ${publishdir} ; fi
	@if test ! -d ${publishdir}/_scripts; then cp -pR $(origdir)/_scripts ${publishdir} ; fi
	@if test ! -d ${publishdir}/favicons; then cp -pR $(origdir)/favicons ${publishdir} ; fi
	@if test ! -d ${publishdir}/fonts;    then cp -pR $(origdir)/fonts    ${publishdir} ; fi

bases = \
	404          \
	CONTRIBUTING \
	README       \
	components   \
	docsarchive  \
	get-docker   \
	glossary     \
	index        \
	search       \
	test

copies = \
	_website-config-docs.json       \
	_website-config-docs-stage.json \
	favicon.ico                     \
	robots.txt

ch_mds = $(bases:=.ch) # ch means change files
tr_mds = $(bases:=.md) # tr means translated files
EXTRA_DIST = $(ch_mds)
#DISTCLEANFILES = 

srcs = $(tr_mds)
srcs_with_prefix = ${addprefix $(publishdir)/,$(srcs)}
copies_with_prefix = ${addprefix $(publishdir)/,$(copies)}

.PHONY: tgtdir
tgtdir:
	@$(MKDIR_P) $(publishdir)

-include Makefile.sub
Makefile.sub: $(top_srcdir)/bin/ctiemake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/ctiemake.sh $(publishdir) $(srcs)
	@sed -i -e "/glossary\.md\:/s|$$|& $(publishdir)/_data/glossary.yaml|" $@

-include copyfiles.sub
copyfiles.sub: $(top_srcdir)/bin/copymake.sh $(top_builddir)/config.log
	@$(top_srcdir)/bin/copymake.sh copyfiles $(publishdir) $(copies)

_config.yml: $(origdir)/_config.yml
	cp -p $(origdir)/_config.yml .
_config_production.yml: $(origdir)/_config_production.yml
	cp -p $(origdir)/_config_production.yml .

@MAINT@.PHONY: chbuild
@MAINT@chbuild: $(addprefix $(mysrcdir)/, $(ch_mds))
@MAINT@$(addprefix $(mysrcdir)/, $(ch_mds)):
@MAINT@	@if test ! -f $@; then $(top_srcdir)/bin/buildch.perl `echo $@ | sed -e "s|^$(mysrcdir)|$(origdir)|" -e "s|\.ch$$|.md|"` $@; fi

.PHONY: install build
install: all ${publishdir}/_config.yml ${publishdir}/_config_production.yml ${publishdir}/_config_ja.yml
	@if test ! -d $(publishdir)/_plugins; then cp -pR $(origdir)/_plugins ${publishdir} ; fi
	@if test ! -d $(publishdir)/_scripts; then cp -pR $(origdir)/_scripts $(publishdir) ; fi
	@if test ! -d $(publishdir)/favicons; then cp -pR $(origdir)/favicons $(publishdir) ; fi
	@if test ! -d $(publishdir)/fonts;    then cp -pR $(origdir)/fonts    $(publishdir) ; fi

${publishdir}/_config.yml: $(origdir)/_config.yml
	@cp -p $(origdir)/_config.yml ${publishdir}
${publishdir}/_config_production.yml: $(origdir)/_config_production.yml
	@cp -p $(origdir)/_config_production.yml ${publishdir}

${publishdir}/_config_ja.yml: $(srcdir)/_config_ja.yml.in $(top_builddir)/config.log
	@sed -e "s|__URL__|${publishurl}|" \
	     -e "s|__BASEURL__|${publishbase}|g" \
	     -e "s|__SITEDESTDIR__|${sitedestdir}|g" \
		$(srcdir)/_config_ja.yml.in > ${publishdir}/_config_ja.yml
	@if test x"${sitedefined}" = xno; then \
	  sed -i -e "/^destination/d" ${publishdir}/_config_ja.yml ; \
	fi

.PHONY: build
build: install
	@rm -f ${sitedestdir}/index.html
	(cd $(publishdir) && rbenv exec jekyll build --config $(CONFIG_YML),_config_ja.yml)

	@find ${sitedestdir}/{,get-docker/}index.html | xargs \
	  sed -i -e "s|TEMPTITLE|<p><b>暫定公開中 ${thisdate} (${commitdate} \<a href=\"${dockercommiturl}/${commithash}\"\>docker.github.io@${commithash}\</a\> 対応)</b></p>|"
	@sed -i -e "s|__URL__|${publishurl}|g" \
	        -e "s|SUBBASEURL|${publishbase}|g" ${sitedestdir}/js/docs.js

	@sed -i -e "s|url(/images|url(/$(uploadbase)/images|g" \
	        -e "s|url(\"/images|url(\"/$(uploadbase)/images|g" \
	        -e "s|url(\"../fonts|url(\"/$(uploadbase)/fonts|g" $(sitedestdir)/css/style.css
	@sed -i -e "s|SUBBASEURL|${uploadbase}|g" ${sitedestdir}/js/docs.js
	@if test x"${enable_production}" = xyes; then \
	  sed -i -e "/lastmod/d" ${sitedestdir}/sitemap.xml ; \
	fi

.PHONY: rewriteurls
rewriteurls:
	@rm -f ${publishdir}/docs.docker.jp.onthefly/{index.html,js/docs.js}
	@if test -f ${publishdir}/.jekyll-metadata.upload; then cp -p $(publishdir)/.jekyll-metadata{.upload,}; fi
	@sed -e "/^name:/s/Documentation/ドキュメント/" \
	     -e "/^lsi:/a lang: ja_JP" \
	     -e "/^url:/s|https://docs.docker.com|$(uploadurl)|"  $(origdir)/_config.yml > $(publishdir)/_config.yml
	(cd $(publishdir) && rbenv exec jekyll build -d $(uploadbase))
	@cp -p $(publishdir)/.jekyll-metadata{,.upload}

	@mv ${publishdir}/_config.yml{,.upload}
	@cp -p $(origdir)/_config.yml ${publishdir}

	@find $(publishdir)/docs.docker.jp.onthefly -type f -name '*.html' | xargs \
	  sed -i -e "s#https://docs.docker.com#$(uploadurl)#g"
	@sed -i -e "s|TEMPTITLE|<p><b>暫定公開中 ${thisdate} (${commitdate} 対応)</b></p>|" ${publishdir}/docs.docker.jp.onthefly/index.html

	@echo Copying docs.docker.jp.onthefly files...
	@cp -pR ${publishdir}/docs.docker.jp.onthefly/* $(uploaddir)

	sed -i	-e "s|url(/images|url(/$(uploadbase)/images|g" \
		-e "s|url(\"/images|url(\"/$(uploadbase)/images|g" \
		-e "s|url(\"../fonts|url(\"/$(uploadbase)/fonts|g" $(uploaddir)/css/style.css

	@sed -i -e "s|SUBBASEURL|${uploadbase}|g" ${uploaddir}/js/docs.js

#	# Executes rewriteurls target for each SUBDIRS
	@for dir in $(SUBDIRS); do $(MAKE) -C $$dir rewriteurls; done

	@echo Removing rst files...
	@find $(uploaddir) -type f -name '*.rst' -print | xargs rm -f

	@echo Replacing URLs...
	@find $(uploaddir) -type f -name '*.html' -print | xargs \
	  sed -i -e "s|https://docs.docker.com|$(uploadurl)|g" \
		 -e "s|http://docs.docker.jp|$(uploadurl)|g" \
		 -e "s|https://github.com/zembutsu/docs.docker.jp/edit/master|https://github.com/matsuand/docs.docker.jp/edit/v19.03.local|g" \
		 -e "s|https://github.com/zembutsu/docs.docker.jp/issues/new|https://github.com/matsuand/docs.docker.jp.onthefly/issues/new|g" \
		 -e "s|$(hosturl)|$(uploadurl)|g" \
		 -e "s|\"$(publishurl)/$(publishbase)|\"$(uploadurl)/$(uploadbase)|g" \
		 -e "s|href=\"/|href=\"/$(uploadbase)/|g" \
		 -e "s|content=\"/|content=\"/$(uploadbase)/|g" \
		 -e "s|src=\"/|src=\"/$(uploadbase)/|g" \
		 -e "s|REDIRECTBASE|$(uploadbase)|g"

#	@echo Rewriting URL links...

	@sed -i -e "s|src=\"\.\./|src=\"$(uploadurl)/|g" $(uploaddir)/index.html
	@sed -i -e "s|src=\"\.\./|src=\"$(uploadurl)/|g" $(uploaddir)/get-docker/index.html
	@sed -i -e "s|$(publishurl)/$(publishbase)|$(uploadurl)/$(uploadbase)|g" $(uploaddir)/robots.txt
	@if test x"${enable_production}" = xyes; then \
	  sed -i -e "s|$(publishurl)/$(publishbase)|$(uploadurl)/$(uploadbase)|g" $(uploaddir)/sitemap.xml ; \
	fi
	@sed -i -e "103s|href=\"|href=\"/$(uploadbase)|" \
		-e "132s|href=\"|href=\"/$(uploadbase)|" \
		-e "143s|href=\"|href=\"/$(uploadbase)|" \
		-e "156s|href=\'|href=\'/$(uploadbase)|" \
	        $(uploaddir)/js/docs.js
	@sed -i -e "s|\"/samples/|\"/$(uploadbase)/samples/|g" $(uploaddir)/js/collections_tocs.js
	@sed -i -e "s|href='/|href='$(uploadbase)/|g" $(uploaddir)/js/menu.js
	@sed -i -e "s|\"url\":\"/|\"url\":\"/$(uploadbase)/|" $(uploaddir)/js/metadata.js
	@find $(uploaddir) -type f -name '*.html' -print | xargs \
	  sed -i -e "s|id=\"searchForm\" action=\"/search/\"|id=\"searchForm\" action=\"/$(uploadbase)/search/\"|g"
	@rm -fr $(uploaddir)/build
	@rm -f $(uploaddir)/conf.py
	@cp -p $(top_srcdir)/README.md $(uploaddir)

.PHONY: rewritelinks
rewritelinks:
	@echo Rewriting URL links...
	@find $(uploaddir) -type f -name "*.html" -print >_link.txt
	@while read line; do $(SHELL) $(top_srcdir)/bin/rewritelink.sh $$line; done < _link.txt
