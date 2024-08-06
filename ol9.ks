# Copyright 2023-2024 Broadcom. All rights reserved.
# SPDX-License-Identifier: BSD-2

# Oracle Linux Server 9

# Installs from the first attached CD-ROM/DVD on the system.
cdrom

# Performs the kickstart installation in text mode.
text

# Accepts the End User License Agreement.
eula --agreed

# Sets the language to use during installation and the default language to use on the installed system.
lang en_GB.UTF-8

# Sets the default keyboard type for the system.
keyboard uk

# Configure network information for target system and activate network devices in the installer environment
network  --bootproto=dhcp --device=eth0 --onboot=on  --hostname=ol6-112-server.localdomain

# Lock the root account.
rootpw --lock

# Add a user that can login and escalate privileges.
user --name=builduser --iscrypted --password=$1$USEhgGL3$288iZJqkskW2pu.8woUF10 --groups=wheel

# Configure firewall settings for the system.
firewall --enabled --ssh

# Sets up the authentication options for the system.
authselect select sssd

# Sets the state of SELinux on the installed system.
selinux --enforcing

# Sets the system time zone.
timezone Europe/London

# Partitioning
autopart

# Modifies the default set of services that will run under the default runlevel.
services --enabled=NetworkManager,sshd

# Do not configure X on the installed system.
skipx

# Packages selection.
%packages --ignoremissing --excludedocs
@base
@core
%end

# Post-installation commands.
%post
# Reboot after the installation is complete.
