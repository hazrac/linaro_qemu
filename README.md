# Linaro Emulator
This repo contains two ways to run a Linaro (ARMv7) Emulator.  One is natively via qemu that is installed on your local host (assumed OSX) the other is through a custom built Virtualbox, which is created by using Vagrant.  Qemu is ran on the VM, allowing you to run the emulator on a system that doesn't support qemu natively.  Ironically the emulator seems to perform better in the VM on OSX instead of using qemu natively on OSX. Further instructions follow.

## Running the Emulator on OSX
* Install qemu
	* The easiest way to install qemu is by using brew `brew install qemu`
* Clone this repo
* Go into the NativeOSX folder and run ./startme.sh
* Wait about 5 minutes, and use another terminal to `ssh linaro@localhost -p 2223` the password is linaro


## Running the Emulator via the Virtualbox VM
* Ensure Virtualbox and Vagrant are setup
* Clone this repo
* Go into the Vagrant directory
* Do `vagrant up`
* After vagrant is running ssh into the box (`vagrant ssh`) 


## Todo
### For Native OSX
*
### For the Virtualbox VM
* Install a list of packages that replicate the Linaro systems I am looking to replicate and recreate the box 
* Script the startup and ssh connection into the Linaro system for easier startup
* Address the ability to share the host's host's network connection
* Place the scripts I created to build the kernel and image from scratch onto the box so that you can re-create the image if needed.
* For my purposes I want Ubuntu 15.04


## Issues
### For Native OSX
* Performance isn't great
* I still need to install the base packages I would prefer
* ./startme.sh needs better error handling 

### For the Virtualbox VM
* The disk image file seems to get corrupted in the box.  If I recreate it once the VM is created, it is fine.  The files impacted are minor (/etc/mtab seems to be consistantly impacted. Doing an ls -la on that file will tell you if your image is corrupted).  This may allow the box to still be used for minor testing, but may not work to test config management on Linaro for example.
* Given I'm using the vexpress emulator the system is limited to 1GB of memory.  For my purposes I need 2GB. (I can do this by replicating my script from nativeOSX)
* Currently I'm unable to go from the Linaro instance to the physical hosts connection, which limits my ability to access the Internet for updates/packages.

## Linaro Details
Linaro version: Ubuntu 14.10
Kernel version: 3.10.79.0-1-linaro-lsk-vexpress