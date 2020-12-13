# was sind die Spalten?
csvcut -n facebook.csv

# "inhalt des files anzeigen"
csvlook facebook.csv | less -S

#das enspricht aufgabe 7
csvcut -c status_id,status_message,link_name,status_type,status_link,status_published,num_reactions,num_comments,num_shares,num_likes,num_loves,num_wows,num_hahas,num_sads,num_angrys facebook.csv | csvlook | head
