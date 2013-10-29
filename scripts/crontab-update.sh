#!/bin/bash

echo "------------------------------"
echo $(date -u)
echo "$ sh scripts/crontab-update.sh"
echo "------------------------------"

crontab ~/.crontab/.crontab

echo "Done!"