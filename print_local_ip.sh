#!/bin/bash
printf $(ifconfig | awk '/inet 192/ {print $2}')
printf "\\n"

