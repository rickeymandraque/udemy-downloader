#!/usr/bin/env bash

# Udemy-Downloader Launcher for Debian and Ubuntu

cd $HOME
python3 /usr/bin/UDL/main.py -b $(cat $HOME/.config/Udemy-DL/bearer.txt) "$@"
