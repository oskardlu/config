#platform=x86, AMD64, or Intel EM64T
#version=DEVEL
# Firewall configuration
firewall --enabled --ssh
# Install OS instead of upgrade
install
# Use CDROM installation media
cdrom
# Root password
rootpw --iscrypted $1$USEhgGL3$288iZJqkskW2pu.8woUF10
# System authorization information
auth  --useshadow  --passalgo=sha512
# Use text install
text
# Run the Setup Agent on first boot
firstboot --enable
# System keyboard
keyboard uk
# System language
lang en_GB.UTF-8
# SELinux configuration
selinux --permissive
# Installation logging level
logging --level=info
# Reboot after installation
reboot
# System timezone
timezone  Europe/London
# Network information
network  --bootproto=static --device=eth0 --gateway=192.168.0.1 --ip=192.169.0.2 --nameserver=192.168.0.4 --netmask=255.255.255.0 --onboot=on  --hostname=ol6-112-server.localdomain
# System bootloader configuration
bootloader --location=mbr
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --all --initlabel
# Disk partitioning information
part / --fstype="ext4" --size=10240
part swap --fstype="swap" --size=2048
part /home --fstype="ext4" --size=10240
part /var --fstype="ext4" --size=4096
part /tmp --fstype="ext4" --size=2048
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=sda
# Package selection
%packages
@base
@core
%end
# Post installation script
%post
echo 'Hello, World!'
%end
