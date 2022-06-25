#!/bin/sh
if [ -z "$1" ]; then
	echo "Usage: $0 filename"
	exit 1
fi

echo ""
echo "| 更改日期 | 更改信息 |"
echo "| --- | --- |"
#git log --no-merges --format="| %ad | #a1# %s #a2# %H #a3# |" --date=short $1 | sed -e '/IGNORE_CHANGELOG/d' -e '/TODO/d' -e 's/#a1# /[/g' -e 's/ #a2# /](https:\/\/github.com\/DonAnthonyLee\/DonAnthonyLee.github.io\/commit\//g' -e 's/ #a3#/)/g' -

git log --no-merges --format="| %ad | #a1# %H #a2# %s #a3# |" --date=short $1 | sed -e '/IGNORE_CHANGELOG/d' -e '/TODO/d' -e 's/#a1# /<a href=\"https:\/\/github.com\/DonAnthonyLee\/DonAnthonyLee.github.io\/commit\//g' -e 's/ #a2# /\" target=\"_blank\">/g' -e 's/ #a3#/<\/a>/g' -

exit 0

