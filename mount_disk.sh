#!/bin/bash
clear
printf "FSTAB\\n"
printf "$(cat /etc/fstab)\\n"

printf "LSBLK\\n"
lsblk -f
