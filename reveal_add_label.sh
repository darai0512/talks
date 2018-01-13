#!/bin/bash
for f in `find . -type f -name 'index.html'`;
do
    egrep '<header.*社外秘' $f
    if [ $? -eq 0 ]; then
        continue
    fi
    /usr/bin/perl -p -i.bak -e 's@([\s]*<div class="reveal">)[\s\n]*@<header style="position: absolute; right: 10px; border: #af1f1f 1px solid; color: #af1f1f; background: #fff; font-weight: bold;"><div style="font-size: 14px;">社外秘</div></header>\n\1@' $f
    rm -f $f.bak
done
