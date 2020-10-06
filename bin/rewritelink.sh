#!/bin/sh

ogurl1=`grep "^<meta property=\"og:url\"" $1 2>/dev/null`
if test -z "${ogurl1}"; then
  exit 0
fi

ogurl2=`echo ${ogurl1} | sed -e "s|^<meta property=\"og\:url\" content=\"\(.*\)\" />|\1|"`
if test -z "${ogurl2}"; then
  exit 0
fi

sed -i -e "s|a href\=\"#|a href\=\"$ogurl2#|g" $1 || exit 0
