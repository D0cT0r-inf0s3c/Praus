#!/bin/bash

home=$HOME
mkdir /$home/temp
touch /$home/temp/umasks.txt

echo
echo -e "\e[1;95m-------------------------[umask audit in progress]-------------------------"

umasklogin=$(grep -cP '^UMASK\s+077$' /etc/login.defs)
if [ $umasklogin -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
echo -e "\e[39m[*] Checking if umask has been set for users\t\t\t\t\t\t$status" > /$home/temp/umasks.txt

umasklogin=$(grep -cP '^umask\s+077$' /root/.bashrc)
if [ $umasklogin -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo -e "\e[39m[*] Checking if umask has been set for root\t\t\t\t\t\t$status" >> > /$home/temp/umasks.txt


echo -e "\033[0m"
