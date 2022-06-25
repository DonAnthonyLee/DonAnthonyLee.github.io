#!/bin/sh
#
# Run command below to prevent jekyll to convert two hyphen to an en dash automatically.
#
#	find ./ -name "*.md" -exec ./replace-double-dash.sh {} \; 
#


if [ -z "$1" ]; then
	echo "Usage: $0 file"
	exit 1
fi

printf "Handling $1 ... "

HANDLE_FIRST=0
HANDLE_MIDDLE=0

grep '^--[\,;,.,a-z,A-Z]' $1 > /dev/null 2>&1
if [ "x$?" = "x0" ]; then
	HANDLE_FIRST=1
fi

grep '[ ,ⁿ,ᴺ,nbsp;,a-z,A-Z]--[\,;,.,a-z,A-Z]' $1 > /dev/null 2>&1
if [ "x$?" = "x0" ]; then
	HANDLE_MIDDLE=1
fi

if [ "x${HANDLE_FIRST}" != "x1" -a "x${HANDLE_MIDDLE}" != "x1" ]; then
	printf "[NO NEED]\n"
else
	if [ "x${HANDLE_FIRST}" = "x1" ]; then
		sed -i -r 's/^--([\,;,.,a-z,A-Z])/\&#x002D;\&#x002D;\1/g' $1
		if [ "x$?" != "x0" ]; then
			printf "\e[31m[FAILED]\e[0m\n"
			exit 1
		fi
	fi

	if [ "x${HANDLE_MIDDLE}" = "x1" ]; then
		sed -i -r 's/([ ,ⁿ,ᴺ,nbsp;,a-z,A-Z])--([\,;,.,a-z,A-Z])/\1\&#x002D;\&#x002D;\2/g' $1
		if [ "x$?" != "x0" ]; then
			printf "\e[31m[FAILED]\e[0m\n"
			exit 1
		fi
	fi
	printf "\e[32m[OK]\e[0m\n"
fi

exit 0

