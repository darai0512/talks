#!/usr/bin/env bash
if [ "x$1" = "x" ]; then
  echo 'Usage: ./reveal_add_label.sh <dir name>';
  exit 1;
fi

f=`pwd`/$1/index.html;
ls $f;
if [ $? -ne 0 ]; then
  exit 1;
fi
egrep '<header.*社外秘' $f
if [ $? -eq 0 ]; then
  exit 0;
fi
/usr/bin/perl -p -i.bak -e 's@([\s]*<div class="reveal">)[\s\n]*@<header style="position: absolute; right: 10px; border: #af1f1f 1px solid; color: #af1f1f; background: #fff; font-weight: bold;"><div style="font-size: 14px;">社外秘</div></header>\n\1@' $f
rm -f $f.bak
