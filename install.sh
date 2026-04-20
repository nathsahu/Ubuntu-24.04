#!/data/data/com.termux/files/usr/bin/bash

# Termux packages install karna
pkg install x11-repo -y
pkg install termux-x11 -y
pkg install pulseaudio -y
pkg install proot-distro -y

# Ubuntu 24.04 configuration create karna
printf "DISTRO_NAME=\"Ubuntu 24.04\"\nTARBALL_URL['aarch64']=\"https://cdimage.ubuntu.com/ubuntu-base/releases/noble/release/ubuntu-base-24.04.4-base-arm64.tar.gz\"\nTARBALL_SHA256['aarch64']=\"\"\nTARBALL_STRIP_OPT=0" > $PREFIX/etc/proot-distro/ubuntu-24.04.sh

# Ubuntu install karna
proot-distro install ubuntu-24.04

# Shortcut command 'ubuntu' banana
mkdir -p ~/ubuntu-lts
cat <<EOF > $PREFIX/bin/ubuntu
proot-distro login ubuntu-24.04
EOF
chmod +x $PREFIX/bin/ubuntu

# Ubuntu ke andar setup script bhejna (Automated login ke liye)
# Note: Isme hum wo script download karenge jo Ubuntu ke andar chalegi
proot-distro login ubuntu-24.04 -- sh -c "apt update && apt install wget -y && wget https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/setup_ubuntu.sh && chmod +x setup_ubuntu.sh && ./setup_ubuntu.sh"
