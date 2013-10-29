#!/bin/bash

echo "------------------------------"
echo $(date -u)
echo "$ sh scripts/npm-update.sh"
echo "------------------------------"

ignore_dir="components"

while true ; do
    case "$1" in
        -g )
            global=1
            shift 1
        ;;
        --global )
            global=1
            shift 1
        ;;
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
        -p )
            password=$2
            shift 2
        ;;
        --password )
            password=$2
            shift 2
        ;;
        *)
            break
        ;;
    esac 
done;

if [ -n "$global" ]; then
    if [ -n "$password" ]; then
        echo "$password" | sudo -S npm -g update;
    else
        npm -g update;
    fi
    npm cache clean
    npm -g update;
    echo "global";
fi

if [ -n "$dir" ]; then
    for f in $(find $dir -name 'package.json'); do

        #if [[ "$f" == *"/$ignore_dir/"* ]]; then
        #    echo "SKIP $f contains /$ignore_dir/";
        #elif [[ "$f" == *"/node_modules/"* ]]; then
        #    echo "SKIP $f contains '/node_modules/'"
        #fi
        
        if [[ "$f" != *"/$ignore_dir/"* && "$f" != *"/node_modules/"* ]]; then
            echo $f;
            
            cd $(dirname $f);
            npm update;
            cd $dir;
        fi
    done
fi