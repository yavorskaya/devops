#!/bin/bash

DIR=$1
ALGO=$2
OUT=$3 #works if outputfile has an ending .tar/.tar.gz/tar.bz2/tar.lzma

# .log file is created in the current directory
touch -c error.log

if [ "$ALGO" = none ]
then
	tar -cvf $OUT $DIR 2>> error.log 1> /dev/null

elif [ "$ALGO" = gzip ]
then
	tar -zcvf $OUT $DIR 2>> error.log 1> /dev/null

elif [ "$ALGO" = bzip2 ]
then
	tar -jcvf $OUT $DIR 2>> error.log 1> /dev/null

elif [ "$ALGO" = xz ]
then
	tar -Jcvf $OUT $DIR 2>> error.log 1> /dev/null

elif [ "$ALGO" = lzma ]
then
	tar -cavvf $OUT $DIR 2>> error.log 1> /dev/null
fi

openssl aes-256-cbc -in $OUT -out $OUT.des 2>> error.log 1> /dev/null


