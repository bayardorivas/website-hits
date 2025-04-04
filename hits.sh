#! /bin/bash

# Create a Dictionary of sites
clear
declare -A WEBSITES
WEBSITES=(
    [site-1]='https://mysite-1.com'
    [site-2]='https://mysite-2.com'
    [site-n]='https://mysite-n.com'
)

RED='\033[0;31m'
NC='\033[0m'  # No Color (reset)

for SITE in ${WEBSITES[@]}; do
    STATUS=$(curl -s -o /dev/null -w "%{http_code}" --max-time 10 $SITE)
    sleep 3
    if [[ "$STATUS" != 200 ]]; then
        echo -e "${RED}$SITE is not accessible ${NC} (Status code: $STATUS)"
    else
        echo "The website $SITE is up and running Status $STATUS"
    fi
done
