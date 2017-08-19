#!/usr/bin/env bash

## Followed these instructions. This will only work on Ubuntu 14.04, if you use the VM in the Vagrant directory it will work
# https://developer.mozilla.org/en-US/docs/Mozilla/Developer_guide/Virtual_ARM_Linux_environment
## Used this release
# http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/


add-apt-repository ppa:linaro-maintainers/tools
apt-get install linaro-image-tools qemu-user-static qemu-system
apt-get install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

# The compressed filesystem
wget http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/linaro-utopic-gnome-20150421-702.tar.gz
wget http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/boot-qcom-apq8064-eI_ERAGON600-qcom-snapdragon-20150417-100.img.gz

# Download firmware
wget http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/firmware-qcom-snapdragon-20150417-100.img.gz
wget http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/linaro-utopic-developer-qcom-snapdragon-20150417-100.img.gz
wget http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/linaro-utopic-gnome-qcom-snapdragon-20150417-100.img.gz

# hw pack,
wget http://releases.linaro.org/ubuntu/hwpacks/lsk-vexpress/15.07/hwpack_linaro-lsk-vexpress_20150725-725_armhf_supported.tar.gz

# Create image
linaro-media-create --rootfs ext2 --image_file vexpress.img --dev vexpress \
  --binary linaro-utopic-gnome-20150421-702.tar.gz \
  --hwpack hwpack_linaro-lsk-vexpress_20150725-725_armhf_supported.tar.gz

# Download kernel
wget http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/initrd.img-3.19.0-linaro-lt-qcom
wget http://releases.linaro.org/archive/15.04/ubuntu/snapdragon/zImage