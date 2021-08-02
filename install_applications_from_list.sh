#!/bin/bash
# script function : install applications to a ubuntu-based 
#		    distribution from a formatted text file
# requirements : a formatted text file
# text file format : one application per line
# text file example :
# 	htop
#	python3
#	vim

# system specific variables
APPFILE="$HOME/system/applications.txt"

clear
echo "SCRIPT STARTED"
echo -e "\tAPPFILE=$APPFILE"

echo "ENSURING $APPFILE EXISTS"
if [ -f "$APPFILE" ];then
  echo -e "\t$APPFILE exists"
else
  echo -e "\t$APPFILE does not exist" && echo "exit program" && exit
fi

echo "READING $APPFILE"
APPLINES=$(cat $APPFILE)

echo "BUILDING COMMAND"
COMMAND="sudo apt-get install"
for APPLINE in "$APPLINES"
do
  COMMAND+=" $APPLINE"
done
echo -e "executing $COMMAND" | tr '\n' ' '
$COMMAND

