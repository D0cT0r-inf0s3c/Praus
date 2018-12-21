#!/bin/bash

home=$HOME
mkdir /$home/temp
touch /$home/temp/files.txt

echo  "\e[1;95m-------------------------[system files audit in progress]-------------------------"

fileowner=$(ls -l /etc/passwd| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo "\e[39m[*] Checking /etc/passwd owner\t\t\t\t\t\t\t\t$status" > /$home/temp/files.txt

filegroup=$(ls -l /etc/passwd| awk '{ print $4 }'|grep -c root)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo "\e[39m[*] Checking /etc/passwd group\t\t\t\t\t\t\t\t$status" >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/passwd|grep -c 644)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/passwd file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileowner=$(ls -l /etc/shadow| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo "\e[39m[*] Checking /etc/shadow owner\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

filegroup=$(ls -l /etc/shadow| awk '{ print $4 }'|grep -c shadow)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo "\e[39m[*] Checking /etc/shadow group\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/shadow|grep -c 640)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/shadow file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileowner=$(ls -l /etc/group| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo -e "\e[39m[*] Checking /etc/group owner\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

filegroup=$(ls -l /etc/group| awk '{ print $4 }'|grep -c root)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo "\e[39m[*] Checking /etc/group group\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/group|grep -c 644)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/group file permissions\t\t\t\t\t\t$status" >> /$home/temp/files.txt

fileowner=$(ls -l /etc/gshadow| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo "\e[39m[*] Checking /etc/gshadow owner\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

filegroup=$(ls -l /etc/gshadow| awk '{ print $4 }'|grep -c shadow)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/gshadow group\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/gshadow|grep -c 640)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/gshadow file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

if [ -f /etc/opasswd ]; then

    fileowner=$(ls -l /etc/opasswd| awk '{ print $3 }'|grep -c root)
    if [ $fileowner -eq 0 ];
    then
      status="\e[91m[ BAD ]"
      #exit
    else
      status="\e[92m[ GOOD ]"
    fi
    sleep 2
    echo  "\e[39m[*] Checking /etc/opasswd owner\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

    filegroup=$(ls -l /etc/opasswd| awk '{ print $4 }'|grep -c root)
    if [ $filegroup -eq 0 ];
    then
      status="\e[91m[ BAD ]"
      #exit
    else
      status="\e[92m[ GOOD ]"
    fi
    sleep 2
    echo  "\e[39m[*] Checking /etc/opasswd group\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

    fileperms=$(stat --format '%a' /etc/opasswd|grep -c 600)
    if [ $fileperms -eq 0 ];
    then
      status="\e[91m[ BAD ]"
      #exit
    else
      status="\e[92m[ GOOD ]"
    fi
    sleep 2
    echo  "\e[39m[*] Checking /etc/opasswd file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt
else
    status="\e[91m[ BAD ]"
    echo  "\e[39m[*] Checking if /etc/opasswd exists\t\t\t\t\t\t\t$status"
fi

fileowner=$(ls -l /etc/passwd-| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/passwd- owner\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

filegroup=$(ls -l /etc/passwd-| awk '{ print $4 }'|grep -c root)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/passwd- group\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/passwd-|grep -c 600)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/passwd- file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileowner=$(ls -l /etc/shadow-| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/shadow- owner\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

filegroup=$(ls -l /etc/shadow-| awk '{ print $4 }'|grep -c root)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/shadow- group\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/shadow-|grep -c 600)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/shadow- file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileowner=$(ls -l /etc/group-| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/group- owner\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

filegroup=$(ls -l /etc/group-| awk '{ print $4 }'|grep -c root)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/group- group\t\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/group-|grep -c 600)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
v
echo  "\e[39m[*] Checking /etc/group- file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileowner=$(ls -l /etc/gshadow-| awk '{ print $3 }'|grep -c root)
if [ $fileowner -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/gshadow- owner\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

filegroup=$(ls -l /etc/gshadow-| awk '{ print $4 }'|grep -c root)
if [ $filegroup -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/gshadow- group\t\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

fileperms=$(stat --format '%a' /etc/gshadow-|grep -c 600)
if [ $fileperms -eq 0 ];
then
  status="\e[91m[ BAD ]"
  #exit
else
  status="\e[92m[ GOOD ]"
fi
sleep 2
echo  "\e[39m[*] Checking /etc/gshadow- file permissions\t\t\t\t\t\t$status"  >> /$home/temp/files.txt

echo  "\033[0m"
