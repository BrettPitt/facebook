# Function Declarations
# Task 7.1 get a Preview and each Column has a max Length of 10chars for better Overview
function showPreview 
    {
        head -8 facebook.csv | csvlook --max-column-width 10
    }

# Task 7.2 get all types of Statuses and how often they appear 
function showStatusTypes
    {
        csvsql --query "select count() as status_id, status_type from facebook group by status_type" facebook.csv | csvlook
    }

# Task 7.3 get the Post with the most klicks
function mostLiked1
    {
        #-F ignore commas in quotes
        #then count all "_num" columns | Sort them descending | print the first
        awk  -F "\"*,\"*" '{
        print int($8 + $9 + $11 + $12 + $13 + $14 + $15), $1, $2
        }' facebook.csv | sort -n -r | head -1

                # awk ' /lebron/ {print $2}' facebook.csv
    }

# menu declaration
TITLE="** Aufgabe 7 - Facebook Data Mining**"
declare menu=(
    "7.1 Preview"
    "7.1.1 Übersichtliches Preview" 
    "7.2 Statustyp und Anzahl"
    "7.3 Beliebtester Statuseintrag"
    "Beenden"
)

menuCount=${#menu[@]}
while true; do
    echo "$TITLE"
    for((i=0; i<$menuCount; i++))
    do
        echo "$i) ${menu[$i]}"
    done
    echo -n "Wähle einen Menuepunkt aus und bestätige mit Enter: "
    read ANTWORT
    case $ANTWORT in 
    
        0)
        # this is Task 7.1 but gives ALL information
        echo -e "\n=> ${MENU[0]}\n"
            echo "Preview der ersten 10 Linien"
            printf "\n"
            head -n 10 facebook.csv | csvlook
            printf "\n"
        ;;

        1)
        # Task 7.1
        echo -e "\n=> ${MENU[1]}\n"
            echo "Preview mit beschränkter Zeilenlänge"
            printf "\n"
            showPreview 
            printf "\n"
        ;;

        2)
        # Task 7.2
        echo -e "\n=> ${MENU[2]}\n"
            echo "Statustypen und Anzahl"
            printf "\n"
            showStatusTypes
            printf "\n"
        ;;

        3)
        #Task 7.3
        echo -e "\n=> ${MENU[3]}\n"
            echo "Meist bewerteter Kommentar"
            printf "\n"
            mostLiked
            printf "\n"
        ;;    

        4)
        # exit programm
        echo -e "\n=> ${MENU[4]}\n"
        break
    esac    
done
