# scanfo
Forensic scanner for Unix systems
 
A forensic scanner for unix systems for system analysis using a bash script.

## Print Screen
! [Screen capture of the running program] (./ printscreen.png "Screen capture")

## Usage
`. / scanfo.sh`

After execution, a *** info.txt *** file will be generated.

## What kind of data is collected?
* Which system is being used
* Kernel version
* System Architecture
* User name
* User Folder Location
* External IP address
* Connected Devices
* Connected Users
* Network connections
* List of Open Files
* System Processes
* Network interfaces (ifconfig)
* Registration of the Last Logins
* / etc / passwd
* / etc / groups
* / etc / shadow (root required)
* crontab (root / root required)
* crontab (user)
* Disk Space
* Amount of RAM
* SUID / SGID binaries
* Checks RootKits on the System


### ** ATTENTION **
This script was tested on Zorin OS 15.3
