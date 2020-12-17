if dpkg -s csvkit 2>&1 ; then
    echo "csvkit found"
else
    echo "csvkit not found"
    exit 1
fi
declare -a menue=(
    "7.1 Preview"
    "7.2 Datenanalyse"
)



# was sind die spalten?
csvcut -n facebook.csv

#inhalt "anzeigen" (2 varianten)
csvlook facebook.csv | less -S
head -n 10 facebook.csv |csvlook

#das entspricht 7.1 -->  anzeigen der 3 sagen (status_type,status_link,status_published ) und pipen durch csvlook und head
csvcut -c status_type,status_link,status_published facebook.csv | csvlook | head

#7.2 teil 1 für anzahl status (inkl wie oft es vorkommt)-->
csvcut -c status_type facebook.csv | csvstat
#7.2 teil 2 anzahl wie viele status 
csvcut -c status_id facebook.csv | csvstat

#"vorbereitung für 7.3"
csvcut -c num_reactions,num_comments,num_shares,num_likes,num_loves,num_wows,num_hahas,num_sads,num_angrys facebook.csv | csvstat --max
