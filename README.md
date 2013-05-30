# .crontab
Easy access to Mac OS X crontab. Great for automatically updating `brew` or `npm`.

## Setup
```bash
$ cd ~/ # go to where the dot files lie
$ mkdir .crontab && cd $_ # dir to store additional scripts
$ crontab -l > .crontab # export current crontab
$ echo "0 0 * * * crontab .crontab" >> .crontab # auto inject crontab changes”
$ crontab .crontab # save crontab changes
```

## Samples
```bash
0 0 * * * crontab .crontab # auto inject any crontab changes
0 0 * * * brew update 2>&1 | tee -a crontab.log # Update brew repos nightly
0 5 */7 * * echo <password> | sudo -S npm -g update 2>&1 | tee -a crontab.log # Update global npm repos weekly
0 0 7 * * curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash 2>&1 | tee -a crontab.log # Relpace ievms with fresh copies monthy
```
Please submit your commands to [issues](https://github.com/willfarrell/.crontab/issues).

## Reference
```
* * * * * command to be executed
- - - - -
| | | | | ----- Day of week (0 - 7) (Sunday=0 or 7)
| | | | ------- Month (1 - 12)
| | | --------- Day of month (1 - 31)
| | ----------- Hour (0 - 23)
| ------------- Minute (0 - 59)
```

