#!/bin/sh
#
# Script to detect UNIX/Linux OS and varios aspects of the
# OS. Especially for Linux: distribution type and derivarite (such as
# CentOS/RHEL or Debian/Ubuntu)
# Example
# OS=Linux
# MACH=x86_64
# KERNEL=2.6.32-5-amd64
# DISTRIBUTION=debian
# FAMILY=debian
# DERIVATIVE=Debian
# RELEASE=6.0.6
# CODENAME=squeeze
#

PATH=/bin:/sbin:/usr/bin:/usr/sbin

####################################################################
# Functions
# Main function that call all others
#
BLUE='\033[1;34m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
detect_os () {

    OS=`uname -s`
    MACH=`uname -m`

    echo OS=${BLUE}$OS${NC}
    sleep 2
    echo MACH=${BLUE}$MACH${NC}
    sleep 2
    if [ "${OS}" = "SunOS" ] ; then
	    echo ARCH=${BLUE}`uname -p`
      sleep 2
	    OSSTR="${OS} ${REV}(${ARCH} `uname -v`)"
        echo FAMILY=${BLUE}solaris${NC}
        sleep 2
    elif [ "${OS}" = "AIX" ] ; then
	    echo OSSTR="${OS} `oslevel` (`oslevel -r`)"
      sleep 2
        echo FAMILY=${BLUE}aix${NC}
        sleep 2
    elif [ "${OS}" = "Darwin" ] ; then
        echo REV=`uname -r`
        sleep 2
        echo FAMILY=${BLUE}macosx${NC}
        sleep 2
    elif [ "${OS}" = "Linux" ] ; then
	    echo KERNEL=${BLUE}"`uname -r`"${NC}
      sleep 2
        linux_distro
    fi
}



## ------------------------------------------------------------
# Redhat derivatives distros
#
redhat_derivative () {

    local FILE=/etc/redhat-release

    grep -i 'red.*hat.*enterprise.*linux' $FILE 2>&1 > /dev/null && { echo  DERIVATIVE=rhel; return; }
    grep -i 'red.*hat.*linux' $FILE 2>&1 > /dev/null && { echo DERIVATIVE=rh; return; }
    grep -i 'cern.*e.*linux' $FILE 2>&1 > /dev/null && { echo DERIVATIVE=cel; return; }
    grep -i 'scientific linux cern' $FILE 2>&1 > /dev/null && { echo DERIVATIVE=slc; return; }
    grep -i 'centos' $FILE 2>&1 > /dev/null && { echo DERIVATIVE=centos; return; }

    echo DERIVATIVE=${BLUE}unknown${NC}
    sleep 2
}


redhat_release () {
    echo RELEASE=${BLUE}`tr -d 'a-zA-Z [](){}' < /etc/redhat-release`${NC}
    sleep 2
}

## ------------------------------------------------------------
# Debian derivatives
#
debian_derivative () {
    if which lsb_release 2>&1 > /dev/null ; then
        echo DERIVATIVE=${BLUE}`lsb_release --id --short 2> /dev/null`${NC}
        sleep 2
        echo RELEASE=${BLUE}`lsb_release --release --short 2> /dev/null`${NC}
        sleep 2
        echo CODENAME=${BLUE}`lsb_release --codename --short 2> /dev/null`${NC}
        sleep 2
        return
    else
        echo DERIVATIVE=${BLUE}unknown${NC}
        sleep 2
        echo RELEASE=${BLUE}`cat /etc/debian_version`${NC}
        sleep 2
        echo CODENAME=${BLUE}unknown${NC}
        sleep 2
        return
    fi
}

##
#
#
linux_distro () {

	if [ -f /etc/redhat-release ] ; then
		echo DISTRIBUTION=redhat
    sleep 2
        echo FAMILY=${BLUE}rh${NC}
        sleep 2
        redhat_derivative
        redhat_release
    elif [ -s /etc/slackware-version ]; then
        echo DISTRIBUTION="slackware"
	elif [ -f /etc/SUSE-release ] ; then
        # TODO - not tested
        echo DISTRIBUTION=${BLUE}suse${NC}
 		echo PSUEDONAME=`cat /etc/SUSE-release | tr "\n" ' '| sed s/VERSION.*//`
 		echo REV=`cat /etc/SUSE-release | tr "\n" ' ' | sed s/.*=\ //`
        echo VERSION=`cat /etc/SuSE-release | grep 'VERSION' | sed  -e 's#[^0-9]##g'`
	elif [ -f /etc/mandrake-release ] ; then
        # TODO - not tested
        echo DISTRIBUTION=m${BLUE}andrake${NC}
 		echo PSUEDONAME=`cat /etc/mandrake-release | sed s/.*\(// | sed s/\)//`
 		echo REV=`cat /etc/mandrake-release | sed s/.*release\ // | sed s/\ .*//`
        echo FAMILY=${BLUE}rh${NC}
	elif [ -f /etc/debian_version ] ; then
        echo DISTRIBUTION=${BLUE}debian${NC}
        echo FAMILY=${BLUE}debian${NC}
        debian_derivative
    elif [ -f /etc/UnitedLinux-release ]; then
        echo DISTRIBUTION="united"
        echo VERSION=`cat /etc/UnitedLinux-release`
    elif [ -r /etc/init.d/functions.sh ]; then
        # TODO - not tested
        source /etc/init.d/functions.sh
        [ zz`type -t ebegin 2>/dev/null` == "zzfunction" ] && echo DISTRIBUTION="gentoo"
	fi
}

# --------------------------------------------------------------------------------
# Do it!
#
detect_os
