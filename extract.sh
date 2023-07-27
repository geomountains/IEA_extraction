#!/bin/bash
for i in `cat list.txt`
do
 wget -v -nc --adjust-extension --user-agent="Mozilla" https://iea.uoregon.edu/treaty-text/"$i" 2>> log.txt
done

for i in $(ls *.html)
do
   lynx -dump $i > $i.txt
done

perl -ne 'push @lines,$_; print $lines[0] if /ERROR 404/; shift(@lines) if $.>4;' log.txt > texts_missing.txt
perl -ne 'push @lines,$_; print $lines[0] if /Unable to establish SSL connection/; shift(@lines) if $.>3;' log.txt > texts_missing2.txt