#!/bin/bash

echo "------------------------------"
echo $(date -u)
echo "$ sh scripts/mac-clean.sh"
echo "------------------------------"

# Clean up duplicates in 'Open with ...'
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user

echo "Done!"