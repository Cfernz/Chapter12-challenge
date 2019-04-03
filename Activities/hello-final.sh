#!/bin/bash
#hello.sh

#set -e
#set -u

name=$1
month=$2
date=$3

if [ "$#" -lt 3 ]
then
	echo "error: too few arguments, you provided $#, 3 required."
	echo "usage: hello.sh name month date"
	exit 1
else
	echo "Hello, $name, it is $month $date."
fi
