#!/bin/bash
#
# by DD0cT0rinf0s3c
# Contact me via chat or email with any feedback or suggestions that you may have:
# jamesngigi707@gmail.com
#

##############################################################################################################
resize -s 37 78 > /dev/null
# Catch process termination
trap f_terminate SIGHUP SIGINT SIGTERM

# Global variables
home=$HOME
long='========================================================================================================================================================'
medium='=============================================================================='
short='========================================'
sip='sort -n -u -t . -k 1,1 -k 2,2 -k 3,3 -k 4,4'

BLUE='\033[1;34m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NC='\033[0m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
BROWN='\033[0;33m'
DARKGRAY='\033[0;30m'
GRAY='\033[0;37m'
LIGHTBLUE='\033[0;94m'
MAGENTA='\033[1;35m'
PURPLE='\033[0;35m'
WHITE='\033[1;37m'

###############################################################################################################

f_banner(){
echo -e "${medium}${YELLOW}
              ██████╗  ██████╗   █████╗  ██╗   ██╗ ███████╗
              ██╔══██╗ ██╔══██╗ ██╔══██╗ ██║   ██║ ██╔════╝
              ██████╔╝ ██████╔╝ ███████║ ██║   ██║ ███████╗
              ██╔═══╝  ██╔══██╗ ██╔══██║ ██║   ██║ ╚════██║
              ██║      ██║  ██║ ██║  ██║ ╚██████╔╝ ███████║
              ╚═╝      ╚═╝  ╚═╝ ╚═╝  ╚═╝  ╚═════╝  ╚══════╝
                OPERATING SYSTEM AUDIT FRAMEWORK
                By Codename:: D0cT0rInf0s3c${NC}
${RED}Praus is an open source Operating system audit and Hardening Framework.
feel free to contribute.${NC}
${medium}"
}

##############################################################################################################

f_error(){
echo
echo -e "${RED}$medium${NC}"
echo
echo -e "${RED}                *** Invalid choice or entry. ***${NC}"
echo
echo -e "${RED}$medium${NC}"
sleep 2
f_main
}

###############################################################################################################

f_location(){
echo
echo -n "Enter the location of your file: "
read -e location

# Check for no answer
if [[ -z $location ]]; then
     f_error
fi

# Check for wrong answer
if [ ! -f $location ]; then
     f_error
fi
}
###############################################################################################################

f_terminate(){

save_dir=$home/data/cancelled-`date +%H:%M:%S`
echo
echo "Terminating..."
echo
echo -e "\e[1;33mAll data will be saved in $save_dir.\e[0m"


mkdir $save_dir

# Nmap and Metasploit scans
mv $name/ $save_dir 2>/dev/null

# Recon files
mv curl debug* dns emails* domain hosts names* network* passive* registered* squatting sub* tmp* whois* z* doc pdf ppt txt xls $save_dir 2>/dev/null
cd /tmp/
rm emails names networks profiles subdomains 2>/dev/null

echo
echo "Saving complete."
echo
echo

exit
}
#############################################################################################################
#level 2 scan
f_level2(){
  f_banner;
  echo -e "${BLUE}OPERATING SYSTEM AUDIT FRAMEWORK${NC}"
  echo "1.  Audit"
  echo "2.  Hardening"
  echo "3.  Previous menu"
  echo
  echo -n "Select an Option: "
  read choice
case  $choice in
       1) reset
       f_banner;
       f_audit
       echo
       exit;;
       2) reset
       f_banner;
       f_hardening
       echo
       exit;;
       3)f_main;
       echo
       exit;;
       *) f_error;;
     esac
}
##############################################################################################################
f_audit(){
  reset
  f_banner
  echo -e "${BLUE}SELECT THE AREA OF AUDIT${NC}"
  echo "1.  Apache2"
  echo "2.  Banners"
  echo "3.  Files"
  echo "4.  Iptable"
  echo "5.  Network"
  echo "6.  Nginx"
  echo "7.  Services"
  echo "8.  Ssh"
  echo "9.  Sudo-su"
  echo "10. Umask"
  echo "11. User-Group"
  echo "12. Previous menu"
  echo
  echo -n "Select an Option: "
  read choice
  case  $choice in
    1) reset
    f_banner;
    sh $WORKDIR/audit/apache2.sh
    echo
    sleep 1
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;

    2) reset
    f_banner;
    sh $WORKDIR/audit/banners.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    3) reset
    f_banner;
    sh $WORKDIR/audit/files.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    4) reset
    f_banner
    sh $WORKDIR/audit/iptables.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    5) reset
    f_banner
    sh $WORKDIR/audit/network.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    6) reset
    f_banner
    sh $WORKDIR/audit/nginx.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    7) reset
    f_banner
    sh $WORKDIR/audit/services.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    8) reset
    f_banner
    sh $WORKDIR/audit/ssh.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    9)reset
    f_banner
    sh $WORKDIR/audit/sudo-su.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    10) reset
    f_banner
    sh $WORKDIR/audit/umasks.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    11) reset
    f_banner
    sh $WORKDIR/audit/users-groups.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    12)reset
    f_banner
    f_level2
    exit;;
    *) f_error;
  esac
}
f_hardening(){
  reset
  f_banner
  echo -e "${BLUE}SELECT THE AREA OF HARDEN${NC}"
  echo "1.  Apache2"
  echo "2.  Banners"
  echo "3.  Files"
  echo "4.  Iptable"
  echo "5.  Network"
  echo "6.  Nginx"
  echo "7.  Services"
  echo "8.  Ssh"
  echo "9.  Sudo-su"
  echo "10. Umask"
  echo "11. User-Group"
  echo "12. Previous menu"
  echo
  echo -n "Select an Option: "
  read
  case  $choice in
    1) reset
    f_banner;
    sh $WORKDIR/hardening/apache2.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    2) reset
    f_banner;
    sh $WORKDIR/hardening/banners.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    3) reset
    f_banner;
    sh $WORKDIR/hardening/files.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    4) reset
    f_banner
    sh $WORKDIR/hardening/iptables.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    5) reset
    f_banner
    sh $WORKDIR/hardening/network.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    6) reset
    f_banner
    sh $WORKDIR/hardening/nginx.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    7) reset
    f_banner
    sh $WORKDIR/hardening/services.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    8) reset
    f_banner
    sh $WORKDIR/hardening/ssh.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    9)reset
    f_banner
    sh $WORKDIR/hardening/sudo-su.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    10) reset
    f_banner
    sh $WORKDIR/hardening/umasks.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    11) reset
    f_banner
    sh $WORKDIR/hardening/users-groups.sh
    echo
    echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
    read OP
    reset
    f_level2
    exit;;
    12)reset
    f_banner
    f_level2
    echo
    exit;;
    *) f_error;
  esac
}
#############################################################################################################
# work directory
WORKDIR=$(pwd)


##############################################################################################################

f_main(){
reset
f_banner
echo -e "${BLUE}    ╘ ${WHITE}Press [${GREEN} ENTER ${WHITE}] to continue${RED}!"
read OP
      if [ $(id -u) != "0" ]; then
      echo ""
      echo ${RED}[☠]${WHITE} we need to be root to run this script...${NC};
      echo ${RED}[☠]${WHITE} execute [ sudo ./morpheus.sh ] on terminal ${NC};
      exit
      fi
reset
f_banner;
echo ${medium}
echo -e "${BLUE}OPERATING SYSTEM AUDIT FRAMEWORK${NC}"
echo "1.  Operating System Architecture : Basic Operating System scan"
sleep 1
echo "2.  Audit system                  : Perform local security scan"
sleep 1
echo "3.  Audit system remote           : Remote security scan"
sleep 1
echo
echo -n "Select an Option: "
read choice
case  $choice in
  1) reset
  f_banner;
  sh $WORKDIR/include/osdetection.sh
  echo
  exit;;
  2) reset
  f_level2
  exit;;
#####################################################################################################
#remote auditing
  3) reset
  f_banner;
  echo -e "${BLUE}REMOTE OPERATING SYSTEM AUDIT${NC}"
  echo "1.  Automated System Remote Audit"
  echo "2.  Manual Remote System Audit"
  echo
  echo -n "Select an Option: "
  read choice
case  $choice in
       1) reset
       f_banner;
       sh $WORKDIR/include/remote-scan.sh
       echo
       exit;;
       2) reset
       f_banner;
       sh $WORKDIR/include/remote-help-scan.sh
       echo
       exit;;
       *) f_error;
     esac
  echo
  exit;;
  *) f_error;
esac
}
f_main
