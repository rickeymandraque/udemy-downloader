#!/usr/bin/env bash

function export_cookie() {
reponse="$(sqlite3 $HOME/.mozilla/firefox/*.default-release/cookies.sqlite <<EOF
SELECT name,value FROM moz_cookies WHERE host="www.udemy.com" and name LIKE "%%access_token%%";
EOF
)"
cookie="${reponse##*\|}"
echo $cookie
}
export_cookie
