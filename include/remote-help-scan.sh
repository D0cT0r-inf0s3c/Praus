#!/bin/sh

#
######################################################################
#
# Helper program to perform a remote scan
#
######################################################################
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

    Tar_file="praus-remote.tar.gz"
    echo ""
    echo  "  ${BLUE}*${NC}${WHITE}Step 1${NC}: ${CYAN}Create tarball${NC}"
    printf "%s\n\n" "    mkdir -p ./files && cd .. && tar czf ./praus/files/${Tar_file} --exclude=files/${Tar_file} ./praus && cd praus"

    echo "  ${BLUE}* ${WHITE}Step 2${NC}: ${CYAN}Copy tarball to target ${REMOTE_TARGET}${NC}"
    Tar_file="./files/praus-remote.tar.gz"
    printf "%s\n\n" "    scp -q ${Tar_file} ${REMOTE_TARGET}:~/tmp-praus-remote.tgz"
    #if [ $? -gt 0 ]; then echo "Could not copy tarball to target"; ExitFatal; fi

    echo "  ${BLUE}* ${WHITE}Step 3${NC}: ${CYAN}Execute audit command${NC}"

    printf "%s\n\n" "    ssh ${REMOTE_TARGET} \"mkdir -p ~/tmp-praus && cd ~/tmp-praus && tar xzf ../tmp-praus-remote.tgz && rm ../tmp-praus-remote.tgz && cd praus && ${REMOTE_COMMAND}\""
    #if [ $? -gt 1 ]; then echo "Could not perform remote audit"; ExitFatal; fi

    echo "  ${BLUE}* ${WHITE}Step 4${NC}: ${CYAN}Clean up directory${NC}"
    printf "%s\n\n" "    ssh ${REMOTE_TARGET} \"rm -rf ~/tmp-praus\""

    echo "  ${BLUE}* ${WHITE}Step 5${NC}: ${CYAN}Retrieve log and report${NC}"
    printf "%s\n" "    scp -q ${REMOTE_TARGET}:/tmp/praus.log ./files/${REMOTE_TARGET}-praus.log"
    printf "%s\n\n" "    scp -q ${REMOTE_TARGET}:/tmp/praus-report.dat ./files/${REMOTE_TARGET}-praus-report.dat"

    echo "  ${BLUE}* ${WHITE}Step 6${NC}: ${CYAN}Clean up tmp files (when using non-privileged account)${NC}"
    printf "%s\n\n" "    ssh ${REMOTE_TARGET} \"rm /tmp/praus.log /tmp/praus-report.dat\""

    QUIET=1

# The End
