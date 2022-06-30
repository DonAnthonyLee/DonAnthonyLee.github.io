#!/bin/sh
if [ -z "$1" ]; then
	echo "Usage: $0 filename"
	exit 1
fi

printf "Checking $1 ... "
grep "{:.changelog}" $1 > /dev/null 2>&1
if [ "x$?" != "x0" ]; then
	printf "[NO NEED]\n"
	exit 0
fi

sed -i '/{:.changelog}/,$d' $1
if [ "x$?" != "x0" ]; then
	printf "\e[31m[FAILED]\e[0m\n"
	exit 1
fi

echo "{:.changelog}" >> $1
echo "" >> $1
echo "| 更改日期 | 更改信息 |" >> $1
echo "| --- | --- |" >> $1
git log --no-merges --format="| %ad | #a1# %H #a2# %s #a3# |" --date=short $1 | sed -e '/IGNORE_CHANGELOG/d' -e '/TODO/d' -e 's/#a1# /<a href=\"https:\/\/github.com\/DonAnthonyLee\/DonAnthonyLee.github.io\/commit\//g' -e 's/ #a2# /\" target=\"_blank\">/g' -e 's/ #a3#/<\/a>/g' - >> $1
printf "\e[32m[OK]\e[0m\n"

exit 0

