#!/bin/bash
################################################################################

# TABLE OF CONTENTS
#   - README
#   - function declaration
#   - example of a topic
#   - topic, array
#   - topic, string splitting

################################################################################

# README
# - the purpose of this script : to demonstrate
#    concise and clear examples of various common 
#    syntax patterns, organized by topic

################################################################################

# function declaration :
clear
announce() {
  local topic=${1:?must provide a topic argument}
  echo -e "\n"
  read -rn 1 -p "the next topic is $topic, press enter to continue"
}

################################################################################

# example of a topic :
#   1. declare topic=NAME
#   2. optional, delimit with runtime interaction via announce()
#   3. echo title, echo description
#   4. demonstrate syntax of title topic
topic="example"
announce $topic
echo "echo command example, an example of the echo command"
echo "the current directory is : $PWD"

################################################################################

# topic, array :
topic="array"
announce $topic
echo "array init, how to save an array to a variable"
echo "TODO"

################################################################################

# topic, string spltting :
topic="string splitting"
announce $topic
echo "string splitting using an internal field separator"
IFS=" "
string="this is a string"
echo "IFS=$IFS, string=$string"
read -ra split_string <<< $string
for element in "${split_string[@]}";do
  echo "next element is : $element"
done

################################################################################

