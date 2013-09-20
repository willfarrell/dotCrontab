#!/bin/bash

echo "------------------------------"
echo "$ sh scripts/bower-update.sh"
echo "------------------------------"

ignore_dir="components"

while true ; do
    case "$1" in
        -d )
            dir=$2
            shift 2
        ;;
        --dir )
            dir=$2
            shift 2
        ;;
        -i )
            ignore_dir=$2
            shift 2
        ;;
        --ignore )
            ignore_dir=$2
            shift 2
        ;;
        *)
            break
        ;;
    esac 
done;

if [ -n "$dir" ]; then
    for f in $(find $dir -name 'bower.json'); do

        #if [[ "$f" == *"/$ignore_dir/"* ]]; then
        #    echo "SKIP $f contains /$ignore_dir/";
        #elif [[ "$f" == *"/node_modules/"* ]]; then
        #    echo "SKIP $f contains '/node_modules/'"
        #fi
        
        if [[ "$f" != *"/$ignore_dir/"* && "$f" != *"/node_modules/"* ]]; then
            echo $f;
            
            cd $(dirname $f);
            bower update;
            cd $dir;
        fi
    done
fi