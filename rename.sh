#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "$0 {pinyin, trad, simp} <filename> "
  exit 1
fi

set -x
# Unpack it.
rm -rf files
unzip "${2}" -d files

# Do subsitutions.
for i in files/OEBPS/xhtml/*.xhtml; do
  ruby rename.rb $1 "$i";
done

# Stamp a new title
cd files
cat OEBPS/package.opf | sed -e "s/<\/dc:title>/ - $1<\/dc:title>/" > tmp
mv tmp OEBPS/package.opf

# Repack it
OUTFILE="../${2%.*} - $1.epub"
rm -f "$OUTFILE"
zip -X0 "$OUTFILE" mimetype
zip -Xr "$OUTFILE" META-INF OEBPS

# cleanup
cd ..
rm -rf files
