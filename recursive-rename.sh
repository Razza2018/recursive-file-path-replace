#!/bin/bash

pattern="$1";
substitution="$2";

if [[ "$pattern" == *"|"* ]]
then
	echo "Warn: Converting | to \|.";
	pattern=`echo "$pattern" | sed 's/|/\\\|/g'`;
fi

if [ -z "$pattern" ]
then
	echo "Error: No pattern string found.";
	exit;
fi

find . -depth -iname "*$pattern*" -exec rename -d -v "s/$pattern/$substitution/g" "{}" \;
