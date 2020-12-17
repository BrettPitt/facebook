# if dpkg -s csvkit 2>&1 ; then
#     echo "csvkit found"
# else
#     echo "csvkit not found"
#     exit 1
# fi
TITLE="**Facebook Anal**"
declare -a menu=(
    "7.1 Preview"
    "7.2 Datenanalyse"
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
            echo "blabla"
        ;;
        1)
            echo "hihi"
        ;;
    esac
    
done
