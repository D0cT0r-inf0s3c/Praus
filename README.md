# praus

praus Scripts

Praus is a battle-tested security tool for systems running Linux, macOS, or Unix-based operating system. It performs an extensive health scan of your systems to support system hardening and compliance testing. The project is open source software.

# Supported operating systems

Praus is tested and runs on almost all UNIX-based systems and versions, including:

    * FreeBSD
    * Linux
    * macOS
    * Kali Linux
    * Ubuntu
    * redhat
    * OpenSUSE
    and others
    
# Audit steps
This is what happens during a typical scan with praus:

    * Initialization and basic checks
    * Scan operating system and tools
    * Perform either an audit or had scan
    * Perform a automated or manual remote scan
    * Report status of security scan

Besides the report and information displayed on screen, all technical details about the scan are stored in a log file (praus.log). Findings like warnings and suggestions are stored in a separate report file (praus-report.pdf).
# commands to download and run Praus:
 git clone https://github.com/D0cT0r-inf0s3c/Praus.git
 
 cd Praus
 
 chmod +x praus.sh
 
 ./praus.sh
 
 NB: you should be root to run the program.

# Contributors

Praus is an open source Operating system audit and Hardening Framework. feel free to contribute

# By James Doctor-infosec Codename:: D0cT0rInf0s3c
