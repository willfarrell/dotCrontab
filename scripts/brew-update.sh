#!/bin/bash

echo "------------------------------"
echo $(date -u)
echo "$ sh scripts/brew-update.sh"
echo "------------------------------"

/usr/local/bin/brew update
/usr/local/bin/brew doctor

echo "Done!"