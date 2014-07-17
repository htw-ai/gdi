#!/usr/bin/bash
# 1.1
mkdir gdi-u5
mv files.zip gdi-u5
unzip files.zip
zip files2 gdi-u5_kompr_tabelle.odt gdi-u5_kompr_tabelle.pdf search.txt
tar cfvz file3.tar.gz gdi-u5_kompr_tabelle.odt gdi-u5_kompr_tabelle.pdf
search.txt
tar cfvj file4.tar.bz2 gdi-u5_kompr_tabelle.odt gdi-u5_kompr_tabelle.pdf
search.txt
zip test gdi-u5_kompr_tabelle.odt
gzip --best gdi-u5_kompr_tabelle.odt
unzip files.zip
n
n
bzip2 --best gdi-u5_kompr_tabelle.odt
ls -l | awk '{print $9 "  " $5}'
# gzip has the best compression rate
# 1.2
cd ..
mkdir zipIn
tar cvf ./zipIn/here.tar gdi-u5/
#1.3
tar cvzf ./zipIn/here.tar.gz gdi-u5/
cd zipIn
ls -l | awk '{print $9 "  " $5}'
# die frage eruebrigt sich, da tar dafuer da ist um Dateien sequenziell in eine
einzige Datei zu schreiben und nicht zu kompremieren.
# dementsprechen ist das gepackte Verzeichnis(tar) groesser als das Gepackte und
Kompremierte(tar.gz)
#1.4
# 7-zip
#2.1
cd $HOME/gdi-u5
egrep '^#' search.txt
#2.2
egrep '1?[0-9]|2[0-3])(:[0-5][0-9](:[0-5][0-9])?)?' search.txt
#2.3
egrep '\(.{1,}\)' search.txt
#2.4
egrep '[\w]{10,}' search.txt
#2.5
egrep '\b[01]{1,}\b' search.txt
#2.6
egrep '\b([0-9]|[A-Z])+\b' search.txt
#2.7
grep '\b(\w+)\s+\1\b' search.txt
#2.8
egrep '(0[1-9]|[12][0-9]|3[01])\.(0[1-9]|1[012])\.(\d{4}|\d\d)' search.txt
