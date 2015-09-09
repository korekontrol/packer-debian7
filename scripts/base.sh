# Adjust root filesystem


# Update the box
apt-get -y update
apt-get -y install linux-headers-$(uname -r) build-essential

# Install development tools
apt-get -y install zlib1g-dev libssl-dev libreadline-gplv2-dev
apt-get -y install curl wget vim mc screen zsh unzip pbzip2 lsof htop iotop dstat telnet tcpdump make python python-apt

# Set up sudo
echo 'vagrant ALL=NOPASSWD:ALL' > /etc/sudoers.d/vagrant

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub
