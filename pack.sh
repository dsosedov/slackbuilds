#!/bin/sh
mkdir -p packages
if [ -z $1 ]
then
    echo "Missing package"
else
    tar cvzf packages/$1.tar.gz $1/
fi
