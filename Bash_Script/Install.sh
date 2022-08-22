#!/usr/bin/env bash

# DO NOT USE FOR NOW ! Warning Not tested ! This script is for my personal configuration. Warning Not tested ! DO NOT USE FOR NOW !

echo "! Warning ! This script will not help you get the decryption keys. ! Warning !"
echo "Warning Not tested ! This script is for my personal configuration. DO NOT USE ! USE CTL+C"
echo "NOT WORKING FOR NOW !"

sleep 5s

Download_Dir="$HOME/.UDL_Installer"
Shaka_Pakager="https://github.com/truedread/shaka-packager/releases/download/v2.5.3/packager-linux"
UDL_Sources="https://github.com/rickeymandraque/udemy-downloader/archive/refs/heads/master.zip"

function mkcd() {
  mkdir -p "$@" && cd "$_";
}

mkcd $Download_Dir


sudo -E gpg --no-default-keyring --keyring=/usr/share/keyrings/javinator9889-ppa-keyring.gpg --keyserver keyserver.ubuntu.com --recv-keys A2A43BD5139A4173
sudo tee /etc/apt/sources.list.d/javinator9889-ppa.list <<< "deb [arch=amd64 signed-by=/usr/share/keyrings/javinator9889-ppa-keyring.gpg] https://ppa.javinator9889.com all main"

sudo apt update && sudo apt -s upgrade
sudo apt -s install python3-pip python3-mpegdash python3-tqdm python3-requests python3-dotenv python3-protobuf python3-webvtt python3-pysrt python3-m3u8 python3-colorama python3-bitstring python3-unidecode python3-bs4 python3-lxml python3-six python3-pathvalidate python3-coloredlogs python3-xmltodict discord yarn youtube-dl yt-dlp python3 build-essential wget curl aria2 libssl-dev gcc automake screen zlib1g-dev libjpeg-dev mint-meta-codecs vlc celluloid ffmpeg p7zip-rar catfish p7zip-full fonts-crosextra-carlito fonts-crosextra-caladea gdebi
sudo pip install cloudscraper


# wget -O Udemy-Downloader.zip $UDL_Sources
# wget -O $Shaka_Pakager
# sudo mv ./packager-linux /usr/bin/shaka-pakager
# sudo chmod 755 /usr/bin/shaka-pakager
wget -q --spider $UDL_Sources
wget -q --spider $Shaka_Pakager


