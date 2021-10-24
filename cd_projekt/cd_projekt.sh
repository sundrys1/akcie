#!/bin/bash

rm investors_page.txt
#rm investors_page.txt

cp investor_page_new.html investor_page_old.html
# cp beachkemp-new.html beachkemp-old.html

rm investor_page_new.html
#rm beachkemp-new.html

wget https://www.cdprojekt.com/en/investors/ --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --keep-session-cookies --save-cookies investors_page.txt

wget https://www.cdprojekt.com/en/investors/ --header="User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:23.0) Gecko/20100101 Firefox/23.0" --load-cookies investors_page.txt -O investor_page_new.html


diff -u investor_page_old.html investor_page_new.html > diff_investors_page.txt

diff_investors_page="diff_investors_page.txt"

chybne_texty=$(cat diff_investors_page.txt | grep "DOCTYPE\|function")

dt=`date '+%A %H:%M:%S %d %b %Y'`



if [ -n  "$chybne_texty" ] ;

        then

                echo konec scriptu
                exit 1

        fi



if [ -s  "$diff_investors_page" ] ;

        then

                echo "cd_projekt_red" | mail  -s "cd_projekt_red" -a From:cd_projekt_red\<zahradnickova.alarm@gmail.com\> magyarr@live.com < diff_investors_page.txt
                #echo "cd_projekt_red" | mail  -s "cd_projekt_red" -a From:cd_projekt_red\<zahradnickova.alarm@gmail.com\> sundrys5@seznam.cz < diff_investors_page.txt
                
                echo -------------------------------ZMENA--------------------------------------------------
                echo $dt >> zmena_diff_investors_page.txt
        else
                echo
                echo -------------------------------ZADNA ZMENA-------------------------------------------
                echo
                echo
                cat diff_investors_page.txt


        fi


#rm --  training?event_group id=46.*
