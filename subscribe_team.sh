#!/bin/bash

### Script to validate team
TEAM_FILE="my_team.txt"
STEP="STEP 1 : MY TEAM"

EMAIL=`grep -i email $TEAM_FILE | cut -d '=' -f 2`
TEAM_NAME=`grep -i name $TEAM_FILE | cut -d '=' -f 2`
MOTTO=`grep -i motto $TEAM_FILE | cut -d '=' -f 2`

echo $EMAIL
echo $TEAM_NAME
echo $MOTTO

if [[ $EMAIL = "" || $TEAM_NAME = "" || $MOTTO = "" ]]
then
    echo -e "\e[31mFAIL\e[0m : Your file is not valid"
else
    echo -e "\e[92mSUCCESS\e[0m : Your file is ok, your team is now registered"
fi
