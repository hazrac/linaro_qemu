#!/usr/bin/env bash
KERNEL="vmlinuz-3.10.79.0-1-linaro-lsk-vexpress"
KERNEL_URL="https://dl.dropboxusercontent.com/u/7976553/Linaro/NativeOSX/vmlinuz-3.10.79.0-1-linaro-lsk-vexpress"
INITRD="initrd.img-3.10.79.0-1-linaro-lsk-vexpress"
INITRD_URL="https://dl.dropboxusercontent.com/u/7976553/Linaro/NativeOSX/initrd.img-3.10.79.0-1-linaro-lsk-vexpress"
DISK_IMG="vexpress.img"
DISK_IMG_URL="https://dl.dropboxusercontent.com/u/7976553/Linaro/NativeOSX/vexpress.img"

get_kernel () 
{
	if [ -f $KERNEL ]; then
		return 0
	else
		wget $KERNEL_URL && return 0
	fi
}

get_initrd ()
{
	if [ -f $INITRD ]; then
		return 0
	else
		wget $INITRD_URL && return 0
	fi
}

get_disk_img ()
{
	if [ -f $DISK_IMG ]; then
		return 0
	else
		wget $DISK_IMG_URL && return 0
	fi
}

echo "Downloading kernel, initrd, and disk image if unavail"
get_kernel
get_initrd
get_disk_img

echo "Starting qemu. Wait 5min and use another terminal to ssh in via ssh linaro@localhost -p 2223"
   qemu-system-arm -M vexpress-a15 -cpu cortex-a15 -kernel $KERNEL \
  -initrd $INITRD \
  -redir tcp:2223::22 -m 2048M \
  -append "root=/dev/mmcblk0p2 rootfstype=ext2 vga=normal mem=512M devtmpfs.mount=0 rw" \
  -display none \
  -drive file=$DISK_IMG,if=sd,cache=writeback

