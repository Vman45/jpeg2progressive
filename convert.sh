#!/usr/bin/env bash

for img in `find . -name "*" | egrep "\.jpe?g$"`
do
    echo "$img"
    name=`echo "$img" | egrep "[0-9]+\.jpe?g$" | egrep -o '[0-9]+'`
    echo "$name"
    idout=`identify -verbose $img | grep -i interlace | grep -i none$`

    if [[ -z $idout ]]
    then
        echo "$img is progressive"
    #echo "....making copy of original with .prog extension"
    #/bin/cp -f $img $img.prog
    #echo "....converting to baseline"
    #convert $img -interlace none $img 
    #echo "....done!"
    else
        echo "$img is non-progressive"
        echo "... converting to progressive"
        # convert "$img" -interlace Line "./results/convert/$img"
    fi
done
