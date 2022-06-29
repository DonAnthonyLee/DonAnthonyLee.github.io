#!/bin/sh
#
# Run command below to prevent jekyll to convert double hyphen into an em dash automatically.
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
HANDLE_MIDDLE_NORMAL=0
HANDLE_MIDDLE_2BYTES=0
HANDLE_MIDDLE_3BYTES=0

grep '^--[\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2]' $1 > /dev/null 2>&1
if [ "x$?" = "x0" ]; then
	HANDLE_FIRST=1
fi

# normal prefix
grep '[ ,\&nbsp;,a-z,A-Z]--[\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2]' $1 > /dev/null 2>&1
if [ "x$?" = "x0" ]; then
	HANDLE_MIDDLE=1
	HANDLE_MIDDLE_NORMAL=1
fi

# 2 bytes UTF-8 prefix
# NOTE: bad way for "grep"
grep '[\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD]*--[\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2]' $1 > /dev/null 2>&1
if [ "x$?" = "x0" ]; then
	HANDLE_MIDDLE=1
	HANDLE_MIDDLE_2BYTES=1
fi

# 3 bytes UTF-8 prefix
# NOTE: bad way for "grep"
grep '[\xE1,\xE2]*--[\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2]' $1 > /dev/null 2>&1
if [ "x$?" = "x0" ]; then
	HANDLE_MIDDLE=1
	HANDLE_MIDDLE_3BYTES=1
fi

if [ "x${HANDLE_FIRST}" != "x1" -a "x${HANDLE_MIDDLE}" != "x1" ]; then
	printf "[NO NEED]\n"
else
	if [ "x${HANDLE_FIRST}" = "x1" ]; then
		sed -i -r 's/^--([\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2])/\&#x002D;\&#x002D;\1/g' $1
		if [ "x$?" != "x0" ]; then
			printf "\e[31m[FAILED]\e[0m\n"
			exit 1
		fi
	fi

	if [ "x${HANDLE_MIDDLE_NORMAL}" = "x1" ]; then
		sed -i -r 's/([ ,\&nbsp;,a-z,A-Z])--([\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2])/\1\&#x002D;\&#x002D;\2/g' $1
		if [ "x$?" != "x0" ]; then
			printf "\e[31m[FAILED]\e[0m\n"
			exit 1
		fi
	fi

	if [ "x${HANDLE_MIDDLE_2BYTES}" = "x1" ]; then
		sed -i -r 's/([\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD]?)--([\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2])/\1\&#x002D;\&#x002D;\2/g' $1
		if [ "x$?" != "x0" ]; then
			printf "\e[31m[FAILED]\e[0m\n"
			exit 1
		fi
	fi

	if [ "x${HANDLE_MIDDLE_3BYTES}" = "x1" ]; then
		sed -i -r 's/([\xE1,\xE2]??)--([\,;,.,a-z,A-Z,\xC2,\xC3,\xC4,\xC5,\xC7,\xC8,\xC9,\xCC,\xCD,\xE1,\xE2])/\1\&#x002D;\&#x002D;\2/g' $1
		if [ "x$?" != "x0" ]; then
			printf "\e[31m[FAILED]\e[0m\n"
			exit 1
		fi
	fi

	# NOTE: BAD, BAD, BAD!!!
	sed -i -e 's/<\!\&#x002D;\&#x002D;/<\!--/g' $1

	printf "\e[32m[OK]\e[0m\n"
fi

exit 0

