#!/usr/bin/env bash

# DO NOT USE FOR NOW ! Warning Not tested ! This script is for my personal configuration. Warning Not tested ! DO NOT USE FOR NOW !

echo "Warning Not tested ! This script is for my personal configuration. DO NOT USE ! USE CTL+C"
echo "NOT WORKING FOR NOW !"

if [ $(id -u) -ne 0 ]
then
    echo "Script must be run as root"
    exit 1
fi
DISTRIBTYPE=$(egrep ^ID= /etc/os-release | awk -F= '{ print $2 ;}')

echo "removing Firefox"

sudo apt remove firefox

cat << EOF > /etc/apt/preferences.d/firefox-for-nosnaps
Package: firefox*
Pin: release o=Ubuntu*
Pin-Priority: -1

Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 99
EOF

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' > /etc/apt/apt.conf.d/50unattended-upgrades-firefox

echo "Removing snap..."

snap remove snap-store
snap remove gtk-common-themes
snap remove gnome-3-34-1804
snap remove core20

# Stop the daemon
sudo systemctl stop snapd && sudo systemctl disable snapd

# Uninstall
apt autoremove snapd
sudo apt purge -y snapd

# Tidy up dirs
sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd /usr/lib/snapd ~/snap

# Stop it from being reinstalled by 'mistake' when installing other packages
cat << EOF > no-snap.pref
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF

sudo mv no-snap.pref /etc/apt/preferences.d/
sudo chown root:root /etc/apt/preferences.d/no-snap.pref

# done
echo "Snap removed"



sudo -E gpg --no-default-keyring --keyring=/usr/share/keyrings/javinator9889-ppa-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys 08633B4AAAEB49FC
sudo tee /etc/apt/sources.list.d/javinator9889-ppa.list <<< "deb [arch=amd64 signed-by=/usr/share/keyrings/javinator9889-ppa-keyring.gpg] https://ppa.javinator9889.com all main"
wget -O /usr/share/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ jammy main" >> "/etc/apt/sources.list.d/mkvtoolnix.download.list"
echo "deb-src [arch=amd64 signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/ubuntu/ jammy main" >> "/etc/apt/sources.list.d/mkvtoolnix.download.list"
sudo add-apt-repository ppa:mozillateam/ppa -y

sudo apt -s install python3-mpegdash python3-tqdm python3-requests python3-dotenv python3-protobuf python3-webvtt python3-pysrt python3-m3u8 python3-colorama python3-bitstring python3-unidecode python3-bs4 python3-lxml python3-six python3-pathvalidate python3-coloredlogs python3-xmltodict atom discord firefox firefox-locale-fr mkvtoolnix yarn youtube-dl yt-dlp python3 build-essential manpages-fr manpages-fr-extra tldr wget curl aria2 libssl-dev gcc automake screen zlib1g-dev libjpeg-dev mint-meta-codecs vlc celluloid ffmpeg p7zip-rar catfish p7zip-full fonts-crosextra-carlito fonts-crosextra-caladea mkvtoolnix-gui gdebi
sudo pip install cloudscraper
wget -O /usr/bin/shaka-pakager https://github.com/truedread/shaka-packager/releases/download/v2.5.3/packager-linux
sudo chmod 755 /usr/bin/shaka-pakager
