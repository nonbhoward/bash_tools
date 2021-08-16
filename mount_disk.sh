#!/bin/bash
clear
printf "FSTAB FILE\\n"
printf "$(cat /etc/fstab)\\n"

printf "FDISK INFO\\n"
sudo fdisk -l
