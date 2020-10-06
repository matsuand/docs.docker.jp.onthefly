#!/bin/sh

# The first arg:		$1		makefile name
# The second arg:		$2		from directory
# The third arg:		$3		to directory
# The fourth and later args:	${@:4:($#-3)}	target copy dir list

name=$1
fromdir=$2
todir=$3
list=${@:4:($#-3)}

rm -f $name.sub
#if test ! -f $name.sub; then
  echo "# $name.sub">$name.sub
#fi

for d in $list; do
# maketgt=`echo ${todir}/$d | sed "s|^\./||"`
# target=`grep "^${maketgt}:" $name.sub`
# if test "x${target}"="x"; then
    files=`(cd ${fromdir}/$d && ls | tr '\n' ' ')`
    echo -e "\nfiles_${name}_$d=${files}" >> $name.sub
    maketgt0=`basename ${todir}/$d | sed "s|^\./||"`
    maketgt=`echo ${todir}/$d | sed "s|^\./||"`
    echo -e "\n.PHONY: ${name}_$d" >> $name.sub
    echo "${name}_$d: \$(addprefix ${maketgt}/,\${files_${name}_$d})" >> $name.sub
    for f in $files; do
      echo "${maketgt}/$f: ${fromdir}/$d/$f" >> $name.sub
      echo "	@mkdir -p \$(@D)" >> $name.sub
      echo "	@cp -p \$^ \$@" >> $name.sub
    done
# fi
done
