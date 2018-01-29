#/bin/bash 

declare -a Line
# script to learn/practice dictionary words.
Line[1]="Accolade"
Line[2]="Eloquence"
Line[3]="Encomium"
Line[4]="Epitome"
Line[5]="Erudite"
Line[6]="Felicity"
Line[7]="Foliage"
Line[8]="Guarantee"
Line[9]="Impromptu"
Line[10]="Occurrence"
Line[11]="Sincerely"
Line[12]="Surreal"
Line[13]="Synonyms"

SKIP=s
QUIT=q

for index in {1..13}
do
    WORD=${Line[index]}
    say $WORD
    read input
    status=$?
    echo $status
    
while [ $input != $SKIP ]
    do
        if [ $?  -eq 1 ]; then 
            echo "bad input"
            $input=""
        fi

        if [ $input == $QUIT ]; then
            exit 0
        fi

        if [ $input != $WORD ]; then
            say ${Line[index]}
            read input
            status=$?
        else
            perl -e 'print "\xE2\x9C\x94"' 
            break
        fi
    done
done


Echo "Congratulation !"
