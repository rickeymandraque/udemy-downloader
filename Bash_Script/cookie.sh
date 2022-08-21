#!/usr/bin/env bash

echo "This script work only with firefox"
echo "This script not work yet"

Get-Locale="$(locale | grep -E '^LANG=' | awk -F= '{print $2}'| awk -F. '{print $1}')"
Minus_Local="$(Get-Local | awk -F_ '{print $1}')"
Up_Local="$(Get-Local | awk -F_ '{print $2}')"


if [[ $Minus_Locale = "fr" ]]; then
  Locale="fr"
else
  Locale="$Minus_Locale-$Up_Local"
fi


function export_cookie() {
# Path for snap $HOME/snap/firefox/common/.mozilla/firefox/*.default/cookies.sqlite
# C'est la meeeerde !
reponse="$(sqlite3 $HOME/.mozilla/firefox/*.default-release/cookies.sqlite <<EOF
SELECT value FROM moz_cookies WHERE host="www.udemy.com" and name LIKE "%%access_token%%";
EOF
)"
echo $reponse
}

# 21/08/2022
# New idea ! Download firefox portable mode for linux.
# open it with the good url via bash, just 1 cookie.
# same thing with chrome.
# url = https://www.udemy.com/join/login-popup/?locale=${Get-Locale}&response_type=html&next=https%3A%2F%2Fwww.udemy.com%2F
# need to get local from computer (locale | grep -E ^LANG=)
# need confirmation for local
# need to find a solution in bash to get cookie for chrome.
# the firefox portable solution don't need chrome !!! :)
# Firefox portable https://gist.github.com/thewh1teagle/6a739c959b613f839eb3c5f9895a4505
# Firefox latest link https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=${Locale}
# French is fr; english us is en-US ...
# need list of local (apt-cache output > list.lst ? )

export_cookie
