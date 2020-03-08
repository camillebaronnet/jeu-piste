#!/bin/bash

### Script to validate sponsors
STEP="STEP 2 : MY SPONSORS"

TEAM_FILE="my_team.txt"
EMAIL=`grep -i mail $TEAM_FILE | cut -d '=' -f 2`
TEAM_NAME=`grep -i name $TEAM_FILE | cut -d '=' -f 2`
MOTTO=`grep -i motto $TEAM_FILE | cut -d '=' -f 2`

SPONSORS_FOLDER="My_Sponsors"

echo -e "\e[92mYou have chosen these sponsors :\e[0m"
for SPONSOR in `ls -1 $SPONSORS_FOLDER/*.sponsor | cut -d '/' -f 2`
do
    echo `echo $SPONSOR | cut -d "." -f 1` ": " `cat $SPONSORS_FOLDER/$SPONSOR`
    TOTAL_BUDGET=$(($TOTAL_BUDGET + `cat $SPONSORS_FOLDER/$SPONSOR`))
    NB_SPONSORS=$(($NB_SPONSORS + 1))
done

if [[ $NB_SPONSORS -le 0 || $NB_SPONSORS -gt 20 ]]
then
    if [[ $NB_SPONSORS -le 0 ]]
    then
	echo -e "\n\e[31mFAIL\e[0m : No sponsor found, you have to choose from 1 to 3 sponsors !"
    else
	echo -e "\n\e[31mFAIL\e[0m : Invalid number of sponsors, you have to choose from 1 to 3 sponsors!"
    fi
else
    echo -e "\n\e[92mSUCCESS\e[0m : Your total budget is ""$TOTAL_BUDGET"
fi
