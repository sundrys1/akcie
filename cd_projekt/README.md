# cd projekt red akcie
script to download page of https://www.cdprojekt.com/en/investors/

run the cript in crontab

5 * * * * cd /home/sundrys1/akcie/ && ./cd_projekt_red.sh >/dev/null 2>&1
#* * * * * touch /home/sundrys1/bin/crontab-test.txt
