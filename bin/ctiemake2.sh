#!/bin/sh

# Yamlファイルに依存関係がある場合の Makefile.sub 生成

# The first arg:		$1		abs_publishdir
# The second arg:		$2		directory where the merge files will be created in
# The second and later args:	${@:3:($#-2)}	target filename list

abs_publishdir=$1
dirname=$2
list=${@:3:($#-2)}

rm -f Makefile.sub
echo "# Makefile.sub partII">Makefile.sub

for f in $list; do
    ext=`echo $f | sed 's/^.*\.\([^\.]*\)$/\1/'`
    base=`echo $f | sed "s/\.[^\.]*$//"`
    if test "x${ext}" = "xmd"; then
      change="ch"
    else
      change="${ext}ch"
    fi
    if test -f $abs_publishdir/_data/engine-cli/docker_$base.yaml; then
      echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/engine-cli/docker_$base.yaml">>Makefile.sub
    else
      if test -f $abs_publishdir/_data/compose-cli/docker_$base.yaml; then
        echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/compose-cli/docker_$base.yaml">>Makefile.sub
      else
        if test -f $abs_publishdir/_data/application-template/docker_$base.yaml; then
          echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/application-template/docker_$base.yaml">>Makefile.sub
        else
          if test -f $abs_publishdir/_data/assemble/docker_$base.yaml; then
            echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/assemble/docker_$base.yaml">>Makefile.sub
          else
            if test -f $abs_publishdir/_data/buildx/docker_$base.yaml; then
              echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/buildx/docker_$base.yaml">>Makefile.sub
            else
              if test -f $abs_publishdir/_data/cluster/docker_$base.yaml; then
                echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/cluster/docker_$base.yaml">>Makefile.sub
              else
                if test -f $abs_publishdir/_data/docker-app/docker_$base.yaml; then
                  echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/docker-app/docker_$base.yaml">>Makefile.sub
                else
                  if test -f $abs_publishdir/_data/registry-cli/docker_$base.yaml; then
                    echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/_data/registry-cli/docker_$base.yaml">>Makefile.sub
                  else
                    if test -f $abs_publishdir/docker-hub/api/$base.yaml; then
                      echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/docker-hub/api/$base.yaml">>Makefile.sub
                    else
                      if test -f $abs_publishdir/engine/api/$base.yaml; then
                        echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change \$(abs_publishdir)/engine/api/$base.yaml">>Makefile.sub
                      else
                        echo "$dirname/$f: \$(origdir)/$f \$(srcdir)/$base.$change">>Makefile.sub
                      fi
                    fi
                  fi
                fi
              fi
            fi
          fi
        fi
      fi
    fi
    echo "	@echo Processing \$@...">>Makefile.sub
    echo "	@\$(top_builddir)/\$(CTIE) -m \$@ \$(origdir)/$f \$(srcdir)/$base.$change >/dev/null">>Makefile.sub
# fi
done
