#!/bin/bash

if ! ls | egrep -q '^IMG_.*[.]JPG'
then
    echo 'No suitable photos'
    exit
fi

for old in *.JPG
do
    new="${PWD##*/}-${old#IMG_}"
    /bin/mv -vi -- "$old" "${new,,}"
done



