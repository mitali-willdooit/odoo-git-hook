#!/bin/sh
#
# An example hook script to check the commit log message.
# Called by "git commit" with one argument, the name of the file
# that has the commit message.  The hook should exit with non-zero
# status after issuing an appropriate message if it wants to stop the
# commit.
#
# This file check that commit message is written as per the Guidelines or not.

MSG_FILE=$1
FileContent="$(cat $MSG_FILE)"

oldIFS="$IFS"
IFS=$'\n'
IFS=${IFS:0:1} # this is useful to format your code with tabs
lines=( $FileContent )
IFS="$oldIFS"
count=0

for line in "${lines[@]}"
    do
        let count++
        dislen="${#line}"
        if [[ $count == 1 ]]; then
            export REGEX="^[+['FIX','REF','ADD','REM','REV','MOV','REL','IMP','MERGE','CLA','I18N']+]+[[:space:]]+[a-z0-9, _()*]+[(?<=[a-z0-9, _()*):]+[[:space:]]+[^A-Z]+$"
            if ! [[ "$line" =~ $REGEX ]]; then
                echo "Wrong title description.....Follow the Guidelines:https://www.odoo.com/documentation/12.0/reference/guidelines.html#git"
                exit 1
            fi
        fi
        if ! [[ "$dislen" -le 80 ]]; then
            echo "Allow maximum 80 characters only...."
            exit 1
        fi
        dislen=0
done
exit 0
