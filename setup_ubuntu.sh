#!/bin/bash

# Colors
GREEN='\033[0;32m'
SKYBLUE='\033[1;36m'
NC='\033[0m' # No Color

# User creation prompt
echo -e "${GREEN}Do you want to create a new user? (Y/N)${NC}"
read -r choice
if [[ "$choice" =~ ^[Yy]$ ]]; then
    echo -e "${GREEN}Enter your username (small letters only):${NC}"
    read -r username
    useradd -m -s /bin/bash "$username"
    passwd "$username"
    # Sudo permission bina password ke
    apt update && apt install sudo -y
    echo "$username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    
    # Login shortcut update karna Termux mein (nath ya jo bhi user ho)
    echo "proot-distro login ubuntu-24.04 --user $username" > /data/data/com.termux/files/usr/bin/ubuntu
fi

# Background mein repositories add karna
apt update && apt install wget gpg -y
# VS Code Repo
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=arm64 signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list
# Sublime Repo
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list

apt update

# App Installation Prompts
echo -e "${GREEN}Do you want to install VS Code? (Y/N)${NC}"
read -r ins_vscode
[[ "$ins_vscode" =~ ^[Yy]$ ]] && apt install code -y

echo -e "${GREEN}Do you want to install GIMP? (Y/N)${NC}"
read -r ins_gimp
[[ "$ins_gimp" =~ ^[Yy]$ ]] && apt install gimp -y

echo -e "${GREEN}Do you want to install Firefox? (Y/N)${NC}"
read -r ins_ff
[[ "$ins_ff" =~ ^[Yy]$ ]] && apt install firefox -y

# Final Message
clear
sleep 2
echo -e "${SKYBLUE}Ubuntu has been installed successfully!${NC}"
echo -e "${SKYBLUE}1. Install Termux-x11 app from GitHub${NC}"
echo -e "${SKYBLUE}2. Restart Termux${NC}"
echo -e "${SKYBLUE}3. Type in Termux: termux-x11 :1 &${NC}"
echo -e "${SKYBLUE}4. Then type: ubuntu${NC}"
echo -e "${SKYBLUE}5. Inside Ubuntu type: export DISPLAY=:1${NC}"
echo -e "${SKYBLUE}6. Then type: startxfce4${NC}"
echo -e "${SKYBLUE}7. Open Termux-x11 app to see the display${NC}"
