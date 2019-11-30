#!/usr/bin/env bash

for img in `find ./base -name "*" | egrep "\.jpe?g$"`
do
    name=`basename "$img"`
    echo "$img is non-progressive. Converting to progressive and minifying..."
    convert "$img" -interlace Line -resize 10% "./results/thumbs/$name"
done

