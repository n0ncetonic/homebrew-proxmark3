Homebrew tap of iceman fork of Proxmark3
========================================

[Homebrew](http://brew.sh) - is a open-source package manager for Apple macOS.

This repository contains homebrew formulas for iceman fork of proxmark3 project with it dependencies.
The old HID-flasher doesn't compile on this version. You'll need to manually fix/compile it on MacOS.

### Install

1. Install homebrew if you haven't yet already done so: http://brew.sh/

2. Tap this repo: `brew tap iceman1001/proxmark3`

3. Install Proxmark3:
    `brew install proxmark3` for stable release 
	`brew install --HEAD proxmark3` for latest non-stable from GitHub (use this if previous command fails)

	 
### Usage

Proxmark3 will be installed in `/usr/local/bin/proxmark3`  

Firmware located at `/usr/local/share/firmware/`  


#### Connect to device
`proxmark3 /dev/tty.usbmodem88888` 


#### Flashing firmware  
`sudo proxmark3-flasher /dev/tty.usbmodem88888 /usr/local/share/firmware/fullimage.elf`  


#### Flashing bootloader  
`sudo proxmark3-flasher /dev/tty.usbmodem88888 -b /usr/local/share/firmware/bootrom.elf`  

	
### Info

Current release version is v3.0.0 (https://github.com/iceman1001/proxmark3/releases/tag/v3.0.0)


###Maintainers

original [chrisfu](https://github.com/chrisfu/homebrew-tap), [zhovner](https://github.com/zhovner)

fork [iceman1001](https://github.com/iceman1001/homebrew-proxmark3)
