#!/usr/bin/env bash

for img in `find ./base -name "*" | egrep "\.jpe?g$"`
do
    idout=`identify -verbose $img | grep -i interlace | grep -i none$`
    if [[ -z $idout ]]
    then
        echo "$img is progressive"
    else
        name=`basename "$img"`
        echo "$img is non-progressive. Converting to progressive..."
        convert "$img" -interlace Line "./results/convert/$name"
        jpegtran -optimize -progressive "$img" > "./results/jpegtran/$name"
    fi
done
