#!/bin/sh

#
###################################################################
#remote scan
#
# Normal color names
    CYAN='\033[0;36m'
    BLUE='\033[0;34m'
    BROWN='\033[0;33m'
    DARKGRAY='\033[0;30m'
    GRAY='\033[0;37m'
    GREEN='\033[1;32m'
    LIGHTBLUE='\033[0;94m'
    MAGENTA='\033[1;35m'
    PURPLE='\033[0;35m'
    RED='\033[1;31m'
    YELLOW='\033[1;33m'
    WHITE='\033[1;37m'
    NC='\033[0m'

    # Enable screen output again
    QUIET=0

    SCP_BINARY=$(which scp 2> /dev/null | grep -v "no [^ ]* in ")
    SSH_BINARY=$(which ssh 2> /dev/null | grep -v "no [^ ]* in ")
    if [ "${SCP_BINARY}" = "" ]; then echo "Could not find scp binary"; ExitFatal; fi
    if [ "${SSH_BINARY}" = "" ]; then echo "Could not find ssh binary"; ExitFatal; fi

    echo "${YELLOW}                 Enter The IP of the Remote Target Host${NC}"
    echo -n "${WHITE}                         REMOTE_TARGET${NC}:"
    read REMOTE_TARGET
    Tar_file="plaus-remote.tar.gz"
    echo "\e[1;95m-------------------------[Extraction of Praus Tar file in progress]-------------------------${NC}"
    sleep 2
    mkdir -p ./files && cd .. && tar czf ./plaus/files/${Tar_file} --exclude=files/${Tar_file} ./plaus && cd plaus
    echo "\e[1;95m-------------------[Copy Praus Tar files to target:${REMOTE_TARGET}]-------------------------${NC}"
    sleep 2
    Tar_file="./files/plaus-remote.tar.gz"
    scp -q ${Tar_file} ${REMOTE_TARGET}:~/tmp-plaus-remote.tgz
    #if [ $? -gt 0 ]; then echo "Could not copy tarball to target"; ExitFatal; fi
    echo "\e[1;95m-------------------[Execution of the audit command in progress]-------------------------------${NC}"
    sleep 2
    ssh ${REMOTE_TARGET} \"mkdir -p ~/tmp-plaus && cd ~/tmp-plaus && tar xzf ../tmp-plaus-remote.tgz && rm ../tmp-plaus-remote.tgz && cd plaus && ${REMOTE_COMMAND}\"
    #if [ $? -gt 1 ]; then echo "Could not perform remote audit"; ExitFatal; fi
    echo "\e[1;95m-------------------[Cleaning up of directory on ${REMOTE_TARGET} in progress]-----------------${NC}"
    sleep 2
    ssh ${REMOTE_TARGET} \"rm -rf ~/tmp-plaus\"
    echo "\e[1;95m-------------------[Retriving of log and report]-----------------------------------------------${NC}"
    sleep 2
    scp -q ${REMOTE_TARGET}:/tmp/plaus.log ./files/${REMOTE_TARGET}-plaus.log
    scp -q ${REMOTE_TARGET}:/tmp/plaus-report.dat ./files/${REMOTE_TARGET}-plaus-report.dat
    echo "\e[1;95m-------------------[Clean up tmp files (when using non-privileged account)]--------------------${NC}"
    sleep 2
    ssh ${REMOTE_TARGET} \"rm /tmp/plaus.log /tmp/plaus-report.dat\"

    QUIET=1

# The End
